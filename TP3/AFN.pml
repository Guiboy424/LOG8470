mtype:ClientRequest = {CheckUsername, CheckPassword, AddFunds, WithdrawFunds, BuyMeal, LogOut}
mtype:ServerResponse = {InvalidUsername, ValidUsername, InvalidPsw, ValidPsw, AccountBlocked, FundsAdded, FundsWithdrew, NoMoreFunds, BoughtMeal, NotEnoughFunds, LoggedOut, InvalidRequest}
mtype:ServerRequest = {AccountCredit, SaveAccountCredit}
mtype:DatabaseResponse = {Ok}
proctype database(chan serverToDatabaseChan; chan databasetoServerChan){
    int accountCredit = 0
    int fkYou = 0
    mtype:ServerRequest serverRequest
    int serverCredit = 0 
    do
    ::  serverToDatabaseChan?serverRequest,serverCredit
        if
        ::  serverRequest == AccountCredit
            databasetoServerChan!Ok,accountCredit
        ::  serverRequest == SaveAccountCredit
            int newCredit = 0
            accountCredit = serverCredit
            printf("DB - saved new credit %d\n", accountCredit)
            databasetoServerChan!Ok,accountCredit
        ::  else -> skip
        fi
    ::  fkYou = 0
    od
}
proctype server(chan clientToServerChan; chan serverToClientChan; chan serverToDatabaseChan; chan databasetoServerChan){
    mtype:ClientRequest clientRequest
    mtype:ServerResponse serverChoice
    mtype:DatabaseResponse databaseResponse
    int uselessCreditInfo = 0
    int fkYou = 0
    int accountFunds = 0
    int pswAttempts = 0
    do
    ::  do
        ::  printf("waiting for client username\n")
            clientToServerChan?clientRequest
            if
            ::  clientRequest == CheckUsername
                do
                ::  serverChoice = InvalidUsername; break
                ::  serverChoice = ValidUsername; break
                od
                if
                ::  serverChoice == ValidUsername; serverToClientChan!ValidUsername; break
                ::  else -> serverToClientChan!InvalidUsername
                fi
            ::  else -> serverToClientChan!InvalidRequest
            fi
        od
        do
        ::  printf("waiting for client psw\n")
                clientToServerChan?clientRequest
                if
                ::  clientRequest == CheckPassword
                    do
                    ::  serverChoice = InvalidPsw; break
                    ::  serverChoice = ValidPsw; break
                    od
                    if
                    ::  serverChoice == ValidPsw
                        pswAttempts = 0
                        serverToDatabaseChan!AccountCredit,0
                        databasetoServerChan?databaseResponse,accountFunds
                        serverToClientChan!ValidPsw
                        break
                    ::  else
                        pswAttempts++
                        if
                        ::  pswAttempts >= 3
                            serverToClientChan!AccountBlocked // return to start
                            break
                        ::  else
                            serverToClientChan!InvalidPsw
                        fi
                    fi
                ::  else -> serverToClientChan!InvalidRequest
                fi
        od
        do
        ::  clientToServerChan??AddFunds
            accountFunds = accountFunds + 5
            serverToDatabaseChan!SaveAccountCredit,accountFunds
            databasetoServerChan?databaseResponse,uselessCreditInfo
            serverToClientChan!FundsAdded
        ::  clientToServerChan??WithdrawFunds
            if
            ::  accountFunds <= 0
                serverToClientChan!NoMoreFunds
            ::  else
                accountFunds = 0
                serverToDatabaseChan!SaveAccountCredit,accountFunds
                databasetoServerChan?databaseResponse,uselessCreditInfo
                serverToClientChan!FundsWithdrew
            fi
        ::  clientToServerChan??BuyMeal
            if
            ::  accountFunds < 10
                serverToClientChan!NotEnoughFunds
            ::  else
                accountFunds = accountFunds - 10
                serverToDatabaseChan!SaveAccountCredit,accountFunds
                databasetoServerChan?databaseResponse,uselessCreditInfo
                serverToClientChan!BoughtMeal
            fi
        ::  clientToServerChan??LogOut
            serverToClientChan!LoggedOut
            break
        :: fkYou = 0
        od
    od
}
proctype client(chan serverToClientChan; chan clientToServerChan){
    mtype:ServerResponse serverResponse
    do
    ::  do
        ::  clientToServerChan!CheckUsername
            serverToClientChan?serverResponse
            if
            ::  serverResponse == ValidUsername -> printf("validUsename\n"); break// break loop
            ::  else -> skip
            fi
        od

        do
        ::  clientToServerChan!CheckPassword
            serverToClientChan?serverResponse
            if
            ::  serverResponse == ValidPsw -> printf("validPsw\n"); break
            ::  serverResponse == AccountBlocked -> printf("accountBlocked\n"); skip // return to start to proc
            :: else -> printf("invalidPsw \n"); skip
            fi
        od

        do
        ::  printf("Adding funds \n")
            clientToServerChan!AddFunds    // Add funds
            serverToClientChan?serverResponse
            printf("Funds added\n")
        ::  printf("Withdrawing funds \n")
            clientToServerChan!WithdrawFunds   // WithdrawFunds
            serverToClientChan?serverResponse
            if
            ::  serverResponse == FundsWithdrew -> printf("FundsWithdrew with success\n")
            ::  else -> printf("ERROR with the withdraw\n")
            fi
        ::  printf("buying a meal \n")
            clientToServerChan!BuyMeal // BuyMeal
            serverToClientChan?serverResponse
            if
            ::  serverResponse == BoughtMeal -> printf("Meal bought with success\n")
            ::  else -> printf("ERROR with the transaction\n")
            fi
        ::  printf("Logging out \n")
            clientToServerChan!LogOut  // LogOut
            serverToClientChan?serverResponse
            printf("Logged out\n")
            break
        od
    od
}
init{
    chan clientToServerChan = [0] of {mtype:ClientRequest}
    chan serverToClientChan = [0] of {mtype:ServerResponse}
    chan serverToDatabaseChan = [0] of {mtype:ServerRequest , int}
    chan databasetoServerChan = [0] of {mtype:DatabaseResponse , int}
    run database(serverToDatabaseChan, databasetoServerChan) ; run client(serverToClientChan, clientToServerChan) ; run server(clientToServerChan, serverToClientChan, serverToDatabaseChan, databasetoServerChan)
}