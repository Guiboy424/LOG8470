mtype = {Error, Election, Ok, Coordinator}
chan chans[4] = [10] of {int, mtype} // Array of channels
// chans[0] = input channel of node 1
// chans[1] = input channel of node 2
// chans[2] = input channel of node 3
// chans[3] = input channel of node 4
int nbNodeNeedingChief = 4 // Global var to count the number of node who haven't found Coordinator yet

proctype Node(int id; chan inputChan){
    int msgId
    mtype msg
    bool isElecting = false
    bool hasChief = false


    if
    ::  id == 4                 // Sending Error to node 1 to start election
        inputChan?msgId, msg
        chans[msgId-1]!id,Error
    ::  id == 1                 // Sending Ok to receive Error from node 4
        chans[3]!id,Ok
    ::  else -> skip
    fi

    int i
    bool hasValidSup = false
    do
    ::  !hasChief
        // Listens the input channel for a message 
        do
        :: inputChan?msgId,msg
            if
            ::  msg == Election
                if
                ::  id == 4 -> chans[msgId-1]!id,Error; // The node 4 must throw Error because its down
                ::  else -> chans[msgId-1]!id,Ok; isElecting = true // Node enters election mode; Sending Ok response
                fi
                break
            ::  msg == Error // Received Error while not electing, starting election
                isElecting = true
                break
            ::  msg == Coordinator // This node has his chief
                hasChief = true
                break
            ::  else -> skip       // Continue listening ...
            fi
        ::  timeout // Continue listening ...
        od
        // End listening loop

        // Start election if isElecting
        if
        ::  isElecting
            for(i : id .. 3){   // For each node with higher id
                chans[i]!id,Election    // Sending election message
                do
                ::  inputChan??msgId,Error
                    break
                ::  inputChan??msgId,Ok
                    hasValidSup = true  // Node receive Ok response from Election msg, found a possible Coordinator
                    break
                ::  skip
                od
            }
        ::  else -> skip
        fi

        // Check if node should be Coordinator after election process
        if
        ::  !hasValidSup && isElecting  // If node has no Coordinator possible, becomes Coordinator
            for(i : 0 .. 3){    // Sending Coordinator message to other nodes
                if
                ::  i+1 != id
                    chans[i]!id,Coordinator
                ::  else -> skip
                fi
            }
            printf("%d, is new chief \n", id)
            hasChief = true
        ::  else -> skip
        fi

    ::  hasChief
        printf("%d - has chief \n", id)
        nbNodeNeedingChief--
        // Listening for messages
        do
        ::  inputChan?msgId,msg
            if
            ::  msg == Election // Sending response if receive election message
                if
                ::  id == 4 -> chans[msgId-1]!id,Error
                ::  else -> chans[msgId-1]!id,Ok
                fi
            ::  else -> skip
            fi
        ::  nbNodeNeedingChief == 0 -> break // Quit program if every node receive Coordinator message
        ::  skip // Continue listening
        od
        break // Quitting program ...
    od
    printf("%d - shuting down \n", id)
}

init{
    run Node(1, chans[0])
    run Node(2, chans[1])
    run Node(3, chans[2])
    run Node(4, chans[3])
}