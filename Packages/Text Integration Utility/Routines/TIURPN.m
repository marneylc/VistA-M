TIURPN ; SLC/JER - QUICK Review BY PATIENT ;2/28/01
 ;;1.0;TEXT INTEGRATION UTILITIES;**100**;Jun 20, 1997
EN(TIUCLASS,DFN) ; Entry point for build code
 N DIRUT,DTOUT,DUOUT,TIUI,SCREEN,STATUS,TIUTYP,TIUSTAT,TIUEDFLT,TIUDCL
 N TIUDPRMT,TIUPICT,TIUOUT
 K DIROUT
 S TIUEDT=$$FMADD^XLFDT(DT,$S($D(^DPT(DFN,.1))'>0:-180,1:-30))
 S TIULDT=+$$NOW^XLFDT
 W !,"Searching for the documents."
 D BUILD(TIUCLASS,DFN,TIUEDT,TIULDT)
 Q
BUILD(CLASS,DFN,EARLY,LATE) ; Build List
 N TIUCNT,TIUDT,TIUI,TIUJ,TIUK,TIUP,TIUQ,TIUDA,TIUREC
 N TIUT,TIUTP,XREF,TIUS,TIUPREF,TIUPICK
 S (TIUK,VALMCNT)=0
 K ^TMP("TIUR",$J),^TMP("TIURIDX",$J)
 S EARLY=9999999-+$G(EARLY),LATE=9999999-+$G(LATE)
 S TIUJ=LATE
 S TIUPICK=+$O(^ORD(101,"B","TIU ACTION SELECT LIST ELEMENT",0))
 F  S TIUJ=$O(^TIU(8925,"APTCL",DFN,CLASS,TIUJ)) Q:+TIUJ'>0!(+TIUJ>EARLY)  D
 . S TIUDA=0
 . F  S TIUDA=$O(^TIU(8925,"APTCL",DFN,CLASS,TIUJ,TIUDA)) Q:+TIUDA'>0  D
 . . D ADDELMNT(TIUDA,.TIUCNT)
 S ^TMP("TIUR",$J,0)=+$G(TIUCNT)_U_"ALL^APT^"_DFN
 S ^TMP("TIUR",$J,0)=^TMP("TIUR",$J,0)_U_$P(^DPT(DFN,0),U)
 S ^TMP("TIUR",$J,"CLASS")=TIUCLASS
 S ^TMP("TIUR",$J,"#")=TIUPICK_"^1:"_+$G(TIUCNT)
 I $D(VALMHDR)>9 D HDR^TIURH
 S VALMCNT=+$G(TIUCNT)
 I +$G(TIUCNT)'>0 D
 . S ^TMP("TIUR",$J,1,0)="",VALMCNT=2
 . S ^TMP("TIUR",$J,2,0)="     No records found to satisfy search criteria."
 Q
ADDELMNT(DA,TIUCNT) ; Add each element to the list
 N DIC,DIQ,DR,TIUR,PT,MOM,ADT,DDT,LCT,AUT,AMD,EDT,SDT,XDT,RMD,TIULST4
 N TIUP,TIUREC,TIUD0,TIUD12,TIUD13,TIUD15,TIULI,STATX,DOC,IDKIDFLG
 I '$D(^TIU(8925,DA,0)) Q
 I $G(^TMP("TIUR",$J,2,0))="     No records found to satisfy search criteria." D
 . K ^TMP("TIUR",$J,2),^TMP("TIUR",$J,"IDX",2),^TMP("TIUR",$J,"IDX",1) S TIUCNT=0
 S TIUD0=$G(^TIU(8925,+DA,0)),TIUD12=$G(^TIU(8925,+DA,12))
 S TIUD13=$G(^TIU(8925,+DA,13)),TIUD15=$G(^TIU(8925,+DA,15))
 I +TIUD0=81,(+$P(TIUD0,U,5)>5) Q
 S DOC=$$PNAME^TIULC1(+TIUD0)
 I DOC="Addendum" S DOC=DOC_" to "_$$PNAME^TIULC1(+$G(^TIU(8925,+$P(TIUD0,U,6),0)))
 S PT=$$NAME^TIULS($$PTNAME^TIULC1($P(TIUD0,U,2)),"LAST,FI MI")
 S TIULI=$E(PT),IDKIDFLG=1
 I +$O(^TIU(8925,"DAD",+DA,0)),$$HASADDEN^TIULC1(DA,IDKIDFLG) S PT="+ "_PT ;**100**
 S TIUP=$$URGENCY(+DA)
 S:TIUP=1 PT=$S(PT["+":"*",1:"* ")_PT
 S TIULST4=$E($P($G(^DPT(+$P(TIUD0,U,2),0)),U,9),6,9)
 S TIULST4="("_TIULI_TIULST4_")"
 S ADT=$$DATE^TIULS($P(TIUD0,U,7),"MM/DD/YY")
 S DDT=$$DATE^TIULS($P(TIUD0,U,8),"MM/DD/YY")
 S AMD=$$PERSNAME^TIULC1($P(TIUD12,U,8)) S:AMD="UNKNOWN" AMD=""
 S AUT=$$PERSNAME^TIULC1($P(TIUD12,U,2)) S:AUT="UNKNOWN" AUT=""
 S AMD=$$NAME^TIULS(AMD,"LAST,FI MI")
 S AUT=$$NAME^TIULS(AUT,"LAST,FI MI")
 S EDT=$$DATE^TIULS($P(TIUD13,U),"MM/DD/YY")
 S SDT=$S(+$P(TIUD15,U,7):+$P(TIUD15,U,7),+$P(TIUD0,U,5)'<7:+$P(TIUD15,U),1:"")
 S SDT=$$DATE^TIULS(SDT,"MM/DD/YY")
 S STATX=$P($G(^TIU(8925.6,+$P(TIUD0,U,5),0)),U)
 S TIUCNT=+$G(TIUCNT)+1
 S TIUREC=$$SETFLD^VALM1(TIUCNT,"","NUMBER")
 S TIUREC=$$SETFLD^VALM1(PT,TIUREC,"PATIENT NAME")
 S TIUREC=$$SETFLD^VALM1(TIULST4,TIUREC,"LAST I/LAST 4")
 S TIUREC=$$SETFLD^VALM1(DOC,TIUREC,"DOCUMENT TYPE")
 S TIUREC=$$SETFLD^VALM1(EDT,TIUREC,"REF DATE")
 S TIUREC=$$SETFLD^VALM1(SDT,TIUREC,"SIG DATE")
 S TIUREC=$$SETFLD^VALM1($$LOWER^TIULS(STATX),TIUREC,"STATUS")
 S TIUREC=$$SETFLD^VALM1(AUT,TIUREC,"AUTHOR")
 S TIUREC=$$SETFLD^VALM1(AMD,TIUREC,"COSIGNER")
 S ^TMP("TIUR",$J,TIUCNT,0)=TIUREC
 S ^TMP("TIUR",$J,"IDX",TIUCNT,TIUCNT)="" W:TIUCNT#10'>0 "."
 S ^TMP("TIURIDX",$J,TIUCNT)=TIUCNT_U_DA
 S VALMCNT=TIUCNT
 Q
CLEAN ; Clean up your mess!
 K ^TMP("TIUR",$J),^TMP("TIURIDX",$J) D CLEAN^VALM10
 K VALMY
 Q
URGENCY(TIUDA) ; What is the urgency of the current document
 N TIUY,TIUD0,TIUDSTAT,TIUDURG
 S TIUD0=$G(^TIU(8925,+TIUDA,0)),TIUDSTAT=$P(TIUD0,U,5)
 S TIUDURG=$P(TIUD0,U,9)
 S TIUY=$S(TIUDSTAT<7:$S(TIUDURG="P":1,1:2),1:3)
 Q TIUY
