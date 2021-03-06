PSUUD4 ;BIR/TJH - PBM UNIT DOSE EMAIL GENERATOR ;10 JUL 1999
 ;;4.0;PHARMACY BENEFITS MANAGEMENT;;MARCH, 2005
 ;DBIA(s)
 ; Reference to file #4.3  supported by DBIA 2496,2596
 ; Reference to file #40.8 supported by DBIA 2438
 ;
 ;PSULC  = Line processing in ^tmp
 ;PSUTLC = Total Line count
 ;PSUMC  = Message counter
 ;PSUMLC = Message Line Counter
 ; RETURNS 
 ;PSUMSG("M") = # Messages
 ;PSUMSG("L") = # Lines
 ;
EN(PSUMSGT) ;Scan and process for Division(s)
 ; PSUMSGT ("M")= # MESSAGES  ("L")= # LINES
 ;
 S PSUDIV=0,Z=0,PSUUDSUB="PSUUD_"_PSUJOB
 F  S PSUDIV=$O(^XTMP(PSUUDSUB,"RECORDS",PSUDIV)) Q:PSUDIV=""  D
 . D XMD^PSUUD4(.Z) ; ==> process one division
 . S PSUMSGT(PSUDIV,PSUOPTN,"M")=$G(PSUMSGT(PSUDIV,PSUOPTN,"M"))+Z("M")
 . S PSUMSGT(PSUDIV,PSUOPTN,"L")=$G(PSUMSGT(PSUDIV,PSUOPTN,"L"))+Z("L")
 Q
XMD(PSUMSG) ;EP returns PSUMSG("M")= # MESSAGES ("L")= # LINES
 NEW PSUMAX,PSULC,PSUTMC,PSUTLC,PSUMC
 ; Scan TMP, split lines, transmit per MAX lines in Netmail
 S PSUMAX=$$VAL^PSUTL(4.3,1,8.3)
 S PSUMAX=$S(PSUMAX="":10000,PSUMAX>10000:10000,1:PSUMAX)
 ;
 ;   Split and store into ^XTMP(PSUUDSUB,"XMD",PSUMC,PSUMLC)
 K ^XTMP(PSUUDSUB,"XMD")
 S PSUMC=1,PSUMLC=0
 F PSULC=1:1 S X=$G(^XTMP(PSUUDSUB,"RECORDS",PSUDIV,PSULC)) Q:X=""  D
 . S PSUMLC=PSUMLC+1
 . I PSUMLC>PSUMAX S PSUMC=PSUMC+1,PSUMLC=0,PSULC=PSULC-1 Q  ; +  message
 . I $L(X)<235 S ^XTMP(PSUUDSUB,"XMD",PSUMC,PSUMLC)=X Q
 . F I=235:-1:1 S Z=$E(X,I) Q:Z="^"
 . S ^XTMP(PSUUDSUB,"XMD",PSUMC,PSUMLC)=$E(X,1,I)
 . S PSUMLC=PSUMLC+1
 . S ^XTMP(PSUUDSUB,"XMD",PSUMC,PSUMLC)="*"_$E(X,I+1,999)
 ;   Count Lines sent
 S PSUTLC=0
 F PSUM=1:1:PSUMC S X=$O(^XTMP(PSUUDSUB,"XMD",PSUM,""),-1),PSUTLC=PSUTLC+X
 ;   Transmit Messages
VARS ; Setup variables for contents
 ;
 F PSUM=1:1:PSUMC D
 . S X=PSUDIV,DIC=40.8,DIC(0)="X",D="C" D IX^DIC ;**1
 . S X=+Y S PSUDIVNM=$$VAL^PSUTL(40.8,X,.01)
 . S ^XTMP("PSU_"_PSUJOB,"DIV",PSUDIV)=PSUDIVNM
 . I '$D(PSUUDFLG) S XMSUB="V. 4.0 PBMUD "_PSUMON_" "_PSUM_"/"_PSUMC_" "_PSUDIV_" "_PSUDIVNM
 . I $D(PSUUDFLG) S XMSUB="V. 4.0 PBMUD "_PSUMON_" "_PSUDIV_" "_PSUDIVNM
 . S XMTEXT="^XTMP(PSUUDSUB,""XMD"",PSUM,"
 . S XMDUZ=DUZ
 . M XMY=PSUXMY
 . S XMCHAN=1
 . M XMY=PSUXMY
 . I PSUMASF!PSUDUZ!PSUPBMG D ^XMD
 ;
 S PSUMSG("M")=PSUMC
 S PSUMSG("L")=PSUTLC
 Q
 ;
