mtype:MenuComm = {CheckedMenu, AskMenu}
mtype:OrderComm = {PreparingOrder, OrderFood}
mtype:CreditComm = {FoodPaid, PayFood}
mtype:DeliveryComm = {ChooseDeliveryOrder, AskDelivery}

proctype MenuService(chan menuIn; chan menuOut){
    do
    :: mtype:MenuComm menuInput
        menuIn?menuInput
        printf("j'ai recu comme message: %e\n", menuInput)
        menuOut!CheckedMenu
    od
}
proctype OrderFoodService(chan orderIn; chan orderOut){
    do
    ::mtype:OrderComm orderInput
        orderIn?orderInput
        printf("Commande de type: %e\n", orderInput)
        orderOut!PreparingOrder
    od
}
proctype SchoolCreditCardAccountService(chan creditIn; chan creditOut){
    do
    ::mtype:CreditComm creditInput
        creditIn?creditInput
        printf("Mode de paiement de type: %e\n", creditInput)
        creditOut!FoodPaid
    od
}
proctype DeliveryService(chan deliveryIn; chan deliveryOut){
    do
    :: mtype:DeliveryComm deliveryInput
        deliveryIn?deliveryInput
        printf("Demande de livraison: %e\n", deliveryInput)
        deliveryOut!ChooseDeliveryOrder
    od
}
init{
    // Creating channels
    chan menuRequestChan = [15] of {mtype:MenuComm}
    chan menuResponseChan = [15] of {mtype:MenuComm}
    chan orderRequestChan = [15] of {mtype:OrderComm}
    chan orderResponseChan = [15] of {mtype:OrderComm}
    chan creditRequestChan = [15] of {mtype:CreditComm}
    chan creditResponseChan = [15] of {mtype:CreditComm}
    chan deliveryRequestChan = [15] of {mtype:DeliveryComm}
    chan deliveryResponseChan = [15] of {mtype:DeliveryComm}

    mtype ClientRequests[8] = {AskMenu, OrderFood, PayFood, AskDelivery, OrderFood, AskMenu, AskDelivery, PayFood}
    int requestCounter = 0
    mtype:MenuComm menuResponse
    mtype:OrderComm orderResponse
    mtype:CreditComm creditResponse
    mtype:DeliveryComm deliveryResponse
    mtype currentClientRequest

    run MenuService(menuRequestChan, menuResponseChan)
    run OrderFoodService(orderRequestChan, orderResponseChan)
    run SchoolCreditCardAccountService(creditRequestChan, creditResponseChan)
    run DeliveryService(deliveryRequestChan, deliveryResponseChan)

    do
    ::  currentClientRequest = ClientRequests[requestCounter%8]
        requestCounter++
        printf("New Client request\n")
        if
        :: (currentClientRequest == AskMenu && len(menuRequestChan) < 1) -> menuRequestChan!AskMenu; printf("Menu %d\n",len(menuRequestChan))
        :: (currentClientRequest == OrderFood && len(orderRequestChan) < 1) -> orderRequestChan!OrderFood; printf("Order %d\n",len(orderRequestChan))
        :: (currentClientRequest == PayFood && len(creditRequestChan) < 1) -> creditRequestChan!PayFood; printf("Credit %d\n",len(creditRequestChan))
        :: (currentClientRequest == AskDelivery && len(deliveryRequestChan) < 1) -> deliveryRequestChan!AskDelivery; printf("Delivery %d\n",len(deliveryRequestChan))
        fi
    ::  menuResponseChan?menuResponse
        printf("%e\n", menuResponse)
    ::  creditResponseChan?creditResponse
        printf("%e\n", creditResponse)
    ::  orderResponseChan?orderResponse
        printf("%e\n", orderResponse)
        printf("Requesting PayFood from OrderFoodService response\n")
        printf("%d\n", len(creditRequestChan))
        creditRequestChan!PayFood
    ::  deliveryResponseChan?deliveryResponse
        printf("%e \n", deliveryResponse)
        printf("Requesting OrderFood from DeliveryService response\n")
        orderRequestChan!OrderFood
    od
}