LRMLPRG ;BPFO/DTG - PURGE PGM FOR NTRT PROCESS ;02102016
 ;;5.2;LAB SERVICE;**468**;FEB 10 2016;Build 64
 ;
 ;purge routine for the audit date/time multiple in file 60
EN ; enter here from [LR NTRT EDIT PURGE]
 N ZTDESC,ZTSAVE,ZTRTN,ZTDTH,ZTIO,ZTSK,LRDUZ
 S LRDUZ=DUZ,ZTSAVE("LRDUZ")=""
 S ZTDESC="LR NDS AUDITS PURGE"
 S ZTRTN="QUEA^LRMLPRG",ZTDTH=$$NOW^XLFDT,ZTIO=""
 D ^%ZTLOAD W:$D(ZTSK) !,"Request Queued, #",ZTSK W !
 K ZTSK D HOME^%ZIS
 Q
 ;
CALL ; from task manager
 N ZTDESC,ZTSAVE,ZTRTN,ZTDTH,ZTSK,ZTIO
 S ZTDESC="LR NTRT EDITS PURGE"
 S ZTRTN="QUEA^LRMLPRG",ZTDTH=$$NOW^XLFDT
 D ^%ZTLOAD
 Q
 ;
QUEA ; walk ^LAB(60,,15 and trim older audits
 N DA,DIE,DR,A,LD,LT,B,PS,PURGEDAYS,PDT,LDT,DIDEL
 S U="^" I $G(DT)="" S DT=$$DT^XLFDT
 S B=$$SITE^VASITE,B=$P(B,U,1) I 'B G QDONE  ; not set up
 S PS=$O(^LAB(66.4,"B",B,0)) I PS="" G QDONE  ; 66.4 not set up
 S PURGEDAYS=$$GET1^DIQ(66.4,PS_",",.04)
 I PURGEDAYS=""!(+PURGEDAYS<1) S PURGEDAYS=220
 S PDT=DT-PURGEDAYS
 ; loop ^LAB(60 audit date/time multiple
 S LT=0
Q1 S LT=$O(^LAB(60,LT)) I 'LT G QDONE
 S LD=0
Q2 S LD=$O(^LAB(60,LT,15,LD)) I 'LD G Q1
 S A=$$GET1^DIQ(60.28,LD_","_LT,.01,"I") I A="" G Q2
 S LDT=$P(A,".",1) I LDT>PDT G Q2
 ; remove entry from file
 S DIDEL=60.28
 L +^LAB(60,LT,15,LD):30 I '$T G Q2
 S DA=LD,DA(1)=LT,DIE="^LAB(60,"_DA(1)_",15,",DR=".01///@"
 D ^DIE
 L -^LAB(60,LT,15,LD)
 G Q2
 ;
QDONE K DA,DIE,DR,A,LD,LT,B,PS,PURGEDAYS,PDT,LDT,DIDEL
 I $D(ZTQUEUED) S ZTREQ="@"
 Q
