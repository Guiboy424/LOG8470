mtype:ClientRequest = {CheckUsername, CheckPassword, AddFunds, WithdrawFunds, BuyMeal, LogOut}
mtype:ServerResponse = {InvalidUsername, ValidUsername, InvalidPsw, ValidPsw, AccountBlocked, FundsAdded, FundsWithdrew, NoMoreFunds, BoughtMeal, NotEnoughFunds, LoggedOut, InvalidRequest}
mtype:ServerRequest = {AccountCredit, SaveAccountCredit, GetUsername, GetPassword}
int pswAttempts = 0
int accountCredit = 0
bool isPasswordValid = false
bool accountLocked = false
bool clientCanOrder = false
bool clientConnected = false
bool canAddFunds = true
bool moneyWithdrew = false
mtype:ServerResponse serverChoice
//ltl p1 { []((!isPasswordValid && pswAttempts > 3) -> <>accountLocked) }
//ltl p2 { [] (accountCredit >= 0) }
//ltl p3 { !clientCanOrder until clientConnected }
ltl p4 { clientConnected -> <>moneyWithdrew }
//ltl p5 { [] canAddFunds}
proctype database(chan serverToDatabaseChan; chan databasetoServerChan){
    int fkYou = 0
    mtype:ServerRequest serverRequest
    int serverCredit = 0
    do
    ::  printf("db - waiting for request\n")
        serverToDatabaseChan?serverRequest,serverCredit
        if
        ::  serverRequest == AccountCredit
            databasetoServerChan!accountCredit
        ::  serverRequest == SaveAccountCredit
            accountCredit = serverCredit
            printf("DB - saved new credit %d\n", accountCredit)
            databasetoServerChan!accountCredit
        ::  serverRequest == GetUsername
            databasetoServerChan!0
        ::  serverRequest == GetPassword
            databasetoServerChan!0
        ::  else -> skip
        fi
    od
}
proctype server(chan clientToServerChan; chan serverToClientChan; chan serverToDatabaseChan; chan databasetoServerChan){
    mtype:ClientRequest clientRequest
    mtype:DatabaseResponse databaseResponse
    int uselessCreditInfo = 0
    int fkYou = 0
    int accountFunds = 0
    bool returnToStartState = false
    do
    ::  returnToStartState = false
        do  // state S0: waiting for username
        ::  printf("s - waiting for client username\n")
            clientToServerChan?clientRequest
            if
            ::  clientRequest == CheckUsername
                serverToDatabaseChan!GetUsername,0
                databasetoServerChan?uselessCreditInfo
                do
                ::  serverChoice = InvalidUsername; break
                ::  serverChoice = ValidUsername; break
                od
                printf("s - choosing %e\n", serverChoice)
                if
                ::  serverChoice == ValidUsername; serverToClientChan!ValidUsername; break
                ::  else -> serverToClientChan!InvalidUsername
                fi
            ::  else -> serverToClientChan!InvalidRequest
            fi
        od
        do  // state S1-S5: waiting for password
        ::  printf("s - waiting for client psw\n")
            clientToServerChan?clientRequest
            if
            ::  clientRequest == CheckPassword
                serverToDatabaseChan!GetPassword,0
                databasetoServerChan?uselessCreditInfo
                do
                ::  isPasswordValid = false; printf("s - invalid psw\n"); break
                ::  isPasswordValid = true; printf("s - valid psw\n"); break
                od
                if
                ::  isPasswordValid
                    accountLocked = false
                    pswAttempts = 0
                    serverToDatabaseChan!AccountCredit,0
                    databasetoServerChan?accountFunds
                    serverToClientChan!ValidPsw
                    break
                ::  else
                    pswAttempts++
                    if
                    ::  pswAttempts > 3
                        accountLocked = true
                        printf("s - sending account block\n")
                        serverToClientChan!AccountBlocked // return to start
                        returnToStartState = true
                        break
                    ::  else
                        serverToClientChan!InvalidPsw
                    fi
                fi
            ::  else -> serverToClientChan!InvalidRequest
            fi
        od
        printf("s - going to if state\n")
        if
        ::  returnToStartState == false
            do  // state: client requests
            ::  clientToServerChan??AddFunds
                canAddFunds
                accountFunds = accountFunds + 5
                serverToDatabaseChan!SaveAccountCredit,accountFunds
                databasetoServerChan?uselessCreditInfo
                serverToClientChan!FundsAdded
            ::  clientToServerChan??WithdrawFunds
                if
                ::  accountFunds <= 0
                    serverToClientChan!NoMoreFunds
                ::  else
                    accountFunds = 0
                    serverToDatabaseChan!SaveAccountCredit,accountFunds
                    databasetoServerChan?uselessCreditInfo
                    serverToClientChan!FundsWithdrew
                fi
            ::  clientToServerChan??BuyMeal
                if
                ::  accountFunds < 10
                    serverToClientChan!NotEnoughFunds
                ::  else
                    accountFunds = accountFunds - 10
                    serverToDatabaseChan!SaveAccountCredit,accountFunds
                    databasetoServerChan?uselessCreditInfo
                    serverToClientChan!BoughtMeal
                fi
            ::  clientToServerChan??LogOut
                serverToClientChan!LoggedOut
                break
            :: fkYou = 0
            od
        ::  else -> printf("s - returning to start state\n"); skip // return to start state
        fi
    od
}
proctype client(chan serverToClientChan; chan clientToServerChan){
    mtype:ServerResponse serverResponse
    bool returnToStartState = false
    do
    ::  returnToStartState = false
        clientCanOrder = false
        clientConnected = false
        do // state: username connexion
        ::  printf("c - sending check username\n")
            clientToServerChan!CheckUsername
            serverToClientChan?serverResponse
            if
            ::  serverResponse == ValidUsername -> printf("validUsename\n"); break// break loop
            ::  else -> skip
            fi
        od

        do // state: password connexion
        ::  clientToServerChan!CheckPassword
            serverToClientChan?serverResponse
            if
            ::  serverResponse == ValidPsw -> printf("validPsw\n"); clientConnected = true; clientCanOrder = true; break
            ::  serverResponse == AccountBlocked -> printf("accountBlocked\n"); returnToStartState = true; break // return to start to proc
            :: else -> printf("invalidPsw \n"); skip
            fi
        od

        if
        ::  returnToStartState == false
            do  // state: do things
            ::  canAddFunds
                printf("Adding funds \n")
                clientToServerChan!AddFunds    // Add funds
                serverToClientChan?serverResponse
                printf("funds added \n")
            ::  printf("Withdrawing funds \n")
                clientToServerChan!WithdrawFunds   // WithdrawFunds
                serverToClientChan?serverResponse
                if
                ::  serverResponse == FundsWithdrew -> printf("FundsWithdrew with success\n"); moneyWithdrew = true
                ::  else -> printf("ERROR with the withdraw\n")
                fi
            ::  printf("buying a meal \n")
                clientToServerChan!BuyMeal // BuyMeal
                serverToClientChan?serverResponse
                if
                ::  serverResponse == BoughtMeal -> printf("Meal bought with success\n")
                ::  else -> printf("ERROR with the transaction\n")
                fi
            ::  
                if
                ::  moneyWithdrew
                    printf("Logging out \n")
                    clientToServerChan!LogOut  // LogOut
                    serverToClientChan?serverResponse
                    clientCanOrder = false
                    clientConnected = false
                    moneyWithdrew = false
                    printf("Logged out\n")
                    break
                ::  else -> printf("c - doit retirer de largent avant de se deconnecter\n")
                fi 
            od
        ::  else -> printf("c - returning to start state\n"); // return to start state
        fi
    od
}
init{
    chan clientToServerChan = [0] of {mtype:ClientRequest}
    chan serverToClientChan = [0] of {mtype:ServerResponse}
    chan serverToDatabaseChan = [0] of {mtype:ServerRequest , int}
    chan databasetoServerChan = [0] of {int}
    run database(serverToDatabaseChan, databasetoServerChan) ; run client(serverToClientChan, clientToServerChan) ; run server(clientToServerChan, serverToClientChan, serverToDatabaseChan, databasetoServerChan)
}