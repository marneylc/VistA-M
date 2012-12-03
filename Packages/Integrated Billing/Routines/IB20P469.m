IB20P469 ;ALB/CXW - UPDATE MCCR UTILITY/REVENUE CODE; 01/10/2012
 ;;2.0;INTEGRATED BILLING;**469**;21-MAR-94;Build 10
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 Q
POST ; 
 ; Update value/occurrence/condition codes in mccr utility file 399.1
 ; Update revenue codes in revenue file 399.2   
 N U S U="^"
 D MES^XPDUTL("Patch Post-Install starts")
 D MCR,RVC
 D MES^XPDUTL("Patch Post-Install is complete.")
 Q
 ;
MCR ; 3 types of codes
 N IBACT,IBCNT,IBCOD,IBPE,IBFD,IBI,IBX,DLAYGO,DIC,DIE,DA,DD,DO,DR,X,Y
 ; IBACT=1 - addition, 2 - update
 ; Value code flag in field .18/piece 11
 S IBCNT=0,IBCOD="Value",IBPE=11,IBFD=.18
 S IBACT=1 D DIS
 F IBI=1:1 S IBX=$P($T(VALN+IBI),";;",2) Q:IBX=""  D MFILE
 S IBACT=2 D DIS
 F IBI=1:1 S IBX=$P($T(VALO+IBI),";;",2) Q:IBX=""  D MFILE
 D DIS1
 ;
 ; Occurrence code flag in field .11/piece 4
 S IBCNT=0,IBCOD="Occurrence",IBPE=4,IBFD=.11
 S IBACT=1 D DIS
 F IBI=1:1 S IBX=$P($T(OCCN+IBI),";;",2) Q:IBX=""  D MFILE
 S IBACT=2 D DIS
 F IBI=1:1 S IBX=$P($T(OCCO+IBI),";;",2) Q:IBX=""  D MFILE
 D DIS1
 ;
 ; Condition code flag in field .22/piece 15
 S IBCNT=0,IBCOD="Condition",IBPE=15,IBFD=.22
 S IBACT=1 D DIS
 F IBI=1:1 S IBX=$P($T(CONN+IBI),";;",2) Q:IBX=""  D MFILE
 S IBACT=2 D DIS
 F IBI=1:1 S IBX=$P($T(CONO+IBI),";;",2) Q:IBX=""  D MFILE
 D DIS1
 Q
 ;
DIS ;
 D MES^XPDUTL($S(IBACT=1:"Add",IBACT=2:"Updat",IBACT=3:"Reserv",1:"Activat")_"ing "_IBCOD_" Code..")
 Q
DIS1 ;
 D MES^XPDUTL("Total "_IBCNT_" "_IBCOD_" Code"_$S(IBCNT'=1:"s",1:"")_" updated")
 D MES^XPDUTL("")
 Q
 ;
MFILE ; Mccr file
 N IBFN
 S IBFN=+$$EXCODE($P(IBX,U),IBPE)
 I IBACT=1,'IBFN D
 . K DD,DO S DLAYGO=399.1,DIC="^DGCR(399.1,",DIC(0)="L",X=$P(IBX,U,2) D FILE^DICN K DIC,DLAYGO I Y<1 K X,Y Q
 . S DA=+Y,DIE="^DGCR(399.1,",DR=".02///"_$P(IBX,U,1)_";"_IBFD_"///"_1 D ^DIE K DIE,DA,DR,X,Y
 . S IBCNT=IBCNT+1 D MES^XPDUTL("  Code# "_$P(IBX,U)_" "_$P(IBX,U,2))
 I IBACT=2,IBFN D
 . S DIE="^DGCR(399.1,",DA=IBFN,DR=".01///"_$P(IBX,U,2) D ^DIE K DIE,DA,DR,X,Y
 . S IBCNT=IBCNT+1 D MES^XPDUTL("  Code# "_$P(IBX,U)_" "_$P(IBX,U,2))
 Q
 ;
EXCODE(X,P) ; Returns IEN if code found in the P piece
 N IBX,IBY S IBY=""
 I $G(X)'="" S IBX=0 F  S IBX=$O(^DGCR(399.1,"C",X,IBX)) Q:'IBX  I $P($G(^DGCR(399.1,IBX,0)),U,+$G(P)) S IBY=IBX
 Q IBY
 ;
RVC ; Revenue code in field 1/piece 2, field 3/piece 4
 N IBACT,IBCOD,IBCNT,IBI,IBJ,IBX,IBX3,IBRES,IBY,IBZ,DIE,DA,DR,X,Y
 ; IBACT=1 - addition, 2 - update, 3 - reservation, 4 - activation
 S IBCNT=0,IBX3="",IBCOD="Revenue",IBRES="*RESERVED"
 S IBACT=1 D DIS
 F IBI=1:1 S IBX=$P($T(RVCN+IBI),";;",2) Q:IBX=""  D
 . S IBY=$P(IBX,U),IBZ=$G(^DGCR(399.2,+IBY,0))
 . ; quit if no reserved
 . Q:(+IBY'=+IBZ)!($P(IBZ,U,2)'=IBRES)
 . S IBZ=+IBZ
 . D RFILE
 ;
 S IBACT=2 D DIS
 F IBI=1:1 S IBX=$P($T(RVCO+IBI),";;",2) Q:IBX=""  D
 . S IBY=$P(IBX,U),IBZ=$O(^DGCR(399.2,"B",IBY,0)) Q:'IBZ
 . D RFILE
 ;
 S IBACT=3 D DIS
 F IBI=1:1 S IBX=$P($T(RVCR+IBI),";;",2) Q:IBX=""  D
 . F IBJ=1:1 S IBY=$P(IBX,";",IBJ) Q:IBY=""  D
 .. S IBZ=$O(^DGCR(399.2,"B",IBY,0)) Q:'IBZ
 .. ; quit if reserved
 .. Q:$P($G(^DGCR(399.2,+IBZ,0)),U,2)=IBRES
 .. D RFILE
 ;
 S IBACT=4 D DIS
 F IBI=1:1 S IBX=$P($T(RVCA+IBI),";;",2) Q:IBX=""  D
 . F IBJ=1:1 S IBY=$P(IBX,";",IBJ) Q:IBY=""  D
 .. S IBZ=$O(^DGCR(399.2,"B",IBY,0)) Q:'IBZ
 .. S IBX3=$G(^DGCR(399.2,+IBZ,0))
 .. ; quit if reserved and activated
 .. Q:$P(IBX3,U,2)=IBRES
 .. Q:+$P(IBX3,U,3)
 .. S IBX3=$P(IBX3,U,4)
 .. D RFILE
 D DIS1
 Q
 ;
RFILE ; Revenue file
 S:(IBACT=1)!(IBACT=2) DR="1///"_$P(IBX,U,2)_";3///"_$P(IBX,U,3)_";2///1"
 ; bypass the input transform for reserved in a '*' char format
 S:IBACT=3 DR="1////"_IBRES_";2///0"_";3////"_IBRES
 S:IBACT=4 DR="2///1"
 S DIE="^DGCR(399.2,",DA=+IBZ D ^DIE K DIE,DA,DR,X,Y
 S IBCNT=IBCNT+1
 D MES^XPDUTL("  Code# "_IBZ_" "_$S(IBACT=3:IBRES,IBACT=4:IBX3,1:$P(IBX,U,3)))
 Q
 ;
 ;
RVCN ; New revenue code (1)^abbreviation^description
 ;;970^PROFESSIONAL SERVICES - EXTENSION OF 096X^PROFESSIONAL SERVICES - EXTENSION OF 096X
 ;;
RVCO ; Old revenue code (2)^abbreviation^description
 ;;521^RURAL/FQHC CLINIC^RURAL/FQHC - HEALTH CLINIC
 ;;522^HOME VISIT BY RHC/FQHC PRACTITIONER^HOME VISIT BY RHC/FQHC PRACTITIONER
 ;;
RVCR ; Old revenue code delimited by semi-colon for reservation (7)
 ;;184;709;719;749;759;799;910
 ;;
RVCA ; Old revenue code delimited by semi-colon for activation (61)
 ;;173;174;191;192;193;194;199;241;242;243;344;392;451;452;456;479;489
 ;;499;524;525;526;527;528;547;548;583;609;615;616;623;658;663;669;670
 ;;671;672;679;681;682;683;684;689;770;780;860;861;882;905;906;907;930
 ;;931;947;948;951;952;971;973;976;978;979
 ;;
VALN ; New value code (11)^description
 ;;32^MULTIPLE PATIENT AMBULANCE TRANSPORT
 ;;54^NEWBORN BIRTH WEIGHT IN GRAMS
 ;;55^ELIGIBILITY THRESHOLD FOR CHARITY CARE
 ;;66^MEDICAID SPEND DOWN AMOUNT
 ;;69^STATE CHARITY CARE PERCENT
 ;;83^LIFETIIME RESERVE DAYS
 ;;A7^CO-PAYMENT PAYER A
 ;;B7^CO-PAYMENT PAYER B
 ;;C7^CO-PAYMENT PAYER C
 ;;D4^CLINICAL TRIAL NUMBER ASSIGNED BY THE NLM/NIH
 ;;G8^FACILITY WHERE INPATIENT HOSPICE SERVICE IS DELIVERED
 ;;
VALO ; Old value code (4)^description
 ;;01^MOST COMMON SEMI-PRIVATE ROOM RATE
 ;;43^DISABLED BENEFICIARY UNDER AGE OF 65 WITH LGHP
 ;;44^AMT AGRED FRM PRIME<CHGS&>PYMT > THN PYMT REC, MSP CLMS
 ;;52^SPEECH-LANGUAGE THERAPY VISITS
 ;;
OCCN ; New occurrence code (1)^description
 ;;DR^DISASTER RELATED OCCURRENCE CODE
 ;;
OCCO ; Old occurrence code (21)^description
 ;;01^ACCIDENT/MEDICAL COVERAGE
 ;;02^NO FAULT INSURANCE INVOLVED INCLUDING AUTO ACCIDENT/OTHER
 ;;05^ACCIDENT/NO MEDICAL OR LIABILITY COVERAGE
 ;;26^DATE SNF BED BECAME AVAILABLE
 ;;27^DATE OF HOSPICE CERTIFICATION OR RECERTIFICATION
 ;;30^DATE OF OP SPEECH-LANGUAGE PATH PLAN EST/LAST REVWD
 ;;33^FIRST DAY THE COORD PD FOR ESRD BENEFICIARIES CVRD BY EGHP
 ;;34^DATE OF ELECTION OF EXTENDED CARE SERVICES
 ;;36^DATE OF IP HOSP DISCHG FOR COVERED TRANSPLANT PATIENT
 ;;37^DATE OF IP HOSP DISCHG FOR NON-COVERED TRANSPLANT PATIENT
 ;;45^DATE TREATMENT STARTED FOR SPEECH-LANGUAGE THERAPY
 ;;A4^SPLIT BILL DATE
 ;;E1^RZD FOR NATIONAL ASSIGNMENT
 ;;E2^RZD FOR NATIONAL ASSIGNMENT
 ;;E3^RZD FOR NATIONAL ASSIGNMENT
 ;;F1^RZD FOR NATIONAL ASSIGNMENT
 ;;F2^RZD FOR NATIONAL ASSIGNMENT
 ;;F3^RZD FOR NATIONAL ASSIGNMENT
 ;;G1^RZD FOR NATIONAL ASSIGNMENT
 ;;G2^RZD FOR NATIONAL ASSIGNMENT
 ;;G3^RZD FOR NATIONAL ASSIGNMENT
 ;;
CONN ; New condition code (9)^description
 ;;51^ATTESTATION OF UNRELATED OUTPATIENT NONDIAGNOSTIC SERVICES
 ;;BO^MEDICARE COORDINATED CARE DEMONSTRATION CLAIM
 ;;B1^BENEFICIARY INELIGIBLE FOR DEMONSTRATION PROGRAM
 ;;B2^CRITICAL ACCESS HOSPITAL AMBULANCE ATTESTATION
 ;;B3^PREGNANCY INDICATOR
 ;;BP^GULF OIL SPILL OF 2010
 ;;EO^CHANGE IN PATIENT STATUS
 ;;P1^DO NOT RESUCITATE (DNR) FOR PUBLIC HEALTH REPORTING ONLY
 ;;WO^UNITED MINE WORKERS OF AMERICA (UMWA) DEMO INDICATOR
 ;;
CONO ; Old condition code (9)^description
 ;;04^INFORMATION ONLY BILL
 ;;06^ESRD PATIENT IN FIRST 30 MONTHS OF ENTITLE CVRD BY EGHP
 ;;58^TERMINATED MEDICARE ADVANTAGE ENROLLEE
 ;;69^IME/DGME/N&AH PAYMENT ONLY
 ;;78^NEW COVERAGE NOT IMPLEMENTED BY MANAGED CARE PLAN
 ;;79^CORF SERVICES PROVIDED OFFSITE
 ;;H3^REOCCURRENCE OF GI BLEED (MA) CATEGORY
 ;;H4^REOCCURRENCE OF PNEUMONIA (MB) CATEGORY
 ;;H5^REOCCURRENCE OF PERICARDITIS (MC) CATEGORY
 ;;