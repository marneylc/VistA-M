IBJYL3 ; List Template Exporter ; 04-JAN-1996
 ;;Version 2.0 ; INTEGRATED BILLING ;**39**; 21-MAR-94
 W !,"'IBJT INACTIVE LIST' List Template..."
 S DA=$O(^SD(409.61,"B","IBJT INACTIVE LIST",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IBJT INACTIVE LIST" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="IBJT INACTIVE LIST^1^^80^4^20^1^1^Inactive Bill^IBJT INACTIVE LIST SCREEN MENU^Inactive Bills^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBJTLB"",$J)"
 .S ^SD(409.61,VALM,"COL",0)="^409.621^12^12"
 .S ^SD(409.61,VALM,"COL",1,0)="NUMBER^1^3"
 .S ^SD(409.61,VALM,"COL",2,0)="BILL^4^8^Bill #"
 .S ^SD(409.61,VALM,"COL",3,0)="HD^13^1"
 .S ^SD(409.61,VALM,"COL",4,0)="STFROM^14^8^From"
 .S ^SD(409.61,VALM,"COL",5,0)="STTO^24^8^To"
 .S ^SD(409.61,VALM,"COL",6,0)="TYPE^34^4^Type"
 .S ^SD(409.61,VALM,"COL",7,0)="ARST^39^4^Stat"
 .S ^SD(409.61,VALM,"COL",8,0)="RATE^44^8^Rate"
 .S ^SD(409.61,VALM,"COL",9,0)="CB^54^1"
 .S ^SD(409.61,VALM,"COL",10,0)="INSUR^55^7^Insurer"
 .S ^SD(409.61,VALM,"COL",11,0)="OAMT^64^8^Orig Amt"
 .S ^SD(409.61,VALM,"COL",12,0)="CAMT^73^8^Curr Amt"
 .S ^SD(409.61,VALM,"FNL")="D EXIT^IBJTLB"
 .S ^SD(409.61,VALM,"HDR")="D HDR^IBJTLB"
 .S ^SD(409.61,VALM,"HLP")="D HELP^IBJTLB"
 .S ^SD(409.61,VALM,"INIT")="D INIT^IBJTLB"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'IBJT NS PI VIEW PAT INS' List Template..."
 S DA=$O(^SD(409.61,"B","IBJT NS PI VIEW PAT INS",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IBJT NS PI VIEW PAT INS" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="IBJT NS PI VIEW PAT INS^1^^150^5^20^1^1^Policy^IBJT NS PI VIEW PAT INS MENU^Patient Insurance^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBNSM"",$J)"
 .S ^SD(409.61,VALM,"COL",0)="^409.621^14^14"
 .S ^SD(409.61,VALM,"COL",1,0)="NUMBER^1^4"
 .S ^SD(409.61,VALM,"COL",2,0)="NAME^5^15^Insurance Co.^^1"
 .S ^SD(409.61,VALM,"COL",3,0)="POLICY^134^15^Subsciber ID"
 .S ^SD(409.61,VALM,"COL",4,0)="GROUP^39^11^Group"
 .S ^SD(409.61,VALM,"COL",5,0)="HOLDER^52^8^Holder"
 .S ^SD(409.61,VALM,"COL",6,0)="EFFDT^61^9^Effect."
 .S ^SD(409.61,VALM,"COL",7,0)="EXPIRE^72^9^Expires"
 .S ^SD(409.61,VALM,"COL",8,0)="TYPE^81^8^Type"
 .S ^SD(409.61,VALM,"COL",9,0)="VERIFIED BY^91^12^Verified By"
 .S ^SD(409.61,VALM,"COL",10,0)="VERIFIED ON^105^9^Date Ver."
 .S ^SD(409.61,VALM,"COL",11,0)="PRECERT^116^5^Pre"
 .S ^SD(409.61,VALM,"COL",12,0)="UR^122^5^UR"
 .S ^SD(409.61,VALM,"COL",13,0)="COB^128^4^COB"
 .S ^SD(409.61,VALM,"COL",14,0)="TYPEPOL^22^15^Type of Policy"
 .S ^SD(409.61,VALM,"COL","AIDENT",1,2)=""
 .S ^SD(409.61,VALM,"FNL")="D EXITPI^IBJTNC"
 .S ^SD(409.61,VALM,"HDR")="D HDRPI^IBJTNC"
 .S ^SD(409.61,VALM,"INIT")="D INITPI^IBJTNC"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'IBJT NS VIEW AN BEN' List Template..."
 S DA=$O(^SD(409.61,"B","IBJT NS VIEW AN BEN",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IBJT NS VIEW AN BEN" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="IBJT NS VIEW AN BEN^1^^98^5^17^1^1^Annual Benefits^IBJT NS VIEW AN BEN MENU^Annual Benefits^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBCNSA"",$J)"
 .S ^SD(409.61,VALM,"FNL")="D EXITA^IBJTNB"
 .S ^SD(409.61,VALM,"HDR")="D HDRA^IBJTNB"
 .S ^SD(409.61,VALM,"HLP")="D HELPA^IBJTNB"
 .S ^SD(409.61,VALM,"INIT")="D INITA^IBJTNB"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 W !,"'IBJT NS VIEW EXP POL' List Template..."
 S DA=$O(^SD(409.61,"B","IBJT NS VIEW EXP POL",0)),DIK="^SD(409.61," D ^DIK:DA
 K DO,DD S DIC(0)="L",DIC="^SD(409.61,",X="IBJT NS VIEW EXP POL" D FILE^DICN S VALM=+Y
 I VALM>0 D
 .S ^SD(409.61,VALM,0)="IBJT NS VIEW EXP POL^1^^80^5^17^1^1^Policy^IBJT NS VIEW EXP POL MENU^Patient Policy Information^1^^1"
 .S ^SD(409.61,VALM,1)="^VALM HIDDEN ACTIONS"
 .S ^SD(409.61,VALM,"ARRAY")=" ^TMP(""IBCNSVP"",$J)"
 .S ^SD(409.61,VALM,"FNL")="D EXITP^IBJTNB"
 .S ^SD(409.61,VALM,"HDR")="D HDRP^IBJTNB"
 .S ^SD(409.61,VALM,"HLP")="D HELPP^IBJTNB"
 .S ^SD(409.61,VALM,"INIT")="D INITP^IBJTNB"
 .S DA=VALM,DIK="^SD(409.61," D IX1^DIK K DA,DIK
 .W "Filed."
 ;
 G ^IBJYL4
