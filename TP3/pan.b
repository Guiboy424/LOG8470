	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM p4 */
;
		;
		;
		;
		
	case 5: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC :init: */

	case 6: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 3
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 4
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC client */

	case 10: // STATE 1
		;
		((P2 *)_this)->returnToStartState = trpt->bup.oval;
		;
		goto R999;

	case 11: // STATE 2
		;
		clientCanOrder = trpt->bup.oval;
		;
		goto R999;

	case 12: // STATE 3
		;
		now.clientConnected = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 14: // STATE 5
		;
		_m = unsend(((P2 *)_this)->clientToServerChan);
		;
		goto R999;

	case 15: // STATE 6
		;
		XX = 1;
		unrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, ((P2 *)_this)->serverResponse, 1);
		((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;

	case 16: // STATE 7
		;
	/* 0 */	((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;

	case 17: // STATE 17
		;
		_m = unsend(((P2 *)_this)->clientToServerChan);
		;
		goto R999;

	case 18: // STATE 18
		;
		XX = 1;
		unrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, ((P2 *)_this)->serverResponse, 1);
		((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;

	case 19: // STATE 19
		;
	/* 0 */	((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;

	case 20: // STATE 21
		;
		now.clientConnected = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 22
		;
		clientCanOrder = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 26
		;
		((P2 *)_this)->returnToStartState = trpt->bup.ovals[1];
	/* 0 */	((P2 *)_this)->serverResponse = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 24: // STATE 36
		;
	/* 0 */	((P2 *)_this)->returnToStartState = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		
	case 27: // STATE 39
		;
		_m = unsend(((P2 *)_this)->clientToServerChan);
		;
		goto R999;

	case 28: // STATE 40
		;
	/* 0 */	((P2 *)_this)->serverResponse = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, ((P2 *)_this)->serverResponse, 1);
		((P2 *)_this)->serverResponse = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		;
		;
		
	case 31: // STATE 43
		;
		_m = unsend(((P2 *)_this)->clientToServerChan);
		;
		goto R999;

	case 32: // STATE 44
		;
		XX = 1;
		unrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, ((P2 *)_this)->serverResponse, 1);
		((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;

	case 33: // STATE 45
		;
	/* 0 */	((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;

	case 34: // STATE 47
		;
		now.moneyWithdrew = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 37: // STATE 53
		;
		_m = unsend(((P2 *)_this)->clientToServerChan);
		;
		goto R999;

	case 38: // STATE 54
		;
		XX = 1;
		unrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, ((P2 *)_this)->serverResponse, 1);
		((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;

	case 39: // STATE 55
		;
	/* 0 */	((P2 *)_this)->serverResponse = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 43: // STATE 63
		;
		_m = unsend(((P2 *)_this)->clientToServerChan);
		;
		goto R999;

	case 44: // STATE 64
		;
	/* 0 */	((P2 *)_this)->serverResponse = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, ((P2 *)_this)->serverResponse, 1);
		((P2 *)_this)->serverResponse = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 45: // STATE 65
		;
		clientCanOrder = trpt->bup.oval;
		;
		goto R999;

	case 46: // STATE 66
		;
		now.clientConnected = trpt->bup.oval;
		;
		goto R999;

	case 47: // STATE 67
		;
		now.moneyWithdrew = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 51: // STATE 84
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC server */

	case 52: // STATE 1
		;
		((P1 *)_this)->returnToStartState = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 54: // STATE 3
		;
		XX = 1;
		unrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, ((P1 *)_this)->clientRequest, 1);
		((P1 *)_this)->clientRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 55: // STATE 4
		;
	/* 0 */	((P1 *)_this)->clientRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 56: // STATE 5
		;
		_m = unsend(((P1 *)_this)->serverToDatabaseChan);
		;
		goto R999;

	case 57: // STATE 6
		;
	/* 0 */	((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, ((P1 *)_this)->uselessCreditInfo, 1);
		((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 58: // STATE 7
		;
		now.serverChoice = trpt->bup.oval;
		;
		goto R999;

	case 59: // STATE 9
		;
		now.serverChoice = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 62: // STATE 16
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 63: // STATE 19
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 64: // STATE 23
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;
;
		;
		
	case 66: // STATE 30
		;
		XX = 1;
		unrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, ((P1 *)_this)->clientRequest, 1);
		((P1 *)_this)->clientRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 67: // STATE 31
		;
	/* 0 */	((P1 *)_this)->clientRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 68: // STATE 32
		;
		_m = unsend(((P1 *)_this)->serverToDatabaseChan);
		;
		goto R999;

	case 69: // STATE 33
		;
	/* 0 */	((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, ((P1 *)_this)->uselessCreditInfo, 1);
		((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 70: // STATE 34
		;
		now.isPasswordValid = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 72: // STATE 37
		;
		now.isPasswordValid = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		
	case 75: // STATE 44
		;
		accountLocked = trpt->bup.oval;
		;
		goto R999;

	case 76: // STATE 45
		;
		now.pswAttempts = trpt->bup.oval;
		;
		goto R999;

	case 77: // STATE 46
		;
		_m = unsend(((P1 *)_this)->serverToDatabaseChan);
		;
		goto R999;

	case 78: // STATE 47
		;
		XX = 1;
		unrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, ((P1 *)_this)->accountFunds, 1);
		((P1 *)_this)->accountFunds = trpt->bup.oval;
		;
		;
		goto R999;

	case 79: // STATE 48
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 80: // STATE 51
		;
		now.pswAttempts = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 82: // STATE 53
		;
		accountLocked = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 84: // STATE 55
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 85: // STATE 56
		;
		((P1 *)_this)->returnToStartState = trpt->bup.oval;
		;
		goto R999;

	case 86: // STATE 59
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 87: // STATE 65
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;
;
		
	case 88: // STATE 71
		goto R999;

	case 89: // STATE 72
		;
	/* 0 */	((P1 *)_this)->returnToStartState = trpt->bup.oval;
		;
		;
		goto R999;

	case 90: // STATE 73
		;
		XX = trpt->bup.oval;
		unrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 4, 1);
		;
		;
		goto R999;
;
		;
		
	case 92: // STATE 75
		;
		((P1 *)_this)->accountFunds = trpt->bup.oval;
		;
		goto R999;

	case 93: // STATE 76
		;
		_m = unsend(((P1 *)_this)->serverToDatabaseChan);
		;
		goto R999;

	case 94: // STATE 77
		;
	/* 0 */	((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, ((P1 *)_this)->uselessCreditInfo, 1);
		((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 95: // STATE 78
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 96: // STATE 79
		;
		XX = trpt->bup.oval;
		unrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 3, 1);
		;
		;
		goto R999;
;
		;
		
	case 98: // STATE 81
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 99: // STATE 83
		;
		((P1 *)_this)->accountFunds = trpt->bup.oval;
		;
		goto R999;

	case 100: // STATE 84
		;
		_m = unsend(((P1 *)_this)->serverToDatabaseChan);
		;
		goto R999;

	case 101: // STATE 85
		;
	/* 0 */	((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, ((P1 *)_this)->uselessCreditInfo, 1);
		((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 102: // STATE 86
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 103: // STATE 89
		;
		XX = trpt->bup.oval;
		unrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 2, 1);
		;
		;
		goto R999;
;
		;
		
	case 105: // STATE 91
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 106: // STATE 93
		;
		((P1 *)_this)->accountFunds = trpt->bup.oval;
		;
		goto R999;

	case 107: // STATE 94
		;
		_m = unsend(((P1 *)_this)->serverToDatabaseChan);
		;
		goto R999;

	case 108: // STATE 95
		;
	/* 0 */	((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, ((P1 *)_this)->uselessCreditInfo, 1);
		((P1 *)_this)->uselessCreditInfo = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 109: // STATE 96
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 110: // STATE 99
		;
		XX = trpt->bup.oval;
		unrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 1, 1);
		;
		;
		goto R999;

	case 111: // STATE 100
		;
		_m = unsend(((P1 *)_this)->serverToClientChan);
		;
		goto R999;

	case 112: // STATE 102
		;
		((P1 *)_this)->fkYou = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 114: // STATE 114
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC database */
;
		;
		
	case 116: // STATE 2
		;
		XX = 1;
		unrecv(((P0 *)_this)->serverToDatabaseChan, XX-1, 0, ((P0 *)_this)->serverRequest, 1);
		unrecv(((P0 *)_this)->serverToDatabaseChan, XX-1, 1, ((P0 *)_this)->serverCredit, 0);
		((P0 *)_this)->serverRequest = trpt->bup.ovals[0];
		((P0 *)_this)->serverCredit = trpt->bup.ovals[1];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 117: // STATE 3
		;
	/* 0 */	((P0 *)_this)->serverRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 118: // STATE 4
		;
		_m = unsend(((P0 *)_this)->databasetoServerChan);
		;
		goto R999;

	case 119: // STATE 5
		;
	/* 0 */	((P0 *)_this)->serverRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 120: // STATE 6
		;
		now.accountCredit = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 122: // STATE 8
		;
		_m = unsend(((P0 *)_this)->databasetoServerChan);
		;
		goto R999;

	case 123: // STATE 9
		;
	/* 0 */	((P0 *)_this)->serverRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 124: // STATE 10
		;
		_m = unsend(((P0 *)_this)->databasetoServerChan);
		;
		goto R999;

	case 125: // STATE 11
		;
	/* 0 */	((P0 *)_this)->serverRequest = trpt->bup.oval;
		;
		;
		goto R999;

	case 126: // STATE 12
		;
		_m = unsend(((P0 *)_this)->databasetoServerChan);
		;
		goto R999;

	case 127: // STATE 20
		;
		p_restor(II);
		;
		;
		goto R999;
	}

