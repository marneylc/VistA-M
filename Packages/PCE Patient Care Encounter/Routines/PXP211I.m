PXP211I ;SLC/PKR - Init routine for PX*1.0*211 ;01/23/2017
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**211**;Aug 12, 1996;Build 84
 ;======================
BINDEX ;Make sure the "B" index matches what is in the .01.
 N BNAME,IEN,NAME
 D BMES^XPDUTL("Checking B indexes.")
 ;
 D BMES^XPDUTL("Checking Education Topics.")
 S BNAME=""
 F  S BNAME=$O(^AUTTEDT("B",BNAME)) Q:BNAME=""  D
 . S IEN=$O(^AUTTEDT("B",BNAME,""))
 . S NAME=$P($G(^AUTTEDT(IEN,0)),U,1)
 . I BNAME=NAME Q
 . D BMES^XPDUTL("Setting B index for Education Topic: "_NAME)
 . K ^AUTTEDT("B",BNAME)
 . S ^AUTTEDT("B",NAME,IEN)=""
 ;
 D BMES^XPDUTL("Checking Exams.")
 S BNAME=""
 F  S BNAME=$O(^AUTTEXAM("B",BNAME)) Q:BNAME=""  D
 . S IEN=$O(^AUTTEXAM("B",BNAME,""))
 . S NAME=$P($G(^AUTTEXAM(IEN,0)),U,1)
 . I BNAME=NAME Q
 . D BMES^XPDUTL("Setting B index for Exam: "_NAME)
 . K ^AUTTEXAM("B",BNAME)
 . S ^AUTTEXAM("B",NAME,IEN)=""
 ;
 D BMES^XPDUTL("Checking Health Factors.")
 S BNAME=""
 F  S BNAME=$O(^AUTTHF("B",BNAME)) Q:BNAME=""  D
 . S IEN=$O(^AUTTHF("B",BNAME,""))
 . S NAME=$P($G(^AUTTHF(IEN,0)),U,1)
 . I BNAME=NAME Q
 . D BMES^XPDUTL("Setting B index for Health Factor: "_NAME)
 . K ^AUTTHF("B",BNAME)
 . S ^AUTTHF("B",NAME,IEN)=""
 Q
 ;
 ;======================
GENPNAME ;For any entry missing a print names generate one.
 N IEN,IENS,FDA,MSG,NAME,PNAME,REPA,TNAME
 D HFREPA(.REPA)
 D BMES^XPDUTL("Generating Print Names for entries that do not have one.")
 ;
 D BMES^XPDUTL("Checking Education Topics.")
 S NAME=""
 F  S NAME=$O(^AUTTEDT("B",NAME)) Q:NAME=""  D
 . S IEN=$O(^AUTTEDT("B",NAME,""))
 . S PNAME=$P($G(^AUTTEDT(IEN,0)),U,4)
 . I PNAME'="" Q
 . K FDA,MSG
 . S IENS=IEN_","
 . S TNAME=$S($E(NAME,1,2)="ZZ":$E(NAME,3,99),1:NAME)
 . S PNAME=$$HFPNAME(TNAME,.REPA)
 . S FDA(9999999.09,IENS,.04)=PNAME
 . D BMES^XPDUTL("Setting Print Name for Education Topic: "_NAME)
 . D MES^XPDUTL("Print Name: "_PNAME)
 . D FILE^DIE("ET","FDA","MSG")
 ;
 D BMES^XPDUTL("Checking Exams.")
 S NAME=""
 F  S NAME=$O(^AUTTEXAM("B",NAME)) Q:NAME=""  D
 . S IEN=$O(^AUTTEXAM("B",NAME,""))
 . S PNAME=$P($G(^AUTTEXAM(IEN,200)),U,1)
 . I PNAME'="" Q
 . K FDA,MSG
 . S IENS=IEN_","
 . S TNAME=$S($E(NAME,1,2)="ZZ":$E(NAME,3,99),1:NAME)
 . S PNAME=$$HFPNAME(TNAME,.REPA)
 . S FDA(9999999.15,IENS,200)=PNAME
 . D BMES^XPDUTL("Setting Print Name for Exam: "_NAME)
 . D MES^XPDUTL("Print Name: "_PNAME)
 . D FILE^DIE("ET","FDA","MSG")
 ;
 D BMES^XPDUTL("Checking Health Factors.")
 S NAME=""
 F  S NAME=$O(^AUTTHF("B",NAME)) Q:(NAME="")  D
 . S IEN=$O(^AUTTHF("B",NAME,""))
 . S PNAME=$P($G(^AUTTHF(IEN,200)),U,1)
 . I PNAME'="" Q
 . K FDA,MSG
 . S IENS=IEN_","
 . S TNAME=$S($E(NAME,1,2)="ZZ":$E(NAME,3,99),1:NAME)
 . S PNAME=$$HFPNAME(TNAME,.REPA)
 . S FDA(9999999.64,IENS,200)=PNAME
 . D BMES^XPDUTL("Setting Print Name for Health Factor: "_NAME)
 . D MES^XPDUTL("Print Name: "_PNAME)
 . D FILE^DIE("ET","FDA","MSG")
 Q
 ;
 ;======================
HFPNAME(NAME,REPA) ;Turn name into a print name for health factors.
 N CF,CHAR,CP,PNAME,ONC
 I $E(NAME,1,3)="VA-" S PNAME=$E(NAME,4,99)
 E  S PNAME=NAME
 S ONC=0
 I $E(NAME,1,3)="ONC" S ONC=1
 I 'ONC S PNAME=$$TITLE^XLFSTR(PNAME)
 S PNAME=$$REPLACE^XLFSTR(PNAME,.REPA)
 ;Make sure characters following those below are uppercase.
 F CHAR="-","/","\" D
 . S CP=0
 . F  S CP=$F(PNAME,CHAR,CP) Q:CP=0  D
 .. S CF=$E(PNAME,CP)
 .. S $E(PNAME,CP)=$$UP^XLFSTR(CF)
 Q PNAME
 ;
 ;======================
HFREPA(REPA) ;Establish the replacements for health factor print names.
 ;AH health factors
 S REPA("Abn ")="ABN ",REPA("Abg")="ABG"
 S REPA("Ah-bpr")="Airborne Hazard Burn Pit Registry"
 S REPA(" Cbc")=" CBC",REPA(" Cc")=" CC"
 S REPA(" Ent ")=" ENT ",REPA("/onc")="/ONC"
 ;
 ;ARCH health factors
 S REPA("Arch")="ARCH"
 S REPA("-no")="-No",REPA("-service")="-Service"
 ;
 ;CGA health factors
 S REPA("Cg ")="CG ",REPA("Cga ")="Caregiver Annual Assessment "
 S REPA(" Pc")=" PC"
 S REPA("W/out")="W/OUT",REPA("Zbi ")="ZBI "
 ;
 ;CGF health factors
 S REPA("Cgf")="Caregiver 90 Day Monitoring Assessments"
 S REPA(" Cvt")=" CVT",REPA(" Mh")=" MH"
 ;
 ;CGI health factors
 S REPA("Cgi")="Caregiver Initial Assessment"
 ;
 ;CGINT health factors
 S REPA("Cgint")="Caregiver Interim Assessment"
 ;
 ;Ebola health factors
 S REPA("W/o")="W/O"
 ;
 ;ECOE health factors
 S REPA("Aed ")="AED ",REPA("Aeds")="AEDS"
 S REPA("Ecoe")="Epilepsy Center Of Excellence"
 S REPA("Eeg ")="EEG ",REPA("Mh ")="MH ",REPA("Mri ")="MRI "
 S REPA("Pet ")="PET ",REPA("Qolie")="QOLIE"
 S REPA("Tbi")="TBI",REPA("Vid ")="VID ",REPA("Vns")="VNS"
 S REPA("Wada")="WADA"
 ;
 ;Embedded Fragments
 S REPA("Ef-")="Embedded Fragments-",REPA("-ied")="-IED"
 S REPA("rpg")="RPG"
 ;
 ;GEC health factors
 S REPA("Adl")="ADL",REPA("bipap")="BIPAP",REPA("Cpap")="CPAP"
 S REPA("Dpoa ")="DPOA ",REPA("Iadl")="IADL",REPA("Iv ")="IV "
 S REPA("Fx")="FX",REPA("Gec")="Geriatric Extended Care"
 S REPA("Geri ")="GERI "
 S REPA("-medicaid")="-Medicaid",REPA("-medicare")="-Medicare"
 S REPA("Nhcu")="NHCU",REPA("Pt-")="PT-",REPA("/pt")="/PT"
 S REPA("Pt/ot")="PT/OT",REPA("t+/-30d")="T+/-30D",REPA("Tx-")="TX-"
 S REPA("-va")="-VA",REPA("Va ")="VA ",REPA("-yes")="-Yes"
 S REPA("Wc ")="WC "
 ;
 ;Hepatitis C Virus
 S REPA("-hcv")="-Hepatitis C Virus",REPA("Hcv")="Hepatitis C Virus"
 S REPA("Hiv")="HIV"
 ;
 ;Miscellaneous
 S REPA("Aaa")="AAA",REPA("AAa")="AAA",REPA("Abd ")="ABD "
 S REPA("Cm")="cm",REPA("Fobt")="FOBT",REPA("Hpv")="HPV"
 S REPA("Ihd")="IHD",REPA("-mh")="-MH",REPA("Md ")="MD "
 S REPA("Oef")="OEF",REPA("/oif")="/OIF",REPA("Oif")="OIF"
 S REPA("Na ")="NA ",REPA("Tb ")="TB ",REPA("Zzmh")="ZZMH"
 ;
 ;MH health factors
 S REPA("2Nd")="2nd",REPA("3Rd")="3rd"
 S REPA("Act ")="ACT ",REPA("Bft ")="BFT "
 S REPA("Cbt-i")="CBT-I",REPA("Cbt-d")="CBT-D",REPA("Cog ")="COG "
 S REPA("Cpt ")="CPT ",REPA("Cqs")="CQS"
 S REPA("Dbas ")="DBAS ",REPA("Ebp ")="EBP ",REPA("Ibct ")="IBCT "
 S REPA("Ipt ")="IPT ",REPA("Isi ")="ISI ",REPA("Mh ")="MH "
 S REPA("Mst")="MST",REPA("Pct ")="PCT "
 S REPA("Pei ")="PEI ",REPA("Phq9")="PHQ-9",REPA("Q&a")="Q&A"
 S REPA("Snq ")="SNQ ",REPA(" Ssn")=" SSN",REPA("Sst")="SST"
 S REPA("Waso")="WASO"
 ;
 ;ONC health factors
 S REPA("Ecog")="ECOG",REPA("ONC ")="Oncology ",REPA("(Onc) ")=""
 S REPA("Onc Pca")="ONC PCA"
 S REPA("Pca")="PCA",REPA("Sob")="SOB",REPA("Vsas")="VSAS"
 ;
 ;ONS health factors
 S REPA("Aa ")="AA ",REPA("amb ")="AMB ",REPA("Amb ")="AMB "
 S REPA("Cant")="Can't",REPA("Ca/tbi")="CA/TBI",REPA("Cv ")="CV "
 S REPA("Etoh")="ETOH",REPA("Fr ")="FR ",REPA(" Gi")=" GI"
 S REPA("Gi ")="GI "
 S REPA("Gu ")="GU ",REPA("hn ")="HN ",REPA("Hob ")="Head of Bed "
 S REPA("hob")="Head of Bed",REPA("Ic ")="IC ",REPA("Id-")="ID-"
 S REPA(" Ii")=" II",REPA(" Iii")=" III",REPA("Iv ")="IV "
 S REPA("Ldl")="LDL"
 S REPA("Mrsa")="MRSA",REPA("Ms ")="MS ",REPA("Ntf")="NTF"
 S REPA("Ons ")="ONS "
 S REPA(" Oob")=" OOB",REPA("Pf ")="PF "
 S REPA("Pu ")="Pressure Ulcer "
 S REPA("Q2h")="Q2H",REPA("Ra ")="RA "
 S REPA(" Rn")=" RN",REPA(" Tv")=" TV"
 ;
 ;PTSD health factors
 S REPA("Ptsd")="PTSD"
 ;
 ;TBI health factors
 S REPA(" Ii")=" II",REPA(" Iii")=" III",REPA(" Iv")=" IV"
 S REPA("-pt")="-Pt"
 ;
 ;TDI health factors
 S REPA("Tdi")="Telederm Imager",REPA("Tdr")="Telederm Reader"
 ;
 ;TDR health factors
 S REPA("Pcc")="PCC"
 ;
 ;VANOD health factors
 S REPA("Vanod")="VANOD"
 ;
 ;VC health factors
 S REPA("Vc ")="Veteran's Choice "
 ;
 ;WH health factors
 S REPA("F/u")="F/U",REPA(" Hf")=" HF",REPA("le<")="LE<"
 S REPA("N/a")="N/A",REPA("Wh ")="Women's Health ",REPA("Zzwh")="ZZWH"
 Q
 ;
 ;======================
MVTREAT ;Move Treatment from sequence 13 to 15 on PXCE ADD/EDIT MENU.
 N IENM,IENT,IND
 S IENM=$$FIND1^DIC(101,"","BX","PXCE ADD/EDIT MENU")
 S IENT=$$FIND1^DIC(101,"","BX","PXCE TREATMENT ADD")
 S IND=$O(^ORD(101,IENM,10,"B",IENT,""))
 S $P(^ORD(101,IENM,10,IND,0),U,3)=15
 Q
 ;
 ;======================
PRE ;Pre-init
 D BINDEX
 D RMOLDDDS
 D MVTREAT
 Q
 ;
 ;======================
POST ;Post-init
 D SETCLASS^PXP211I
 D GENPNAME^PXP211I
 D UPCNAME^PXP211I
 ;D RENAME^PXP211I
 Q
 ;
 ;======================
RENAME ;Rename entries from the Platinum list so they start with "VA-".
 Q
 N FDA,IEN,IENS,IND,MSG,NAME,NDONE,PLTNAME,PXNAT,XPDIDTOT
 S NDONE=0,PXNAT=1,XPDIDTOT=0
 S IND=0
 F  S IND=+$O(@XPDGREF@("ED",IND)) Q:IND=0  D
 . S PLTNAME=@XPDGREF@("ED",IND)
 . S IEN=$O(^AUTTEDT("B",PLTNAME,""))
 . I IEN="" Q
 . I $E(PLTNAME,1,3)="VA-" Q
 . S XPDIDTOT=XPDIDTOT+1
 S IND=0
 F  S IND=+$O(@XPDGREF@("EX",IND)) Q:IND=0  D
 . S PLTNAME=@XPDGREF@("EX",IND)
 . S IEN=$O(^AUTTEXAM("B",PLTNAME,""))
 . I IEN="" Q
 . I $E(PLTNAME,1,3)="VA-" Q
 . S XPDIDTOT=XPDIDTOT+1
 S IND=0
 F  S IND=+$O(@XPDGREF@("HF",IND)) Q:IND=0  D
 . S PLTNAME=@XPDGREF@("HF",IND)
 . S IEN=$O(^AUTTHF("B",PLTNAME,""))
 . I IEN="" Q
 . I $E(PLTNAME,1,3)="VA-" Q
 . S XPDIDTOT=XPDIDTOT+1
 D BMES^XPDUTL("There are "_XPDIDTOT_" entries that need to be renamed.")
 I XPDIDTOT=0 Q
 ;
 D BMES^XPDUTL("Checking for Education Topics that need renamed.")
 S IND=0
 F  S IND=+$O(@XPDGREF@("ED",IND)) Q:IND=0  D
 . S PLTNAME=@XPDGREF@("ED",IND)
 . S IEN=$O(^AUTTEDT("B",PLTNAME,""))
 . I IEN="" D BMES^XPDUTL("Education Topic "_PLTNAME_" was not found!") Q
 . S NAME=$S($E(PLTNAME,1,3)="VA-":PLTNAME,1:"VA-"_PLTNAME)
 . I NAME'=PLTNAME S NDONE=NDONE+1
 . S NAME=$$UP^XLFSTR(NAME)
 . D BMES^XPDUTL(" Renaming Education Topic: "_PLTNAME)
 . D MES^XPDUTL(" To: "_NAME)
 . K FDA,MSG
 . S IENS=IEN_","
 . S FDA(9999999.09,IENS,.01)=NAME
 . D FILE^DIE("ET","FDA","MSG")
 . D UPDATE^XPDID(NDONE)
 ;
 D BMES^XPDUTL("Checking for Health Factors that need renamed.")
 S IND=0
 F  S IND=+$O(@XPDGREF@("HF",IND)) Q:IND=0  D
 . S PLTNAME=@XPDGREF@("HF",IND)
 . S IEN=$O(^AUTTHF("B",PLTNAME,""))
 . I IEN="" D BMES^XPDUTL("Health Factor "_PLTNAME_" was not found!") Q
 . I $E(PLTNAME,1,3)="VA-" Q
 . I $E(PLTNAME,1,5)="ZZVA-" Q
 . S NAME=$S($E(PLTNAME,1,2)="ZZ":"ZZVA-"_$E(PLTNAME,3,99),$E(PLTNAME,1,3)="VA-":PLTNAME,1:"VA-"_PLTNAME)
 . I NAME'=PLTNAME S NDONE=NDONE+1
 . S NAME=$$UP^XLFSTR(NAME)
 . D BMES^XPDUTL(" Renaming Health Factor: "_PLTNAME)
 . D MES^XPDUTL(" To: "_NAME)
 . K FDA,MSG
 . S IENS=IEN_","
 . S FDA(9999999.64,IENS,.01)=NAME
 . D FILE^DIE("ET","FDA","MSG")
 . D UPDATE^XPDID(NDONE)
 D BMES^XPDUTL("Renaming completed.")
 Q
 ;
 ;======================
RMOLDDDS ;Remove old data dictionaries.
 N DIU,TEXT
 D EN^DDIOL("Removing old data dictionaries.")
 S DIU(0)=""
 F DIU=9999999.09,9999999.15,9999999.64,9000010.16,9000010.13,9000010.23 D
 . S TEXT=" Deleting data dictionary for file # "_DIU
 . D EN^DDIOL(TEXT)
 . D EN^DIU2
 Q
 ;
 ;======================
SETCLASS ;Until a decision on national entries has been made make everything
 ;local.
 N CLASS,FDA,IEN,IENS,IND,MSG,NAME
 D BMES^XPDUTL("Setting undefined Education Topic Class fields.")
 S NAME=""
 F  S NAME=$O(^AUTTEDT("B",NAME)) Q:NAME=""  D
 . I NAME="VA-NATIONAL CLASS TEST" Q
 . S IEN=$O(^AUTTEDT("B",NAME,""))
 . D MES^XPDUTL(" Setting the Class of Education Topic: "_NAME_" to LOCAL.")
 . K FDA,MSG
 . S IENS=IEN_","
 .;Remove "VA-" from any non-national entries.
 . ;I $E(NAME,1,3)="VA-" S FDA(9999999.09,IENS,.01)=$E(NAME,4,99)
 . S FDA(9999999.09,IENS,100)="L"
 . D FILE^DIE("ET","FDA","MSG")
 ;
 ;Make all Exam entries local and if the name starts with "VA-"
 ;remove it.
 D BMES^XPDUTL("Setting undefined Exam Class fields.")
 S NAME=""
 F  S NAME=$O(^AUTTEXAM("B",NAME)) Q:NAME=""  D
 . I NAME="VA-NATIONAL CLASS TEST" Q
 . S IEN=$O(^AUTTEXAM("B",NAME,""))
 . D MES^XPDUTL(" Setting the Class of EXAM: "_NAME_" to LOCAL.")
 . K FDA,MSG
 . S IENS=IEN_","
 .;Remove "VA-" from any non-national entries.
 . ;I $E(NAME,1,3)="VA-" S FDA(9999999.15,IENS,.01)=$E(NAME,4,99)
 . S FDA(9999999.15,IENS,100)="L"
 . D FILE^DIE("ET","FDA","MSG")
 ;
 D BMES^XPDUTL("Setting undefined Health Factor Class fields.")
 S NAME=""
 F  S NAME=$O(^AUTTHF("B",NAME)) Q:NAME=""  D
 . I NAME="VA-NATIONAL CLASS TEST" Q
 . S IEN=$O(^AUTTHF("B",NAME,""))
 . D MES^XPDUTL(" Setting the Class of HF: "_NAME_" to LOCAL.")
 . K FDA,MSG
 . S IENS=IEN_","
 .;Remove "VA-" from any non-national entries.
 . ;I $E(NAME,1,3)="VA-" S FDA(9999999.64,IENS,.01)=$E(NAME,4,99)
 . S FDA(9999999.64,IENS,100)="L"
 . D FILE^DIE("ET","FDA","MSG")
 ;K ^TMP($J,"HFB")
 Q
 ;
 ;======================
SETCL ;Set the Class of all entries whose Class is not already defined
 ;to local. Preserve this version, as a basis for the final SETCLASS
 ;once a decision on national entries has been made.
 N CLASS,FDA,IEN,IENS,IND,MSG,NAME
 S IND=0
 F  S IND=+$O(@XPDGREF@("ED",IND)) Q:IND=0  D
 . S NAME=@XPDGREF@("ED",IND)
 . S ^TMP($J,"EDB",NAME)=""
 ;
 D BMES^XPDUTL("Setting undefined Education Topic Class fields.")
 S NAME=""
 F  S NAME=$O(^AUTTEDT("B",NAME)) Q:NAME=""  D
 . S IEN=$O(^AUTTEDT("B",NAME,""))
 . S CLASS=$P($G(^AUTTEDT(IEN,100)),U,1)
 . I CLASS="N",$D(^TMP($J,"EDB",NAME)) Q
 . D MES^XPDUTL(" Setting the Class of Education Topic: "_NAME_" to LOCAL.")
 . K FDA,MSG
 . S IENS=IEN_","
 .;Remove "VA-" from any non-national entries.
 . I $E(NAME,1,3)="VA-" S FDA(9999999.09,IENS,.01)=$E(NAME,4,99)
 . S FDA(9999999.09,IENS,100)="L"
 . D FILE^DIE("ET","FDA","MSG")
 K ^TMP($J,"EDB")
 ;
 ;Make all Exam entries local and if the name starts with "VA-"
 ;remove it.
 D BMES^XPDUTL("Setting undefined Exam Class fields.")
 S NAME=""
 F  S NAME=$O(^AUTTEXAM("B",NAME)) Q:NAME=""  D
 . S IEN=$O(^AUTTEXAM("B",NAME,""))
 . D MES^XPDUTL(" Setting the Class of EXAM: "_NAME_" to LOCAL.")
 . K FDA,MSG
 . S IENS=IEN_","
 .;Remove "VA-" from any non-national entries.
 . I $E(NAME,1,3)="VA-" S FDA(9999999.15,IENS,.01)=$E(NAME,4,99)
 . S FDA(9999999.15,IENS,100)="L"
 . D FILE^DIE("ET","FDA","MSG")
 K ^TMP($J,"EXB")
 ;
 S IND=0
 F  S IND=+$O(@XPDGREF@("HF",IND)) Q:IND=0  D
 . S NAME=@XPDGREF@("HF",IND)
 . S ^TMP($J,"HFB",NAME)=""
 ;
 D BMES^XPDUTL("Setting undefined Health Factor Class fields.")
 S NAME=""
 F  S NAME=$O(^AUTTHF("B",NAME)) Q:NAME=""  D
 . S IEN=$O(^AUTTHF("B",NAME,""))
 . S CLASS=$P($G(^AUTTHF(IEN,100)),U,1)
 . I CLASS="N",$D(^TMP($J,"HFB",NAME)) Q
 . D MES^XPDUTL(" Setting the Class of HF: "_NAME_" to LOCAL.")
 . K FDA,MSG
 . S IENS=IEN_","
 .;Remove "VA-" from any non-national entries.
 . I $E(NAME,1,3)="VA-" S FDA(9999999.64,IENS,.01)=$E(NAME,4,99)
 . S FDA(9999999.64,IENS,100)="L"
 . D FILE^DIE("ET","FDA","MSG")
 K ^TMP($J,"HFB")
 Q
 ;
 ;======================
UPCNAME ;Make sure all entries have upppercase .01s.
 N IEN,IENS,FDA,MSG,NAME,UPCNAME
 D BMES^XPDUTL("Making sure all .01s are uppercase.")
 ;
 D BMES^XPDUTL("Checking Education Topics.")
 S NAME=""
 F  S NAME=$O(^AUTTEDT("B",NAME)) Q:NAME=""  D
 . S UPCNAME=$$UP^XLFSTR(NAME)
 . I NAME=UPCNAME Q
 . S IEN=$O(^AUTTEDT("B",NAME,""))
 . K FDA,MSG
 . S IENS=IEN_","
 . S FDA(9999999.09,IENS,.01)=UPCNAME
 . D BMES^XPDUTL("Setting Education Topic: "_NAME)
 . D MES^XPDUTL("To: "_UPCNAME)
 . D FILE^DIE("ET","FDA","MSG")
 ;
 D BMES^XPDUTL("Checking Exams.")
 S NAME=""
 F  S NAME=$O(^AUTTEXAM("B",NAME)) Q:NAME=""  D
 . S UPCNAME=$$UP^XLFSTR(NAME)
 . I NAME=UPCNAME Q
 . S IEN=$O(^AUTTEXAM("B",NAME,""))
 . K FDA,MSG
 . S IENS=IEN_","
 . S FDA(9999999.15,IENS,.01)=UPCNAME
 . D BMES^XPDUTL("Setting Exam: "_NAME)
 . D MES^XPDUTL("To: "_UPCNAME)
 . D FILE^DIE("ET","FDA","MSG")
 ;
 D BMES^XPDUTL("Checking Health Factors.")
 S NAME=""
 F  S NAME=$O(^AUTTHF("B",NAME)) Q:(NAME="")  D
 . S UPCNAME=$$UP^XLFSTR(NAME)
 . I NAME=UPCNAME Q
 . S IEN=$O(^AUTTHF("B",NAME,""))
 . S IENS=IEN_","
 . K FDA,MSG
 . S FDA(9999999.64,IENS,.01)=UPCNAME
 . D BMES^XPDUTL("Setting Health Factor: "_NAME)
 . D MES^XPDUTL("To: "_UPCNAME)
 . D FILE^DIE("ET","FDA","MSG")
 Q
 ;
