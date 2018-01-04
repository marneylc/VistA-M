ECX3P166 ;ALB/DAN - DSS FY2018 Conversion, Post-init ;6/6/17  15:23
 ;;3.0;DSS EXTRACTS;**166**;Dec 22, 1997;Build 24
 ;
POST ;Post-install items
 D TEST ;Set testing site information
 D MENU ;update menus
 Q
 ;
TEST ;turn-on fld #73 in file #728 for Field Test Site;
 ;allows use of option ECX FISCAL YEAR EXTRACT by test sites;
 D MES^XPDUTL(" ")
 D MES^XPDUTL("Providing special menu option access for DSS FY Conversion test sites.")
 D TESTON^ECXTREX(XPDNM,"FY2018")
 D MES^XPDUTL(" ")
 ;if this is the national released version, then fld #73 will be turned-off
 ;the first time any user attempts to use ECX FISCAL YEAR EXTRACT option
 Q
 ;
MENU ;update menus
 N DA,DIE,DR,MENU,OPTION,CHECK,CHOICE,SYN,ORD,TYPE,OFF,UPDATE
 S TYPE="MENUDEL" F OFF=1:1 S CHOICE=$P($T(@TYPE+OFF),";;",2) Q:CHOICE="DONE"  D
 .S OPTION=$P(CHOICE,"^"),MENU=$P(CHOICE,"^",2)
 .S CHECK=$$DELETE^XPDMENU(MENU,OPTION)
 .D BMES^XPDUTL(">>> "_OPTION_" OPTION "_$S(CHECK:"REMOVED FROM ",1:"DOES NOT EXIST IN ")_MENU_" <<<")
 S TYPE="MENUADD" F OFF=1:1 S CHOICE=$P($T(@TYPE+OFF),";;",2) Q:CHOICE="DONE"  D
 .S OPTION=$P(CHOICE,"^"),MENU=$P(CHOICE,"^",2),SYN=$P(CHOICE,"^",3),ORD=$P(CHOICE,"^",4)
 .S CHECK=$$ADD^XPDMENU(MENU,OPTION,SYN,ORD)
 .D BMES^XPDUTL(">>> "_OPTION_" OPTION"_$S('CHECK:" NOT",1:"")_" ADDED TO "_MENU_" <<<")
 S OPTION=$$LKOPT^XPDMENU("ECX SOURCE AUDITS") Q:'+OPTION
 S UPDATE(19,OPTION_",",1)="Extract Audit Reports"
 D FILE^DIE("","UPDATE")
 D BMES^XPDUTL("Source Audit menu text updated")
 Q
 ;
MENUDEL ;Menu items to be deleted
 ;;ECX SETUP LAB^ECX MAINTENANCE
 ;;ECX CPT INQUIRY^ECX MAINTENANCE
 ;;ECX ECS MAINTENANCE^ECX MAINTENANCE
 ;;ECX DSSDEPT MGMT^ECX MAINTENANCE
 ;;ECX SETUP INP MEDS^ECX MAINTENANCE
 ;;ECX SURGERY MAINTENANCE^ECX MAINTENANCE
 ;;ECX LBB SOURCE AUDIT REPORTS^ECX SOURCE AUDITS
 ;;ECX ECS VOL^ECX ECS MAINTENANCE
 ;;ECX PHA FKEY^ECX PHARMACY MAINTENANCE
 ;;ECX PHA COST^ECX PHARMACY MAINTENANCE
 ;;ECX PHA VOL^ECX PHARMACY MAINTENANCE
 ;;ECX PHA UDP/IVP SOURCE AUDIT^ECX PHARMACY MAINTENANCE
 ;;ECX PRO COST^ECX PROSTHETICS MAINTENANCE
 ;;ECX SUR VOL REPORT^ECX SURGERY MAINTENANCE
 ;;ECX SUR VOL^ECX SURGERY MAINTENANCE
 ;;ECX LBB SOURCE AUDIT^ECX SOURCE AUDITS
 ;;DONE
MENUADD ;Menu items to be added
 ;;ECXTPR^ECX MAINTENANCE^TST^11
 ;;ECXPROMR^ECX PROSTHETICS MAINTENANCE^6
 ;;ECXPROUI^ECX PROSTHETICS MAINTENANCE^7
 ;;ECX CPT INQUIRY^ECX LOOKUPS^1^1
 ;;ECX ICD INQUIRY^ECX LOOKUPS^2^2
 ;;ECX LOOKUPS^ECX MAINTENANCE^INQ^2
 ;;ECX CBOC REPORT^ECX MAINTENANCE^CBO^1
 ;;ECX WARD DSSDEPT^ECX MAINTENANCE^WRD^3
 ;;ECXLAB MAINTENACE^ECX MAINTENANCE^LAB^4
 ;;ECX PHARMACY MAINTENANCE^ECX MAINTENANCE^PHA^5
 ;;ECX IV DIV EDIT^ECX PHARMACY MAINTENANCE^1^1
 ;;ECX IV DIV PRINT^ECX PHARMACY MAINTENANCE^2^2
 ;;ECXNDC^ECX PHARMACY MAINTENANCE^3^3
 ;;ECX PHA EDIT^ECX PHARMACY MAINTENANCE^4^4
 ;;ECXFEKEY^ECX MAINTENANCE^KEY^6
 ;;ECXFELOC^ECX MAINTENANCE^LOC^7
 ;;ECX PROSTHETICS MAINTENANCE^ECX MAINTENANCE^PRO^8
 ;;ECX SETUP CLINIC^ECX MAINTENANCE^CLI^9
 ;;ECX SETUP INP CENSUS^ECX MAINTENANCE^CEN^10
 ;;ECX PRE-EXTRACT REPORTS^ECXMGR^R^8
 ;;ECX ECS VOL^ECX PRE-EXTRACT REPORTS^ECS^1
 ;;ECX LBB SOURCE AUDIT^ECX PRE-EXTRACT REPORTS^LBB^2
 ;;ECX PHARMACY PRE-EXTRACT^ECX PRE-EXTRACT REPORTS^PHA^3
 ;;ECX PRO COST^ECX PRE-EXTRACT REPORTS^PRO^4
 ;;ECX SURGERY PRE-EXTRACT^ECX PRE-EXTRACT REPORTS^SUR^5
 ;;ECX PHA FKEY^ECX PHARMACY PRE-EXTRACT^1^1
 ;;ECX PHA COST^ECX PHARMACY PRE-EXTRACT^2^2
 ;;ECX PHA VOL^ECX PHARMACY PRE-EXTRACT^3^3
 ;;ECX PHA UDP/IVP SOURCE AUDIT^ECX PHARMACY PRE-EXTRACT^4^4
 ;;ECX SUR VOL REPORT^ECX SURGERY PRE-EXTRACT^1^1
 ;;ECX SUR VOL^ECX SURGERY PRE-EXTRACT^2^2
 ;;ECX LBB SOURCE AUDIT COMPAR^ECX SOURCE AUDITS^LBB^6
 ;;DONE
