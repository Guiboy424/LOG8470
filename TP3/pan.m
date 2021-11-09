#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* CLAIM p4 */
	case 3: // STATE 1 - _spin_nvr.tmp:4 - [((!(!(clientConnected))&&!(moneyWithdrew)))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported1 = 0;
			if (verbose && !reported1)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported1 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][1] = 1;
		if (!(( !( !(((int)now.clientConnected)))&& !(((int)now.moneyWithdrew)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 6 - _spin_nvr.tmp:9 - [(!(moneyWithdrew))] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported6 = 0;
			if (verbose && !reported6)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported6 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][6] = 1;
		if (!( !(((int)now.moneyWithdrew))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 11 - _spin_nvr.tmp:11 - [-end-] (0:0:0 - 1)
		
#if defined(VERI) && !defined(NP)
#if NCLAIMS>1
		{	static int reported11 = 0;
			if (verbose && !reported11)
			{	int nn = (int) ((Pclaim *)pptr(0))->_n;
				printf("depth %ld: Claim %s (%d), state %d (line %d)\n",
					depth, procname[spin_c_typ[nn]], nn, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported11 = 1;
				fflush(stdout);
		}	}
#else
		{	static int reported11 = 0;
			if (verbose && !reported11)
			{	printf("depth %d: Claim, state %d (line %d)\n",
					(int) depth, (int) ((Pclaim *)pptr(0))->_p, src_claim[ (int) ((Pclaim *)pptr(0))->_p ]);
				reported11 = 1;
				fflush(stdout);
		}	}
#endif
#endif
		reached[4][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC :init: */
	case 6: // STATE 1 - AFN.pml:214 - [(run database(serverToDatabaseChan,databasetoServerChan))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][1] = 1;
		if (!(addproc(II, 1, 0, ((P3 *)_this)->serverToDatabaseChan, ((P3 *)_this)->databasetoServerChan, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 2 - AFN.pml:214 - [(run client(serverToClientChan,clientToServerChan))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][2] = 1;
		if (!(addproc(II, 1, 2, ((P3 *)_this)->serverToClientChan, ((P3 *)_this)->clientToServerChan, 0, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 3 - AFN.pml:214 - [(run server(clientToServerChan,serverToClientChan,serverToDatabaseChan,databasetoServerChan))] (0:0:0 - 1)
		IfNotBlocked
		reached[3][3] = 1;
		if (!(addproc(II, 1, 1, ((P3 *)_this)->clientToServerChan, ((P3 *)_this)->serverToClientChan, ((P3 *)_this)->serverToDatabaseChan, ((P3 *)_this)->databasetoServerChan)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 4 - AFN.pml:215 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC client */
	case 10: // STATE 1 - AFN.pml:146 - [returnToStartState = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->returnToStartState);
		((P2 *)_this)->returnToStartState = 0;
#ifdef VAR_RANGES
		logval("client:returnToStartState", ((int)((P2 *)_this)->returnToStartState));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 2 - AFN.pml:147 - [clientCanOrder = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		(trpt+1)->bup.oval = ((int)clientCanOrder);
		clientCanOrder = 0;
#ifdef VAR_RANGES
		logval("clientCanOrder", ((int)clientCanOrder));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 3 - AFN.pml:148 - [clientConnected = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][3] = 1;
		(trpt+1)->bup.oval = ((int)now.clientConnected);
		now.clientConnected = 0;
#ifdef VAR_RANGES
		logval("clientConnected", ((int)now.clientConnected));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 4 - AFN.pml:150 - [printf('c - sending check username\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		Printf("c - sending check username\n");
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 5 - AFN.pml:151 - [clientToServerChan!6] (0:0:0 - 1)
		IfNotBlocked
		reached[2][5] = 1;
		if (q_len(((P2 *)_this)->clientToServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)_this)->clientToServerChan, 0, 6, 0, 1);
		{ boq = ((P2 *)_this)->clientToServerChan; };
		_m = 2; goto P999; /* 0 */
	case 15: // STATE 6 - AFN.pml:152 - [serverToClientChan?serverResponse] (0:0:1 - 1)
		reached[2][6] = 1;
		if (boq != ((P2 *)_this)->serverToClientChan) continue;
		if (q_len(((P2 *)_this)->serverToClientChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
		;
		((P2 *)_this)->serverResponse = qrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("client:serverResponse", ((P2 *)_this)->serverResponse);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", ((P2 *)_this)->serverResponse); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P2 *)_this)->serverToClientChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 16: // STATE 7 - AFN.pml:154 - [((serverResponse==11))] (33:0:1 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		if (!((((P2 *)_this)->serverResponse==11)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverResponse */  (trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->serverResponse = 0;
		/* merge: printf('validUsename\\n')(0, 8, 33) */
		reached[2][8] = 1;
		Printf("validUsename\n");
		/* merge: goto :b8(0, 9, 33) */
		reached[2][9] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 17: // STATE 17 - AFN.pml:160 - [clientToServerChan!5] (0:0:0 - 1)
		IfNotBlocked
		reached[2][17] = 1;
		if (q_len(((P2 *)_this)->clientToServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)_this)->clientToServerChan, 0, 5, 0, 1);
		{ boq = ((P2 *)_this)->clientToServerChan; };
		_m = 2; goto P999; /* 0 */
	case 18: // STATE 18 - AFN.pml:161 - [serverToClientChan?serverResponse] (0:0:1 - 1)
		reached[2][18] = 1;
		if (boq != ((P2 *)_this)->serverToClientChan) continue;
		if (q_len(((P2 *)_this)->serverToClientChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
		;
		((P2 *)_this)->serverResponse = qrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("client:serverResponse", ((P2 *)_this)->serverResponse);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", ((P2 *)_this)->serverResponse); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P2 *)_this)->serverToClientChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 19: // STATE 19 - AFN.pml:163 - [((serverResponse==9))] (21:0:1 - 1)
		IfNotBlocked
		reached[2][19] = 1;
		if (!((((P2 *)_this)->serverResponse==9)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverResponse */  (trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->serverResponse = 0;
		/* merge: printf('validPsw\\n')(0, 20, 21) */
		reached[2][20] = 1;
		Printf("validPsw\n");
		_m = 3; goto P999; /* 1 */
	case 20: // STATE 21 - AFN.pml:163 - [clientConnected = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][21] = 1;
		(trpt+1)->bup.oval = ((int)now.clientConnected);
		now.clientConnected = 1;
#ifdef VAR_RANGES
		logval("clientConnected", ((int)now.clientConnected));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 21: // STATE 22 - AFN.pml:163 - [clientCanOrder = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		(trpt+1)->bup.oval = ((int)clientCanOrder);
		clientCanOrder = 1;
#ifdef VAR_RANGES
		logval("clientCanOrder", ((int)clientCanOrder));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 24 - AFN.pml:164 - [((serverResponse==8))] (79:0:2 - 1)
		IfNotBlocked
		reached[2][24] = 1;
		if (!((((P2 *)_this)->serverResponse==8)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverResponse */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->serverResponse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->serverResponse = 0;
		/* merge: printf('accountBlocked\\n')(79, 25, 79) */
		reached[2][25] = 1;
		Printf("accountBlocked\n");
		/* merge: returnToStartState = 1(79, 26, 79) */
		reached[2][26] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P2 *)_this)->returnToStartState);
		((P2 *)_this)->returnToStartState = 1;
#ifdef VAR_RANGES
		logval("client:returnToStartState", ((int)((P2 *)_this)->returnToStartState));
#endif
		;
		/* merge: goto :b9(0, 27, 79) */
		reached[2][27] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 23: // STATE 29 - AFN.pml:165 - [printf('invalidPsw \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][29] = 1;
		Printf("invalidPsw \n");
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 36 - AFN.pml:170 - [((returnToStartState==0))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][36] = 1;
		if (!((((int)((P2 *)_this)->returnToStartState)==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: returnToStartState */  (trpt+1)->bup.oval = ((P2 *)_this)->returnToStartState;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->returnToStartState = 0;
		_m = 3; goto P999; /* 0 */
	case 25: // STATE 37 - AFN.pml:172 - [(canAddFunds)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][37] = 1;
		if (!(((int)now.canAddFunds)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 26: // STATE 38 - AFN.pml:173 - [printf('Adding funds \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][38] = 1;
		Printf("Adding funds \n");
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 39 - AFN.pml:174 - [clientToServerChan!4] (0:0:0 - 1)
		IfNotBlocked
		reached[2][39] = 1;
		if (q_len(((P2 *)_this)->clientToServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)_this)->clientToServerChan, 0, 4, 0, 1);
		{ boq = ((P2 *)_this)->clientToServerChan; };
		_m = 2; goto P999; /* 0 */
	case 28: // STATE 40 - AFN.pml:175 - [serverToClientChan?serverResponse] (0:0:2 - 1)
		reached[2][40] = 1;
		if (boq != ((P2 *)_this)->serverToClientChan) continue;
		if (q_len(((P2 *)_this)->serverToClientChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->serverResponse;
		;
		((P2 *)_this)->serverResponse = qrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("client:serverResponse", ((P2 *)_this)->serverResponse);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", ((P2 *)_this)->serverResponse); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P2 *)_this)->serverToClientChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: serverResponse */  (trpt+1)->bup.ovals[1] = ((P2 *)_this)->serverResponse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->serverResponse = 0;
		_m = 4; goto P999; /* 0 */
	case 29: // STATE 41 - AFN.pml:176 - [printf('funds added \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][41] = 1;
		Printf("funds added \n");
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 42 - AFN.pml:177 - [printf('Withdrawing funds \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][42] = 1;
		Printf("Withdrawing funds \n");
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 43 - AFN.pml:178 - [clientToServerChan!3] (0:0:0 - 1)
		IfNotBlocked
		reached[2][43] = 1;
		if (q_len(((P2 *)_this)->clientToServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)_this)->clientToServerChan, 0, 3, 0, 1);
		{ boq = ((P2 *)_this)->clientToServerChan; };
		_m = 2; goto P999; /* 0 */
	case 32: // STATE 44 - AFN.pml:179 - [serverToClientChan?serverResponse] (0:0:1 - 1)
		reached[2][44] = 1;
		if (boq != ((P2 *)_this)->serverToClientChan) continue;
		if (q_len(((P2 *)_this)->serverToClientChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
		;
		((P2 *)_this)->serverResponse = qrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("client:serverResponse", ((P2 *)_this)->serverResponse);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", ((P2 *)_this)->serverResponse); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P2 *)_this)->serverToClientChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 33: // STATE 45 - AFN.pml:181 - [((serverResponse==6))] (47:0:1 - 1)
		IfNotBlocked
		reached[2][45] = 1;
		if (!((((P2 *)_this)->serverResponse==6)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverResponse */  (trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->serverResponse = 0;
		/* merge: printf('FundsWithdrew with success\\n')(0, 46, 47) */
		reached[2][46] = 1;
		Printf("FundsWithdrew with success\n");
		_m = 3; goto P999; /* 1 */
	case 34: // STATE 47 - AFN.pml:181 - [moneyWithdrew = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][47] = 1;
		(trpt+1)->bup.oval = ((int)now.moneyWithdrew);
		now.moneyWithdrew = 1;
#ifdef VAR_RANGES
		logval("moneyWithdrew", ((int)now.moneyWithdrew));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 49 - AFN.pml:182 - [printf('ERROR with the withdraw\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][49] = 1;
		Printf("ERROR with the withdraw\n");
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 52 - AFN.pml:184 - [printf('buying a meal \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][52] = 1;
		Printf("buying a meal \n");
		_m = 3; goto P999; /* 0 */
	case 37: // STATE 53 - AFN.pml:185 - [clientToServerChan!2] (0:0:0 - 1)
		IfNotBlocked
		reached[2][53] = 1;
		if (q_len(((P2 *)_this)->clientToServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)_this)->clientToServerChan, 0, 2, 0, 1);
		{ boq = ((P2 *)_this)->clientToServerChan; };
		_m = 2; goto P999; /* 0 */
	case 38: // STATE 54 - AFN.pml:186 - [serverToClientChan?serverResponse] (0:0:1 - 1)
		reached[2][54] = 1;
		if (boq != ((P2 *)_this)->serverToClientChan) continue;
		if (q_len(((P2 *)_this)->serverToClientChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
		;
		((P2 *)_this)->serverResponse = qrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("client:serverResponse", ((P2 *)_this)->serverResponse);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", ((P2 *)_this)->serverResponse); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P2 *)_this)->serverToClientChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 39: // STATE 55 - AFN.pml:188 - [((serverResponse==4))] (74:0:1 - 1)
		IfNotBlocked
		reached[2][55] = 1;
		if (!((((P2 *)_this)->serverResponse==4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverResponse */  (trpt+1)->bup.oval = ((P2 *)_this)->serverResponse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->serverResponse = 0;
		/* merge: printf('Meal bought with success\\n')(0, 56, 74) */
		reached[2][56] = 1;
		Printf("Meal bought with success\n");
		/* merge: .(goto)(0, 60, 74) */
		reached[2][60] = 1;
		;
		/* merge: .(goto)(0, 75, 74) */
		reached[2][75] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 40: // STATE 58 - AFN.pml:189 - [printf('ERROR with the transaction\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][58] = 1;
		Printf("ERROR with the transaction\n");
		_m = 3; goto P999; /* 0 */
	case 41: // STATE 61 - AFN.pml:193 - [(moneyWithdrew)] (0:0:0 - 1)
		IfNotBlocked
		reached[2][61] = 1;
		if (!(((int)now.moneyWithdrew)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 42: // STATE 62 - AFN.pml:194 - [printf('Logging out \\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][62] = 1;
		Printf("Logging out \n");
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 63 - AFN.pml:195 - [clientToServerChan!1] (0:0:0 - 1)
		IfNotBlocked
		reached[2][63] = 1;
		if (q_len(((P2 *)_this)->clientToServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P2 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P2 *)_this)->clientToServerChan, 0, 1, 0, 1);
		{ boq = ((P2 *)_this)->clientToServerChan; };
		_m = 2; goto P999; /* 0 */
	case 44: // STATE 64 - AFN.pml:196 - [serverToClientChan?serverResponse] (0:0:2 - 1)
		reached[2][64] = 1;
		if (boq != ((P2 *)_this)->serverToClientChan) continue;
		if (q_len(((P2 *)_this)->serverToClientChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P2 *)_this)->serverResponse;
		;
		((P2 *)_this)->serverResponse = qrecv(((P2 *)_this)->serverToClientChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("client:serverResponse", ((P2 *)_this)->serverResponse);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P2 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", ((P2 *)_this)->serverResponse); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P2 *)_this)->serverToClientChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: serverResponse */  (trpt+1)->bup.ovals[1] = ((P2 *)_this)->serverResponse;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->serverResponse = 0;
		_m = 4; goto P999; /* 0 */
	case 45: // STATE 65 - AFN.pml:197 - [clientCanOrder = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][65] = 1;
		(trpt+1)->bup.oval = ((int)clientCanOrder);
		clientCanOrder = 0;
#ifdef VAR_RANGES
		logval("clientCanOrder", ((int)clientCanOrder));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 66 - AFN.pml:198 - [clientConnected = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][66] = 1;
		(trpt+1)->bup.oval = ((int)now.clientConnected);
		now.clientConnected = 0;
#ifdef VAR_RANGES
		logval("clientConnected", ((int)now.clientConnected));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 47: // STATE 67 - AFN.pml:199 - [moneyWithdrew = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[2][67] = 1;
		(trpt+1)->bup.oval = ((int)now.moneyWithdrew);
		now.moneyWithdrew = 0;
#ifdef VAR_RANGES
		logval("moneyWithdrew", ((int)now.moneyWithdrew));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 48: // STATE 68 - AFN.pml:200 - [printf('Logged out\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][68] = 1;
		Printf("Logged out\n");
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 71 - AFN.pml:202 - [printf('c - doit retirer de largent avant de se deconnecter\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][71] = 1;
		Printf("c - doit retirer de largent avant de se deconnecter\n");
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 78 - AFN.pml:205 - [printf('c - returning to start state\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[2][78] = 1;
		Printf("c - returning to start state\n");
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 84 - AFN.pml:208 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][84] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC server */
	case 52: // STATE 1 - AFN.pml:48 - [returnToStartState = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->returnToStartState);
		((P1 *)_this)->returnToStartState = 0;
#ifdef VAR_RANGES
		logval("server:returnToStartState", ((int)((P1 *)_this)->returnToStartState));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 2 - AFN.pml:50 - [printf('s - waiting for client username\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		Printf("s - waiting for client username\n");
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 3 - AFN.pml:51 - [clientToServerChan?clientRequest] (0:0:1 - 1)
		reached[1][3] = 1;
		if (boq != ((P1 *)_this)->clientToServerChan) continue;
		if (q_len(((P1 *)_this)->clientToServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P1 *)_this)->clientRequest;
		;
		((P1 *)_this)->clientRequest = qrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:clientRequest", ((P1 *)_this)->clientRequest);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->clientRequest); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->clientToServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 55: // STATE 4 - AFN.pml:53 - [((clientRequest==6))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((((P1 *)_this)->clientRequest==6)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: clientRequest */  (trpt+1)->bup.oval = ((P1 *)_this)->clientRequest;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->clientRequest = 0;
		_m = 3; goto P999; /* 0 */
	case 56: // STATE 5 - AFN.pml:54 - [serverToDatabaseChan!2,0] (0:0:0 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (q_len(((P1 *)_this)->serverToDatabaseChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToDatabaseChan);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToDatabaseChan, 0, 2, 0, 2);
		{ boq = ((P1 *)_this)->serverToDatabaseChan; };
		_m = 2; goto P999; /* 0 */
	case 57: // STATE 6 - AFN.pml:55 - [databasetoServerChan?uselessCreditInfo] (0:0:2 - 1)
		reached[1][6] = 1;
		if (boq != ((P1 *)_this)->databasetoServerChan) continue;
		if (q_len(((P1 *)_this)->databasetoServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->uselessCreditInfo;
		;
		((P1 *)_this)->uselessCreditInfo = qrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:uselessCreditInfo", ((P1 *)_this)->uselessCreditInfo);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->uselessCreditInfo); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->databasetoServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: uselessCreditInfo */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->uselessCreditInfo;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->uselessCreditInfo = 0;
		_m = 4; goto P999; /* 0 */
	case 58: // STATE 7 - AFN.pml:57 - [serverChoice = 12] (0:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = now.serverChoice;
		now.serverChoice = 12;
#ifdef VAR_RANGES
		logval("serverChoice", now.serverChoice);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 59: // STATE 9 - AFN.pml:58 - [serverChoice = 11] (0:0:1 - 1)
		IfNotBlocked
		reached[1][9] = 1;
		(trpt+1)->bup.oval = now.serverChoice;
		now.serverChoice = 11;
#ifdef VAR_RANGES
		logval("serverChoice", now.serverChoice);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 60: // STATE 14 - AFN.pml:60 - [printf('s - choosing %e\\n',serverChoice)] (0:0:0 - 5)
		IfNotBlocked
		reached[1][14] = 1;
		Printf("s - choosing %e\n", now.serverChoice);
		_m = 3; goto P999; /* 0 */
	case 61: // STATE 15 - AFN.pml:62 - [((serverChoice==11))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][15] = 1;
		if (!((now.serverChoice==11)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 62: // STATE 16 - AFN.pml:62 - [serverToClientChan!11] (0:0:0 - 1)
		IfNotBlocked
		reached[1][16] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 11); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 11, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 63: // STATE 19 - AFN.pml:63 - [serverToClientChan!12] (0:0:0 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 12); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 12, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 64: // STATE 23 - AFN.pml:65 - [serverToClientChan!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][23] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 1, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 65: // STATE 29 - AFN.pml:69 - [printf('s - waiting for client psw\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][29] = 1;
		Printf("s - waiting for client psw\n");
		_m = 3; goto P999; /* 0 */
	case 66: // STATE 30 - AFN.pml:70 - [clientToServerChan?clientRequest] (0:0:1 - 1)
		reached[1][30] = 1;
		if (boq != ((P1 *)_this)->clientToServerChan) continue;
		if (q_len(((P1 *)_this)->clientToServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P1 *)_this)->clientRequest;
		;
		((P1 *)_this)->clientRequest = qrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:clientRequest", ((P1 *)_this)->clientRequest);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->clientRequest); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->clientToServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 67: // STATE 31 - AFN.pml:72 - [((clientRequest==5))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][31] = 1;
		if (!((((P1 *)_this)->clientRequest==5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: clientRequest */  (trpt+1)->bup.oval = ((P1 *)_this)->clientRequest;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->clientRequest = 0;
		_m = 3; goto P999; /* 0 */
	case 68: // STATE 32 - AFN.pml:73 - [serverToDatabaseChan!1,0] (0:0:0 - 1)
		IfNotBlocked
		reached[1][32] = 1;
		if (q_len(((P1 *)_this)->serverToDatabaseChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToDatabaseChan);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToDatabaseChan, 0, 1, 0, 2);
		{ boq = ((P1 *)_this)->serverToDatabaseChan; };
		_m = 2; goto P999; /* 0 */
	case 69: // STATE 33 - AFN.pml:74 - [databasetoServerChan?uselessCreditInfo] (0:0:2 - 1)
		reached[1][33] = 1;
		if (boq != ((P1 *)_this)->databasetoServerChan) continue;
		if (q_len(((P1 *)_this)->databasetoServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->uselessCreditInfo;
		;
		((P1 *)_this)->uselessCreditInfo = qrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:uselessCreditInfo", ((P1 *)_this)->uselessCreditInfo);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->uselessCreditInfo); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->databasetoServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: uselessCreditInfo */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->uselessCreditInfo;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->uselessCreditInfo = 0;
		_m = 4; goto P999; /* 0 */
	case 70: // STATE 34 - AFN.pml:76 - [isPasswordValid = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][34] = 1;
		(trpt+1)->bup.oval = ((int)now.isPasswordValid);
		now.isPasswordValid = 0;
#ifdef VAR_RANGES
		logval("isPasswordValid", ((int)now.isPasswordValid));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 71: // STATE 35 - AFN.pml:76 - [printf('s - invalid psw\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][35] = 1;
		Printf("s - invalid psw\n");
		_m = 3; goto P999; /* 0 */
	case 72: // STATE 37 - AFN.pml:77 - [isPasswordValid = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][37] = 1;
		(trpt+1)->bup.oval = ((int)now.isPasswordValid);
		now.isPasswordValid = 1;
#ifdef VAR_RANGES
		logval("isPasswordValid", ((int)now.isPasswordValid));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 73: // STATE 38 - AFN.pml:77 - [printf('s - valid psw\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][38] = 1;
		Printf("s - valid psw\n");
		_m = 3; goto P999; /* 0 */
	case 74: // STATE 43 - AFN.pml:80 - [(isPasswordValid)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][43] = 1;
		if (!(((int)now.isPasswordValid)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 75: // STATE 44 - AFN.pml:81 - [accountLocked = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][44] = 1;
		(trpt+1)->bup.oval = ((int)accountLocked);
		accountLocked = 0;
#ifdef VAR_RANGES
		logval("accountLocked", ((int)accountLocked));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 76: // STATE 45 - AFN.pml:82 - [pswAttempts = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][45] = 1;
		(trpt+1)->bup.oval = now.pswAttempts;
		now.pswAttempts = 0;
#ifdef VAR_RANGES
		logval("pswAttempts", now.pswAttempts);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 77: // STATE 46 - AFN.pml:83 - [serverToDatabaseChan!4,0] (0:0:0 - 1)
		IfNotBlocked
		reached[1][46] = 1;
		if (q_len(((P1 *)_this)->serverToDatabaseChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToDatabaseChan);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToDatabaseChan, 0, 4, 0, 2);
		{ boq = ((P1 *)_this)->serverToDatabaseChan; };
		_m = 2; goto P999; /* 0 */
	case 78: // STATE 47 - AFN.pml:84 - [databasetoServerChan?accountFunds] (0:0:1 - 1)
		reached[1][47] = 1;
		if (boq != ((P1 *)_this)->databasetoServerChan) continue;
		if (q_len(((P1 *)_this)->databasetoServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((P1 *)_this)->accountFunds;
		;
		((P1 *)_this)->accountFunds = qrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:accountFunds", ((P1 *)_this)->accountFunds);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->accountFunds); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->databasetoServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 79: // STATE 48 - AFN.pml:85 - [serverToClientChan!9] (0:0:0 - 1)
		IfNotBlocked
		reached[1][48] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 9); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 9, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 80: // STATE 51 - AFN.pml:88 - [pswAttempts = (pswAttempts+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][51] = 1;
		(trpt+1)->bup.oval = now.pswAttempts;
		now.pswAttempts = (now.pswAttempts+1);
#ifdef VAR_RANGES
		logval("pswAttempts", now.pswAttempts);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 81: // STATE 52 - AFN.pml:90 - [((pswAttempts>3))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][52] = 1;
		if (!((now.pswAttempts>3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 82: // STATE 53 - AFN.pml:91 - [accountLocked = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][53] = 1;
		(trpt+1)->bup.oval = ((int)accountLocked);
		accountLocked = 1;
#ifdef VAR_RANGES
		logval("accountLocked", ((int)accountLocked));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 83: // STATE 54 - AFN.pml:92 - [printf('s - sending account block\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][54] = 1;
		Printf("s - sending account block\n");
		_m = 3; goto P999; /* 0 */
	case 84: // STATE 55 - AFN.pml:93 - [serverToClientChan!8] (0:0:0 - 1)
		IfNotBlocked
		reached[1][55] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 8); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 8, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 85: // STATE 56 - AFN.pml:94 - [returnToStartState = 1] (0:109:1 - 1)
		IfNotBlocked
		reached[1][56] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->returnToStartState);
		((P1 *)_this)->returnToStartState = 1;
#ifdef VAR_RANGES
		logval("server:returnToStartState", ((int)((P1 *)_this)->returnToStartState));
#endif
		;
		/* merge: goto :b4(109, 57, 109) */
		reached[1][57] = 1;
		;
		/* merge: printf('s - going to if state\\n')(109, 71, 109) */
		reached[1][71] = 1;
		Printf("s - going to if state\n");
		_m = 3; goto P999; /* 2 */
	case 86: // STATE 59 - AFN.pml:97 - [serverToClientChan!10] (0:0:0 - 1)
		IfNotBlocked
		reached[1][59] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 10); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 10, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 87: // STATE 65 - AFN.pml:100 - [serverToClientChan!1] (0:0:0 - 1)
		IfNotBlocked
		reached[1][65] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 1, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 88: // STATE 71 - AFN.pml:103 - [printf('s - going to if state\\n')] (0:109:0 - 5)
		IfNotBlocked
		reached[1][71] = 1;
		Printf("s - going to if state\n");
		_m = 3; goto P999; /* 0 */
	case 89: // STATE 72 - AFN.pml:105 - [((returnToStartState==0))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][72] = 1;
		if (!((((int)((P1 *)_this)->returnToStartState)==0)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: returnToStartState */  (trpt+1)->bup.oval = ((P1 *)_this)->returnToStartState;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->returnToStartState = 0;
		_m = 3; goto P999; /* 0 */
	case 90: // STATE 73 - AFN.pml:107 - [clientToServerChan??4] (0:0:1 - 1)
		reached[1][73] = 1;
		if (boq != ((P1 *)_this)->clientToServerChan) continue;
		if (q_len(((P1 *)_this)->clientToServerChan) == 0) continue;

		XX=1;
		if (!(XX = Q_has(((P1 *)_this)->clientToServerChan, 1, 4, 0, 0))) continue;
		(trpt+1)->bup.oval = XX;
		;
		qrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->clientToServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 91: // STATE 74 - AFN.pml:108 - [(canAddFunds)] (0:0:0 - 1)
		IfNotBlocked
		reached[1][74] = 1;
		if (!(((int)now.canAddFunds)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 92: // STATE 75 - AFN.pml:109 - [accountFunds = (accountFunds+5)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][75] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->accountFunds;
		((P1 *)_this)->accountFunds = (((P1 *)_this)->accountFunds+5);
#ifdef VAR_RANGES
		logval("server:accountFunds", ((P1 *)_this)->accountFunds);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 93: // STATE 76 - AFN.pml:110 - [serverToDatabaseChan!3,accountFunds] (0:0:0 - 1)
		IfNotBlocked
		reached[1][76] = 1;
		if (q_len(((P1 *)_this)->serverToDatabaseChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToDatabaseChan);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->accountFunds); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToDatabaseChan, 0, 3, ((P1 *)_this)->accountFunds, 2);
		{ boq = ((P1 *)_this)->serverToDatabaseChan; };
		_m = 2; goto P999; /* 0 */
	case 94: // STATE 77 - AFN.pml:111 - [databasetoServerChan?uselessCreditInfo] (0:0:2 - 1)
		reached[1][77] = 1;
		if (boq != ((P1 *)_this)->databasetoServerChan) continue;
		if (q_len(((P1 *)_this)->databasetoServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->uselessCreditInfo;
		;
		((P1 *)_this)->uselessCreditInfo = qrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:uselessCreditInfo", ((P1 *)_this)->uselessCreditInfo);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->uselessCreditInfo); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->databasetoServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: uselessCreditInfo */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->uselessCreditInfo;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->uselessCreditInfo = 0;
		_m = 4; goto P999; /* 0 */
	case 95: // STATE 78 - AFN.pml:112 - [serverToClientChan!7] (0:0:0 - 1)
		IfNotBlocked
		reached[1][78] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 7); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 7, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 96: // STATE 79 - AFN.pml:113 - [clientToServerChan??3] (0:0:1 - 1)
		reached[1][79] = 1;
		if (boq != ((P1 *)_this)->clientToServerChan) continue;
		if (q_len(((P1 *)_this)->clientToServerChan) == 0) continue;

		XX=1;
		if (!(XX = Q_has(((P1 *)_this)->clientToServerChan, 1, 3, 0, 0))) continue;
		(trpt+1)->bup.oval = XX;
		;
		qrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->clientToServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 97: // STATE 80 - AFN.pml:115 - [((accountFunds<=0))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][80] = 1;
		if (!((((P1 *)_this)->accountFunds<=0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 98: // STATE 81 - AFN.pml:116 - [serverToClientChan!5] (0:0:0 - 1)
		IfNotBlocked
		reached[1][81] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 5); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 5, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 99: // STATE 83 - AFN.pml:118 - [accountFunds = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][83] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->accountFunds;
		((P1 *)_this)->accountFunds = 0;
#ifdef VAR_RANGES
		logval("server:accountFunds", ((P1 *)_this)->accountFunds);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 100: // STATE 84 - AFN.pml:119 - [serverToDatabaseChan!3,accountFunds] (0:0:0 - 1)
		IfNotBlocked
		reached[1][84] = 1;
		if (q_len(((P1 *)_this)->serverToDatabaseChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToDatabaseChan);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->accountFunds); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToDatabaseChan, 0, 3, ((P1 *)_this)->accountFunds, 2);
		{ boq = ((P1 *)_this)->serverToDatabaseChan; };
		_m = 2; goto P999; /* 0 */
	case 101: // STATE 85 - AFN.pml:120 - [databasetoServerChan?uselessCreditInfo] (0:0:2 - 1)
		reached[1][85] = 1;
		if (boq != ((P1 *)_this)->databasetoServerChan) continue;
		if (q_len(((P1 *)_this)->databasetoServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->uselessCreditInfo;
		;
		((P1 *)_this)->uselessCreditInfo = qrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:uselessCreditInfo", ((P1 *)_this)->uselessCreditInfo);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->uselessCreditInfo); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->databasetoServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: uselessCreditInfo */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->uselessCreditInfo;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->uselessCreditInfo = 0;
		_m = 4; goto P999; /* 0 */
	case 102: // STATE 86 - AFN.pml:121 - [serverToClientChan!6] (0:0:0 - 1)
		IfNotBlocked
		reached[1][86] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 6); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 6, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 103: // STATE 89 - AFN.pml:123 - [clientToServerChan??2] (0:0:1 - 1)
		reached[1][89] = 1;
		if (boq != ((P1 *)_this)->clientToServerChan) continue;
		if (q_len(((P1 *)_this)->clientToServerChan) == 0) continue;

		XX=1;
		if (!(XX = Q_has(((P1 *)_this)->clientToServerChan, 1, 2, 0, 0))) continue;
		(trpt+1)->bup.oval = XX;
		;
		qrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->clientToServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 104: // STATE 90 - AFN.pml:125 - [((accountFunds<10))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][90] = 1;
		if (!((((P1 *)_this)->accountFunds<10)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 105: // STATE 91 - AFN.pml:126 - [serverToClientChan!3] (0:0:0 - 1)
		IfNotBlocked
		reached[1][91] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 3, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 106: // STATE 93 - AFN.pml:128 - [accountFunds = (accountFunds-10)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][93] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->accountFunds;
		((P1 *)_this)->accountFunds = (((P1 *)_this)->accountFunds-10);
#ifdef VAR_RANGES
		logval("server:accountFunds", ((P1 *)_this)->accountFunds);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 107: // STATE 94 - AFN.pml:129 - [serverToDatabaseChan!3,accountFunds] (0:0:0 - 1)
		IfNotBlocked
		reached[1][94] = 1;
		if (q_len(((P1 *)_this)->serverToDatabaseChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToDatabaseChan);
		sprintf(simtmp, "%d", 3); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P1 *)_this)->accountFunds); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToDatabaseChan, 0, 3, ((P1 *)_this)->accountFunds, 2);
		{ boq = ((P1 *)_this)->serverToDatabaseChan; };
		_m = 2; goto P999; /* 0 */
	case 108: // STATE 95 - AFN.pml:130 - [databasetoServerChan?uselessCreditInfo] (0:0:2 - 1)
		reached[1][95] = 1;
		if (boq != ((P1 *)_this)->databasetoServerChan) continue;
		if (q_len(((P1 *)_this)->databasetoServerChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->uselessCreditInfo;
		;
		((P1 *)_this)->uselessCreditInfo = qrecv(((P1 *)_this)->databasetoServerChan, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("server:uselessCreditInfo", ((P1 *)_this)->uselessCreditInfo);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", ((P1 *)_this)->uselessCreditInfo); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->databasetoServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: uselessCreditInfo */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->uselessCreditInfo;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->uselessCreditInfo = 0;
		_m = 4; goto P999; /* 0 */
	case 109: // STATE 96 - AFN.pml:131 - [serverToClientChan!4] (0:0:0 - 1)
		IfNotBlocked
		reached[1][96] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 4); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 4, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 110: // STATE 99 - AFN.pml:133 - [clientToServerChan??1] (0:0:1 - 1)
		reached[1][99] = 1;
		if (boq != ((P1 *)_this)->clientToServerChan) continue;
		if (q_len(((P1 *)_this)->clientToServerChan) == 0) continue;

		XX=1;
		if (!(XX = Q_has(((P1 *)_this)->clientToServerChan, 1, 1, 0, 0))) continue;
		(trpt+1)->bup.oval = XX;
		;
		qrecv(((P1 *)_this)->clientToServerChan, XX-1, 0, 1);
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->clientToServerChan);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P1 *)_this)->clientToServerChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 111: // STATE 100 - AFN.pml:134 - [serverToClientChan!2] (0:0:0 - 1)
		IfNotBlocked
		reached[1][100] = 1;
		if (q_len(((P1 *)_this)->serverToClientChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->serverToClientChan);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->serverToClientChan, 0, 2, 0, 1);
		{ boq = ((P1 *)_this)->serverToClientChan; };
		_m = 2; goto P999; /* 0 */
	case 112: // STATE 102 - AFN.pml:136 - [fkYou = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][102] = 1;
		(trpt+1)->bup.oval = ((P1 *)_this)->fkYou;
		((P1 *)_this)->fkYou = 0;
#ifdef VAR_RANGES
		logval("server:fkYou", ((P1 *)_this)->fkYou);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 113: // STATE 107 - AFN.pml:138 - [printf('s - returning to start state\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[1][107] = 1;
		Printf("s - returning to start state\n");
		_m = 3; goto P999; /* 0 */
	case 114: // STATE 114 - AFN.pml:141 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][114] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC database */
	case 115: // STATE 1 - AFN.pml:23 - [printf('db - waiting for request\\n')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("db - waiting for request\n");
		_m = 3; goto P999; /* 0 */
	case 116: // STATE 2 - AFN.pml:24 - [serverToDatabaseChan?serverRequest,serverCredit] (0:0:2 - 1)
		reached[0][2] = 1;
		if (boq != ((P0 *)_this)->serverToDatabaseChan) continue;
		if (q_len(((P0 *)_this)->serverToDatabaseChan) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->serverRequest;
		(trpt+1)->bup.ovals[1] = ((P0 *)_this)->serverCredit;
		;
		((P0 *)_this)->serverRequest = qrecv(((P0 *)_this)->serverToDatabaseChan, XX-1, 0, 0);
#ifdef VAR_RANGES
		logval("database:serverRequest", ((P0 *)_this)->serverRequest);
#endif
		;
		((P0 *)_this)->serverCredit = qrecv(((P0 *)_this)->serverToDatabaseChan, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("database:serverCredit", ((P0 *)_this)->serverCredit);
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)_this)->serverToDatabaseChan);
		sprintf(simtmp, "%d", ((P0 *)_this)->serverRequest); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((P0 *)_this)->serverCredit); strcat(simvals, simtmp);		}
#endif
		if (q_zero(((P0 *)_this)->serverToDatabaseChan))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 117: // STATE 3 - AFN.pml:26 - [((serverRequest==4))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		if (!((((P0 *)_this)->serverRequest==4)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverRequest */  (trpt+1)->bup.oval = ((P0 *)_this)->serverRequest;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->serverRequest = 0;
		_m = 3; goto P999; /* 0 */
	case 118: // STATE 4 - AFN.pml:27 - [databasetoServerChan!accountCredit] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (q_len(((P0 *)_this)->databasetoServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", now.accountCredit); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->databasetoServerChan, 0, now.accountCredit, 0, 1);
		{ boq = ((P0 *)_this)->databasetoServerChan; };
		_m = 2; goto P999; /* 0 */
	case 119: // STATE 5 - AFN.pml:28 - [((serverRequest==3))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((P0 *)_this)->serverRequest==3)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverRequest */  (trpt+1)->bup.oval = ((P0 *)_this)->serverRequest;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->serverRequest = 0;
		_m = 3; goto P999; /* 0 */
	case 120: // STATE 6 - AFN.pml:29 - [accountCredit = serverCredit] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = now.accountCredit;
		now.accountCredit = ((P0 *)_this)->serverCredit;
#ifdef VAR_RANGES
		logval("accountCredit", now.accountCredit);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 121: // STATE 7 - AFN.pml:30 - [printf('DB - saved new credit %d\\n',accountCredit)] (0:0:0 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		Printf("DB - saved new credit %d\n", now.accountCredit);
		_m = 3; goto P999; /* 0 */
	case 122: // STATE 8 - AFN.pml:31 - [databasetoServerChan!accountCredit] (0:0:0 - 1)
		IfNotBlocked
		reached[0][8] = 1;
		if (q_len(((P0 *)_this)->databasetoServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", now.accountCredit); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->databasetoServerChan, 0, now.accountCredit, 0, 1);
		{ boq = ((P0 *)_this)->databasetoServerChan; };
		_m = 2; goto P999; /* 0 */
	case 123: // STATE 9 - AFN.pml:32 - [((serverRequest==2))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		if (!((((P0 *)_this)->serverRequest==2)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverRequest */  (trpt+1)->bup.oval = ((P0 *)_this)->serverRequest;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->serverRequest = 0;
		_m = 3; goto P999; /* 0 */
	case 124: // STATE 10 - AFN.pml:33 - [databasetoServerChan!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (q_len(((P0 *)_this)->databasetoServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->databasetoServerChan, 0, 0, 0, 1);
		{ boq = ((P0 *)_this)->databasetoServerChan; };
		_m = 2; goto P999; /* 0 */
	case 125: // STATE 11 - AFN.pml:34 - [((serverRequest==1))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!((((P0 *)_this)->serverRequest==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: serverRequest */  (trpt+1)->bup.oval = ((P0 *)_this)->serverRequest;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->serverRequest = 0;
		_m = 3; goto P999; /* 0 */
	case 126: // STATE 12 - AFN.pml:35 - [databasetoServerChan!0] (0:0:0 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		if (q_len(((P0 *)_this)->databasetoServerChan))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->databasetoServerChan);
		sprintf(simtmp, "%d", 0); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->databasetoServerChan, 0, 0, 0, 1);
		{ boq = ((P0 *)_this)->databasetoServerChan; };
		_m = 2; goto P999; /* 0 */
	case 127: // STATE 20 - AFN.pml:39 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][20] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

