PRSDEU09 ;HISC/GWB-PAID EDIT AND UPDATE DOWNLOAD RECORD 9 LAYOUT ;6/1/93  14:10
 ;;4.0;PAID;;Sep 21, 1995
 F CC=1:1 S GRP=$T(@CC) Q:GRP=""  S GRPVAL=$P(RCD,":",CC) I GRPVAL'="" S GNUM=$P(GRP,";",4),LTH=$P(GRP,";",5),PIC=$P(GRP,";",6) D:PIC=9 PIC9^PRSDUTIL F EE=1:1:GNUM S FLD=$T(@CC+EE) D EPTSET^PRSDSET
 Q
RECORD ;;Record 9;5
 ;;
1 ;;Group 1;6;30;X
 ;;MMDTENT2;MSD DATE ENTERED MIL SVC-2;1;8;MSD1;11;D DATE^PRSDUTIL;;;268
 ;;MMDTSEP2;MSD DATE SEPARATED MIL SVC-2;9;16;MSD1;14;D DATE^PRSDUTIL;;;271
 ;;MMBRSV2;MSD BRANCH OF SERVICE-2;17;17;MSD1;8;;;;265
 ;;MMLOST2;MSD LOST TIME-2;18;22;MSD1;17;D SIGN^PRSDUTIL S DATA=+DATA;;;274
 ;;MMAMTDU2;MSD AMT DUE THIS PERIOD-2;23;29;MSD1;5;D SIGN^PRSDUTIL,DD^PRSDUTIL;;;262
 ;;MMPDMS3;MSD ACTION CODE-3;30;30;MSD1;3;S:DATA="D" DATA="";;;260
 ;;
2 ;;Group 2;6;34;X
 ;;MMDTENT3;MSD DATE ENTERED MIL SVC-3;1;8;MSD1;12;D DATE^PRSDUTIL;;;269
 ;;MMDTSEP3;MSD DATE SEPARATED MIL SVC-3;9;16;MSD1;15;D DATE^PRSDUTIL;;;272
 ;;MMBRSV3;MSD BRANCH OF SERVICE-3;17;17;MSD1;9;;;;266
 ;;MMLOST3;MSD LOST TIME-3;18;22;MSD1;18;D SIGN^PRSDUTIL S DATA=+DATA;;;275
 ;;MMAMTDU3;MSD AMT DUE THIS PERIOD-3;23;29;MSD1;6;D SIGN^PRSDUTIL,DD^PRSDUTIL;;;263
 ;;MMSAVAM2;SAVINGS ALLOTMENT-2 AMT EPPD;30;34;SALLOT;3;D SIGN^PRSDUTIL S DATA=+DATA;;;341
 ;;
3 ;;Group 3;4;28;9
 ;;MNPPAMT;MSD DEDUCTION EPPD;1;5;MSD2;5;D SIGN^PRSDUTIL S DATA=+DATA;;;280
 ;;MNTOTDUE;MSD TOTAL AMT DUE;6;12;MSD2;13;D SIGN^PRSDUTIL,DD^PRSDUTIL;;;288
 ;;MNICDATE;MSD INTEREST COMP DATE;13;20;MSD2;9;D DATE^PRSDUTIL;;;284
 ;;MNPAYDAT;MSD CASH PAYMENT DATE;21;28;MSD2;3;D DATE^PRSDUTIL;;;278
 ;;
4 ;;Group 4;9;51;X
 ;;MOALCBAL;BAYLOR PLAN AL CURRENT BAL;1;7;BAYLOR;1;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;473
 ;;MOALUSED;BAYLOR PLAN AL USED LYTD;8;14;BAYLOR;3;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;475
 ;;MOALEOPY;BAYLOR PLAN AL EOPY BAL;15;21;BAYLOR;2;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;474
 ;;MOSLCBAL;BAYLOR PLAN SL CURRENT BAL;22;28;BAYLOR;13;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;485
 ;;MOSLUSED;BAYLOR PLAN SL USED LYTD;29;35;BAYLOR;15;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;487
 ;;MOSLEOPY;BAYLOR PLAN SL EOPY BAL;36;42;BAYLOR;14;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;486
 ;;MORALCD1;BAYLOR PLAN RESTORED AL YEAR-1;43;43;BAYLOR;11;;;;483
 ;;MORALBL1;BAYLOR PLAN RESTORED AL BAL-1;44;50;BAYLOR;9;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;481
 ;;MORALCD2;BAYLOR PLAN RESTORED AL YEAR-2;51;51;BAYLOR;12;;;;484
 ;;
5 ;;Group 5;12;72;X
 ;;MORALBL2;BAYLOR PLAN RESTORED AL BAL-2;1;7;BAYLOR;10;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;482
 ;;MOLWOPLY;BAYLOR PLAN LWOP LYTD;8;14;BAYLOR;5;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;477
 ;;MOLWOPCY;BAYLOR PLAN LWOP CCY;15;21;BAYLOR;4;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;476
 ;;MOLWOPSS;BAYLOR PLAN LWOP THIS STEP;22;28;BAYLOR;8;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;480
 ;;MOLWOPLP;BAYLOR PLAN LWOP SINCE PROM;29;35;BAYLOR;7;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;479
 ;;MOLWOPPP;BAYLOR PLAN LWOP PROB PD;36;42;BAYLOR;6;D SIGN^PRSDUTIL,DDD^PRSDUTIL;;;478
 ;;MOCNTLNO;ACSB CONTROL NUMBER-2;43;47;ACSB;10;;;;245
 ;;MOACIND;ACSB CODE-2;48;48;ACSB;8;;;;243
 ;;MOPERFAC;ACSB FED/STATE PCT FACTOR-2;49;53;ACSB;14;D SIGN^PRSDUTIL,DDDD^PRSDUTIL;;;249
 ;;MOCURDED;ACSB CURRENT ALLOTMENT-2;54;60;ACSB;12;D SIGN^PRSDUTIL,DD^PRSDUTIL;;;247
 ;;MOBPBAL;ACSB BACK PAY BALANCE-2;61;67;ACSB;3;D SIGN^PRSDUTIL,DD^PRSDUTIL;;;238
 ;;MOBPDED;ACSB BACK PAY DEDUCTION-2;68;72;ACSB;5;D SIGN^PRSDUTIL,DD^PRSDUTIL;;;240
