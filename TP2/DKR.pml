proctype Node(int id; chan chanIn; chan chanOut){
    bool isActive = true
    int msgIn
    int ids[2] // ids of previous nodes

    do
    ::  if
        ::  isActive -> 
            chanOut!id
            chanIn?ids[0]
            chanOut!ids[0]
            chanIn?ids[1]
            if
            ::  ids[0] > id && ids[0] > ids[1] -> id = ids[0]
            ::  id == ids[0] -> goto L1
            ::  else -> isActive = false
            fi
        ::  else ->
                    do
                    ::  chanIn?msgIn
                        chanOut!msgIn
                    ::  else ->
                    od
        fi
    od
L1:    printf("I am the leader: %d", id)
}

init{
    chan nodeChan[6] = [1] of {int}
    run Node(145, nodeChan[5], nodeChan[0])
    run Node(76, nodeChan[0], nodeChan[1])
    run Node(3, nodeChan[1], nodeChan[2])
    run Node(90, nodeChan[2], nodeChan[3])
    run Node(5, nodeChan[3], nodeChan[4])
    run Node(123, nodeChan[4], nodeChan[5])
}