QACDISC ;WCIOFO/ERC - Report of Discipline Contacts ;8/15/97
 ;;2.0;Patient Representative;**3,5,6,9,13,17,18**;07/25/1995
DATE ;
 N QACFLG
 D DATDIV^QACUTL0 G:QAQPOP EXIT
 S QACTEXT="Discipline "
 S DIC="^QA(745.5,"
 D DIR(QACTEXT,DIC,.Y)
 I $G(QACQUIT)=1 G EXIT2
 I $G(Y),+Y<0 D
 . W !!,"No Discipline selected.",!!
 . S QACTEXT="Discipline "
 . S DIC="^QA(745.5,"
 . D DIR(QACTEXT,DIC,.Y)
 I $G(QACQUIT)=1 G EXIT2
 I $G(QACFLG)=1 S QACDSC=$P(^QA(745.5,+Y,0),U,2),QACDSP=+Y
 K %ZIS,IOP S %ZIS="MQ" W ! D ^%ZIS G:POP EXIT
 I $D(IO("Q")) D  G EXIT
 . S ZTDESC="Patient Rep "_QACTEXT_"Report"
 . S (ZTSAVE("QASDIS"),ZTSAVE("QACDSC"),ZTSAVE("QACDSP"))=""
 . S (ZTSAVE("QACSRPT0"),ZTSAVE("QACSRPT1"),ZTSAVE("QACSRPT2"))=""
 . S (ZTSAVE("QAQNBEG"),ZTSAVE("QAQNEND"))=""
 . S (ZTSAVE("QACFLG"),ZTSAVE("QACTEXT"))=""
 . S (ZTSAVE("QAC1DIV"),ZTSAVE("QACDIV"),ZTSAVE("QACDV"))=""
 . S ZTRTN="TSK^QACDISC"
 . D TASK^QACUTL0
 . Q
TSK ;
 S QACPIECE=2
 S QACSUB=1
 D TSK1(QACPIECE,QACSUB)
 Q
TSK1(QACPIECE,QACSUB) ;
 K ^TMP("QACSRPT0",$J),^TMP("QACSRPT1",$J),^TMP("QACSRPT2",$J)
 ;I '$D(QAC1DIV) S (^TMP("QACSRPT0",$J),^TMP("QACSRPT1",$J),^TMP("QACSRPT2",$J))=0
 I $G(QAC1DIV)]"" S (^TMP("QACSRPT0",$J,QAC1DIV),^TMP("QACSRPT1",$J,QAC1DIV),^TMP("QACSRPT2",$J,QAC1DIV))=0
 ;I $G(QAC1DIV)']"" D
 ;. S QACDIV(0)=0
 ;. S (^TMP("QACSRPT0",$J,QACDIV(0)),^TMP("QACSRPT1",$J,QACDIV(0)),^TMP("QACSRPT2",$J,QACDIV(0)))=0
 ;. S QACEE=0
 ;. F  S QACEE=$O(^QA(740,1,"QAC2",QACEE)) Q:QACEE'>0  D
 ;. . S QACDIV(QACEE)=^QA(740,1,"QAC2",QACEE,0)
 ;. . S (^TMP("QACSRPT0",$J,QACDIV(QACEE)),^TMP("QACSRPT1",$J,QACDIV(QACEE)),^TMP("QACSRPT2",$J,QACDIV(QACEE)))=0
 U IO
 K QACDT,QACD0,QACCN,QACDIEN,QACCIEN,QACINM,QACHDNM,QACHDIEN
 S QACDT=QAQNBEG-.0000001 F  S QACDT=$O(^QA(745.1,"D",QACDT)) Q:(QACDT'>0)!(QACDT>QAQNEND)!(QACDT\1'?7N)  D
 . S QACD0=0 F  S QACD0=$O(^QA(745.1,"D",QACDT,QACD0)) Q:QACD0'>0  D
 . . S QACDIV=$P(^QA(745.1,QACD0,0),U,16)
 . . I $G(QACDIV)']"" S QACDIV=0
 . . I $G(QAC1DIV)]"" Q:$G(QAC1DIV)'=$G(QACDIV)
 . . S QACCN=0 F  S QACCN=$O(^QA(745.1,QACD0,3,QACCN)) Q:QACCN'>0  D
 . . . S QACDN=0 F  S QACDN=$O(^QA(745.1,QACD0,3,QACCN,3,QACDN)) Q:QACDN'>0  D
 . . . . S QACDIEN=$P($G(^QA(745.1,QACD0,3,QACCN,3,QACDN,0)),U,QACPIECE) Q:QACDIEN=""
 . . . . I $G(QACFLG)=1 I $G(QACDSP)'=QACDIEN Q
 . . . . I QACSUB=1 S QACDIS=$$EN7^QACUTIL(QACDIEN)
 . . . . I QACSUB=2 S QACDIS=$$EN8^QACUTIL(QACDIEN)
 . . . . S QACCIEN=$P($G(^QA(745.1,QACD0,3,QACCN,0)),U,1) Q:QACCIEN=""
 . . . . S QACICODE=$P($G(^QA(745.2,QACCIEN,0)),U,1) Q:QACICODE=""
 . . . . I $E(QACICODE,1,2)?2A S QACHD=$E(QACICODE,1,2)
 . . . . E  S QACHD=$E(QACICODE,1)
 . . . . S QACHDIEN=0 F  S QACHDIEN=$O(^QA(745.2,"B",QACHD,QACHDIEN)) Q:QACHDIEN'>0  D SET
 . . . . Q
 . . . Q
 . . Q
 . Q
PRINT ;
 ;This is the header information on each page and the data by service.
 N QACCC,QACE,QACF,QACTTL
 K QACUNDL S $P(QACUNDL,"-",81)="",QACQUIT=0,QACPG=1
 S QACCC=$O(^TMP("QACSRPT0",$J,""))
 I $G(QACCC)="" S QACDSC="" D HEAD W !!,"No data found for the date range selected!" Q
 I $G(^TMP("QACSRPT0",$J,QACCC))=0 S QACDSC="" D HEAD W !!,"No data found for the date range selected!" Q
 K QACDIS,QACHDIEN,QACHD,QACCIEN,QACICODE,QACSTOT,QACCTOT,QACHDTOT
 I $D(QAC1DIV) D PRT1
 D ^%ZISC
 D EXIT
 Q
PRT1 ;print report for all disciplines by division
 S QACDD=""
 F  S QACDD=$O(^TMP("QACSRPT0",$J,QACDD)) Q:(QACDD']"")!(QACQUIT)  D 
 . S QACDSC=""
 . F  S QACDSC=$O(^TMP("QACSRPT0",$J,QACDD,QACDSC)) Q:(QACDSC']"")!($G(QACQUIT))  D PRT4
 Q
PRT4 ;print report for each discipline by division
 S QACSTOT=$G(^TMP("QACSRPT0",$J,QACDD,QACDSC)) Q:QACSTOT=""
 D HEAD
 I $G(QACDD)=0 S QACDV="Unknown"
 I $G(QACDD)>0 D INST^QACUTL0(QACDD,.QACDV)
 W !!?25,"Issues for Division: ",QACDV
 W !?15,"Total Issues for ",QACDSC," = ",QACSTOT
 S QACHD="" F  S QACHD=$O(^TMP("QACSRPT1",$J,QACDD,QACDSC,QACHD)) Q:(QACHD="")!(QACQUIT)  D
 . S QACHDIEN=$P(QACHD,"^",2)
 . S QACHDNM=$$EN6^QACUTIL(QACHDIEN)
 . S QACHDTOT=$G(^TMP("QACSRPT1",$J,QACDD,QACDSC,QACHD)) Q:(QACHDTOT="")!(QACQUIT)
 . W !!?5,QACHDNM,?77,QACHDTOT
 . S QACICODE="" F  S QACICODE=$O(^TMP("QACSRPT2",$J,QACDD,QACDSC,QACHD,QACICODE)) Q:(QACICODE="")!(QACQUIT)  D
 . . S QACCIEN=$P(QACICODE,"^",2)
 . . S QACCNM=$$EN5^QACUTIL(QACCIEN)
 . . S QACCTOT=$P($G(^TMP("QACSRPT2",$J,QACDD,QACDSC,QACHD,QACICODE)),U,1) Q:(QACCTOT="")!(QACQUIT)
 . . W !,QACCNM,?77,QACCTOT
 . . I $Y>(IOSL-5) D:$E(IOST)="C" PAUSE Q:QACQUIT  D HEAD
 . . Q
 . Q
 W ! D PAUSE
 Q
EXIT ;
 W ! D ^%ZISC S:$D(ZTQUEUED) ZTREQ="@"
EXIT2 K DIR,DIROUT,DIRUT,DTOUT
 K IOP,POP,%ZIS,ZTSAVE,ZTDESC,ZTREQ,ZTRTN,ZTQUEUED,ZTSK
 K QAC1DIV,QACCIEN,QACCN,QACCTOT,QACD0,QACDT,QACICODE,QACDIEN,QACDIS
 K QACDIV,QACDSC,QACDSP,QACDV,QACGDREC,QACHD
 K QACHEAD,QACHDIEN,QACHDNM,QACHDTOT,QACINAME,QACCNM,QACDN
 K QACPG,QACQUIT,QACRED,QACHTOT,QACTOT,QACUNDL
 K QAQNBEG,QAQNEND,QAQPOP,QAQQUIT
 K ^TMP("QACSRPT0",$J),^TMP("QACSRPT1",$J),^TMP("QACSRPT2",$J)
 K QACDD,QACEE
 K QAQ2HED,QAQNBEG,QAQNEND,QAQPOP
 D K^QAQDATE
 Q
HEAD ;
 W:($E(IOST)="C")!(QACPG>1) @IOF
 W !,QACTEXT_"Issue Report for ",QACDSC S Y=DT D DD^%DT W ?60,"Date: ",Y,!
 W QAQ2HED,?60,"Page: ",QACPG
 W !,QACUNDL,! S QACPG=QACPG+1
 Q
PAUSE ;
 I $E(IOST)="C" K DIR S DIR(0)="E" D ^DIR S QACQUIT=$S(Y'>0:1,1:0)
 Q
SET ;Counts the records.
 I '$D(QAC1DIV) D
 . S ^TMP("QACSRPT0",$J,QACDIS)=$G(^TMP("QACSRPT0",$J,QACDIS))+1
 . S ^TMP("QACSRPT1",$J,QACDIS,QACHD_"^"_QACHDIEN)=$G(^TMP("QACSRPT1",$J,QACDIS,QACHD_"^"_QACHDIEN))+1
 . S ^TMP("QACSRPT2",$J,QACDIS,QACHD_"^"_QACHDIEN,QACICODE_"^"_QACCIEN)=$G(^TMP("QACSRPT2",$J,QACDIS,QACHD_"^"_QACHDIEN,QACICODE_"^"_QACCIEN))+1
 . Q
 I $D(QAC1DIV) D
 . S ^TMP("QACSRPT0",$J,QACDIV)=$G(^TMP("QACSRPT0",$J,QACDIV))+1
 . S ^TMP("QACSRPT0",$J,QACDIV,QACDIS)=$G(^TMP("QACSRPT0",$J,QACDIV,QACDIS))+1
 . S ^TMP("QACSRPT1",$J,QACDIV,QACDIS,QACHD_"^"_QACHDIEN)=$G(^TMP("QACSRPT1",$J,QACDIV,QACDIS,QACHD_"^"_QACHDIEN))+1
 . S ^TMP("QACSRPT2",$J,QACDIV,QACDIS,QACHD_"^"_QACHDIEN,QACICODE_"^"_QACCIEN)=$G(^TMP("QACSRPT2",$J,QACDIV,QACDIS,QACHD_"^"_QACHDIEN,QACICODE_"^"_QACCIEN))+1
 . Q
 Q
DIR(QACTEXT,DIC,Y) ;
 S QACFLG=0
 S DIR(0)="YOA"
 S DIR("A")="Would you like this report for one "_QACTEXT_"only? "
 S DIR("B")="NO"
 S DIR("?")="Enter 'Y' if you want only one "_QACTEXT_"."
 D ^DIR
 K DIR I $D(DTOUT)!($D(DUOUT)) K DTOUT,DUOUT S QACQUIT=1 Q
 I Y=1 S QACFLG=1
 I $G(QACFLG)=1 S DIC(0)="AEMNZQ" D ^DIC K DIC Q:+Y<1  ; S QACDSC=$P(^QA(745.5,+Y,0),U,2)
 Q
