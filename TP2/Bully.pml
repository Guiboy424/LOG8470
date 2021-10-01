mtype = {Error, Election, Ok, Coordinator}
proctype Node(int id; chan chan1; chan chan2; chan chan3; int id1; int id2; int id3){
    chan chans[3]
    bool isActive = true
    chans[0] = chan1
    chans[1] = chan2
    chans[2] = chan3
    int ids[3]
    ids[0] = id1
    ids[1] = id2
    ids[2] = id3
    mtype msg
    int i

    if
    ::  id == 4
        isActive = false
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
        ::  isActive -> printf("%d - got %e from %d \n", id, msg, ids[0]); chan1!Ok; goto MsgRecieved
        ::  !isActive -> chan1!Error
        fi
    ::  chan2?msg 
        if
        ::  isActive -> printf("%d - got %e from %d \n", id, msg, ids[1]); chan2!Ok; goto MsgRecieved
        ::  !isActive -> chan2!Error
        fi
    ::  chan3?msg 
        if
        ::  isActive -> printf("%d - got %e from %d \n", id, msg, ids[2]); chan3!Ok; goto MsgRecieved
        ::  !isActive -> chan3!Error
        fi
    ::  goto FkYou
    od

MsgRecieved:
    if
    ::  msg == Error
        printf("%d - got error \n", id)
        msg = Election
        goto MsgRecieved

    ::  msg == Election
        printf("%d - got election \n", id)
        bool hasSupValid = false
        for (i in ids) {
            if
            ::  ids[i] > id
                printf("%d - Node %d is higher \n", id, ids[i])
                chans[i]!Election
                chans[i]?msg
                if
                ::  msg == Ok -> hasSupValid = true
                ::  msg == Error -> printf("%d - Node %d cant be president \n", id, ids[i])
                fi
            ::  else -> printf("%d - Continue looking ... %d \n", id, ids[i])
            fi
        }
        if
        ::  hasSupValid -> printf("%d - Found at least one potential president \n", id)
        ::  else
            for (i in ids) {
                chans[i]!Coordinator
                chans[i]?msg
            }
            printf("%d is the leader \n", id)
        fi
    :: msg == Coordinator -> printf("Coordinateur trouver\n")
    fi
    goto FkYou
}

init{
    chan nodeChans[6] = [0] of { mtype }
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