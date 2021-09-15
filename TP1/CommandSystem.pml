mtype:MenuComm = { CheckedMenu, AskMenu}
mtype:OrderingComm = {PreparingOrder, PreparingDeliveryOrder, OrderFood, OrderFoodDelivery}
mtype:CreditComm = {FoodPaid, DeliveryFoodPaid, PayFood, PayFoodDelivery}
mtype:DeliveryComm = {ChooseDeliveryOrder, AskDelivery}

proctype MenuService(chan menuIn; chan menuOut){
    do
    :: mtype:MenuComm menuInput
        menuIn?menuInput
        printf("j'ai recu comme message: %e \n", menuInput)
        menuOut!CheckedMenu
    od
}
proctype OrderFoodService(chan orderIn; chan orderOut){
    do
    ::mtype:OrderingComm orderInput
        orderIn?orderInput
        printf("Commande de type: %e \n", orderInput)
        if
        :: orderInput == OrderFood -> orderOut!PreparingOrder
        :: orderInput == OrderFoodDelivery -> orderOut!PreparingDeliveryOrder
        fi
    od
}
proctype SchoolCreditCardAccountService(chan creditIn; chan creditOut){
    do
    ::mtype:CreditComm creditInput
        creditIn?creditInput
        printf("Mode de paiement de type: %e \n", creditInput)
        if
        :: creditInput == PayFood -> creditOut!FoodPaid
        :: creditInput == PayFoodDelivery -> creditOut!DeliveryFoodPaid
        fi
    od
}
proctype DeliveryService(chan deliveryIn; chan deliveryOut){
    do
    :: mtype:DeliveryComm deliveryInput
        deliveryIn?deliveryInput
        printf("Demande de livraison: %e \n", deliveryInput)
        deliveryOut!ChooseDeliveryOrder
    od
}
init{
    // // Menu section
    // chan menuIn = [0] of {mtype:MenuComm}
    // chan menuOut = [0] of {mtype:MenuComm}

    // run MenuService(menuInt, menuOut)

    // do
    // ::menuIn!AskMenu
    //     mtype:MenuComm menuResponse
    //     menuOut?menuResponse
    //     printf("%e\n", menuResponse)
    // od

    // // Ordering section
    // chan orderingIn = [5] of{mtype:OrderingComm}
    // chan orderingOut = [5] of {mtype:OrderingComm}

    // run OrderFoodService(orderingIn, orderingOut)
    // mtype:OrderingComm orderResponse

    // do
    // :: orderingIn!OrderFoodDelivery
    //     orderingOut?orderResponse
    //     printf("Reponse de commande: %e \n", orderResponse)
    // :: orderingIn!OrderFood
    //     orderingOut?orderResponse
    //     printf("Reponse de commande: %e \n", orderResponse)
    // od

    // // Credit section
    // chan creditIn = [5] of{mtype:CreditComm}
    // chan creditOut = [5] of {mtype:CreditComm}

    // run SchoolCreditCardAccountService(creditIn, creditOut)
    // mtype:CreditComm creditResponse

    // do
    // :: creditIn!PayFood
    //     creditOut?creditResponse
    //     printf("Reponse de paiement: %e \n", creditResponse)
    // :: creditIn!PayFoodDelivery
    //     creditOut?creditResponse
    //     printf("Reponse de paiement: %e \n", creditResponse)
    // od

    // // Delivery section
    // chan deliveryIn = [5] of {mtype:DeliveryComm}
    // chan deliveryOut = [5] of {mtype:DeliveryComm}

    // run DeliveryService(deliveryIn, deliveryOut)

    // do
    // ::deliveryIn!AskDelivery
    //     mtype:DeliveryComm deliveryResponse
    //     deliveryOut?deliveryResponse
    //     printf("Reponse de livraison: %e\n", deliveryResponse)
    // od
}