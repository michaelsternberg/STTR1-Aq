100  REM **************************************************************
110  REM ***  STAR TREK: BY MIKE MAYFIELD, CENTERLINE  ENGINEERING  ***      
120  REM ***      TOTAL INTERACTION GAME - ORIG. 20 OCT 1972        ***
130  REM ***                                                        ***
140  REM ***   MATTEL/RADOFIN AQUARIUS PORT BY MICHAEL STERNBERG    ***
150  REM ***             RETROCHALLENGE 2016/01                     ***
160  REM **************************************************************
170  GOSUB 5460
180  PRINT CHR$(11);"             STAR TREK":PRINT:PRINT
190  PRINT "INSTRUCTIONS (THEY'RE LONG!)";
200  INPUT A$
210  IF A$ <> "YES" AND A$ <> "yes" THEN 230
220  GOSUB 5820
230  REM *****  PROGRAM STARTS HERE *****
240  Z$="   "
260  DIM G(8,8),C(9,2),K(3,3),N(3),Z(8,8)
270  DIM Q$(64),D$(8)
285  GOSUB 5460
290  T=INT(RND(1)*20+20)*100:T0=T
300  T9=30:D0=0:E0=3000:E=E0:P0=10:P=P0:S9=200:S=0:H8=S
370  Q1=INT(RND(1)*8+1):Q2=INT(RND(1)*8+1)
390  S1=INT(RND(1)*8+1):S2=INT(RND(1)*8+1)
420  I=-1:C(2,1)=I:C(3,1)=I:C(4,1)=I:C(4,2)=I:C(5,2)=I:C(6,2)=I
430  I=0:C(1,1)=I:C(3,2)=I:C(5,1)=I:C(7,2)=I:C(9,1)=I
440  I=1:C(1,2)=I:C(2,2)=I:C(6,1)=I:C(7,1)=I:C(8,1)=I:C(8,2)=I:C(9,2)=I
460  D$(1)="WARP ENGINES"
461  D$(2)="S.R. SENSORS"
462  D$(3)="L.R. SENSORS"
463  D$(4)="PHASER CNTRL"
464  D$(5)="PHOTON TUBES"
465  D$(6)="DAMAGE CNTRL"
480  D$(7)="SHIELD CNTRL"
485  D$(8)="COMPUTER"
490  B9=0:K9=0
500  FOR I=1 TO 8
510  FOR J=1 TO 8
520  R1=RND(1)
530  IF R1>.98 THEN 580
540  IF R1>.95 THEN 610
550  IF R1>.8 THEN 640
560  K3=0:GOTO 660
580  K3=3:K9=K9+3:GOTO 660
610  K3=2:K9=K9+2:GOTO 660
640  K3=1:K9=K9+1
660  R1=RND(1):IF R1>.96 THEN 700
680  B3=0:GOTO 720
700  B3=1:B9=B9+1
720  S3=INT(RND(1)*8+1):G(I,J)=K3*100+B3*10+S3:Z(I,J)=0
750  NEXT J
760  NEXT I
770  K7=K9
780  IF B9 <= 0 OR K9 <= 0 THEN 490
790  PRINT "YOU MUST DESTROY"; K9; " KLINGONS"
800  PRINT "IN"; T9; " STARDATES WITH"; B9; " STARBASES"
810  I=0:K3=I:B3=I:S3=I
820  IF Q1<1 OR Q1>8 OR Q2<1 OR Q2>8 THEN 920
830  X=G(Q1,Q2)*.01:K3=INT(X):B3=INT((X-K3)*10)
860  S3=G(Q1,Q2)-INT(G(Q1,Q2)*.1)*10
870  IF K3=0 THEN 910
880  IF S>200 THEN 910
890  PRINT:PRINT "COMBAT AREA      CONDITION RED"
900  PRINT "   SHIELDS DANGEROUSLY LOW"
910  FOR I=0 TO 3:FOR J=0 TO 3:K(I,J)=0:NEXT J:NEXT I
920  FOR I=1 TO 3:K(I,3)=0:NEXT I
950  FOR I=1 TO 64:Q$(I) = "   ":NEXT I
980  A$="<*>":Z1=S1:Z2=S2:GOSUB 5510
1015  IF K3<1 THEN 1115
1020  FOR I=1 TO K3
1030  GOSUB 5380
1040  A$="+++":Z1=R1:Z2=R2:GOSUB 5510
1080  K(I,1)=R1:K(I,2)=R2:K(I,3)=S9
1110  NEXT I
1115  IF B3<1 THEN 1185
1120  FOR I=1 TO B3
1130  GOSUB 5380
1140  A$=">!<":Z1=R1:Z2=R2:GOSUB 5510
1180  NEXT I
1185  IF S3<1 THEN 1260
1190  FOR I=1 TO S3
1200  GOSUB 5380
1210  A$=" * ":Z1=R1:Z2=R2:GOSUB 5510
1250  NEXT I
1260  GOSUB 4120
1270  PRINT "COMMAND:";:INPUT A
1275  IF A=0 THEN 1410
1280  IF A=1 THEN 1260
1285  IF A=2 THEN 2330
1290  IF A=3 THEN 2530
1295  IF A=4 THEN 2800
1300  IF A=5 THEN 3460
1305  IF A=6 THEN 3560
1310  IF A=7 THEN 4630
1315  PRINT:PRINT "   0 = SET COURSE"
1320  PRINT "   1 = SHORT RANGE SENSOR SCAN"
1330  PRINT "   2 = LONG RANGE SENSOR SCAN"
1340  PRINT "   3 = FIRE PHASERS"
1350  PRINT "   4 = FIRE PHOTON TORPEDOES"
1360  PRINT "   5 = SHIELD CONTROL"
1370  PRINT "   6 = DAMAGE CONTROL REPORT"
1380  PRINT "   7 = CALL ON LIBRARY COMPUTER":PRINT:GOTO 1270
1410  PRINT "COURSE (1-9):";:INPUT C1
1430  IF C1=0 THEN 1270
1440  IF C1<1 OR C1 >= 9 THEN 1410
1450  PRINT "WARP FACTOR (0-8):";:INPUT W1:IF W1<0 OR W1>8 THEN 1410
1480  IF D(1) >= 0 OR W1 <= .2 THEN 1510
1490  PRINT "WARP ENGINES ARE DAMAGED, MAXIMUM SPEED = WARP .2"
1500  GOTO 1410
1510  IF K3 <= 0 THEN 1560
1520  GOSUB 3790
1530  IF K3 <= 0 THEN 1560
1540  IF S<0 THEN 4000
1550  GOTO 1610
1560  IF E>0 THEN 1610
1570  IF S<1 THEN 3920
1580  PRINT "YOU HAVE";E;" UNITS OF ENERGY"
1590  PRINT "SUGGEST YOU GET SOME FROM YOUR"
1592  PRINT "SHIELDS WHICH HAVE";S;" UNITS LEFT"
1600  GOTO 1270
1610  FOR I=1 TO 8
1620  IF D(I) >= 0 THEN 1640
1630  D(I)=D(I)+1
1640  NEXT I
1650  IF RND(1)>.2 THEN 1810
1660  R1=INT(RND(1)*8+1)
1670  IF RND(1) >= .5 THEN 1750
1680  D(R1)=D(R1)-(RND(1)*5+1)
1700  PRINT:PRINT "DAMAGE CONTROL REPORT:"
1710  GOSUB 5610
1720  PRINT " DAMAGED":PRINT:GOTO 1810
1750  D(R1)=D(R1)+(RND(1)*5+1)
1760  PRINT:PRINT "DAMAGE CONTROL REPORT:":GOSUB 5610
1790  PRINT " STATE OF REPAIR IMPROVED":PRINT
1810  N=INT(W1*8):A$="   ":Z1=S1:Z2=S2:GOSUB 5510
1870  X=S1:Y=S2:C2=INT(C1)
1890  X1=C(C2,1)+(C(C2+1,1)-C(C2,1))*(C1-C2)
1900  X2=C(C2,2)+(C(C2+1,2)-C(C2,2))*(C1-C2)
1905  I=1
1910  IF I > N THEN 2080
1920  S1=S1+X1:S2=S2+X2
1940  IF S1<.5 OR S1 >= 8.5 OR S2<.5 OR S2 >= 8.5 THEN 2170
1950  A$="   ":Z1=S1:Z2=S2:GOSUB 5680
1990  IF Z3 <> 0 THEN 2070
2030  PRINT " WARP ENGINES SHUTDOWN AT SECTOR "; S1; ","; S2;
2035  PRINT " DUE TO BAD NAVIGATION"
2040  S1=S1-X1:S2=S2-X2
2060  GOTO 2080
2070  I=I+1:GOTO 1910
2080  A$="<*>":S1=INT(S1+.5):S2=INT(S2+.5):Z1=S1:Z2=S2:GOSUB 5510
2120  E=E-N+5:IF W1<1 THEN 2150
2140  T=T+1
2150  IF T>T0+T9 THEN 3970
2160  GOTO 1260
2170  X=Q1*8+X+X1*N:Y=Q2*8+Y+X2*N:Q1=INT(X/8):Q2=INT(Y/8)
2210  S1=INT(X-Q1*8+.5):S2=INT(Y-Q2*8+.5)
2230  IF S1 <> 0 THEN 2260
2240  Q1=Q1-1:S1=8
2260  IF S2 <> 0 THEN 2290
2270  Q2=Q2-1:S2=8
2290  T=T+1:E=E-N+5:IF T>T0+T9 THEN 3970
2320  GOTO 810
2330  IF D(3) >= 0 THEN 2370
2340  PRINT "LONG RANGE SENSORS ARE INOPERABLE":GOTO 1270
2370  PRINT "LONG RANGE SENSOR SCAN: QUADRANT";Q1;","Q2
2380  PRINT "-----------------"
2390  FOR I=Q1-1 TO Q1+1
2400  FOR J=1 TO 3:N(J)=0:NEXT J
2410  FOR J=Q2-1 TO Q2+1
2420  IF I<1 OR I>8 OR J<1 OR J>8 THEN 2460
2430  N(J-Q2+2)=G(I,J):IF D(7)<0 THEN 2460
2450  Z(I,J)=G(I,J)
2460  NEXT J
2470  PRINT ":";
2471  PRINT LEFT$(Z$,4-LEN(STR$(N(1))));N(1);":";
2472  PRINT LEFT$(Z$,4-LEN(STR$(N(2))));N(2);":";
2473  PRINT LEFT$(Z$,4-LEN(STR$(N(3))));N(3);" :"
2480  PRINT  "-----------------"
2490  NEXT I
2500  GOTO 1270
2530  IF K3 <= 0 THEN 3670
2540  IF D(4) >= 0 THEN 2570
2550  PRINT "PHASER CONTROL IS DISABLED"
2560  GOTO 1270
2570  IF D(7) >= 0 THEN 2590
2580  PRINT " COMPUTER FAILURE HAMPERS ACCURACY"
2590  PRINT "PHASERS LOCKED ON TARGET."
2595  PRINT "ENERGY AVAILABLE=";E
2600  PRINT "NUMBER OF UNITS TO FIRE:";
2610  INPUT X
2620  IF X <= 0 THEN 1270
2630  IF E-X<0 THEN 2570
2640  E=E-X:GOSUB 3790
2660  IF D(7) >= 0 THEN 2680
2670  X=X*RND(1)
2680  FOR I=1 TO 3
2690  IF K(I,3) <= 0 THEN 2770
2700  H=(X/K3/SQR((K(I,1)-S1)^2+(K(I,2)-S2)^2))*(2*RND(1))
2710  K(I,3)=K(I,3)-H
2720  PRINT H;" UNIT HIT ON KLINGON":PRINT " AT SECTOR ";
2730  PRINT K(I,1);",";K(I,2);"  (";K(I,3);" LEFT)":PRINT
2740  IF K(I,3)>0 THEN 2770
2750  GOSUB 3690
2760  IF K9 <= 0 THEN 4040
2770  NEXT I
2780  IF E<0 THEN 4000
2790  GOTO 1270
2800  IF D(5) >= 0 THEN 2830
2810  PRINT "PHOTON TUBES ARE NOT OPERATIONAL":GOTO 1270
2830  IF P>0 THEN 2860
2840  PRINT "ALL PHOTON TORPEDOES EXPENDED":GOTO 1270
2860  PRINT "TORPEDO COURSE (1-9):";:INPUT C1
2880  IF C1=0 THEN 1270
2890  IF C1<1 OR C1 >= 9 THEN 2860
2895  C2=INT(C1)
2900  X1=C(C2,1)+(C(C2+1,1)-C(C2,1))*(C1-C2)
2910  X2=C(C2,2)+(C(C2+1,2)-C(C2,2))*(C1-C2)
2920  X=S1:Y=S2:P=P-1:PRINT "TORPEDO TRACK:"
2960  X=X+X1:Y=Y+X2
2980  IF X<.5 OR X >= 8.5 OR Y<.5 OR Y >= 8.5 THEN 3420
2990  PRINT "               ";INT(X+.5);",";INT(Y+.5)
3010  A$="   ":Z1=X:Z2=Y:GOSUB 5680
3050  IF Z3=0 THEN 3070
3060  GOTO 2960
3070  A$="+++":Z1=X:Z2=Y:GOSUB 5680
3110  IF Z3=0 THEN 3220
3120  PRINT "*** KLINGON DESTROYED ***"
3130  K3=K3-1:K9=K9-1:IF K9 <= 0 THEN 4040
3155  I=1
3160  IF I>3 THEN 3200
3170  IF INT(X+.5) <> K(I,1) THEN 3190
3180  IF INT(Y+.5)=K(I,2) THEN 3200
3190  I=I+1: GOTO 3160
3200  K(I,3)=0
3210  GOTO 3360
3220  A$=" * ":Z1=X:Z2=Y:GOSUB 5680
3260  IF Z3=0 THEN 3290
3270  PRINT "YOU CAN'T DESTROY STARS SILLY"
3280  GOTO 3420
3290  A$=">!<":Z1=X:Z2=Y:GOSUB 5680
3330  IF Z3=0 THEN 2960
3340  PRINT "*** STAR BASE DESTROYED ***":PRINT "......CONGRATULATIONS"
3350  B3=B3-1
3360  A$="   ":Z1=INT(X+.5):Z2=INT(Y+.5):GOSUB 5510
3400  G(Q1,Q2)=K3*100+B3*10+S3:GOTO 3430
3420  PRINT "TORPEDO MISSED"
3430  GOSUB 3790
3440  IF E<0 THEN 4000
3450  GOTO 1270
3460  IF D(7) >= 0 THEN 3490
3470  PRINT "SHIELD CONTROL IS NON-OPERATIONAL":GOTO 1270
3490  PRINT "ENERGY AVAILABLE =";E+S
3495  PRINT "NUMBER OF UNITS TO SHIELDS:";:INPUT X:IF X <= 0 THEN 1270
3520  IF E+S-X<0 THEN 3490
3530  E=E+S-X:S=X:GOTO 1270
3560  IF D(6) >= 0 THEN 3590
3570  PRINT "DAMAGE CONTROL REPORT":PRINT "IS NOT AVAILABLE":GOTO 1270
3590  PRINT:PRINT "DEVICE       STATE OF REPAIR"
3610  FOR R1=1 TO 8
3620  GOSUB 5610
3630  PRINT "",D(R1)
3640  NEXT R1
3650  PRINT:GOTO 1270
3670  PRINT "SHORT RANGE SENSORS REPORT"
3675  PRINT "NO KLINGONS IN THIS QUADRANT"
3680  GOTO 1270
3690  PRINT "KLINGON AT SECTOR ";K(I,1);",";K(I,2);
3700  PRINT " DESTROYED ****"
3710  K3=K3-1:K9=K9-1:A$="   ":Z1=K(I,1):Z2=K(I,2)
3760  GOSUB 5510
3770  G(Q1,Q2)=K3*100+B3*10+S3
3780  RETURN
3790  IF C$ <> "DOCKED" THEN 3820
3800  PRINT " STAR BASE SHIELDS PROTECT":PRINT " THE ENTERPRISE":PRINT
3810  RETURN
3820  IF K3 <= 0 THEN 3910
3830  FOR I=1 TO 3
3840  IF K(I,3) <= 0 THEN 3900
3850  H=(K(I,3)/SQR((K(I,1)-S1)^2+(K(I,2)-S2)^2))*(2*RND(1))
3860  S=S-H
3870  PRINT:PRINT H;" UNIT HIT ON ENTERPRISE"
3880  PRINT " AT SECTOR ";K(I,1);",";K(I,2);"   ("; S; " LEFT)":PRINT
3890  IF S<0 THEN 4000
3900  NEXT I
3910  RETURN
3920  PRINT "THE ENTERPRISE IS DEAD IN SPACE."
3925  PRINT "IF YOU SURVIVE ALL IMPENDING"
3930  PRINT "ATTACK YOU WILL BE DEMOTED TO"
3935  PRINT "THE RANK OF PRIVATE"
3940  IF K3 <= 0 THEN 4020
3950  GOSUB 3790
3960  GOTO 3940
3970  PRINT
3980  PRINT "IT IS STARDATE";T
3990  GOTO 4020
4000  PRINT
4010  PRINT "THE ENTERPRISE HAS BEEN DESTROYED."
4015  PRINT "THE FEDERATION WILL BE CONQUERED"
4020  PRINT " THERE ARE STILL "; K9; " KLINGON"
4025  PRINT " BATTLE CRUISERS"
4027  GOSUB 5880
4030  GOTO 285
4040  PRINT
4050  PRINT "THE LAST KLINGON BATTLE CRUISER"
4055  PRINT "IN THE GALAXY HAS BEEN DESTROYED"
4060  PRINT "THE FEDERATION HAS BEEN SAVED !!!"
4070  PRINT
4080  PRINT "YOUR EFFICIENCY RATING =";((K7/(T-T0))*1000)
4090  GOSUB 5880
4110  GOTO 285
4120  FOR I=S1-1 TO S1+1
4130  FOR J=S2-1 TO S2+1
4140  IF I<1 OR I>8 OR J<1 OR J>8 THEN 4200
4150  A$=">!<":Z1=I:Z2=J:GOSUB 5680
4190  IF Z3=1 THEN 4240
4200  NEXT J
4210  NEXT I
4220  D0=0:GOTO 4310
4240  D0=1:C$="DOCKED":E=3000:P=10
4280  PRINT "SHIELDS DROPPED FOR DOCKING PURPOSES"
4290  S=0:GOTO 4380
4310  IF K3>0 THEN 4350
4320  IF E<E0*.1 THEN 4370
4330  C$="GREEN":GOTO 4380
4350  C$="RED":GOTO 4380
4370  C$="YELLOW"
4380  IF D(2) >= 0 THEN 4430
4390  PRINT:PRINT "*** SHORT RANGE SENSORS ARE OUT ***":PRINT:GOTO 4530
4430  PRINT:PRINT "STARDATE         ";T
4431  PRINT "CONDITION         ";C$
4432  PRINT "QUADRANT         ";Q1;" ,";Q2
4433  PRINT "SECTOR           ";S1;" ,";S2
4434  PRINT "ENERGY           ";E
4435  PRINT "PHOTON TORPEDOES ";P
4436  PRINT "SHIELDS          ";S
4437  PRINT "---------------------------------"
4440  FOR QQ =  1 TO  8:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4450  FOR QQ =  9 TO 16:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4460  FOR QQ = 17 TO 24:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4470  FOR QQ = 25 TO 32:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4480  FOR QQ = 33 TO 40:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4490  FOR QQ = 41 TO 48:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4500  FOR QQ = 49 TO 56:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4510  FOR QQ = 57 TO 64:PRINT " ";Q$(QQ);:NEXT QQ:PRINT
4520  PRINT "---------------------------------"
4530  RETURN
4630  IF D(8) >= 0 THEN 4660
4640  PRINT "COMPUTER DISABLED":GOTO 1270
4660  PRINT "COMPUTER ACTIVE. AWAITING COMMAND";:INPUT A
4680  IF A = 0 THEN 4740
4681  IF A = 1 THEN 4830
4682  IF A = 2 THEN 4880
4690  PRINT:PRINT "FUNCTIONS AVAILABLE FROM COMPUTER":PRINT
4700  PRINT "   0 = CUMULATIVE GALACTIC RECORD"
4710  PRINT "   1 = STATUS REPORT"
4720  PRINT "   2 = PHOTON TORPEDO DATA"
4730  GOTO 4660
4740  PRINT "COMPUTER RECORD-GALAXY: QUADRANT ";Q1;",";Q2
4760  PRINT "    1   2   3   4   5   6   7   8"
4770  PRINT "   --- --- --- --- --- --- --- ---"
4780  FOR I=1 TO 8
4790  PRINT I;
4791  FOR J=1 TO 7
4792  PRINT LEFT$(Z$,4-LEN(STR$(Z(I,J))));Z(I,J);
4793  NEXT J
4794  PRINT LEFT$(Z$,4-LEN(STR$(Z(I,8))));Z(I,8)
4800  PRINT "   --- --- --- --- --- --- --- ---"
4810  NEXT I
4820  GOTO 1270
4830  PRINT:PRINT "   STATUS REPORT":PRINT
4840  PRINT "NUMBER OF KLINGONS LEFT =";K9
4850  PRINT "NUMBER OF STARDATES LEFT =";(T0+T9)-T
4860  PRINT "NUMBER OF STARBASES LEFT =";B9
4870  GOTO 3560
4880  PRINT
4890  H8=0
4900  FOR I=1 TO 3
4910  IF K(I,3) <= 0 THEN 5260
4920  C1=S1:A=S2:W1=K(I,1):X=K(I,2):GOTO 5010
4970  PRINT "YOU ARE AT:"
4980  PRINT "QUADRANT (";Q1;",";Q2;" ) SECTOR ("; S1; ","; S2; " )"
4990  PRINT "SHIP'S & TARGET'S COORDS ARE";:INPUT C1,A,W1,X
5010  X=X-A:A=C1-W1
5030  IF X<0 THEN 5130
5040  IF A<0 THEN 5190
5050  IF X>0 THEN 5070
5060  IF A=0 THEN 5150
5070  C1=1
5080  IF ABS(A) <= ABS(X) THEN 5110
5090  PRINT "DIRECTION =";C1+(((ABS(A)-ABS(X))+ABS(A))/ABS(A))
5100  GOTO 5240
5110  PRINT "DIRECTION =";C1+(ABS(A)/ABS(X))
5120  GOTO 5240
5130  IF A>0 THEN 5170
5140  IF X=0 THEN 5190
5150  C1=5:GOTO 5080
5170  C1=3:GOTO 5200
5190  C1=7
5200  IF ABS(A) >= ABS(X) THEN 5230
5210  PRINT "DIRECTION =";C1+(((ABS(X)-ABS(A))+ABS(X))/ABS(X))
5220  GOTO 5240
5230  PRINT "DIRECTION =";C1+(ABS(X)/ABS(A))
5240  PRINT "DISTANCE =";(SQR(X^2+A^2))
5250  IF H8=1 THEN 5320
5260  NEXT I
5270  H8=0
5280  PRINT "USE THE CALCULATOR";:INPUT A$
5300  IF A$="YES" OR A$="yes" THEN H8=1: GOTO 4970
5320  GOTO 1270
5380  R1=INT(RND(1)*8+1):R2=INT(RND(1)*8+1)
5400  A$="   ":Z1=R1:Z2=R2:GOSUB 5680
5440  IF Z3=0 THEN 5380
5450  RETURN
5460  FOR I=1 TO 2:PRINT:NEXT I
5490  PRINT
5500  RETURN
5510  REM ***  INSERTION IN STRING ARRAY FOR QUADRANT ***
5520  S8=(Z1-1)*8+Z2
5540  Q$(S8)=A$
5600  RETURN
5610  REM ***  PRINTS DEVICE NAME FROM ARRAY ***
5620  S8=R1
5640  PRINT D$(S8);
5670  RETURN
5680  REM ***  STRING COMPARISON IN QUADRANT ARRAY ***
5683  Z1=INT(Z1+.5):Z2=INT(Z2+.5):S8=(Z1-1)*8+Z2:Z3=0
5720  IF Q$(S8) <> A$ THEN 5810
5730  Z3=1
5810  RETURN
5815  REM *** INSTRUCTIONS ***
5820  RESTORE:I=1:P=1:J=0:K=23
5830  PRINT "SEND TO PRINTER";:INPUT A$
5840  IF A$<>"YES" AND A$<>"yes" THEN P=0
5845  READ C$
5847  IF I>K THEN I=0:K=12:GOSUB 5880
5855  IF P=1 THEN LPRINT C$
5860  IF P=0 THEN PRINT C$
5865  IF LEFT$(C$,3)="***" THEN RETURN
5870  I=I+1:GOTO 5840
5880  IF P=0 AND INKEY$ = "" THEN GOTO 5880
5890  RETURN
5900  DATA "     INSTRUCTIONS:"
5910  DATA "<*> = ENTERPRISE"
5920  DATA "+++ = KLINGON"
5930  DATA ">!< = STARBASE"
5940  DATA " *  = STAR"
5945  DATA ""
5946  DATA ""
5947  DATA ""
5950  DATA "COMMAND 0 = WARP ENGINE CONTROL"
5960  DATA "  'COURSE' IS IN A CIRCULAR"
5970  DATA "  NUMERICAL VECTOR ARRANGEMENT AS"
5980  DATA "  SHOWN. INTERGER AND REAL VALUES"
5990  DATA "  MAY BE USED.  THEREFORE COURSE"
6000  DATA "  1.5 IS HALF WAY BETWEEN 1 AND 2."
6010  DATA " "
6020  DATA "  A VECTOR OF 9 IS UNDEFINED, BUT"
6030  DATA "  VALUES MAY APPROACH 9."
6040  DATA " "
6050  DATA "    4  3  2"
6060  DATA "     \ ^ /"
6070  DATA "      \^/"
6080  DATA "   5 ----- 1"
6090  DATA "      /^\"
6100  DATA "     / ^ \"
6110  DATA "    6  7  8"
6120  DATA " " 
6130  DATA "    COURSE"
6140  DATA " "
6150  DATA "  ONE 'WARP FACTOR' IS THE SIZE OF"
6160  DATA "  ONE QUADRANT.  THEREFORE TO GET"
6170  DATA "  FROM QUADRANT 6,5 TO 5,5 YOU"
6180  DATA "  WOULD USE COURSE 3, WARP FACTOR 1"
6185  DATA ""
6186  DATA ""
6190  DATA "COMMAND 1 = SHORT RANGE SENSOR SCAN"
6200  DATA "  PRINTS THE QUADRANT YOU ARE"
6210  DATA "  CURRENTLY IN, INCLUDING STARS,"
6220  DATA "  KLINGONS, STARBASES, AND THE"
6230  DATA "  ENTERPRISE; ALONG WITH OTHER"
6240  DATA "  PERTINATE INFORMATION."
6245  DATA ""
6246  DATA ""
6250  DATA "COMMAND 2 = LONG RANGE SENSOR SCAN"
6260  DATA "  SHOWS CONDITIONS IN SPACE FOR ONE"
6270  DATA "  QUADRANT ON EACH SIDE OF THE"
6280  DATA "  ENTERPRISE IN THE MIDDLE OF THE"
6290  DATA "  SCAN.  THE SCAN IS CODED IN THE"
6300  DATA "  FORM XXX, WHERE THE UNITS DIGIT"
6310  DATA "  IS THE NUMBER OF STARS, THE TENS"
6320  DATA "  DIGIT IS THE NUMBER OF STARBASES,"
6330  DATA "  THE HUNDREDS DIGIT IS THE NUMBER"
6340  DATA "  OF KLINGONS."
6345  DATA ""
6346  DATA ""
6350  DATA "COMMAND 3 = PHASER CONTROL"
6360  DATA "  ALLOWS YOU TO DESTROY THE KLINGONS"
6370  DATA "  BY HITTING HIM WITH SUITABLY LARGE"
6380  DATA "  NUMBERS OF ENERGY UNITS TO DEPLETE"
6390  DATA "  HIS SHIELD POWER.  KEEP IN MIND"
6400  DATA "  THAT WHEN YOU SHOOT AT HIM, HE"
6410  DATA "  GONNA DO IT TO YOU TOO."
6415  DATA ""
6416  DATA ""
6420  DATA "COMMAND 4 = PHOTON TORPEDO CONTROL"
6430  DATA "  COURSE IS THE SAME AS USED IN WARP"
6440  DATA "  ENGINE CONTROL IF YOU HIT THE"
6450  DATA "  KLINGON, HE IS DESTROYED AND"
6460  DATA "  CANNOT FIRE BACK AT YOU.  IF YOU"
6470  DATA "  MISS, HE WILL SHOOT HIS PHASERS"
6480  DATA "  AT YOU."
6490  DATA "   NOTE: THE LIBRARY COMPUTER"
6500  DATA "   (COMMAND 7) HAS AN OPTION TO"
6510  DATA "   COMPUTE TORPEDO TRAJECTORY FOR"
6520  DATA "   YOU (OPTION 2)."
6525  DATA ""
6526  DATA ""
6530  DATA "COMMAND 5 = SHIELD CONTROL"
6540  DATA "  DEFINES NUMBER OF ENERGY UNITS TO"
6550  DATA "  BE ASSIGNED TO SHIELDS ENERGY IS"
6560  DATA "  TAKEN FROM TOTAL SHIP'S ENERGY."
6565  DATA ""
6566  DATA ""
6570  DATA "COMMAND 6 = DAMAGE CONTROL REPORT"
6580  DATA "  GIVES STATE OF REPAIRS OF ALL"
6590  DATA "  DEVICES.  A STATE OF REPAIR LESS"
6600  DATA "  THAN ZERO SHOWS THAT THAT DEVICE"
6610  DATA "  IS TEMPORARALY DAMAGED."
6615  DATA ""
6616  DATA ""
6620  DATA "COMMAND 7 = LIBRARY COMPUTER"
6630  DATA "  THE LIBRARY COMPUTER CONTAINS"
6640  DATA "  THREE OPTIONS:"
6650  DATA "    OPTION 0 = CUMULATIVE GALACTIC"
6660  DATA "     RECORD SHOWS COMPUTER MEMORY OF"
6670  DATA "     THE RESULTS OF ALL PREVIOUS"
6680  DATA "     LONG RANGE SENSOR SCANS"
6690  DATA "    OPTION 1 = STATUS REPORT"
6700  DATA "     SHOWS NUMBER OF KLINGONS,"
6710  DATA "     STARDATES AND STARBASES LEFT."
6720  DATA "    OPTION 2 = PHOTON TORPEDO DATA"
6730  DATA "     GIVES TRAJECTORY AND DISTANCE"
6740  DATA "     BETWEEN THE ENTERPRISE AND ALL"
6750  DATA "     KLINGONS IN YOUR QUADRANT"
6752  DATE ""
6755  DATA "*** END OF INSTRUCTIONS ***"
6770  END
