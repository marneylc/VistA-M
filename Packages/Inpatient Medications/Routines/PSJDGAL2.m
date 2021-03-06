PSJDGAL2 ;BIR/SAB - displays stored DRUG ALLERGY w/sign/symptoms ;10/27/11  02:22
 ;;5.0;INPATIENT MEDICATIONS;**260,281**;16 DEC 97;Build 113
 ;External reference to ^PS(50.605, supported by DBIA 696
 ;External reference to GETOC4^OROCAPI1 supported by DBIA 5729
 ;External reference to ^ORD(100.05 supported by DBIA 5731
 ;External reference to ^GMRD(120.83 supported by DBIA 5767
 ;External reference to ^PS(55 supported by DBIA 2191
 ;External reference to ^PS(50.416 supported by DBIA 4998
 ;External Reference to ^TMP("PSODAOC",$J supported by DBIA 6071
 ;
START ; This routine is called when the hidden option 'DA' is typed from the IP Medication screen
 N PSJNOALL
 ; If allergy is not stored in 100.05 then don't allow DA at that point.
 I $D(^TMP("PSODAOC",$J,"ALLERGY")) W !,"DA is not a valid selection." H 1 Q
 I +$G(PSJAGYSV),$D(^TMP("PSODAOC",$J)) W !,"DA is not a valid selection." H 1 Q
 I '$G(PSJORD) W !!,"NO Drug Allergy Order Checks found." S PSJNOALL=1 G EXT
 N ZORN,X,RET,DA,ZCNT,ZCNTT,XXI,ZZQ,DA,ZI,IT,SEVT,SEVN,ZFND,ZDA,ZDATB,ZST,ZQS,ZDATE,ZERO,PSJPROV,PSJDGORD,PSJDALOC
 N FLAG2,PRTFLG,PSJASORT,PSJQUIT,PSJZERO,PSJREA,PSJTYPE,PSJRSITE,PSJASEV,PSJASEV2,PSJRDATA,ZIIEN,DIE,DIR,DR,DIC
 N PSJQUIT,DIWF,DIWL,DIWR,II,PSJTSTMD,IEN,PSJSSITE,PSJDAOC,PSJDRGCL,PSJCAGNT,PSJDATA,PROSPECT,PSJDOI,PSJDOIN,PSJOIN
 S (FLAG2,ZCNT,ZCNTT,ZFND,PSJQUIT,IEN,PSJDGORD)=0
 D FULL^VALM1
 ;gets drug allergy order chks PSJ*5*260
 D
 .; -- RTC 187974 - remove check for variable - !($G(PSJDSVFY))
 .I $G(PSIVCOPY) S PSJDGORD=$S($G(ON)["P":ON,$G(ON55)["P":ON55,1:"") S:$G(PSJDGORD) ZORN=+$P(^PS(53.1,+PSJDGORD,0),U,21),PSJDALOC=+PSJDGORD_"P" Q
 .I $G(PSJORD)["P" S PSJDGORD=$G(PSJORD) S:$G(PSJDGORD) ZORN=+$P(^PS(53.1,+PSJDGORD,0),U,21),PSJDALOC=+PSJDGORD_"P" Q
 .I $G(PSJORD)["U" S PSJDGORD=$G(PSJORD) S:$G(PSJDGORD) ZORN=+$P(^PS(55,DFN,5,+PSJDGORD,0),U,21),PSJDALOC=DFN_"U"_+PSJDGORD Q
 .I $G(PSJORD)["V" S PSJDGORD=$G(PSJORD) S:$G(PSJDGORD) ZORN=+$P(^PS(55,DFN,"IV",+PSJDGORD,0),U,21),PSJDALOC=DFN_"V"_+PSJDGORD
 .Q:+$G(ZORN)
 .I $G(ON)["P"!($G(ON55)["P") S PSJDGORD=$S($G(ON)["P":ON,$G(ON55)["P":ON55,1:"") S ZORN=+$P(^PS(53.1,+PSJDGORD,0),U,21),PSJDALOC=+PSJDGORD_"P" Q
 .I $G(ON)["U"!($G(ON55)["U") S PSJDGORD=$S($G(ON)["U":ON,$G(ON55)["U":ON55,1:"") S ZORN=+$P(^PS(55,DFN,5,+PSJDGORD,0),U,21),PSJDALOC=DFN_"U"_+PSJDGORD Q
 .I $G(ON)["V"!($G(ON55)["V") S PSJDGORD=$S($G(ON)["V":ON,$G(ON55)["V":ON55,1:"") S ZORN=+$P(^PS(55,DFN,"IV",+PSJDGORD,0),U,21),PSJDALOC=DFN_"V"_+PSJDGORD
 ;
 S:'$D(PSJDAOC) PSJDAOC="IP"
 I '$G(ZORN) W !!,"NO Drug Allergy Order Checks found." G EXT
 D SET3^PSJNEWOC  ;set up variables for order check
 S PSJDAOC=$G(PSJDAOC)_"Allergy"
 I $L(PSJDAOC)>40 S PSJDAOC=$E(PSJDAOC,1,40)
 K ^TMP("PSJDAOCD",$J),^TMP("PSJAL",$J),RET S RET=""
 D GETOC4^OROCAPI1(ZORN,.RET)
 I $O(RET(ZORN,"DATA",""))="" S FLAG2=1
 ;
 F ZI=0:0 S ZI=$O(RET(ZORN,"DATA",ZI)) Q:'ZI  I +$P(RET(ZORN,"DATA",ZI,1),";",2)=3 S ZCNTT=1
 I 'ZCNTT S FLAG2=1 W !!,"NO Drug Allergy Order Checks found." S PSJNOALL=1 G EXT
 ;
SORT ;build sort by severity, reactant/causitive agent
 K PSJASORT
 N ZIIEN,ZSIEN,ZSIGNS,SIGN,SIGNS,PSJPTLOC,PSJINST,PSJDCLAS,PSJIEN70,PSJIEN60,PSJDFLAG,PSJRETI,PSJAIENS,PSJDRCL2
 N PSJFROM1,PSJREAB,PSJREAS,I
 F ZI=0:0 S ZI=$O(RET(ZORN,"DATA",ZI)) Q:'ZI  I $D(RET(ZORN,"DATA",ZI,1)) D
 .Q:+$P(RET(ZORN,"DATA",ZI,1),";",2)'=3
 .I $G(RET(ZORN,"DATA",ZI,"OR",1,0))]"" S ^TMP("PSJDAOCD",$J,"AOR",$G(RET(ZORN,"DATA",ZI,"OR",1,0)))=""
 .K PSJAIENS
 .S ZIIEN=0 F  S ZIIEN=$O(^ORD(100.05,ZI,4,ZIIEN)) Q:ZIIEN=""  I $D(^ORD(100.05,ZI,4,ZIIEN,0)) D
 ..Q:$P(^ORD(100.05,ZI,0),"^",3)["CPRS"
 ..S (PSJZERO,PSJREAB,PSJREA,PSJREAS,PSJTYPE,PSJRSITE,PSJSSITE,PSJASEV,PSJASEV2,PSJDRGCL,PSJIEN70,PSJIEN60,PSJDFLAG,PSJRETI,PSJFROM1)=""
 ..;
 ..D GETS^DIQ(100.05,ZI,"70*","I","PSJIEN70"),GETS^DIQ(100.05,ZI,"60*","I","PSJIEN60")
 ..S PSJDFLAG="",PSJDFLAG=$$GETORD^PSJNEWOA(ZI,PSJDGORD,PSJDFLAG)
 ..Q:'PSJDFLAG
 ..;
 ..S PSJZERO=$G(^ORD(100.05,ZI,4,ZIIEN,0))
 ..S PSJREAB=$P(PSJZERO,"^"),PSJFROM1=$P(PSJZERO,"^",2),PSJASEV=$P(PSJZERO,"^",7),PSJTYPE=$P(PSJZERO,"^",3)
 ..S PSJRSITE=$P(PSJZERO,"^",4),PSJASEV2=$S(PSJASEV=3:"A",PSJASEV="2":"B",PSJASEV=1:"C",1:"D")
 ..I PSJREAB["/" D  S PSJREA=$E(PSJREA,3,$L(PSJREA))
 ...F I=1:1 S PSJREAS=$P(PSJREAB,"/",I) Q:PSJREAS=""  S PSJREA=PSJREA_"/ "_PSJREAS
 ..I PSJREAB'["/" S PSJREA=PSJREAB
 ..;DRUG CLASS
 ..S (PSJCAGNT,PSJDRGCL,PSJDCLAS,PSJDRCL2)=""
 ..F ZZQ=0:0 S ZZQ=$O(^ORD(100.05,ZI,4,ZIIEN,1,ZZQ)) Q:'ZZQ!(ZZQ'?1N.N)  D
 ...S PSJDRCL2=^ORD(100.05,ZI,4,ZIIEN,1,ZZQ,0),PSJDCLAS=1
 ...S PSJDRGCL=PSJDRGCL_"|"_$$GET1^DIQ(50.605,PSJDRCL2,1)
 ..I PSJDRGCL'?1A.AP  S PSJDRGCL=$E(PSJDRGCL,2,999)
 ..S:PSJDRGCL=""!(PSJDRGCL="|") PSJDRGCL="aaaa"
 ..S PSJCAGNT=$S(PSJDRGCL'="aaaa":PSJDRGCL,1:$P(PSJREA,"|",1))
 ..S (PSJDOI,PSJDOIN,PROSPECT,DRUGIEN)=""
 ..;
 ..I $D(^ORD(100.05,ZI,5,1,0)) S DRUGIEN=^ORD(100.05,ZI,5,1,0)
 ..I DRUGIEN'="" D
 ...S DRUG=$$GET1^DIQ(50,DRUGIEN,.01,"E"),PSJOIN=$$GET1^DIQ(50,DRUGIEN,2.1,"E")
 ...S PROSPECT=DRUG  ;GENERIC NAME
 ...I $G(PSJDGORD)["V"!($G(PSJDGORD)["P")&($D(^PS(53.1,+$G(PSJDGORD),"AD"))) S PROSPECT=PSJOIN  ;orderable item if IV
 ..Q:PROSPECT=""
 ..I PSJTYPE="L" S PSJRSITE=$$INST^PSJGMRA($G(PSJDALOC))
 ..;
 ..I $D(PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,0)) D
 ...S:PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,0)'[(ZIIEN_"^"_ZI) PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,0)=PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,0)_"|"_ZIIEN_"^"_ZI_"^"_PSJCAGNT
 ..I '$D(PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,0)) S PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,0)=ZIIEN_"^"_ZI_"^"_PSJCAGNT
 ..S PSJDATA="",PSJDATA=PSJTYPE_"|"_PSJRSITE_"|"_$P(PSJZERO,"^",5)
 ..I $D(PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,1)) D
 ...S:PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,1)'[PSJDATA PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,1)=PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,1)_"^"_PSJDATA
 ..I '$D(PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,1)) S PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,1)=PSJDATA,FLAG2=1
 ..;SIGNS AND SYMPTOMS
 ..S ZSIEN="" F  S ZSIEN=$O(^ORD(100.05,ZI,4,ZIIEN,3,ZSIEN)) Q:ZSIEN=""  I $D(^ORD(100.05,ZI,4,ZIIEN,3,ZSIEN,0)) D
 ...S ZSIGNS=^ORD(100.05,ZI,4,ZIIEN,3,ZSIEN,0)
 ...I '$D(PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,2)) S PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,2)=ZSIGNS Q
 ...S:PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,2)'[("|"_ZSIGNS_"|") PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,2)=PSJASORT(PROSPECT,PSJASEV2,PSJREA,PSJFROM1,2)_"|"_ZSIGNS
 ;
 I 'FLAG2 W !!,"NO Drug Allergy Order Checks found." S PSJNOALL=1 G EXT
 ;
LOOP ;
 ;**** Begin looping through sort
 S (PSJASEV,PSJREA,PSJTYPE,ZIIEN,PROSPECT,PSJDRGCL,PSJCAGNT,PSJFROM1)=""
 F  S PROSPECT=$O(PSJASORT(PROSPECT)) Q:PROSPECT=""  D
 .S IEN=$G(IEN)+1,^TMP("PSJAL",$J,IEN,0)="A Drug-Allergy Reaction exists for this medication and/or class!"
 .S IEN=$G(IEN)+1,^TMP("PSJAL",$J,IEN,0)=" "
 .F  S PSJASEV=$O(PSJASORT(PROSPECT,PSJASEV)) Q:PSJASEV=""  D
 ..F  S PSJCAGNT=$O(PSJASORT(PROSPECT,PSJASEV,PSJCAGNT)) Q:PSJCAGNT=""  d
 ...F  S PSJFROM1=$O(PSJASORT(PROSPECT,PSJASEV,PSJCAGNT,PSJFROM1)) Q:PSJFROM1=""  D ADOC
 ;
PRT ; print allergy information to screen
 D FULL^VALM1 W @IOF
 N ZZ,PRTFLG,PRTFLG3 S (PRTFLG3,PRTFLG)=0
 W $C(7),!
 S ZZ="" F  S ZZ=$O(^TMP("PSJAL",$J,ZZ)) Q:ZZ=""  D  G EXIT:PSJQUIT
 .S PSJDATA="",PSJDATA=$G(^TMP("PSJAL",$J,ZZ,0))
 .I PRTFLG D
 ..I PSJDATA["A Drug-Allergy Reaction exists for this medication and/or class" D EXT S (PRTFLG3,PRTFLG)=0
 .I PSJDATA["Prospective Drug" S PRTFLG3=PRTFLG3+1
 .I PRTFLG,PRTFLG3>1,PSJDATA["Prospective Drug" D EXT W !
 .W !,PSJDATA S PRTFLG=1 I ($Y+3)>IOSL D FF
 ;
 K DIR,DUOUT,DIRUT
 G EXIT:PSJQUIT
 I $G(PRTFLG) W ! D FF
 G EXIT
 Q
 ;
ADOC ;
 N ING,SS,DC,OH,CAG,CAUS,SEVT,SEVN,ZALL,Z,ZX,ZALL,FIRST,DRUGIEN,DRUG,DRUGS,ZCX,PSJWCA,CAUS2,CAUS3,ZLOC,PSJCAR,FLAG,I,ZDATE
 N SITE,SITET,SITED,I,ZDATA,PSJSITE,PSJCSITE,CAUS4,PSJRDAT2,PSJNCOM,PSJNCOM1,PSJCOI,PSJCU,PSJCDF,PSJCPROS
 S (PSJRSITE,PSJRDATA)=""
 S PSJRDATA=PSJASORT(PROSPECT,PSJASEV,PSJCAGNT,PSJFROM1,0)
 ;RTC 190465 - DA not display when allergy contains 2 or more VA Classes
 ;F I=1:1 S PSJRDAT2=$P(PSJRDATA,"|",I) Q:PSJRDAT2=""
 ;S:(I-1)>0 XXI=$P(PSJRDATA,"|",I-1)
 ;S ZI=$P(XXI,"^",2),XXI=+XXI
 S ZI=$P(PSJRDATA,"^",2),XXI=+PSJRDATA
 S PSJRSITE=PSJASORT(PROSPECT,PSJASEV,PSJCAGNT,PSJFROM1,1)
 ;
 Q:XXI'>0
 Q:'+ZI
 Q:$P($G(^ORD(100.05,ZI,4,XXI,0)),"^")']""
 S (SEVT,SEVN,CAUS,CAUS3,CAUS2,CAUS4,PSJWCA,PSJCAR,OH,DRUG,DRUGS,X,ING,SS,DC,ZALL,ZLOC,ZDATE)=""
 S ZALL=$G(^ORD(100.05,ZI,4,XXI,0)),ZLOC=$P(ZALL,"^",3)
 S CAUS=$P(ZALL,"^",1),CAUS2=$P($P(ZALL,"^",2),";"),CAUS3=$$GET1^DIQ(50.6,CAUS2,.01,"E")
 S SEVT=$P(ZALL,"^",7),SEVN=$S(SEVT=1:"MILD",SEVT=2:"MODERATE",SEVT=3:"SEVERE",1:"Not Entered")
 S ^TMP("PSJDAOCD",$J,"CA",CAUS)=""
 S CAUS=PSJCAGNT,PSJCSITE=""
 ;**** PARSE OUT SITES
 I CAUS'?1A.AP S CAUS=$P(ZALL,"^",1)
 I PSJRSITE'["^" D
 .S ZDATE=$P(PSJRSITE,"|",3),ZDATE=$S(ZDATE'="":$E(ZDATE,4,5)_"/"_$E(ZDATE,6,7)_"/"_$E(ZDATE,2,3),1:"")
 .S PSJCSITE=$P(PSJRSITE,"|",2),PSJCSITE=$$GET1^DIQ(4,PSJCSITE,.01)
 .S PSJCSITE=$S(PSJCSITE'="":PSJCSITE,ZLOC="L":"LOCAL",ZLOC="R":"REMOTE",1:"Not Given")
 .S PSJCAR=CAUS_" ("_PSJCSITE_" - "_ZDATE_")"
 I PSJRSITE["^" D  S:PSJCAR'="" PSJCAR=CAUS_" ("_$E(PSJCAR,3,999)_")"
 .F I=1:1 S ZDATA=$P(PSJRSITE,"^",I) Q:ZDATA=""  S PSJCSITE="" D
 ..S ZDATE=$P(ZDATA,"|",3),ZDATE=$S(ZDATE'="":$E(ZDATE,4,5)_"/"_$E(ZDATE,6,7)_"/"_$E(ZDATE,2,3),1:"")
 ..S PSJCSITE=$P(ZDATA,"|",2),PSJCSITE=$$GET1^DIQ(4,PSJCSITE,.01)
 ..S PSJCSITE=$S(PSJCSITE'="":PSJCSITE,ZLOC="L":"LOCAL",ZLOC="R":"REMOTE",1:"Not Given")
 ..S PSJCAR=PSJCAR_", "_PSJCSITE_" - "_ZDATE
 ;****
 I PSJCAR="" S PSJCAR=CAUS
 S (PSJNCOM1,PSJCPROS)="" S PSJNCOM1=$$FINDC($G(PSJORD)) S:+$G(PSJNCOM1) PSJCPROS=$P(PSJNCOM1,"^",2),PSJNCOM1=$P(PSJNCOM1,"^")
 S IEN=$G(IEN)+1,^TMP("PSJAL",$J,IEN,0)="   Prospective Drug: "_$S($G(PSJNCOM1):PSJCPROS,1:PROSPECT)
 S OH=$$UPPER($P(ZALL,"^",6)),^TMP("PSJDAOCD",$J,"OH")=OH
 K ^UTILITY($J,"W") S DIWL=1,DIWR=58,DIWF=""
 S X=PSJCAR
 D ^DIWP S FIRST=1
 F ZCX=0:0 S ZCX=$O(^UTILITY($J,"W",1,ZCX)) Q:'ZCX  S:$D(^UTILITY($J,"W",1,ZCX,0)) IEN=$G(IEN)+1,^TMP("PSJAL",$J,IEN,0)=$S(FIRST:"    Causative Agent: "_^UTILITY($J,"W",1,ZCX,0),1:"                     "_^UTILITY($J,"W",1,ZCX,0)) S FIRST=0
 S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)="Historical/Observed: "_$S(OH="H":"HISTORICAL",OH="O":"OBSERVED",1:"Not Entered")
 S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)="           Severity: "_$G(SEVN)
 K ^UTILITY($J,"W") S DIWL=1,DIWR=58,DIWF=""
INGRED ;
 ; DRUG INGREDIENT
 S FLAG=0 K ^TMP("PSJDAOCD",$J,"DI") N PSJDRCL3
 F ZZQ=0:0 S ZZQ=$O(^ORD(100.05,ZI,4,XXI,2,ZZQ)) Q:'ZZQ  S ^TMP("PSJDAOCD",$J,"DI",$P(^PS(50.416,$P(^ORD(100.05,ZI,4,XXI,2,ZZQ,0),"^"),0),"^"))="",FLAG=1
 S X=""
 F  S ING=$O(^TMP("PSJDAOCD",$J,"DI",ING)) Q:ING=""  S X=X_", "_ING
 S X=$E(X,3,999)
 ;S X=$P(ZALL,"^",1)
 I X'="" D
 .D ^DIWP
 .S FIRST=1
 .F ZX=0:0 S ZX=$O(^UTILITY($J,"W",1,ZX)) Q:'ZX  S:$D(^UTILITY($J,"W",1,ZX,0)) IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)=$S(FIRST:"        Ingredients: "_^UTILITY($J,"W",1,ZX,0),1:"                      "_^UTILITY($J,"W",1,ZX,0)) S FIRST=0
SIGNS ;
 ; SIGNS/SYMPTOMS
 K ^UTILITY($J,"W"),^TMP("PSJDAOCD",$J,"SS") S DIWL=1,DIWR=58,DIWF="",ING=""
 S (X,SIGNS,SIGN)="",SIGNS=$G(PSJASORT(PROSPECT,PSJASEV,PSJCAGNT,PSJFROM1,2))
 I SIGNS'="" F ZZQ=1:1 S SIGN=$P(SIGNS,"|",ZZQ) Q:SIGN=""  D
 .I $G(^GMRD(120.83,SIGN,0))]"" S ^TMP("PSJDAOCD",$J,"SS",$P(^GMRD(120.83,SIGN,0),"^"))=""
 S X="",FIRST=1
 I $O(^TMP("PSJDAOCD",$J,"SS",""))]"" S SS="" D
 .F  S SS=$O(^TMP("PSJDAOCD",$J,"SS",SS)) Q:SS=""  S X=X_", "_SS
 S X=$E(X,3,999) D ^DIWP
 F ZX=0:0 S ZX=$O(^UTILITY($J,"W",1,ZX)) Q:'ZX  S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)=$S(FIRST:"     Signs/Symptoms: "_$S(SIGNS="":"None Entered",1:^UTILITY($J,"W",1,ZX,0)),1:"                     "_^UTILITY($J,"W",1,ZX,0)) S FIRST=0
 K ^UTILITY($J,"W")
 ; DRUG CLASS
 S DIWL=1,DIWR=58,DIWF="" K ^TMP("PSJDAOCD",$J,"DC")
 F ZZQ=0:0 S ZZQ=$O(^ORD(100.05,ZI,4,XXI,1,ZZQ)) Q:'ZZQ  D
 .S PSJDRCL3="",PSJDRCL3=$P(^PS(50.605,+$P(^ORD(100.05,ZI,4,XXI,1,ZZQ,0),"^"),0),"^") S ^TMP("PSJDAOCD",$J,"DC",+$P(^ORD(100.05,ZI,4,XXI,1,ZZQ,0),"^"))=PSJDRCL3_" "_$P($G(^PS(50.605,+$P($G(^ORD(100.05,ZI,4,XXI,1,ZZQ,0)),"^"),0)),"^",2)
 S X="",FIRST=1
 F DC=0:0 S DC=$O(^TMP("PSJDAOCD",$J,"DC",DC)) Q:'DC  S X=X_", "_^TMP("PSJDAOCD",$J,"DC",DC)  D
 .I $L(X)>234 S X=$E(X,3,999) D ^DIWP S X=""
 I X'="" S X=$E(X,3,999)
 I X'="" D
 .D ^DIWP
 .F ZX=0:0 S ZX=$O(^UTILITY($J,"W",1,ZX)) Q:'ZX  S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)=$S(FIRST:"         Drug Class: "_^UTILITY($J,"W",1,ZX,0),1:"                     "_^UTILITY($J,"W",1,ZX,0)) S FIRST=0
 .K ^UTILITY($J,"W") N Z,ZX
 D INV ; intervention
 Q
 ;
UPPER(PSJUCS) ;
 Q $TR(PSJUCS,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 ;
LOWER(PSJLCS) ;
 Q $TR(PSJLCS,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz")
 ;
EXT ;
 K DIR,DUOUT,DIRUT,ZFND
 I $G(PSJNOALL) D FULL^VALM1,PAUSE^VALM1 S VALMBCK="R" K PSJQUIT,DIR,DUOUT,DIRUT Q 
 D FF
 I $D(DIRUT) G EXIT
 Q
EXIT ;
 I $G(PSJNOALL) D FULL^VALM1,PAUSE^VALM1 K PSJQUIT
 S VALMBCK="R" K DIR,DUOUT,DIRUT,^TMP("PSJDAOCD",$J),^TMP("PSJAL",$J),ZPGK
 Q
 ;
INV ;display intervention
 ;changed to add Provider & Pharmacist and put in current sequence [ST - 6.17.2014]
 S IEN=$G(IEN)+1,^TMP("PSJAL",$J,IEN,0)=" "
 K ^UTILITY($J,"W") S DIWL=1,DIWR=55,DIWF=""
 S PSJPROV="",PSJPROV="N/A - Order Check Not Evaluated by Provider"
 I $O(^TMP("PSJDAOCD",$J,"AOR",""))]"" S PSJPROV=$O(^TMP("PSJDAOCD",$J,"AOR",""))
 S X=PSJPROV,FIRST=1 D ^DIWP
 F ZX=0:0 S ZX=$O(^UTILITY($J,"W",1,ZX)) Q:'ZX  S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)=$S(FIRST:"Provider Override Reason: "_^UTILITY($J,"W",1,ZX,0),1:"                          "_^UTILITY($J,"W",1,ZX,0)) S FIRST=0
 S IEN=$G(IEN)+1,^TMP("PSJAL",$J,IEN,0)=" "
 ;
 I $P($G(^ORD(100.05,ZI,8)),"^")="" D  Q
 .S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)="Pharmacist Intervention Not Entered"
 K DIC,DR,DIQ,DA,INTY S DIC=9009032.4,DA=$P($G(^ORD(100.05,ZI,8)),"^"),DR=".01;.03;.04;.08",DIQ="INTY" D EN^DIQ1
 S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)="Intervention Date: "_INTY(9009032.4,DA,.01)
 S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)="         Provider: "_$S($G(INTY(9009032.4,DA,.03))]"":INTY(9009032.4,DA,.03),1:"Not Entered")
 S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)="       Pharmacist: "_$S($G(INTY(9009032.4,DA,.04))]"":INTY(9009032.4,DA,.04),1:"Not Entered")
 S IEN=IEN+1,^TMP("PSJAL",$J,IEN,0)="   Recommendation: "_INTY(9009032.4,DA,.08)
 K DIC,DR,DIQ,DA,INTY
 Q
 ;
FF ;
 W !
 S DIR(0)="E",DIR("A")="Press Return to Continue",DIR("?")="Press Return to Redisplay Rx."
 D ^DIR S:$D(DUOUT)!($D(DTOUT)) PSJQUIT=1
 K DIR,DUOUT,DIRUT,DTOUT,L
 W @IOF
 Q
 ;
FINDC(PSJORD) ;determine if order is part of a complex UD order
 ;for complex UD orders display format:  orderable item doseform (units) ex: MORPHINE TAB,SA (100MG)
 Q:PSJORD=""
 N PSJCOMD,PSJCOI,PSJCU,PSJCDF,PSJCPROS
 S (PSJCOMD,PSJCOI,PSJCU,PSJCDF,PSJCPROS,PSJNCOM)=""
 I $G(PSJORD)["P"!($G(PSJORD)["N") D FINDCP
 E  D FINDCA
 Q PSJNCOM_"^"_PSJCPROS
 ;
FINDCP ;COMPLEX PENDING ORDER
 S PSJNCOM=+$P($G(^PS(53.1,+PSJORD,.2)),"^",8)
 I $G(PSJNCOM) D
 .D GETS^DIQ(53.1,+PSJORD,"108;109","EI","PSJCOMD")
 .S PSJCU=PSJCOMD(53.1,+PSJORD_",",109,"E"),PSJCOI=PSJCOMD(53.1,+PSJORD_",",108,"E")
 .I PSJCOI'="" S PSJCDF=$$GET1^DIQ(50.7,$G(PSJCOMD(53.1,+PSJORD_",",108,"I")),.02,"E")
 .S PSJCPROS=$S(PSJCOI'="":PSJCOI_" "_PSJCDF_" ("_PSJCU_")",1:PROSPECT)
 Q
 ;
FINDCA ;COMPLEX ACTIVE ORDER
 N PSJCPRSO S PSJCPRSO="",PSJCPRSO=$$GET1^DIQ(55.06,+PSJORD_","_DFN_",",125,"I")
 Q:PSJCPRSO=""
 I $D(^PS(55,"ACX",PSJCPRSO)) S PSJNCOM=1 D
 .D GETS^DIQ(55.06,+PSJORD_","_DFN_",","108;109","IE","PSJCOMD")
 .S PSJCOI=$G(PSJCOMD(55.06,+PSJORD_","_DFN_",",108,"E")),PSJCU=$G(PSJCOMD(55.06,+PSJORD_","_DFN_",",109,"E"))
 .I PSJCOI'="" S PSJCDF=$$GET1^DIQ(50.7,$G(PSJCOMD(55.06,+PSJORD_",742,",108,"I")),.02,"E")
 .S PSJCPROS=$S(PSJCOI'="":PSJCOI_" "_PSJCDF_" ("_PSJCU_")",1:PROSPECT)
 Q
