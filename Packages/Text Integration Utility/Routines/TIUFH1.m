TIUFH1 ; SLC/MAM - LM Template H (DDEF Hierarchy) Actions Expand/Collapse, Jump to DDEF (EXPDEF(ASK,FILEDA)), EXPAND1(EINFO), COLLAPSE(EINFO) ;10/2/97  21:44
 ;;1.0;TEXT INTEGRATION UTILITIES;**11**;Jun 20, 1997
 ;
EXPCOLL ; Template A Action Expand/Collapse
 N INFO,OXPDLCNT,MISSITEM,FILEDA,MSG,TIUFXNOD,DTOUT,DIRUT,DIROUT
 S VALMBCK="R",TIUFXNOD=$G(XQORNOD(0))
 D EN^VALM2(TIUFXNOD,"SO") I '$O(VALMY(0)) S VALMBCK="" G EXPCX
 S INFO=$G(^TMP("TIUF1IDX",$J,$O(VALMY(0)))) I 'INFO W !!," Missing List Manager Data; See IRM",! D PAUSE^TIUFXHLX S VALMBCK="Q" G EXPCX
 S FILEDA=$P(INFO,U,2)
 D PARSE^TIUFLLM(.INFO) S OXPDLCNT=INFO("XPDLCNT") ;Old XPDLCNT
 I OXPDLCNT D COLLAPSE(.INFO) S VALMCNT=VALMCNT-OXPDLCNT G EXPCX
 I '$O(^TIU(8925.1,FILEDA,10,0)) S VALMBCK="",MSG=" Entry has no Items to Expand/Collapse" W !!,MSG,! H 1 G EXPCX
 S MISSITEM=$$MISSITEM^TIUFLF4(FILEDA) I MISSITEM W !!," Can't Expand/Collapse: File Entry "_FILEDA_" Has Nonexistent Item "_MISSITEM_"; See IRM.",! D PAUSE^TIUFXHLX S VALMBCK="" G EXPCX
 D EXPAND1(.INFO)
 S VALMCNT=VALMCNT+INFO("XPDLCNT")
 I (+INFO+INFO("XPDLCNT"))>(VALMBG+VALM("LINES")-1) S VALMBG=+INFO
EXPCX I $D(DTOUT) S VALMBCK="Q"
 Q
 ;
EXPDEF(ASK,FILEDA) ; If ASK, Template H action Jump to Document Def; else Expand to show entry FILEDA
 ; Assumes Docmt Def except Shared Components have at most 1 parent
 ; Requires ASK=1 to ask which entry to jump to, = 0 to not ask.
 ; Requires FILEDA if ASK = 0.
 N DIC,X,Y,INFO,NODE0,ORPHAN,PARENT,MSG,OXPDLCNT,TIUJ,ENTRYNO
 N EINFO,PFILEDA,MISSITEM,TIUFXNOD,MSG1,LINENO,DTOUT,DIRUT,DIROUT
 S TIUFXNOD=$G(XQORNOD(0))
 I 'ASK G NOASK
 N FILEDA S VALMBCK="R"
 D FULL^VALM1
 S DIC=8925.1,DIC(0)="AEMNQ"
ASK K PARENT,Y,MSG D ^DIC I Y=-1 G EXPDX
 S FILEDA=+Y,NODE0=^TIU(8925.1,FILEDA,0)
 S ORPHAN=$$ORPHAN^TIUFLF4(FILEDA,NODE0,.PARENT)
 I $P(NODE0,U,4)="O" S MSG=" Objects are not in the Hierarchy: Use SORT Option"
 I $P(NODE0,U,10) S MSG=" Shared Components can occur more than once in the hierarchy; Can't Jump to",MSG1="them.  To find them, use SORT Option.  Edit/View shows their parents."
 I ORPHAN="YES" S MSG=" Orphans are not in the Hierarchy: Use SORT Option"
 I $D(MSG) W !!,MSG,! W:$D(MSG1) MSG1 K MSG,MSG1 G ASK
NOASK S INFO=^TMP("TIUF1IDX",$J,1) D PARSE^TIUFLLM(.INFO)
 I 'ASK S NODE0=^TIU(8925.1,FILEDA,0),ORPHAN=$$ORPHAN^TIUFLF4(FILEDA,NODE0,.PARENT)
 S OXPDLCNT=INFO("XPDLCNT") ;Original XPDLCNT
 D COLLAPSE(.INFO) S VALMCNT=VALMCNT-OXPDLCNT
 F TIUJ=$O(PARENT(1000),-1):-1:1 D  I MISSITEM G EXPDX
 . S ENTRYNO=$O(^TMP("TIUF1IDX",$J,"DAF",PARENT(TIUJ),0))
 . S EINFO=^TMP("TIUF1IDX",$J,ENTRYNO)
 . D PARSE^TIUFLLM(.EINFO) S PFILEDA=$P(EINFO,U,2)
 . S MISSITEM=$$MISSITEM^TIUFLF4(PFILEDA)
 . I MISSITEM W !! W $S(ASK:" Can't Jump",1:"Can't expand to show "_$P(NODE0,U)),": File Entry "_PFILEDA_" Has Nonexistent Item "_MISSITEM_"; See IRM",! D PAUSE^TIUFXHLX Q
 . D EXPAND1(.EINFO) S VALMCNT=VALMCNT+EINFO("XPDLCNT")
 . Q
 S LINENO=$O(^TMP("TIUF1IDX",$J,"DAF",PARENT(0),0))
 I ASK,LINENO<VALMBG!(LINENO>(VALMBG+VALM("LINES")-1)) S VALMBG=LINENO
EXPDX I ASK D RESET^TIUFXHLX S VALMBCK="R" I $D(DTOUT) S VALMBCK="Q"
 Q
 ;
COLLAPSE(EINFO) ; Collapse ENTRYNO
 ; Requires EINFO array, where EINFO = ^TMP("TIUFIDX,$J,ENTRYNO), and
 ;where EINFO array is as set in PARSE^TIUFLLM(EINFO).
 ; Requires TIUFTMPL.
 ; Updates array EINFO; Does NOT update VALMCNT.
 I ($D(EINFO)'=11) G COLLX
 I 'EINFO("XPDLCNT") G COLLX
 D UPDATE^TIUFLLM1(TIUFTMPL,-EINFO("XPDLCNT"),+EINFO,.EINFO)
COLLX ;
 Q
 ;
EXPAND1(EINFO) ; Set items of List Manager array entry ENTRYNO into
 ;LM array (ie., expands entry); Updates Plus in front of ENTRYNO.
 ; Does NOT update IN USE Column.
 ; Requires EINFO array, where EINFO = ^TMP("TIUFIDX,$J,ENTRYNO), and
 ;where EINFO array is as set in PARSE^TIUFLLM(EINFO).
 ; Requires TIUFTMPL.
 ; Requires TIUFWHO, set in Options TIUF/A/C/H EDIT/SORT/CREATE DDEFS CLIN/MGR/NATL.
 ; Updates array EINFO.
 ; Must check that items exist in file BEFORE calling EXPAND1
 N OLDLNO,LINENO,TIUREC
 S (OLDLNO,LINENO)=+EINFO
 D BUFITEMS^TIUFLT(TIUFTMPL,.EINFO,.LINENO)
 ;If no items, update +, QUIT:
 I LINENO=OLDLNO Q:TIUFTMPL="C"  S TIUREC=^TMP("TIUF1",$J,+EINFO,0),TIUREC=$$PLUSUP^TIUFLLM(.EINFO,TIUREC),^TMP("TIUF1",$J,+EINFO,0)=TIUREC Q
 ; Set Buffer items into LM Template array, update entry being expanded:
 D UPDATE^TIUFLLM1(TIUFTMPL,LINENO-OLDLNO,OLDLNO,.EINFO)
EXPAX ;
 Q
 ;
