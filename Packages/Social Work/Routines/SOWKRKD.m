SOWKRKD ;B'HAM ISC/SAB-Routine to delete social worker from SW-Position file ; 16 Dec 93 / 2:34 PM [ 08/05/94  8:02 AM ]
 ;;3.0; Social Work ;**17,31,35**;27 Apr 93
 S DIC("S")="I $D(^VA(200,+Y,654)),$P(^VA(200,+Y,654),""^"")"
 S DIC="^VA(200,",DIC("A")="WHAT WORKER TO DELETE ? ",DIC(0)="AQEM" D ^DIC G:"^"[X Q S DA=+Y K DIC
 D WAIT^DICD I $D(^SOWK(650,"W",DA)) W *7,!,"WORKER HAS CASES ASSIGNED, MUST REPLACE WITH ANOTHER WORKER BEFORE DELETING !",! G Q
 I $D(^VA(200,"ASWC",DA)) W *7,!,"WORKER IS IDENTIFIED AS SUPERVISOR, PLEASE REPLACE WITH ANOTHER SUPERVISOR !",! G Q
OC F Q=0:0 W !,"ARE YOU SURE YOU WANT TO DELETE THIS WORKER" S %=2 D YN^DICN Q:%  I %Y["?" D YN^SOWKHELP
 G:%=2!(%=-1) Q D DEL^SOWKNEW W *7," <WORKER DELETED> "
Q K %,%Y,Q,DIC,X,DA,Y,I,SW,DR,DIK
 Q
PRI ;LIST OF SOCIAL WORKERS
DEV ;
 K ^TMP($J),%ZIS,IOP,ZTSK S SOWKION=ION,%ZIS="QM",%ZIS("B")="" D ^%ZIS K %ZIS I POP S IOP=SOWKION D ^%ZIS K IOP,SOWKION G CLO
 K SOWKION I $D(IO("Q")) S ZTDESC="LIST OF SOCIAL WORKERS",ZTRTN="EN^SOWKRKD" K IO("Q") D ^%ZTLOAD W:$D(ZTSK) !,"LIST TO PRINT AT SELECTED TIME" K ZTSK G CLO
EN S PG=0,OUT=0,%H=$H D YX^%DTC S TD=$P(Y,"@")_" "_$P(Y,"@",2)
 F I=0:0 S I=$O(^VA(200,"ASWB",I)) Q:'I  I $P(^VA(200,I,654),"^"),$P(^(654),"^",2),+$P(^(654),"^",3),$P(^(654),"^",5) D OK
 D HDR F I=0:0 S I=$O(^TMP($J,I)) Q:'I!(OUT=1)  U IO D CHK Q:OUT=1  W !,$J($P(^TMP($J,I,0),"^",3),3),?8,$P(^(0),"^"),?40,$P(^(0),"^",2)
CLO I $E(IOST)["C",('$G(OUT)) R !,"Press <RETURN> to continue: ",SWXX:DTIME K SWXX W @IOF
 W ! W:$E(IOST)'["C" @IOF D ^%ZISC K IOP,POP,OUT,II,%H,TD,I,L,Q,^TMP($J),PG D:$D(ZTSK) KILL^%ZTLOAD
 Q
HDR Q:OUT=1
 U IO S PG=PG+1 W:$Y!(PG>1) @IOF W "WORKERS LIST",?30,TD,?70,"PAGE: "_PG,!,"NUMBER",?8,"SOCIAL WORKER",?40,"IMMEDIATE SUPERVISOR",! F II=1:1:IOM-1 W "_"
 Q
OK S ^TMP($J,+$P(^VA(200,I,654),"^",3),0)=$P(^VA(200,I,0),"^")_"^"_$P(^VA(200,$P(^VA(200,I,654),"^",2),0),"^")_"^"_$P(^VA(200,I,654),"^",3)
 Q
CHK ;checks for end of page
 Q:($Y+5)'>IOSL
 N SWXX
 I $E(IOST)["C" R !,"Press <RETURN> to continue: ",SWXX:DTIME I SWXX["^" S OUT=1 W @IOF Q
 D HDR Q
