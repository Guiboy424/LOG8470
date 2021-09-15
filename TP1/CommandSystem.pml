mtype:MenuComm = { CheckedMenu, AskMenu}
proctype MenuService(chan menuIn; chan menuOut){
    mtype:MenuComm menuInput
    menuIn[0]?menuInput
    printf("%e", menuInput)
    menuIn[1]!CheckedMenu
}
init{
    chan menuChan[2] = [0] of {mtype:MenuComm}
    run MenuService(menuChan[0], menuChanp[1])
    menuChan[0]!AskMenu
    mtype:MenuComm menuResponse
    menuChan[2]?menuResponse
    printf("%e", menuResponse)
}