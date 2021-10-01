mtype:Msg = {Error, Election, Ok, Coordinator}
mtype:State = {Active, Down, Electing, IsLeader}
proctype Node(int id; chan chan1; chan chan2; chan chan3; int id1; int id2; int id3){
    mtype:State currentState = Active
    int indexNextElection = -1
    int nbResponseExpected = 0
    int currentChanIndex = 0
    chan chans[3]
    bool hasPotentielCoord = false
    chans[0] = chan1
    chans[1] = chan2
    chans[2] = chan3
    int ids[3]
    ids[0] = id1
    ids[1] = id2
    ids[2] = id3
    mtype:Msg msg
    int i

    if
    ::  id == 4
        currentState = Down
        chan1?msg
        chan1!Error
    ::  id == 1
        chan3!Ok
        chan3?msg
        if
        :: msg == Error -> goto MsgRecieved
        :: else -> printf("REEEEE \n")
        fi
    :: else -> printf("No problem \n")
    fi
FkYou:
    do
    ::  chan1?msg 
        if
        ::  currentState != Down 
            printf("%d - got %e from %d \n", id, msg, ids[0]);
            currentChanIndex = 0
            goto MsgRecieved
        ::  else -> chan1!Error
        fi
    ::  chan2?msg 
        if
        ::  currentState != Down 
            printf("%d - got %e from %d \n", id, msg, ids[1]);
            currentChanIndex = 1
            goto MsgRecieved
        ::  else -> chan2!Error
        fi
    ::  chan3?msg 
        if
        ::  currentState != Down 
            printf("%d - got %e from %d \n", id, msg, ids[2]);
            currentChanIndex = 2
            goto MsgRecieved
        ::  else -> chan3!Error
        fi
    ::  currentState == Electing && nbResponseExpected == 0 -> goto Search
    ::  currentState == IsLeader && nbResponseExpected == 0 -> goto Coord
    ::  goto FkYou
    od

MsgRecieved:
    if
    ::  msg == Error
        if
        ::  currentState == Active 
            // start election
            printf("%d - got error, starting election\n", id)
            currentState = Electing
        ::  currentState == Electing 
            nbResponseExpected--
            printf("%d %e- A node is down %d\n", id, currentState, nbResponseExpected)
        ::  currentState == IsLeader
            printf("%d %e- A node is down %d\n", id, currentState, nbResponseExpected)
        :: else -> printf("%d - Ignoring msg cause I am down \n", id)
        fi

    ::  msg == Election
        currentState = Electing
        chans[currentChanIndex]!Ok

    ::  msg == Ok && currentState == Electing -> hasPotentielCoord = true;nbResponseExpected--

    :: msg == Coordinator -> printf("%d - Coordinateur est %d\n", id, ids[currentChanIndex])
    fi
    goto FkYou

Search: indexNextElection++
        if
        ::  indexNextElection > 2
            indexNextElection = -1;
            if
            ::  !hasPotentielCoord -> currentState = IsLeader;
            ::  else -> currentState = Active
            fi       
        ::  else
            if
            ::  ids[indexNextElection] > id -> nbResponseExpected++; chans[indexNextElection]!Election
            ::  else -> printf("%d - Skipping lower node %d \n", id, ids[indexNextElection]);
            fi
        fi
        goto FkYou

Coord:  indexNextElection++
        if
        ::  indexNextElection < 3
            chans[indexNextElection]!Coordinator
        ::  else -> printf("%d - Coordination confirmed \n", id); indexNextElection = -1;
        fi
        goto FkYou 
}

init{
    chan nodeChans[6] = [0] of { mtype:Msg }
    // [0] -> 1-2
    // [1] -> 2-3
    // [2] -> 3-4
    // [3] -> 1-3
    // [4] -> 1-4
    // [5] -> 2-4

    run Node(1, nodeChans[0], nodeChans[3], nodeChans[4], 2, 3, 4)
    run Node(2, nodeChans[0], nodeChans[1], nodeChans[5], 1, 3, 4)
    run Node(3, nodeChans[3], nodeChans[1], nodeChans[2], 1, 2, 4)
    run Node(4, nodeChans[4], nodeChans[5], nodeChans[2], 1, 2 ,3)
}