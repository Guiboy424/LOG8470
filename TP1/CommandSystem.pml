#define NbOfClientRequest 8

// Definition of the messages
mtype:MenuComm = {CheckedMenu, AskMenu}
mtype:OrderComm = {PreparingOrder, OrderFood}
mtype:CreditComm = {FoodPaid, PayFood}
mtype:DeliveryComm = {ChooseDeliveryOrder, AskDelivery}

proctype MenuService(chan menuRequestChan; chan menuResponseChan){
    do
    ::  mtype:MenuComm menuRequest
        menuRequestChan?menuRequest
        if
        :: menuRequest == AskMenu -> menuResponseChan!CheckedMenu
        :: else -> printf("Error in MenuService: Wrong request \n")
        fi
    od
}
proctype OrderFoodService(chan orderRequestChan; chan orderResponseChan){
    do
    ::  mtype:OrderComm orderRequest
        orderRequestChan?orderRequest
        if
        :: orderRequest == OrderFood -> orderResponseChan!PreparingOrder
        :: else -> printf("Error in OrderFoodService: Wrong request \n")
        fi
    od
}
proctype SchoolCreditCardAccountService(chan creditRequestChan; chan creditResponseChan){
    do
    ::  mtype:CreditComm creditRequest
        creditRequestChan?creditRequest
        if
        :: creditRequest == PayFood -> creditResponseChan!FoodPaid
        :: else -> printf("Error in SchoolCreditCardAccountService: Wrong request \n")
        fi
    od
}
proctype DeliveryService(chan deliveryRequestChan; chan deliveryResponseChan){
    do
    ::  mtype:DeliveryComm deliveryRequest
        deliveryRequestChan?deliveryRequest
        if
        :: deliveryRequest == AskDelivery -> deliveryResponseChan!ChooseDeliveryOrder
        :: else -> printf("Error in DeliveryService: Wrong request \n")
        fi
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

    // Vars to emulate a client
    mtype ClientRequests[NbOfClientRequest] = {AskMenu, OrderFood, PayFood, AskDelivery, OrderFood, AskMenu, AskDelivery, PayFood}
    int requestCounter = 0
    mtype currentClientRequest
    int noClientRequestCounter = 0

    // Starting services
    run MenuService(menuRequestChan, menuResponseChan)
    run OrderFoodService(orderRequestChan, orderResponseChan)
    run SchoolCreditCardAccountService(creditRequestChan, creditResponseChan)
    run DeliveryService(deliveryRequestChan, deliveryResponseChan)

    // Vars to put the response into
    mtype:MenuComm menuResponse
    mtype:OrderComm orderResponse
    mtype:CreditComm creditResponse
    mtype:DeliveryComm deliveryResponse

    // Listening loop
    do
    ::  requestCounter < NbOfClientRequest
        noClientRequestCounter = 0
        currentClientRequest = ClientRequests[requestCounter]
        requestCounter++
        printf("New Client request -> ")
        if
        :: (currentClientRequest == AskMenu && len(menuRequestChan) < 1) -> menuRequestChan!AskMenu; printf("AskMenu \n")
        :: (currentClientRequest == OrderFood && len(orderRequestChan) < 1) -> orderRequestChan!OrderFood; printf("OrderFood \n")
        :: (currentClientRequest == PayFood && len(creditRequestChan) < 1) -> creditRequestChan!PayFood; printf("PayFood \n")
        :: (currentClientRequest == AskDelivery && len(deliveryRequestChan) < 1) -> deliveryRequestChan!AskDelivery; printf("AskDelivery \n")
        :: else -> requestCounter--; printf("No space to accept client request, the request will be accepted in another cycle. \n")
        fi
    ::  menuResponseChan?menuResponse
        noClientRequestCounter = 0
        printf("%e\n", menuResponse)
    ::  creditResponseChan?creditResponse
        noClientRequestCounter = 0
        printf("%e\n", creditResponse)
    ::  orderResponseChan?orderResponse
        noClientRequestCounter = 0
        printf("%e\n", orderResponse)
        printf("Requesting PayFood from OrderFoodService response\n")
        creditRequestChan!PayFood
    ::  deliveryResponseChan?deliveryResponse
        noClientRequestCounter = 0
        printf("%e \n", deliveryResponse)
        printf("Requesting OrderFood from DeliveryService response\n")
        orderRequestChan!OrderFood
    ::  timeout ->
        if
        :: noClientRequestCounter > 5 -> break
        :: else -> printf("No client request \n"); noClientRequestCounter++
        fi
    od
    printf("Program ending... \n")
}