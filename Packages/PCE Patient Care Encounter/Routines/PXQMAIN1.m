PXQMAIN1 ;ISL/JVS - MAIN MENU ROUTINE #2 ;8/29/96  10:33
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**4**;Aug 12, 1996
 ;
 ;
 ;
ASK ;--5TH OPTION
 N DFN,IEN,VISIT,ANS,I,BROKEN
 ;--ASK FOR IEN OR UID
 ;S (VISIT,IEN)=$$ASKNUM^PXQUTL Q:IEN<0
 S (VISIT,IEN)=$$ASKNUM^PXQUTL I IEN<0 D  Q:IEN<0
 .R !,"Look at a BROKER POINTER to a visit? (Y/N): N// ",ANS:DTIME
 .I ANS["N"!(ANS="") Q
 .R !,"Enter Visit IEN: ",ANS:DTIME
 .I +ANS<1 Q
 .S (VISIT,IEN)=ANS
 .I '$D(^AUPNVSIT(ANS)) S BROKEN=1
 I $G(IEN)'<1 S ^DISV(DUZ,"PXQREP3")="`"_$G(IEN)
 ;
MEN ;--MENU FOR WHAT TO DISPLAY FOR VISIT
 S DIR("A")="Select a Display"
 S DIR(0)="SOM^D:Dependent Entry Counts;E:Expanded Views;S:Sources and Audit Trail;A:All of the Above"
 D ^DIR I Y=""!(Y["^") G CLOSE
 I Y="D" D DEC G MEN
 I Y="E" D EXP G MEN
 I Y="S" D AUD G MEN
 I Y="A" D ALL G MEN
 G CLOSE
 ;
 ;
DEC ;--ENTRIES POINTING TO VISIT
 ;--OPEN DEVICE
 S OPTION="5D"
 D ZIS^PXQZIS G:POP CLOSE
 ;--RESET $X,$Y TO ZERO
 N DX,DY S (DX,DY)=0 X ^%ZOSF("XY")
DEC5D ;--TITLE OF PRINT OUT
 W $$RE^PXQUTL("**  D E P E N D E N T   E N T R Y   C O U N T  **")
 W $$EXP^PXQUTL("^AUPNVSIT(",IEN)
 W $$RE^PXQUTL("     DEPENDENT ENTRY COUNT---FOR VISIT "_IEN_"-----")
 W $$DEC^PXQFV(IEN,1,"")
 ;--ENTRIES POINTING TO ENCOUNTER
 N I S I=0 F  S I=$O(^SCE("AVSIT",IEN,I)) Q:I=""  D
 .W $$RE^PXQUTL("     DEPENDENT ENTRY COUNT ---FOR ENCOUNTER "_I_"-----")
 .W $$DEC^PXQFE(I,1,"")
 ;--PRINT TO SCREEN
 D READ^PXQUTL
 D ^%ZISC
 I $D(ZTSK) G CLOSE
 E  Q
 ;
 ;
EXP ;--EXPANDED VIEW
 ;--OPEN DEVICE
 S OPTION="5E"
 D ZIS^PXQZIS G:POP CLOSE
 ;--RESET $X,$Y TO ZERO
 N DX,DY S (DX,DY)=0 X ^%ZOSF("XY")
EXP5E ;--TITLE OF PRINT OUT
 W $$RE^PXQUTL("**  E X P A N D E D   D E P E N D E N T   E N T R Y   C O U N T  **")
 W $$RE^PXQUTL("     DEPENDENT ENTRY COUNT---FOR VISIT "_IEN_"-----")
 W $$DEC^PXQFV(IEN,1,1)
 ;--ENTRIES POINTING TO ENCOUNTER
 N I S I=0 F  S I=$O(^SCE("AVSIT",IEN,I)) Q:I=""  D
 .W $$RE^PXQUTL("     DEPENDENT ENTRY COUNT ---FOR ENCOUNTER "_I_"-----")
 .W $$DEC^PXQFE(I,1,1)
 D SDV^PXQUTL
 ;--PRINT TO SCREEN
 D READ^PXQUTL
 D ^%ZISC
 I $D(ZTSK) G CLOSE
 E  Q
 ;
AUD ;--AUDIT TRAIL AND SOURCE
 N PXQAUDIT,PXQSOR
 S (PXQAUDIT,PXQSOR)=1
 ;--OPEN DEVICE
 S OPTION="5A"
 D ZIS^PXQZIS G:POP EXIT
 ;--RESET $X,$Y TO ZERO
 N DX,DY S (DX,DY)=0 X ^%ZOSF("XY")
AUD5A ;--TITLE OF PRINT OUT
 W $$RE^PXQUTL("**  S O U R C E S / A U D I T  T R A I L  **")
 ;--GET SOURCE OF THE VISIT ENTRY
 W $$SOR^PXQUTL(VISIT)
 W $$RE^PXQUTL(" ")
 W $$RE^PXQUTL("     DEPENDENT ENTRY COUNT---FOR VISIT "_IEN_"-----")
 W $$DEC^PXQFV(IEN,1,1)
 ;--PRINT TO SCREEN
 D READ^PXQUTL
 D ^%ZISC
 I $D(ZTSK) G CLOSE
 E  Q
ALL ;--ALL OF THE ABOVE
 N PXQAUDIT,PXQSOR
 ;--OPEN DEVICE
 S OPTION="5A"
 D ZIS^PXQZIS G:POP EXIT
 ;--RESET $X,$Y TO ZERO
 N DX,DY S (DX,DY)=0 X ^%ZOSF("XY")
ALL5A ;--TITLE OF PRINT OUT
 W $$RE^PXQUTL("**  A L L   S O U R C E S / A U D I T  T R A I L  **")
 S (PXQAUDIT,PXQSOR)=1
 ;--GET SOURCE OF THE VISIT ENTRY
 W $$SOR^PXQUTL(VISIT)
 W $$RE^PXQUTL(" ")
 W $$RE^PXQUTL("     DEPENDENT ENTRY COUNT---FOR VISIT "_IEN_"-----")
 W $$DEC^PXQFV(IEN,1,1)
 ;--ENTRIES POINTING TO ENCOUNTER
 N I S I=0 F  S I=$O(^SCE("AVSIT",IEN,I)) Q:I=""  D
 .W $$RE^PXQUTL("     DEPENDENT ENTRY COUNT ---FOR ENCOUNTER "_I_"-----")
 .W $$DEC^PXQFE(I,1,1)
 D SDV^PXQUTL
 ;--PRINT TO DEVICE
 D READ^PXQUTL
 D ^%ZISC
 I $D(ZTSK) G CLOSE
 E  Q
CLOSE ;--CLOSE DEVICE
 D ^%ZISC
 ;--RETURN TO MENU
 Q
 ;
EXIT ;--EXIT
 K OPTION
 Q
