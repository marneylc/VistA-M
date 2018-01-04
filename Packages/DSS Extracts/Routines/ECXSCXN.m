ECXSCXN ;ALB/JAP  Clinic Extract ;7/19/17  12:17
 ;;3.0;DSS EXTRACTS;**24,27,29,30,31,32,33,39,46,49,52,71,84,92,107,105,120,124,127,132,136,144,149,156,154,161,166**;Dec 22, 1997;Build 24
 ;
BEG ;entry point from option
 D SETUP Q:ECFILE=""  D ^ECXTRAC,^ECXKILL
 Q
 ;
START ;entry point from taskmgr
 N DIC,EXNUM,I,LOCARR,OUT,P1,P2,P3,P4,PROCESS,SOURCE,STOP,STAT,TOSEND ;166
 N TIU,X,Y,ECXNPRFI
 N ECXICD10P,ECXICD101,ECXICD102,ECXICD103,ECXICD104
 F I=1:1:8 S @("ECXCPT"_I)=""
 F I=1:1:4 S @("ECXICD9"_I)=""
 F I=1:1:4 S @("ECXICD10"_I)=""
 S (OUT,QFLG,ECRN)=0,(ECXICD9P,ECXOBI,ECXICD10P)=""
 K ^TMP($J,"ECXS"),^TMP($J,"ECXCL"),^TMP($J,"SDAMA301") ;136
 ;get ien for tiu in file #839.7
 S DIC="^PX(839.7,",DIC(0)="X",X="TEXT INTEGRATION UTILITIES"
 D ^DIC S TIU=+Y,ECED=ECED+.3,ECXCLIN=0 K DIC,Y
 ;get clinic default appt length, type, division
 F  S ECXCLIN=$O(^SC(ECXCLIN)) Q:'ECXCLIN  D
 .K LOCARR S DIC=44,DA=ECXCLIN,DR="2;3.5;1912",DIQ(0)="I",DIQ="LOCARR"
 .D EN^DIQ1
 .Q:$G(LOCARR(44,ECXCLIN,2,"I"))'="C"
 .S ALEN=+$G(LOCARR(44,ECXCLIN,1912,"I"))
 .S ^TMP($J,"ECXCL",ECXCLIN)=ALEN,ALEN=$$RJ^XLFSTR(ALEN,3,0)
 .S ^TMP($J,"ECXCL",ECXCLIN)=^TMP($J,"ECXCL",ECXCLIN)_"^"_ALEN_"^"_$G(LOCARR(44,ECXCLIN,2,"I"))_"^"_+$G(LOCARR(44,ECXCLIN,3.5,"I"))
 .D FEEDER^ECXSCX1(ECXCLIN,ECSD1,.P1,.P2,.P3,.TOSEND,.ECXDIV,.P4) ;166
 .K P1,P2,P3,P4,TOSEND,ECXDIV ;166
 ;get from file #44 any no-shows & get encounters from #409.68
 D NOSHOW^ECXSCXN1(ECSD1,ECED),ENCNTR(ECSD1,ECED)
 ;send missing clinic msg
 D:$D(^TMP($J,"ECXS")) EN^ECXSCX1
 K ^TMP($J,"ECXS"),^TMP($J,"ECXCL"),^TMP($J,"SDAMA301") ;136
 Q
 ;
ENCNTR(ECSD1,ECED) ;search file #409.68 for encounter data
 N CHKOUT,ECD,STAT,STOP,MDIV,ECXEDIS,CNT,ECXARR,NODE ;136
 N ECXESC,ECXECL,ECXCLST,ECXPP ;149
 S ECD=ECSD1
 F  S ECD=$O(^SCE("B",ECD)) Q:('ECD!(ECD>ECED))!(QFLG)  S ECXIEN=0 D
 .F  S ECXIEN=$O(^SCE("B",ECD,ECXIEN)) Q:'ECXIEN  D  Q:QFLG
 ..Q:'$D(^SCE(ECXIEN,0))
 ..D INTPAT^ECXSCX2 K LOCARR S DIC=409.68,DA=ECXIEN
 ..S DR=".01;.02;.03;.04;.05;.06;.07;.08;.11;.12;.13",DIQ(0)="I",DIQ="LOCARR"
 ..D EN^DIQ1
 ..S ECXTI=$$ECXTIME^ECXUTL(+$G(LOCARR(409.68,ECXIEN,.01,"I"))) ;166
 ..S MDIV=+$G(LOCARR(409.68,ECXIEN,.11,"I")) ;166
 ..S STOP=+$G(LOCARR(409.68,ECXIEN,.03,"I"))
 ..S CHKOUT=+$G(LOCARR(409.68,ECXIEN,.07,"I"))
 ..S PROCESS=+$G(LOCARR(409.68,ECXIEN,.08,"I"))
 ..S STAT=$G(LOCARR(409.68,ECXIEN,.12,"I"))
 ..S ECXDFN=+$G(LOCARR(409.68,ECXIEN,.02,"I"))
 ..Q:(ECXDFN=0)!('CHKOUT)
 ..S:STAT="" STAT="ZZ" S STAT=";"_STAT_";"
 ..Q:";3;4;5;6;7;9;10;13;"[STAT
 ..Q:('STOP)!(PROCESS=4)!(+$G(LOCARR(409.68,ECXIEN,.06,"I")))
 ..S ECXDATE=+$G(LOCARR(409.68,ECXIEN,.01,"I"))
 ..S ECXCLIN=+$G(LOCARR(409.68,ECXIEN,.04,"I"))
 ..Q:$P($G(^TMP($J,"ECXCL",ECXCLIN)),U,3)'="C"
 ..S ECXVISIT=+$G(LOCARR(409.68,ECXIEN,.05,"I"))
 ..S ECXENEL=+$G(LOCARR(409.68,ECXIEN,.13,"I"))
 ..Q:'ECXVISIT
 ..S ECXERR=0
 ..D PAT1^ECXSCX2(ECXDFN,ECXDATE,.ECXERR) Q:ECXERR
 ..D FEEDER^ECXSCX1(ECXCLIN,ECSD1,.P1,.P2,.P3,.TOSEND,.ECXDIV,.P4) ;166
 ..Q:TOSEND=6
 ..K LOCARR S DIC=40.7,DA=STOP,DR="1",DIQ(0)="I",DIQ="LOCARR" D EN^DIQ1
 ..S ECXSTOP=$$RJ^XLFSTR($G(LOCARR(40.7,STOP,1,"I")),3,0)
 ..; ******* - PATCH 127, ADD PATCAT CODE ********
 ..S ECXPATCAT=$$PATCAT^ECXUTL(ECXDFN)
 ..;get date specific patient data
 ..D PAT2^ECXSCX2(ECXDFN,ECXDATE)
 ..;get national patient record flag if exist
 ..D NPRF^ECXUTL5
 ..;get visit specific data
 ..S ECXERR=0 D VISIT^ECXSCX1(ECXDFN,ECXVISIT,.ECXVIST,.ECXERR) Q:ECXERR
 ..F I=1:1:8 S @("ECXCPT"_I)=$G(ECXVIST("CPT"_I))
 ..S ECXPP=$G(ECXVIST("PRIMPROC")) ;149 Get primary procedure if available
 ..F I="P",1:1:4 S @("ECXICD10"_I)=ECXVIST("ICD9"_I) ;161
 ..S SOURCE=ECXVIST("SOURCE"),ECXAO=ECXVIST("AO"),ECXIR=ECXVIST("IR")
 ..S ECXMIL=ECXVIST("MST"),ECXPROV=ECXVIST("PROV"),ECXSHAD=ECXVIST("SHAD")
 ..S ECXECL=ECXVIST("ENCCL"),ECXESC=ECXVIST("ENCSC") ;144
 ..S ECPRNPI=$$NPI^XUSNPI("Individual_ID",ECXPROV,ECXDATE)
 ..S:+ECPRNPI'>0 ECPRNPI="" S ECPRNPI=$P(ECPRNPI,U)
 ..S ECXPROVP=ECXVIST("PROV CLASS"),ECXPROVN=ECXVIST("PROV NPI")
 ..F I=1:1:7 S @("ECSP"_I)=$P($G(ECXVIST("PROVS"_I)),U) ;144 2 new prov
 ..F I=1:1:7 S @("ECSPPC"_I)=$P($G(ECXVIST("PROVS"_I)),U,2) ;144 2 new person class
 ..F I=1:1:7 S @("ECSPNPI"_I)=$P($G(ECXVIST("PROVS"_I)),U,3) ;144 2 new NPI
 ..S ECXECE=ECXVIST("PGE"),ECXHNC=ECXVIST("HNC")
 ..K LOCARR S DIC=8,DA=ECXENEL,DR="8",DIQ(0)="I",DIQ="LOCARR" D EN^DIQ1
 ..S ECXENEL=+$G(LOCARR(8,ECXENEL,8,"I"))
 ..S:ECXENEL ECXENEL=$$ELIG^ECXUTL3(ECXENEL,ECXSVC)
 ..S ECXCBOC=$S(MDIV'="":$$CBOC^ECXSCX2(.MDIV),1:"")  ;is cboc facility?
 ..S ECXEDIS=$$EDIS^ECXUTL1(ECXDFN,ECD,"C",ECXVISIT,ECXSTOP) ;136 Set emergency room disposition
 ..;setup feeder key and file in extract records
 ..S (ECXKEY,ECXDSSD)=""
 ..;appointments
 ..I PROCESS=1 D  Q     ;get appt length 136 Section changed to use SDAMA301 call
 ...N CNT,ECXARR
 ...K ^TMP($J,"SDAMA301")
 ...S ECXARR(1)=ECXDATE_";"_ECXDATE,ECXARR(2)=ECXCLIN,ECXARR(4)=ECXDFN,ECXARR("FLDS")="5;7;10;18" S CNT=$$SDAPI^SDAMA301(.ECXARR)
 ...Q:CNT=0  I CNT=-1 D ERR^ECXUTL1 S QFLG=1 Q  ;Stop if no appts (CNT=0) send error message and stop extract if CNT=-1 (system error)
 ...S NODE=^TMP($J,"SDAMA301",ECXDFN,ECXCLIN,ECXDATE)
 ...S ECXOBI=$S($P(NODE,U,7)="Y":"O",1:"") ;convert overbook indicator from Y to O otherwise send null
 ...S ALEN=$$RJ^XLFSTR($P(NODE,U,5),3,0)
 ...S:+ALEN=0 ALEN=$P($G(^TMP($J,"ECXCL",ECXCLIN)),U,2) ;156-modified global ref to "ECXCL"
 ...S ECXSTOP=P1
 ...S ECXPVST=+$P(NODE,U,18),ECXATYP=+$P(NODE,U,10)
 ...I TOSEND'=3 D
 ....S ECXKEY=P1_P2_ALEN_P3_"0"_P4,ECXOBS=$$OBSPAT^ECXUTL4(ECXA,ECXTS,ECXKEY) ;166
 ....S ECXENC=$$ENCNUM^ECXUTL4(ECXA,ECXSSN,ECXADMDT,ECXDATE,ECXTS,ECXOBS,ECHEAD,ECXKEY,) D:ECXENC'="" FILE
 ...I TOSEND=3 D
 ....S ECXKEY=P1_"000"_ALEN_P3_"0"_P4,ECXOBS=$$OBSPAT^ECXUTL4(ECXA,ECXTS,ECXKEY) ;166
 ....S ECXENC=$$ENCNUM^ECXUTL4(ECXA,ECXSSN,ECXADMDT,ECXDATE,ECXTS,ECXOBS,ECHEAD,ECXKEY,) D:ECXENC'="" FILE
 ...I TOSEND=3 D
 ....S ECXKEY=P2_"000"_ALEN_P3_"0"_P4,ECXOBS=$$OBSPAT^ECXUTL4(ECXA,ECXTS,ECXKEY) ;166
 ....S ECXENC=$$ENCNUM^ECXUTL4(ECXA,ECXSSN,ECXADMDT,ECXDATE,ECXTS,ECXOBS,ECHEAD,ECXKEY,) D:ECXENC'="" FILE
 ..I PROCESS=2 D  Q
 ...S ALEN=0
 ...I SOURCE=TIU S ALEN=$P($G(^TMP($J,"ECXCL",ECXCLIN)),U,2)
 ...S:+ALEN=0 ALEN="030" S ECXKEY=P1_P2_ALEN_P3_"0"_P4,ECXSTOP=P1 ;166
 ...S ECXOBS=$$OBSPAT^ECXUTL4(ECXA,ECXTS,ECXKEY)
 ...S ECXENC=$$ENCNUM^ECXUTL4(ECXA,ECXSSN,ECXADMDT,ECXDATE,ECXTS,ECXOBS,ECHEAD,ECXKEY,) D:ECXENC'="" FILE
 ..;dispositions
 ..I PROCESS=3 D  Q
 ...S ECXKEY=ECXSTOP_"47906000000"_P4,ECXOBS=$$OBSPAT^ECXUTL4(ECXA,ECXTS,ECXKEY) ;166
 ...S ECXENC=$$ENCNUM^ECXUTL4(ECXA,ECXSSN,ECXADMDT,ECXDATE,ECXTS,ECXOBS,ECHEAD,ECXKEY,) D:ECXENC'="" FILE
 Q
 ;
FILE ;record setup for file #727.827
 ;NODE(0)
 ;Sequence Number,Year Month, Extract Number (EC23)^facility (ECXDIV)^
 ;dfn (ECXDFN)^ssn (ECXSSN)^name (ECXPNM)^
 ;in/out (ECXA)^Day $$ECXDATE^ECXUTL(ECXDATE,ECXYM)^Placehold Feeder Key (FY<2018) (ECXKEY) ^
 ;Overbooked Indicator (ECXOBI)^Clinic Name (NOW NULL)^Treating Specialty (ECXTSC) ^
 ;Time (ECXTI)^Primary Care Team (ECPTTM)^primary care provider(ECPTPR)^
 ;Primary Care PRV Person Class(ECCLAS)^Provider (ECXPROV)^
 ;provider person class (ECPROVP)^CPT Code Qty & Modifiers #1 (ECXCPT1)^
 ;CPT Code Qty & Modifiers #3 (ECXCPT3)^CPT Code Qty & Modifiers #3 (ECXCPT3)^
 ;CPT Code Qty & Modifiers #4 (ECXCPT4)^CPT Code Qty & Modifiers #5 (ECXCPT5)^
 ;NODE(1)
 ;CPT Code Qty & Modifiers #6 (ECXCPT6)^CPT Code Qty & Modifiers #7 (ECXCPT7)^
 ;CPT Code Qty & Modifiers #8 (ECXCPT8)^Placeholder (ECXICD9P)^
 ;Placeholder (ECXICD91)^Placeholder (ECXICD92)
 ;Placeholder (ECXICD93)^Placeholder (ECXICD94)
 ;date of birth (ECDOB)^Eligibility (ECXELIG)^Veteran (ECXVET)^
 ;Race (ECXRACE)^POW status (ECXPST)^POW Location (ECXPLOC)^ Radiation Status(ECXRST)^
 ;Radiation Encounter Indicator (ECXIR)^Agent Orange Status (ECXAST)^
 ;Agent Orange Location(ECXAO)^Master Patient Index ((ECXMPI)^DSS Product Department (ECXDSSD)^
 ;Sex (ECXSEX)^zip code (ECXZIP)^Place Holder^Place Holder^Encounter Eligibility (ECXENEL)^
 ;MST Status(ECXMST)^MST Encounter Indicator (ECXMIL)^Place Holder^Place Holder^
 ;Enrollment Location ((ECXENRL)^State (ECXSTATE)^County (ECXCNTY)^
 ;Associate PC Provider (ECASPR)^Associate PC Prov. Person Class (ECCLAS2)^Place Holder^
 ;DOM, PRRTP AND SAARTP Indicator (ECXDOM)^ Enrollment Category (ECXCAT)^
 ;NODE(2)
 ;Enrollment Status (ECXSTAT)^ SHAD Status (ECXPRIOR or ECXSHADI) ^
 ;Purple Heart Indicator (ECXPHI)^Period of Service (ECXPOS)^
 ;Observation Patient Indicator (ECXOBS)^ Encounter Number (ECXENC)^
 ;Agent Orange Location (ECXAOL)^Production Division Code (ECXPDIV)^ Appointment Type (ECXATYP)^
 ;Purpose of Visit (ECXPVST)^Means Test (ECXMTST)^Head & Neck Cancer Indicator (ECXHNCI)^
 ;Ethnicity(ECXETH)^Race 1(ECXRC1)^CBOC Status (ECXCBOC)^Place Holder^Enrollment Priority (ECXPRIOR_ECXSBGRP)^
 ;User Enrollee (ECXUESTA)^ Patient Type(ECXPTYPE)^CV Status Eligibility (ECXCVE)^
 ;CV Eligibility End Date (ECXCVEDT)^Encounter CV (ECXCVENC)^National Patient Record Flag (ECXNPRFI)^
 ;SW Asia Conditions (ECXEST)^Encounter SWAC (ECXECE)^ERI (ECXERI)^Enc Head/Neck CA (ECXHNC)^
 ;OEF/OIF (ECXOEF)^ OEF/OIF Return Date (ECXOEFDT)^Associate PC Provider NPI (ECASNPI)^
 ;Primary Care Provider NPI (ECPTNPI)^Provider NPI(ECPRNPI)^
 ;NODE(3)
 ;Country Code (ECXCNTRY)^Encounter SHAD (ECXSHAD)^PATCAT (ECXPATCAT)^Secondary Provider #1 (ECSP1)^
 ;Secondary Provider #1 PC (ECSPPC1)^Secondary Provider #1 NPI (ECSPNPI1)^Secondary Provider #2 (ECSP2)^
 ;Secondary Provider #2 PC (ECSPPC2)^Secondary Provider #2 NPI (ECSPNPI2)^Secondary Provider #3 (ECSP3)^
 ;Secondary Provider #3 PC (ECSPPC3)^Secondary Provider #3 NPI (ECSPNPI3)^Secondary Provider #4 (ECSP4)^
 ;Secondary Provider #4 PC (ECSPPC4)^Secondary Provider #4 NPI (ECSPNPI4)^Secondary Provider #5 (ECSP5)^
 ;Secondary Provider #5 PC (ECSPPC5)^Secondary Provider #5 NPI (ECSPNPI5)^
 ;ED Disposition Code (ECXEDIS)^Primary ICD-10 Code (ECXICD10P)^Secondary ICD-10 Code #1 (ECXICD101)^
 ;Secondary ICD-10 Code #2 (ECXICD102)^Secondary ICD-10 Code #3 (ECXICD103)^Secondary ICD-10 Code #4 (ECXICD104)^
 ;Encounter SC (ECXESC)^Vietnam (ECXVNS)^Secondary Provider #6 (ECSP6)^Secondary Provider #6 PC (ECSPPC6)^
 ;Secondary Provider #6 NPI (ECSPNPI6)^
 ;NODE(4)
 ;Secondary Provider #7 (ECSP7)^Secondary Provider #7 PC (ECSPPC7)^Secondary Provider #7 NPI (ECSPNPI7)^
 ;Camp Lejeune Status (ECXCLST)^Encounter Camp Lejeune (ECXECL)^Primary Procedure (ECXPP)
 ;Combat Service Indicator (ECXSVCI) ^ Combat Service Location (ECXSVCL)^Clinic IEN (ECXCLIN)^
 ;New Feeder Key (ECXKEY after FY2017)^ Patient Division (ECXSTANO)
 ;
 N STR
 N ECXSTANO  ;161 tjl
 S ECXPDIV=$$GETDIV^ECXDEPT(ECXDIV)  ; Get production division
 S ECXSTANO=$$GETDIV^ECXDEPT($$GET1^DIQ(44,ECXCLIN,3.5,"I"))  ;166 tjl - Get Patient Division
 S EC7=$O(^ECX(727.827,999999999),-1),EC7=EC7+1
 S STR(0)=EC7_U_EC23_U_ECXDIV_U_ECXDFN_U_ECXSSN_U_ECXPNM_U_ECXA_U
 S STR(0)=STR(0)_$$ECXDATE^ECXUTL(ECXDATE,ECXYM)_U_$S($G(ECXLOGIC)>2017:"",1:ECXKEY)_U_ECXOBI_U ;166 Feeder key will be here if FY<2018, otherwise it will be null
 ;convert specialty to PTF Code for transmission
 N ECXDATA,ECXTSC
 S ECXDATA=$$TSDATA^DGACT(42.4,+ECXTS,.ECXDATA)
 S ECXTSC=$G(ECXDATA(7))
 ;done
 S STR(0)=STR(0)_$S(ECXLOGIC>2015:"",1:ECXCLIN)_U_ECXTSC_U_ECXTI_U_ECPTTM_U_ECPTPR_U_ECCLAS_U
 S STR(0)=STR(0)_ECXPROV_U_ECXPROVP_U_ECXCPT1_U_ECXCPT2_U_ECXCPT3_U
 S STR(0)=STR(0)_ECXCPT4_U_ECXCPT5_U
 S STR(1)=ECXCPT6_U_ECXCPT7_U_ECXCPT8_U_ECXICD9P_U_ECXICD91_U_ECXICD92_U
 S STR(1)=STR(1)_ECXICD93_U_ECXICD94_U_ECXDOB_U_ECXELIG_U_ECXVET_U
 S STR(1)=STR(1)_ECXRACE_U_ECXPST_U_ECXPLOC_U_ECXRST_U_ECXIR_U_ECXAST_U
 S STR(1)=STR(1)_ECXAO_U_ECXMPI_U_ECXDSSD_U_ECXSEX_U_ECXZIP_U
 S STR(1)=STR(1)_$G(ECXPCPNP)_U_U_ECXENEL_U_ECXMST_U
 S STR(1)=STR(1)_ECXMIL_U_U_U_ECXENRL_U_ECXSTATE_U
 S STR(1)=STR(1)_ECXCNTY_U_ECASPR_U_ECCLAS2_U_U_ECXDOM_U_ECXCAT_U
 S STR(2)=ECXSTAT_U_$S(ECXLOGIC<2005:ECXPRIOR,ECXLOGIC>2010:ECXSHADI,1:"")_U_ECXPHI_U_ECXPOS_U_ECXOBS_U_ECXENC_U
 S STR(2)=STR(2)_ECXAOL_U_ECXPDIV_U_ECXATYP_U_ECXPVST_U_ECXMTST_U
 S STR(2)=STR(2)_ECXHNCI_U_ECXETH_U_ECXRC1
 I ECXLOGIC>2003 S STR(2)=STR(2)_U_ECXCBOC
 I ECXLOGIC>2004 S STR(2)=STR(2)_U_U_ECXPRIOR_ECXSBGRP_U_ECXUESTA_U_ECXPTYPE_U_ECXCVE_U_ECXCVEDT_U_ECXCVENC_U_ECXNPRFI
 I ECXLOGIC>2005 S STR(2)=STR(2)_U_ECXEST_U_ECXECE
 I ECXLOGIC>2006 S STR(2)=STR(2)_U_ECXERI_U_ECXHNC
 I ECXLOGIC>2007 S STR(2)=STR(2)_U_ECXOEF_U_ECXOEFDT_U_ECASNPI_U_ECPTNPI_U_$G(ECPRNPI)_U
 I ECXLOGIC>2009 S STR(3)=ECXCNTRY
 ;added patcat status, N3 P3
 I ECXLOGIC>2010 S STR(3)=STR(3)_U_ECXSHAD_U_ECXPATCAT
 I ECXLOGIC>2011 S STR(3)=STR(3)_U_ECSP1_U_ECSPPC1_U_ECSPNPI1_U_ECSP2_U_ECSPPC2_U_ECSPNPI2_U_ECSP3_U_ECSPPC3_U_ECSPNPI3_U_ECSP4_U_ECSPPC4_U_ECSPNPI4_U_ECSP5_U_ECSPPC5_U_ECSPNPI5
 ;added icd-10
 I ECXLOGIC>2012 S STR(3)=STR(3)_U_$G(ECXEDIS)_U_ECXICD10P_U_ECXICD101_U_ECXICD102_U_ECXICD103_U_ECXICD104 ;136
 I ECXLOGIC>2013 S STR(3)=STR(3)_U_ECXESC_U_ECXVNS_U_ECSP6_U_ECSPPC6_U_ECSPNPI6_U ; 144
 I ECXLOGIC>2013 S STR(4)=ECSP7_U_ECSPPC7_U_ECSPNPI7_U_ECXCLST_U_ECXECL ; 144 new provider fields and camp lejeune fields
 I ECXLOGIC>2014 S STR(4)=STR(4)_U_$G(ECXPP)_U_ECXSVCI_U_ECXSVCL ;149 add primary procedure, Comb SVC Ind, loc
 I ECXLOGIC>2015 S STR(4)=STR(4)_U_ECXCLIN ;154 moved clinic IEN to end of extract
 I ECXLOGIC>2017 S STR(4)=STR(4)_U_ECXKEY_U_ECXSTANO ;166 New feeder key, Patient division
 D FILE2^ECXSCX2(727.827,EC7,.STR)
 S ECRN=ECRN+1,$P(^ECX(727.827,0),U,3)=EC7
 Q
 ;
SETUP ;set required input for ECXTRAC
 S ECHEAD="CLI"
 D ECXDEF^ECXUTL2(ECHEAD,.ECPACK,.ECGRP,.ECFILE,.ECRTN,.ECPIECE,.ECVER)
 Q
