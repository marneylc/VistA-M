FSCUX ;SLC/STAFF-NOIS Utilities Expand ;8/25/94  16:17
 ;;1.1;NOIS;;Sep 06, 1998
 ;
EXPAND(CHOICE,OK,DEFAULT) ; from FSCLMPC, FSCLMPD, FSCOPT, FSCRPTS
 N CNT,DIC,Y K DIC,Y S OK=1
 S CHOICE=$S($L($G(DEFAULT)):DEFAULT,1:"BRIEF")
 D LOOKUP^FSCULOOK("FTYPE",.CHOICE,"AEMOQZ",.OK,"I '$P(^(0),U,6)")
 I $D(DUOUT)!$D(DTOUT) S OK=0,CHOICE=$G(CHOICE) Q
 D OTHER(.CHOICE,.OK)
 Q
 ;
OTHER(CHOICE,OK) ; from FSCRPTS
 N CNT,D,DIC,FIELD,FORMAT,TYPE,Y K DIC,Y S OK=1
 S CHOICE=$P(CHOICE,U,2),TYPE=CHOICE(0)
 D
 .I $P(TYPE,U,2)="EXECUTE" D  Q
 ..D LOOKUP^FSCULOOK("FORMAT",.FORMAT,"AEMOQ",.OK,"I $D(^(1))")
 ..S CHOICE("F")=FORMAT,FORMAT=+FORMAT
 ..I OK D
 ...S CNT=0 F  S CNT=$O(^FSC("FORMAT",FORMAT,2,CNT)) Q:CNT<1  S FIELD=+^(CNT,0) D
 ....S CHOICE(CNT)=^FSC("FLD",FIELD,0)
 .I $P(TYPE,U,3) D  Q
 ..D LOOKUP^FSCULOOK("FORMAT",.FORMAT,"AEMOQ",.OK)
 ..S FORMAT=+FORMAT
 ..I OK D
 ...S CNT=0 F  S CNT=$O(^FSC("FORMAT",FORMAT,2,CNT)) Q:CNT<1  S FIELD=+^(CNT,0) D
 ....S CHOICE(CNT)=^FSC("FLD",FIELD,0)
 .I $P(TYPE,U,5) D  Q
 ..S DIC=7107.2,DIC(0)="AEMOQZ",DIC("A")="Select Field: "
 ..F CNT=1:1 D ^DIC Q:Y<1  S CHOICE(CNT)=Y(0)
 ..K DIC
 .I $P(TYPE,U,2)="FM" D  Q
 ..S DIC="^DIPT(",DIC(0)="AEOQ",DIC("A")="Select Print Template: ",D="F7100"
 ..D IX^DIC K DIC S:Y<0 OK=0
 ..S CHOICE("T")="["_$P(Y,U,2)_"]"
 I $P(TYPE,U,2)="STAT" D
 .N DIC,Y K CHOICE("COLLATE"),DIC,Y,^TMP("FSC STATS",$J)
 .I '$O(CHOICE(0)) S OK=0 W !,"No fields selected.",$C(7),! H 1 Q
 .I '$O(CHOICE(1)) Q
 .S DIC=7107.2,DIC(0)="AEMOQZ",DIC("A")="(Optional) Select a Field to Collate your fields with: "
 .D ^DIC K DIC Q:Y<1
 .S CNT=0 F  S CNT=$O(CHOICE(CNT)) Q:CNT<1  I Y(0)=CHOICE(CNT) S CHOICE("COLLATE")=CNT
 .I '$D(CHOICE("COLLATE")) S CNT=1+$O(CHOICE("A"),-1),CHOICE(CNT)=Y(0),CHOICE("COLLATE")=CNT
 I $P(TYPE,U,2)="EXTRACT" S CHOICE("E")=""
 S CHOICE=$$CHOICE($P(TYPE,U,2))
 Q
 ;
CHOICE(CHOICE) ; $$(choice) -> single letter
 Q $S(CHOICE="BRIEF":"B",CHOICE="DETAIL":"D",CHOICE="STAT":"S",CHOICE="FIELD":"C",CHOICE="FORMAT":"C",CHOICE="FM":"FM",1:"F")
