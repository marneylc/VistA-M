PXSCH1 ;ISL/JVS - SCHEDULING REDESIGN PROCEDURES ;6/11/96
 ;;1.0;PCE PATIENT CARE ENCOUNTER;;Aug 12, 1996
 ;  Variable List
 ;
 ;  PXS(***)   The various pieces of data to move
 ;  PXS1..PXSn Scratch Variables
 ;  PXSCNT     Counter- Number of a particular procedure
 ;  PXSCS0     ^TMP("SCCVEVT",$J,"CS",0) node
 ;  PXSCSI0    ^TMP("SCCVEVT",$J,"CS",xx,0) node
 ;  PXSCISPR   ^TMP("SCCVEVT",$J,"CS",xx,"PR") node
 ;  PXSOE      ^TMP("SCCVEVT",$J,"SDOE",xx,0) node
 ;  PXSDOE     IEN on the $O(^TMP("SCCVEVT",$J,"SDOE",0) node
 ;  PXSDVI     IEN on the $O(^TMP("SCCVEVT",$J,"CS",0) node
 ;  PXSDX      Pointer to the Diagnosis
 ;  PXSIEN     Scratch Variable for $Ordering
 ;  PXSINDX    increment subscripts in ^TMP("PXK" global
 ;  PXSPR      Pointer to the main Provider
 ;
 ;
EN1 ;Entry point
 N PXS1,PXS2,PXS3,PXS4,PXSCNT,PXSCS0,PXSCSI0,PXSCSIPR,PXSDOE,PXSDVI
 N PXSDX,PXSIEN,PXSINDX,PXSOE,PXSPR,CPTNOD0,CPTNOD12,CPTNOD8
 N PXSCPT,PXSCPTQ,PXSDX,PXSINDX,PXSPNN,PXSPNNN,PXSPR,PRVNOD0,PRVNOD12
 N PXSCT,PXSPRV,DXN800,DXN802,DXNOD0,DXNOD12
 N PXSZPN,PXSFILE
 ;
CHECK ;Check on variables and/or environment
 S PXS1=12 Q:$G(PXS1)'[SCCVEVT
 Q:$G(SCCVORG)'=2
SET ;Set up needed variables
 S PXSDVI=$O(^TMP("SCCVEVT",$J,"CS",0))
 S PXSDOE=$O(^TMP("SCCVEVT",$J,"SDOE",0))
LOCLIZE ; Set the tmp global into local array for speed
 S PXSCS0=$G(^TMP("SCCVEVT",$J,"CS",0))
 S PXSCSI0=$G(^TMP("SCCVEVT",$J,"CS",PXSDVI,0))
 S PXSCSIPR=$G(^TMP("SCCVEVT",$J,"CS",PXSDVI,"PR"))
 S PXSOE=$G(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,0))
ARRAY ;Set all of the data into variables
 S PXS("DATE")=$P(PXSCS0,"^")
 S PXS("PATIENT")=$P(PXSCS0,"^",2)
 S PXS("DIVISION")=$P(PXSCS0,"^",3)
 S PXS("STOP CODE")=$P(PXSCSI0,"^")
 S PXS("CLINIC")=$P(PXSCSI0,"^",3)
 S PXS("ELIGIBILITY")=$P(PXSCSI0,"^",4)
 S PXS("OUT PAT ENCOU")=PXSDOE
 S PXS("PROCEDURE",1)=$P(PXSCSIPR,"^",1)
 S PXS("PROCEDURE",2)=$P(PXSCSIPR,"^",2)
 S PXS("PROCEDURE",3)=$P(PXSCSIPR,"^",3)
 S PXS("PROCEDURE",4)=$P(PXSCSIPR,"^",4)
 S PXS("PROCEDURE",5)=$P(PXSCSIPR,"^",5)
 S PXS("STOP CODE ORIG")=$P(PXSOE,"^",3)
 S PXS("VISIT")=$P(PXSOE,"^",5)
 Q:$G(PXS("VISIT"))'>0
 S PXS("PARENT ENCOUNTER")=$P(PXSOE,"^",6)
 ;
DX ;Set Diagnosis array
 I $D(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"DX")) D
 .S PXSIEN=0 F  S PXSIEN=$O(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"DX",PXSIEN)) Q:PXSIEN=""  D
 ..S PXS("DIAGNOSIS",PXSIEN)=$G(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"DX",PXSIEN,0))
 ;
DOC ;Set Provider array
 I $D(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"PR")) D
 .S PXSIEN=0 F  S PXSIEN=$O(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"PR",PXSIEN)) Q:PXSIEN=""  D
 ..S PXS("PROVIDER",PXSIEN)=$G(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"PR",PXSIEN,0))
CLASS ;Set Classification array
 I $D(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"CL")) D
 .S PXSIEN=0 F  S PXSIEN=$O(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"CL",PXSIEN)) Q:PXSIEN=""  D
 ..S PXS("CLASSIFICATION",$P($G(^TMP("SCCVEVT",$J,"SDOE",PXSDOE,"CL",PXSIEN,0)),"^",1))=""
 ;
COUNT ;Count up the total number of procedures
 N PXS1,PXS2,PXS3,PXS4,PXSCNT
 S (PXS1,PXS2,PXS3,PXS4)=0,PXSCNT=0
 F  S PXS1=$O(PXS("PROCEDURE",PXS1)) Q:PXS1=""  D
 .S PXS4=$G(PXS("PROCEDURE",PXS1))
 .S PXS2="" F  S PXS2=$O(PXS("PROCEDURE",PXS2)) Q:PXS2=""  D
 ..I $G(PXS("PROCEDURE",PXS2))=PXS4 S PXSCNT=PXSCNT+1
 .I PXS4'="" S PXS("PROC",PXS4)=PXSCNT S PXSCNT=0
 ;
 I $D(PXS("DIAGNOSIS")) S PXSDX=+$G(PXS("DIAGNOSIS",$O(PXS("DIAGNOSIS",0))))
 I $D(PXS("PROVIDER")) S PXSPR=+$G(PXS("PROVIDER",$O(PXS("PROVIDER",0))))
 S PXSINDX=0
 D CPT^PXSCH2,PRV^PXSCH3,DIAG^PXSCH4
 D EN1^PXKMAIN
EXIT ;
 K PXS,PXSPNN,PXSPNNN,PXKCO
 K ^TMP("PXK",$J)
 K %DD,%DT,%W,%Y,D,D0,DI,DIC,DQ,X,S,DX
 Q
