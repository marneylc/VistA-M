RMPRPIUF ;HINCIO/ODJ - APIs for Current Stock file 661.7 ;3/8/01
 ;;3.0;PROSTHETICS;**61**;Feb 09, 1996
 Q
 ;*****
 ;
 ; Inputs:
 ;    RMPR - an array with the following elements...
 ;    RMPR("STATION IEN")  - Station ien (ptr ^DIC(4,)
 ;    RMPR("LOCATION IEN") - Location ien (ptr ^RMPR(661.5,)
 ;    RMPR("VENDOR IEN")   - Vendor ien
 ;    RMPR("HCPCS")        - HCPCS code (eg E0111)
 ;    RMPR("ITEM")         - HCPCS Item number (eg 1)
 ;    RMPR("ISSUED QTY")   - Quantity Issued
 ;    RMPR("ISSUED VALUE") - Issue Value
 ;
 ;    RMPRERR - function return...
 ;               0 - no errors
 ;               1 - null Station ien input
 ;               2 - null Location ien input
 ;               3 - null HCPCS code input
 ;               4 - null Item input
 ;               5 - issued qty not greater than 0
 ;               6 - problem with 661.7 file
 ;               7 - null Vendor input
 ;               8 - problem with 661.6 file
FIFO(RMPR) ;
 N RMPRERR,RMPRK,RMPROLD,RMPREOF,RMPR7,RMPR7I,RMPRIBAL,RMPRVBAL
 N RMPRUVAL,RMPRI,RMPR6,RMPR6I,RMPR7U
 S RMPRERR=0
 S RMPRK("STATION")=$G(RMPR("STATION IEN"))
 I RMPRK("STATION")="" S RMPRERR=1 G FIFOX
 S RMPRK("LOCATION")=$G(RMPR("LOCATION IEN"))
 I RMPRK("LOCATION")="" S RMPRERR=2 G FIFOX
 S RMPRK("HCPCS")=$G(RMPR("HCPCS"))
 I RMPRK("HCPCS")="" S RMPRERR=3 G FIFOX
 S RMPRK("ITEM")=$G(RMPR("ITEM"))
 I RMPRK("ITEM")="" S RMPRERR=4 G FIFOX
 I $G(RMPR("VENDOR IEN"))="" S RMPRERR=7 G FIFOX
 I '+$G(RMPR("ISSUED QTY")) S RMPRERR=5 G FIFOX
 S RMPRIBAL=RMPR("ISSUED QTY") ; init issued qty. balance
 S RMPRVBAL=+$G(RMPR("ISSUED VALUE")) ; init issue value balance
 S RMPRUVAL=RMPRVBAL/RMPRIBAL ; unit cost per issued item
 ;
 ; Lock 661.7
 L +^RMPR(661.7,"XSLHIDS",RMPR("STATION IEN"),RMPR("LOCATION IEN"),RMPR("HCPCS"),RMPR("ITEM"))
 ;
 ; Primary loop on all records for Stn, Loc, HCPCS and Item until stock
 ; depleted by the issued amount
FIFOA S RMPRERR=$$NEXT^RMPRPIXE(.RMPRK,"XSLHIDS","",1,.RMPROLD,.RMPREOF)
 I RMPRERR S RMPRERR=6 G FIFOU
 I RMPREOF G FIFOU
 I RMPRK("ITEM")'=RMPROLD("ITEM") G FIFOU
 I RMPRK("HCPCS")'=RMPROLD("HCPCS") G FIFOU
 I RMPRK("LOCATION")'=RMPROLD("LOCATION") G FIFOU
 I RMPRK("STATION")'=RMPROLD("STATION") G FIFOU
 K RMPR7 S RMPR7("IEN")=RMPRK("IEN")
 S RMPRERR=$$GET^RMPRPIX7(.RMPR7) ; read in current stock rec.
 I RMPRERR S RMPRERR=6 G FIFOU
 K RMPR7I
 S RMPRERR=$$ETOI^RMPRPIX7(.RMPR7,.RMPR7I)
 I RMPRERR S RMPRERR=6 G FIFOU
 ;
 ; 2nd Loop on 661.6 transactions so as to match vendor
 S RMPRI=""
FIFOB S RMPRI=$O(^RMPR(661.6,"XHDS",RMPR7I("HCPCS"),RMPR7I("DATE&TIME"),RMPR7I("SEQUENCE"),RMPRI))
 I RMPRI="" G FIFOA
 K RMPR6 S RMPR6("IEN")=RMPRI S RMPRERR=$$GET^RMPRPIX6(.RMPR6)
 I RMPRERR S RMPRERR=8 G FIFOU
 S RMPRERR=$$VNDIEN^RMPRPIX6(.RMPR6)
 I RMPRERR S RMPRERR=8 G FIFOU
 I RMPR6("VENDOR IEN")'=RMPR("VENDOR IEN") G FIFOB
 K RMPR7U
 S RMPR7U("IEN")=RMPR7("IEN")
 S RMPR7U("QUANTITY")=RMPR7("QUANTITY")
 S RMPR7U("VALUE")=RMPR7("VALUE")
 ;
 ; If issued balance less than on-hand quantity then update
 ; the on-hand record
 I RMPRIBAL<RMPR7U("QUANTITY") D
 . S RMPR7U("QUANTITY")=RMPR7U("QUANTITY")-RMPRIBAL
 . S RMPR7U("VALUE")=RMPR7U("VALUE")-RMPRVBAL
 . S RMPRERR=$$UPD^RMPRPIX7(.RMPR7U,)
 . S RMPRIBAL=0
 . Q
 ;
 ; If issued balance not less than on-hand quantity then delete
 ; the on-hand record
 E  D
 . S RMPRIBAL=RMPRIBAL-RMPR7U("QUANTITY")
 . S RMPRVBAL=RMPRVBAL-($J(RMPR7U("QUANTITY")*RMPRUVAL,0,2))
 . S RMPRERR=$$DEL^RMPRPIX7(.RMPR7U)
 . Q
 I RMPRERR S RMPRERR=6 G FIFOU
 G:RMPRIBAL FIFOB ; next transaction if still got issue balance
 ;
 ; exit points
FIFOU L -^RMPR(661.7,"XSLHIDS",RMPR("STATION IEN"),RMPR("LOCATION IEN"),RMPR("HCPCS"),RMPR("ITEM"))
FIFOX Q RMPRERR
