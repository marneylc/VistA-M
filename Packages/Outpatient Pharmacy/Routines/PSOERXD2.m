PSOERXD2 ;ALB/BWF - eRx Drug edit actions ; 5/26/2017 9:57am
 ;;7.0;OUTPATIENT PHARMACY;**467,506**;DEC 1997;Build 4
 ;
 Q
SBN ;
 N Y,ERXIEN
 S Y=$P(XQORNOD(0),"=",2)
 I Y']"" S VALMBCK="R" Q
 D EDIT^PSOERX1A("D",Y)
 S VALMBCK="R"
 Q
VDRG1(PSOIEN,PSOIENS) ;
 N VANDRG,VAODRG,DIE,DA,DR,AUTOVAL,DIC,Y,QTLOOP,SELDRG,VDRG,VANDRG,VAOI,PATINST
 Q:'$G(PSOIEN)
 S VAODRG=$$GET1^DIQ(52.49,PSOIEN,3.2,"I")
 S AUTOVAL=$$GET1^DIQ(52.49,PSOIEN,1.4,"I")
 I VAODRG W !,"Current Vista Drug: "_$$GET1^DIQ(50,VAODRG,.01,"E")
 ; for now allow user to search by drug name. may enhance screening in the future.
 S DIC(0)="AEMQ",DIC=50,DIC("S")="I $$ACTIVE^PSOERXA0(Y),($$OUTPAT^PSOERXA0(Y)),('$$INVCOMP^PSOERXA0(Y)),('$$CS^PSOERXA0(Y))"
 I VAODRG]"" S DIC("B")=VAODRG
 D ^DIC K DIC
 I $G(DUOUT)!($P(Y,U)<1) S PQUIT=1 Q
 S SELDRG=Y
 W !!,"You have selected: "_$P(Y,U,2),!,"Would you like to use this drug/supply?" S DIR(0)="YO" D ^DIR K DIR
 I Y="^"!(Y<1) S PQUIT=1 Q
 S DIE="^PS(52.49,",DA=PSOIEN,DR="3.2///"_$P(SELDRG,U,1) D ^DIE
 ; set the manual validation flag if the drug has been selected.
 S VANDRG=$$GET1^DIQ(52.49,PSOIEN,3.2,"I")
 I $$GET1^DIQ(52.49,PSOIEN,1,"E")="N" D UPDSTAT^PSOERXU1(PSOIEN,"I")
 ; if the drug has changed, update the manual validation by and date/time
 I VANDRG'="",VAODRG'=VANDRG D
 .S QTLOOP=0 F  S QTLOOP=$O(^PS(52.49,PSOIEN,21,QTLOOP)) Q:'QTLOOP  D
 ..S FDA(52.4921,QTLOOP_","_PSOIENS,.01)="@" D FILE^DIE(,"FDA") K FDA
 .; if the drug is the same, leave the manual validation,otherwise delete it.
 .S FDA(52.49,PSOIENS,1.5)=""
 .S FDA(52.49,PSOIENS,1.11)="",FDA(52.49,PSOIENS,1.12)=""
 .S FDA(52.49,PSOIENS,20.3)="",FDA(52.49,PSOIENS,20.4)=""
 .S FDA(52.49,PSOIENS,27)="",FDA(52.49,PSOIENS,20.1)="",FDA(52.49,PSOIENS,20.2)=""
 .S FDA(52.49,PSOIENS,20.3)="",FDA(52.49,PSOIENS,20.4)="",FDA(52.49,PSOIENS,20.5)=""
 ; get and file patient instructions
 S VDRG=VANDRG
 S VAOI=$$GET1^DIQ(50,VDRG,2.1,"I")
 S PATINST=$$GET1^DIQ(50.7,VAOI,7,"E")
 I $L(PATINST) D
 .S FDA(52.49,PSOIENS,27)=$G(PATINST)
 D FILE^DIE(,"FDA") K FDA
 Q
VDRG2(PSOIEN,PSOIENS) ;
 N PSOQTS,PSOFROM
 N PSODOSE,PSONEW,PSODRUG,PSORXED,VERB,QTIEN,SFIENS,DOSE,PSODFN
 ; get patient IEN
 S PSODFN=$$GET1^DIQ(52.49,PSOIEN,.05,"I")
 I 'PSODFN D  Q
 .W !,"Cannot continue with dosing instructions until patient has been matched."
 .S DIR(0)="E" D ^DIR
 .S PQUIT=1
 ; get drug ien and orderable item ien
 D DERX1(PSOIEN,PSOIENS,1)
 S PSODRUG("IEN")=$$GET1^DIQ(52.49,PSOIEN,3.2,"I") Q:'PSODRUG("IEN")
 S PSODRUG("OI")=$$GET1^DIQ(50,PSODRUG("IEN"),2.1,"I") Q:'PSODRUG("OI")
 S (PSORXED("ENT"),ENT)=1
 ; SET PSOFROM=PENDING so the dosage list will activate and present to the user
 S PSOFROM="PENDING"
 D DOSE^PSSORPH(.DOSE,PSODRUG("IEN"),"O",PSODFN)
 D ASK^PSOBKDED
 I $G(DOSE)']"" S PQUIT=1 Q
 I $$GET1^DIQ(52.49,PSOIEN,1,"E")="N" D UPDSTAT^PSOERXU1(PSOIEN,"I")
 I $G(VERB)]"" S PSORXED("VERB",ENT)=VERB G DUPD
VER ;
 D DERX1(PSOIEN,PSOIENS,1)
 ;below logic brought over from VER^PSOOREDX
 D KV S DIR(0)="52.0113,8"
 S:$G(PSORXED("VERB",ENT))]"" DIR("B")=PSORXED("VERB",ENT)
 D ^DIR
 I X[U,$L(X)>1 S FIELD="VER" G JUMP
 G:$D(DTOUT)!($D(DUOUT)) EXQ
 I X="@" K PSORXED("VERB",ENT),VERB G DUPD
 S:X'="" (PSORXED("VERB",ENT),VERB)=X
DUPD ;
 I $G(PSORXED("DOSE",ENT))'?.N&($G(PSORXED("DOSE",ENT))'?.N1".".N)!'DOSE("LD") K PSORXED("DOSE ORDERED",ENT),DUPD G NOU1
 ; below logic brough over from DUPD^PSOOREDX
 D KV S DIR(0)="52.0113,1",DIR("A")="DISPENSE UNITS PER DOSE"_$S($G(PSORXED("NOUN",ENT))]"":"("_PSORXED("NOUN",ENT)_")",1:"")
 I '$G(PSORXED("DOSE",ENT)),$G(PSORXED("DOSE",ENT-1)) S PSORXED("DOSE",ENT)=PSORXED("DOSE",ENT-1)
 S DIR("B")=$S($G(PSORXED("DOSE ORDERED",ENT))]"":PSORXED("DOSE ORDERED",ENT),1:1) S:$E($G(DIR("B")),1)="." DIR("B")="0"_$G(DIR("B")) K:DIR("B")="" DIR("B")
 D ^DIR I X[U,$L(X)>1 S FIELD="DUPD" G JUMP
 G:$D(DTOUT)!($D(DUOUT)) EXQ
 I X="@"!(X=0) W !,"Dispense Units Per Dose is Required!!",! G DUPD
 ;below logic brought over from STR^PSOOREDX
 S:+STRE>0&(X>0) PSORXED("DOSE",ENT)=(X*STRE) W !,"Dosage Ordered: "_$S($E(PSORXED("DOSE",ENT),1)=".":"0",1:"")_PSORXED("DOSE",ENT)_UNITN,!
 S:X'="" (PSORXED("DOSE ORDERED",ENT),DUPD)=X
NOU1 ;
 G:'$G(PSORXED("DOSE ORDERED",ENT)) RTE
 D CNON
 N PSONDEF
 I $G(NOUN)]"" S PSORXED("NOUN",ENT)=NOUN
NOU ;
 ;below logic brought over from NOU^PSOOREDX
 D KV S DIR(0)="52.0113,3"
 S DIR("B")=$S($G(NOUN)]"":NOUN,1:$G(PSORXED("NOUN",ENT))) K:DIR("B")="" DIR("B")
 S PSONDEF=$G(DIR("B"))
 D ^DIR
 I X[U,$L(X)>1 S FIELD="NOU" G JUMP
 G:$D(DTOUT)!($D(DUOUT)) EXQ
 I X="@" K PSORXED("NOUN",ENT),NOUN G RTE
 I X'="",$G(PSONDEF)="" S NOUN=X
 I X'="",$G(PSONDEF)'=X S NOUN=X
 S:X'="" PSORXED("NOUN",ENT)=X
 ;
RTE ;
 N CURTE,ERXRTE
 S CURTE=$$GET1^DIQ(52.4921,ENT_","_PSOIEN_",",10,"E") S PSORXED("ROUTE",ENT)=CURTE
 K JUMP ;S ROU="PSOORED3" D RTE2 K ROU
 S ROU="PSOERXD2" D RTE2 K ROU
 K ROU
 I $G(JUMP) K JUMP G JUMP
 G:$D(DTOUT)!($D(DUOUT)) EXQ
 ;
SCH ;
 K PSOSCH,DIR,CURSCH
 I '$D(ENT) S ENT=PSORXED("ENT")
 S CURSCH=$$GET1^DIQ(52.4921,ENT_","_PSOIEN_",",1,"E") I CURSCH]"" S DIR("B")=CURSCH
 S DIR("?")="^D SCHLP^PSOORED4",DIR("A")="Schedule: ",DIR(0)="FA^1:20^I X[""""""""!(X?.E1C.E)!($A(X)=45)!($L(X,"" "")>$S(X[""PRN"":4,1:3))!($L(X)>20)!($L(X)<1) K X"
 D ^DIR
 I X[U,$L(X)>1 S FIELD="SCH" G JUMP
 G:$D(DTOUT)!($D(DUOUT)) EXQ
 S SCH=Y D SCH^PSOSIG I $G(SCH)']"" G SCH
 S PSORXED("SCHEDULE",ENT)=SCH W " ("_SCHEX_")" K SCH,SCHEX,X,Y,PSOSCH
 S:PSORXED("ENT")<ENT PSORXED("ENT")=ENT
 ;
DUR ;
 N SIG,SIGDAT,SLOOP,P01,I,DDONE
 D KV K EXP S DIR(0)="52.0113,4",DIR("A")="LIMITED DURATION (IN DAYS, HOURS OR MINUTES)"
 S DIR("B")=$S($G(PSORXED("DURATION",ENT))]"":PSORXED("DURATION",ENT),1:"") K:DIR("B")="" DIR("B")
 D ^DIR I X[U,$L(X)>1 S FIELD="DUR" G JUMP
 G:$D(DTOUT)!($D(DUOUT)) EXQ
 ;below logic is from DUR1^PSOOREDX
 I X="@" K DUR,PSORXED("DURATION",ENT)
 I Y'="" S PSORXED("DURATION",ENT)=Y W " ("_$S(Y["L":"MONTHS",Y["W":"WEEKS",Y["H":"HOURS",Y["M":"MINUTES",1:"DAYS")_")"
 ;
 ; KEEP THIS CODE! - REMOVE CONJUNCTION FOR NOW, SINCE WE WILL NOT HAVE COMPLEX DOSING - FUTURE ENHANCEMENT
 ;CON D CON^PSOOREDX I X[U,$L(X)>1 S FIELD="CON" G JUMP
 ;G:$D(DTOUT)!($D(DUOUT)) EXQ
 ;I X="@",$G(PSORXED("CONJUNCTION",ENT))="" W !,?10,"Invalid Entry - nothing to delete!!" G CON
 ;S:X'=""&(X'="@") PSORXED("CONJUNCTION",ENT)=Y
 ;I X="@",$D(PSORXED("CONJUNCTION",ENT)) D CON1^PSOOREDX G:$D(DIRUT) EXQ G:'Y CON N CKX S CKX=1 D UPD^PSOOREDX G CON
 ;;
 ;N PSODLBD4 S PSOSAVX=X,PSODLBD4=1
 ;;*437
 ;I '$$DUROK^PSOORED3(.PSORXED,ENT) D  G DUR
 ;. W !!,"Duration is required for the dosage entered prior to the THEN conjunction.",$C(7),!
 ;I $G(PSORXED("CONJUNCTION",ENT))]"" S PSOCKCON=1 D DCHK1^PSODOSUT G:$G(PSONEW("DFLG")) EX S ENT=ENT+1 K DIR G ASK
 ;E  K PSOCKCON D DCHK1^PSODOSUT I $D(DTOUT)!($D(DUOUT)) S PSORX("DFLG")=1,PSONEW("DFLG")=1 G EX  ;don't need to print the full summary, just the last sequence. 
 ;I PSOSAVX="",$G(PSORXED) K PSOCKCON,PSOEDDOS
 ;K PSOSAVX
 ;;
 ;S X=$G(PSORXED("INS")) D SIG^PSOHELP S:$G(INS1)]"" PSORXED("SIG")=$E(INS1,2,9999999)
 ;D EN^PSOFSIG(.PSORXED),VERI I $G(CKX),'$G(PSOSIGFL) D MP1 K CKX
 ;I $G(PSOSIGFL)=1 D  I '$G(PSOSIGFL) Q
 ;.I $D(OR0),$P(OR0,"^",24)=1 S VALMSG="Digitally Signed Order - No such changes allowed." K PSORXED,PSOSIGFL M PSORXED=PSODOSE D EN^PSOFSIG(.PSORXED) D  Q
 ;..I $D(PSOBDR) K PSODRUG M PSODRUG=PSOBDR K PSOBDR,PSOBDRG
 ;.S PSORXED("ENT")=ENT,SIGOK=1,VALMSG="This change will create a new prescription!",NCPDPFLG=1
 ;K QTYHLD S:$G(PSORXED("QTY")) QTYHLD=PSORXED("QTY") D QTY^PSOSIG(.PSORXED) I $G(PSORXED("QTY")) S QTY=1
 ;I $G(QTYHLD),'$G(PSORXED("QTY")) S PSORXED("QTY")=QTYHLD
 ;K QTYHLD
 ;I '$G(PSORXED("QTY")),$P(OR0,"^",10) S PSORXED("QTY")=$P(OR0,"^",10)
 ;S PSORXED("INS")="TESTING TO SEE HOW LONG WE CAN MAKE THE SIG AND GET THIS TO FORMAT CORRECTLY"
 S X=$G(PSORXED("INS")) D SIG^PSOHELP S:$G(INS1)]"" PSORXED("SIG")=$E(INS1,2,9999999)
 D EN^PSOFSIG(.PSORXED)
 ; delete existing SIG
 S SLOOP=0 F  S SLOOP=$O(^PS(52.49,PSOIEN,"SIG",SLOOP)) Q:'SLOOP  D
 .S FDA(52.4926,SLOOP_","_PSOIEN_",",.01)="@"
 I $D(FDA) D FILE^DIE(,"FDA") K FDA
 ; file sig into appropriate VA DISPENSING INSTRUCTIONS multiple
 S SLOOP=0 F  S SLOOP=$O(SIG(SLOOP)) Q:'SLOOP  D
 .S SIGDAT=$G(SIG(SLOOP)) Q:SIGDAT=""
 .S SFDA(52.4926,"+1,"_PSOIENS,.01)=SIGDAT D UPDATE^DIE(,"SFDA",,"SERR") K SFDA
 S QTIEN=$O(^PS(52.49,PSOIEN,21,0))
 S SFIENS=$S(QTIEN:QTIEN_",",1:"+1,")
 S P01=$S($L($G(PSORXED("DOSE ORDERED",ENT))):$G(PSORXED("DOSE ORDERED",ENT))_"&"_$G(PSORXED("NOUN",ENT)),1:$G(PSORXED("DOSE",ENT)))
 I '$L(P01) D  Q
 .W !,"Dosage is required. Please re-enter the dosing instructions." S DIR(0)="W" D ^DIR D EX Q 
 S FDA(52.4921,SFIENS_PSOIENS,.01)=$G(PSORXED("DOSE ORDERED",ENT))_"&"_$G(PSORXED("NOUN",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,1)=$G(PSORXED("SCHEDULE",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,2)=$G(PSORXED("DURATION",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,8)=$G(PSORXED("DOSE",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,9)=$G(PSORXED("DOSE ORDERED",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,10)=$G(PSORXED("ROUTE",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,11)=$G(PSORXED("UNITS",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,12)=$G(PSORXED("NOUN",ENT))
 S FDA(52.4921,SFIENS_PSOIENS,13)=$G(PSORXED("VERB",ENT))
 ; VA INSTRUCTIONS
 N UNEXINS,UNEXARY,DDONE
 I $G(PSORXED("ENT")) D
 .S DDONE=0
 .F I=1:1:PSORXED("ENT")  D  Q:DDONE
 ..I '$D(PSORXED("DOSE ORDERED",I)) S DDONE=1 Q
 ..I '$L($G(UNEXINS)) D  Q
 ...S UNEXINS=$G(PSORXED("VERB",I))_" "_$G(PSORXED("DOSE ORDERED",I))_" "_$G(PSORXED("NOUN",I))_" "_$G(ERXRTE(I))_" "_$G(PSORXED("SCHEDULE",I))
 ...I $L($G(PSORXED("DURATION",I))) S UNEXINS=UNEXINS_" "_$G(PSORXED("DURATION",I))
 ...I $L($G(PSORXED("CONJUNCTION",I))) S UNEXINS=UNEXINS_" "_$G(PSORXED("CONJUNCTION",I))
 ..S UNEXINS=UNEXINS_$G(PSORXED("VERB",I))_" "_$G(PSORXED("DOSE ORDERED",I))_" "_$G(PSORXED("NOUN",I))_" "_$G(ERXRTE(I))_" "_$G(PSORXED("SCHEDULE",I))
 ..I $L($G(PSORXED("DURATION",I))) S UNEXINS=UNEXINS_" "_$G(PSORXED("DURATION",I))
 ..I $L($G(PSORXED("CONJUNCTION",I))) S UNEXINS=UNEXINS_" "_$G(PSORXED("CONJUNCTION",I))
 I $L($G(UNEXINS)) D
 .D TXT2ARY^PSOERXD1(.UNEXARY,UNEXINS,,80)
 .D WP^DIE(52.49,PSOIEN_",",31,"K","UNEXARY","BWFERR")
 I SFIENS["+" D UPDATE^DIE(,"FDA",,"ERR") K FDA
 ; if there is a quantity/timing entry, overwrite the data (we are not using complex dosing in this phase)
 I SFIENS'["+" D FILE^DIE(,"FDA") K FDA
EX ;
 K PSOBDR,PSOBDRG,PSOSCH,DUPD,STRE,UNITN,SCH,VERB,NOUN,DOSEOR,RTE,DUR,X,Y,ENTS,PSODOSE,OLENT,FIELD,FLDNM,AR,NM,ENT,STRE,UNITN,PSODOSE,ERTE,ROU,AR1,INS1
KV K DTOUT,DUOUT,DIR,DIRUT
 Q
EXQ ;
 K PSORXED,PSOSIGFL M PSORXED=PSODOSE D EN^PSOFSIG(.PSORXED) D MP1
 I $D(PSOBDR) M PSODRUG=PSOBDR K PSOBDR,PSOBDRG
 S PQUIT=1
 G EX Q
MP1 ;
 S VALMSG="eRx Not Updated!"
 Q
JUMP ;jump to fields
 I $L($E(X,2,99))<3 W !,"Field Name Must Be At Least 3 Characters in Length",! G @FIELD
 D FNM
 I FLDNM']"" K X,NM,FLDNM W !,"INVALID FIELD NAME.  PLEASE TRY AGAIN!",! G @FIELD
 F AR=1:1:PSORXED("ENT") W !,AR_". "_$P(FLDNM,"^",2)_": "_$S(NM="ROU"&($G(PSORXED($P(FLDNM,"^"),AR))):$P(^PS(51.2,PSORXED($P(FLDNM,"^"),AR),0),"^"),1:$G(PSORXED($P(FLDNM,"^"),AR))) S AR1=AR
 D KV S DIR("A",1)="* Indicates which fields will create a New Order",DIR("A")="Select Field to Edit by number",DIR(0)="NO^1:"_AR1 D ^DIR G:$D(DIRUT) @FIELD
 D JFN G:FLDNM="" @FIELD G @FLDNM
 G EX
 Q
FNM S NM=$E(X,2,4),NM=$TR(NM,"qwertyuioplkjhgfdsazxcvbnm","QWERTYUIOPLKJHGFDSAZXCVBNM")
 S FLDNM=$S(NM="DOS":"DOSE^*Dosage",NM="DIS":"DOSE ORDERED^Dispense Units",NM="ROU":"ROUTE^*Route",NM="SCH":"SCHEDULE^*Schedule",NM="DUR"!(NM="LIM"):"DURATION^*Duration",1:"")
 S:FLDNM="" FLDNM=$S(NM="CON":"CONJUNCTION^*Conjunction",NM="NOU":"NOUN^Noun",NM="VER":"VERB^Verb",1:"")
 Q
JFN K FLDNM,AR S ENT=+Y,FLDNM=$S(NM="NOU":"NOU",NM="VER":"VER",NM="DOS":"ASK",NM="DIS":"DUPD",NM="ROU":"RTE",NM="SCH":"SCH",NM="DUR"!(NM="LIM"):"DUR",NM="CON":"CON",1:"")
 Q
CNON ;
 I $G(NOUN)'="" Q
 I '$G(PSORXED("DOSE ORDERED",ENT)) Q
 N PSONLT,PSONLL,PSONLG
 S PSONLL=$P($G(DOSE("DD",+$G(PSODRUG("IEN")))),"^",9) I PSONLL="" Q
 S PSONLG=$L(PSONLL)
 I PSONLG'>3 Q
 S PSONLT=$E(PSONLL,(PSONLG-2),PSONLG)
 I PSONLT'="(S)",PSONLT'="(s)" Q
 ;test noun of (S)
 K NOUN
 I $G(PSORXED("DOSE ORDERED",ENT))>1 S PSORXED("NOUN",ENT)=$E(PSONLL,1,(PSONLG-3))_$E(PSONLT,2) Q
 S PSORXED("NOUN",ENT)=$E(PSONLL,1,(PSONLG-3))
 Q
RTE2 I $G(DRET) S PSORXED("ROUTE",ENT)=""
 I $G(RTE) K RTE
 K DIR,DIRUT S DIR(0)="FO^2:45",DIR("A")="ROUTE",DIR("?")="^D HLP^PSOORED4"
 ;S DIR("B")=$S($G(PSORXED("ROUTE",ENT)):$P(^PS(51.2,PSORXED("ROUTE",ENT),0),"^"),$G(RTE)]"":RTE,$G(DRET):"",1:"PO") K:DIR("B")="" DIR("B")
 S DIR("B")=$G(CURTE)
 ;I '$G(PSORXED("ROUTE",ENT)),$G(PSOREEDT) K DIR("B")
 D ^DIR I X[U,$L(X)>1 S FIELD="RTE",JUMP=1 K DIRUT,DTOUT Q
 Q:$D(DTOUT)!($D(DUOUT))
 I X="@"!(X="") K RTE,ERTE S DRET=1,PSORXED("ROUTE",ENT)="" Q
 K DRET I X=$P($G(^PS(51.2,+$G(PSORXED("ROUTE",ENT)),0)),"^") S RTE=$P(^PS(51.2,PSORXED("ROUTE",ENT),0),"^"),ERTE=$P(^PS(51.2,PSORXED("ROUTE",ENT),0),"^",2) W X_" "_$G(ERTE) Q
 S DIC=51.2,DIC(0)="QEZM",DIC("S")="I $P(^(0),""^"",4)" D ^DIC Q:X[U  G:Y=-1 RTE2 W "  "_$P(Y(0),"^",2)
 ;S:X'="" PSORXED("ROUTE",ENT)=+Y,RTE=Y(0,0),ERTE=$P(Y(0),"^",2)
 S:X'="" PSORXED("ROUTE",ENT)=+Y,RTE=Y(0,0),ERTE=$P(Y(0),"^",2),ERXRTE(ENT)=$P(Y(0),U,3)
 Q
VDRG3(PSOIEN,PSOIENS) ;
 N DIR,Y,PATINST,ERXDRUG,VDRG,VAOI,FDA
 D DERX1(PSOIEN,PSOIENS,1)
 S ERXDRUG=$$GET1^DIQ(52.49,PSOIEN,3.2,"I")
 S PATINST=$$GET1^DIQ(52.49,PSOIEN,27,"E")
 I '$L(PATINST) D
 .S VDRG=$$GET1^DIQ(52.49,PSOIEN,3.2,"I") Q:'VDRG
 .S VAOI=$$GET1^DIQ(50,VDRG,2.1,"I") Q:'VAOI
 .S PATINST=$$GET1^DIQ(50.7,VAOI,7,"E")
 K DIR
 S DIR(0)="52.49,27",DIR("A")="VA PATIENT INSTRUCTIONS"
 I $L(PATINST) S DIR("B")=PATINST
 D ^DIR K DIR
 I Y["^" S PQUIT=1 Q
 S FDA(52.49,PSOIEN_",",27)=$$UP^XLFSTR(Y) D FILE^DIE(,"FDA","ERR") K FDA
 Q
VDRG4(PSOIEN,PSOIENS) ;
 N DIR,Y,USERCOMM,VPATINST,UFLAG,VAPCOMM,ERXPCOMM,FDA
 ; POSSIBLE FUTURE IMPLEMENTATION OF ERX DETAILS
 ;D DERX1(PSOIEN,PSOIENS,1)
 S VPATINST=$$GET1^DIQ(52.49,PSOIEN,27,"E")
 S ERXPCOMM=$$GET1^DIQ(52.49,PSOIEN,8,"E")
 S VAPCOMM=$$GET1^DIQ(52.49,PSOIEN,30,"E")
 S DIR(0)="FO^1:240",DIR("A")="VA Provider Comments",DIR("B")=$S($L(VAPCOMM):VAPCOMM,1:ERXPCOMM)
 D ^DIR K DIR
 I Y["^" S PQUIT=1 Q
 S USERCOMM=$$UP^XLFSTR(Y) K Y
 S FDA(52.49,PSOIEN_",",30)=$$UP^XLFSTR(USERCOMM) D FILE^DIE(,"FDA") K FDA
 Q
VDRG5(PSOIEN,PSOIENS) ;
 N PATIEN,PS55IEN,Y,DIE,DR,DA
 S PATIEN=$$GET1^DIQ(52.49,PSOIEN,.05,"I")
 I 'PATIEN W !!,"Patient has not been validated, cannot edit patient status",! Q
 S PS55IEN=$O(^PS(55,"B",PATIEN,0)) Q:'PS55IEN
 S DIE="^PS(55,",DA=PS55IEN,DR="3" D ^DIE K DIE,DR,DA
 I $D(Y) S PQUIT=1
 Q
VDRG6(PSOIEN,PSOIENS) ;
 ;S DIE="^PS(52.49,",DA=PSOIEN,DR="20.1" D ^DIE K DIE,DR,DA
 N DIR,PSODRG,DRGMSG,ERXQTY,VAQTY,DIE,DA,DR
 S PSODRG=$$GET1^DIQ(52.49,PSOIEN,3.2,"I")
 I PSODRG S DRGMSG=$$GET1^DIQ(50,PSODRG,215,"E")
 S ERXQTY=$$GET1^DIQ(52.49,PSOIEN,5.1,"E")
 W !,"eRx Quantity: "_ERXQTY
 I $P(ERXQTY,".",2)>2 S ERXQTY=""
 S VAQTY=$$GET1^DIQ(52.49,PSOIEN,20.1,"E")
 S DIR("B")=$S(VAQTY]"":VAQTY,1:ERXQTY)
 S DIR(0)="52.49,20.1",DIR("A")="VISTA QUANTITY"_$S($G(DRGMSG)]"":" <"_DRGMSG_">",1:"") D ^DIR
 I Y["^" S PQUIT=1 Q
 S DIE="^PS(52.49,",DA=PSOIEN,DR="20.1///"_Y D ^DIE K DIE,DR,DA
 Q
VDRG7(PSOIEN,PSOIENS) ;
 N Y,ERXDS,DIE,DR,DA
 S ERXDS=$$GET1^DIQ(52.49,PSOIEN,5.5,"E")
 W !,"eRx Days Supply: "_ERXDS
 S DIE="^PS(52.49,",DA=PSOIEN,DR="20.2" D ^DIE K DIE,DR,DA
 I $O(Y(0)) S PQUIT=1
 Q
VDRG8(PSOIEN,PSOIENS) ;
 N Y,ERXRFLS,DIE,DR,DA
 S ERXRFLS=$$GET1^DIQ(52.49,PSOIEN,5.6,"E")
 W !,"eRx Refills: "_ERXRFLS
 S DIE="^PS(52.49,",DA=PSOIEN,DR="20.5" D ^DIE K DIE,DR,DA
 I $O(Y(0)) S PQUIT=1
 Q
VDRG9(PSOIEN,PSOIENS) ;
 N Y,DIR,DIE,DR,DA
 S DIR("A")="PICKUP ROUTING"
 S DIR(0)="SO^M:MAIL;W:WINDOW",DIR("B")="M" D ^DIR K DIR
 I Y["^" S PQUIT=1 Q
 S DIE="^PS(52.49,",DA=PSOIEN,DR="20.4///"_Y D ^DIE K DIE,DR,DA
 Q
VDRG10(PSOIEN,PSOIENS) ;
 N DIC,Y,VACLIN,CURCLIN,DIE,DR,DA
 S CURCLIN=$$GET1^DIQ(52.49,PSOIEN,20.6,"E")
 I '$L(CURCLIN) S CURCLIN=$$GET1^DIQ(59,PSOSITE,10,"E")
 S DIC("B")=CURCLIN
 S DIC="^SC(",DIC(0)="QEAMZ",DIC("A")="Select CLINIC: " D ^DIC K DIC
 I Y<1 Q
 I ($D(DTOUT))!($D(DUOUT)) S PQUIT=1 Q
 S VACLIN=$P(Y,U)
 S DIE="^PS(52.49,",DA=PSOIEN,DR="20.6///"_VACLIN D ^DIE K DIE,DR,DA
 K DTOUT,DUOUT
 Q
VDRG11(PSOIEN,PSOIENS) ;
 N DIE,DR,DA,Y
 S DIE="^PS(52.49,",DA=PSOIEN,DR="8" D ^DIE K DIE,DR,DA
 I $O(Y(0)) S PQUIT=1
 Q
 ; display erx info
 ; DFLG - display flag
 ;          1 - drug sig comments
 ;          ""- all
 ;          
DERX1(PSOIEN,PSOIENS,DFLG) ;
 N EDRG,ERXDAT,ESIG,COMM,SUBS,DFORM,DSTR,QQUAL,POTUC,QTY,DAYS,REFILL,COMMARY,SIGARY
 D GETS^DIQ(52.49,PSOIENS,"3.1;4.6;4.8;5.1;5.2;5.4;5.5;5.6;5.8;7;8;41;42;43","E","ERXDAT")
 S DFLG=$G(DFLG,"")
 S EDRG=$G(ERXDAT(52.49,PSOIENS,3.1,"E"))
 S ESIG=$G(ERXDAT(52.49,PSOIENS,7,"E"))
 S COMM=$G(ERXDAT(52.49,PSOIENS,8,"E"))
 S SUBS=$G(ERXDAT(52.49,PSOIENS,5.8,"E"))
 S DFORM=$G(ERXDAT(52.49,PSOIENS,41,"E"))
 S DSTR=$G(ERXDAT(52.49,PSOIENS,43,"E"))
 S QQUAL=$G(ERXDAT(52.49,PSOIENS,5.2,"E"))
 S POTUC=$G(ERXDAT(52.49,PSOIENS,42,"E"))
 S QTY=$G(ERXDAT(52.49,PSOIENS,5.1,"E"))
 S DAYS=$G(ERXDAT(52.49,PSOIENS,5.5,"E"))
 S REFILL=$G(ERXDAT(52.49,PSOIENS,5.6,"E"))
 D TXT2ARY^PSOERXD1(.SIGARY,ESIG,,69)
 D TXT2ARY^PSOERXD1(.COMMARY,COMM,,65)
 W !!!,"eRx Drug: "_EDRG
 W !,"eRx Sig: "
 S I=0 F  S I=$O(SIGARY(I)) Q:'I  D
 .W $S(I>1:"         "_SIGARY(I),1:SIGARY(I)),!
 I '$L(ESIG) W !
 W "eRx Notes: "
 S I=0 F  S I=$O(COMMARY(I)) Q:'I  D
 .W $S(I>1:"              "_COMMARY(I),1:COMMARY(I)),!
 I '$L(COMM) W !
 Q:DFLG=1
 W "Drug Form: "_DFORM,?40,"Strength: "_DSTR
 W !,"Qty Qualifier: "_QQUAL,?40,"Potency Unit Code: "_POTUC
 W !,"DAW Code: "_SUBS
 W !,"Qty: "_QTY,?25,"Days Supply: "_DAYS,?55,"Refills: "_REFILL,!!
 Q
