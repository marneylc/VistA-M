IBXS21 ; ;12/12/16
 D DE G BEGIN
DE S DIE="^DPT(",DIC=DIE,DP=2,DL=2,DIEL=0,DU="" K DG,DE,DB Q:$O(^DPT(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,7) S:%]"" DE(2)=%
 I $D(^(.22)) S %Z=^(.22) S %=$P(%Z,U,5) S:%]"" DE(14)=% S %=$P(%Z,U,6) S:%]"" DE(27)=%
 I $D(^(.25)) S %Z=^(.25) S %=$P(%Z,U,1) S:%]"" DE(18)=% S %=$P(%Z,U,2) S:%]"" DE(20)=% S %=$P(%Z,U,3) S:%]"" DE(22)=% S %=$P(%Z,U,4) S:%]"" DE(24)=% S %=$P(%Z,U,5) S:%]"" DE(25)=% S %=$P(%Z,U,6) S:%]"" DE(26)=% S %=$P(%Z,U,8) S:%]"" DE(28)=%
 I $D(^(.311)) S %Z=^(.311) S %=$P(%Z,U,1) S:%]"" DE(5)=% S %=$P(%Z,U,3) S:%]"" DE(7)=% S %=$P(%Z,U,4) S:%]"" DE(9)=% S %=$P(%Z,U,5) S:%]"" DE(11)=% S %=$P(%Z,U,6) S:%]"" DE(12)=% S %=$P(%Z,U,7) S:%]"" DE(13)=% S %=$P(%Z,U,9) S:%]"" DE(15)=%
 I  S %=$P(%Z,U,15) S:%]"" DE(3)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 K X S X("FIELD")=DIFLD,X("FILE")=DP W "  ("_$$EZBLD^DIALOG(710,.X)_")" K X S X="" Q  ;**
TR Q:DV["K"&(DUZ(0)'="@")  R X:DTIME E  S (DTOUT,X)=U W $C(7)
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G A:DV["K"&(DUZ(0)'["@"),PR:$D(DE(DQ)) D W,TR
N I X="" G NKEY:$D(^DD("KEY","F",DP,DIFLD)),A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" I X?.ANP D SET^DIED I 'DDER G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) G:DV["*" AST^DIED D NOSCR^DIED S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
UNIQ I DV["U",$D(X),DIFLD=.01 K % M %=@(DIE_"""B"",X)") K %(DA) K:$O(%(0)) X
Z K DIC("S"),DLAYGO I $D(X),X'=U D:$G(DE(DW,"INDEX")) SAVEVALS G:'$$KEYCHK UNIQFERR^DIE17 S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) $C(7),"??" I $D(DB(DQ)) G Z^DIE17
 S X="?BAD"
QS S DZ=X D D,QQ^DIEQ G B
D S D=DIFLD,DQ(DQ)=DLB_U_DV_U_DU_U_DW_U_$P($T(@("X"_DQ))," ",2,99) Q
Y I '$D(DE(DQ)) D O G RD:"@"'[X,A:DV'["R"&(X="@"),X:X="@" S X=Y G N
PR S DG=DV,Y=DE(DQ),X=DU I $D(DQ(DQ,2)) X DQ(DQ,2) G RP
R I DG["P",@("$D(^"_X_"0))") S X=+$P(^(0),U,2) G RP:'$D(^(Y,0)) S Y=$P(^(0),U),X=$P(^DD(X,.01,0),U,3),DG=$P(^(0),U,2) G R
 I DG["V",+Y,$P(Y,";",2)["(",$D(@(U_$P(Y,";",2)_"0)")) S X=+$P(^(0),U,2) G RP:'$D(^(+Y,0)) S Y=$P(^(0),U) I $D(^DD(+X,.01,0)) S DG=$P(^(0),U,2),X=$P(^(0),U,3) G R
 X:DG["D" ^DD("DD") I DG["S" S %=$P($P(";"_X,";"_Y_":",2),";") I %]"" S Y=$S($G(DUZ("LANG"))'>1:%,'DIFLD:%,1:$$SET^DIQ(DP,DIFLD,Y))
RP D O I X="" S X=DE(DQ) G A:'DV,A:DC<2,N^DIE17
I I DV'["I",DV'["#" G RD
 D E^DIE0 G RD:$D(X),PR
 Q
SAVEVALS S @DIEZTMP@("V",DP,DIIENS,DIFLD,"O")=$G(DE(DQ)) S:$D(^("F"))[0 ^("F")=$G(DE(DQ))
 I $D(DE(DW,"4/")) S @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")=""
 E  K @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")
 Q
NKEY W:'$D(ZTQUEUED) "??  Required key field" S X="?BAD" G QS
KEYCHK() Q:$G(DE(DW,"KEY"))="" 1 Q @DE(DW,"KEY")
BEGIN S DNM="IBXS21",DQ=1
1 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=1 D X1 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X1 S:IBDR20'["21" Y="@41"
 Q
2 S DW="0;7",DV="F",DU="",DIFLD=.07,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C2^IBXS21"
 G RE
C2 G C2S:$D(DE(2))[0 K DB
 S X=DE(2),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
C2S S X="" G:DG(DQ)=X C2F1 K DB
 S X=DG(DQ),DIC=DIE
 D:($T(ADGRU^DGRUDD01)'="") ADGRU^DGRUDD01(DA)
C2F1 Q
X2 K:$L(X)>30!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
3 D:$D(DG)>9 F^DIE17,DE S DQ=3,DW=".311;15",DV="RSa",DU="",DIFLD=.31115,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C3^IBXS21"
 S DU="1:EMPLOYED FULL TIME;2:EMPLOYED PART TIME;3:NOT EMPLOYED;4:SELF EMPLOYED;5:RETIRED;6:ACTIVE MILITARY DUTY;9:UNKNOWN;"
 G RE
C3 G C3S:$D(DE(3))[0 K DB
 S X=DE(3),DIC=DIE
 X ^DD(2,.31115,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.311)):^(.311),1:"") S X=$P(Y(1),U,16),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.311)),DIV=X S $P(^(.311),U,16)=DIV,DIH=2,DIG=.31116 D ^DICR
 S X=DE(3),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X I "^3^9^"[$P(^DPT(DA,.311),U,15) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.311)):^(.311),1:"") S X=$P(Y(1),U,1),X=X S DIU=X K Y S X="" X ^DD(2,.31115,1,2,2.4)
 S X=DE(3),DIC=DIE
 I ($T(AVAFC^VAFCDD01)'="") S VAFCF=".31115;" D AVAFC^VAFCDD01(DA)
 S X=DE(3),DIC=DIE
 D EVENT^IVMPLOG(DA)
 S X=DE(3),DIIX=2_U_DIFLD D AUDIT^DIET
C3S S X="" G:DG(DQ)=X C3F1 K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.31115,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.311)):^(.311),1:"") S X=$P(Y(1),U,16),X=X S DIU=X K Y S X="" S DIH=$G(^DPT(DIV(0),.311)),DIV=X S $P(^(.311),U,16)=DIV,DIH=2,DIG=.31116 D ^DICR
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X I "^3^9^"[$P(^DPT(DA,.311),U,15) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.311)):^(.311),1:"") S X=$P(Y(1),U,1),X=X S DIU=X K Y S X="" X ^DD(2,.31115,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 I ($T(AVAFC^VAFCDD01)'="") S VAFCF=".31115;" D AVAFC^VAFCDD01(DA)
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
 I $D(DE(3))'[0!($G(^DD(DP,DIFLD,"AUDIT"))["y") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C3F1 Q
X3 Q
4 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=4 D X4 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X4 I $S(X']"":1,X=3:1,X=9:1,1:0) S Y="@41"
 Q
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW=".311;1",DV="FX",DU="",DIFLD=.3111,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C5^IBXS21"
 G RE
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIC=DIE
 X "S DGXRF=.3111 D ^DGDDC Q"
 S X=DE(5),DIC=DIE
 D EVENT^IVMPLOG(DA)
C5S S X="" G:DG(DQ)=X C5F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 D EVENT^IVMPLOG(DA)
C5F1 Q
X5 K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)<1) X I $D(X) D EM^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 S:X']"" Y="@41"
 Q
7 D:$D(DG)>9 F^DIE17,DE S DQ=7,DW=".311;3",DV="FX",DU="",DIFLD=.3113,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C7^IBXS21"
 G RE
C7 G C7S:$D(DE(7))[0 K DB
 S X=DE(7),DIC=DIE
 X "S DGXRF=.3113 D ^DGDDC Q"
C7S S X="" G:DG(DQ)=X C7F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
C7F1 Q
X7 K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)<1) X I $D(X) S DFN=DA D EM1^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 S:X']"" Y=.3116
 Q
9 D:$D(DG)>9 F^DIE17,DE S DQ=9,DW=".311;4",DV="FX",DU="",DIFLD=.3114,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C9^IBXS21"
 G RE
C9 G C9S:$D(DE(9))[0 K DB
 S X=DE(9),DIC=DIE
 X "S DGXRF=.3114 D ^DGDDC Q"
C9S S X="" G:DG(DQ)=X C9F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
C9F1 Q
X9 K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>30!($L(X)<1) X I $D(X) S DFN=DA D EM1^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 S:X']"" Y=.3116
 Q
11 D:$D(DG)>9 F^DIE17,DE S DQ=11,DW=".311;5",DV="FX",DU="",DIFLD=.3115,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X11 K:$L(X)>30!($L(X)<1) X I $D(X) S DFN=DA D EM1^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
12 S DW=".311;6",DV="FX",DU="",DIFLD=.3116,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X12 K:$L(X)>30!($L(X)<1) X I $D(X) S DFN=DA D EM1^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
13 S DW=".311;7",DV="P5'X",DU="",DIFLD=.3117,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(5,"
 G RE
X13 I $D(X) S DFN=DA D EM1^DGLOCK2
 Q
 ;
14 S DW=".22;5",DV="FOX",DU="",DIFLD=.2205,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DQ(14,2)="S Y(0)=Y D ZIPOUT^VAFADDR"
 S DE(DW)="C14^IBXS21"
 G RE
C14 G C14S:$D(DE(14))[0 K DB
 S X=DE(14),DIC=DIE
 D KILL^DGREGDD1(DA,.3118,.311,8,$E(X,1,5))
C14S S X="" G:DG(DQ)=X C14F1 K DB
 S X=DG(DQ),DIC=DIE
 D SET^DGREGDD1(DA,.3118,.311,8,$E(X,1,5))
C14F1 Q
X14 K:X[""""!($A(X)=45) X I $D(X) S DFN=DA D EM1^DGLOCK2 I $D(X) K:$L(X)>15!($L(X)<5) X I $D(X) D ZIPIN^VAFADDR
 I $D(X),X'?.ANP K X
 Q
 ;
15 D:$D(DG)>9 F^DIE17,DE S DQ=15,DW=".311;9",DV="FX",DU="",DIFLD=.3119,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X15 K:$L(X)>20!($L(X)<3) X I $D(X) S DFN=DA D EM1^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
16 S DQ=17 ;@41
17 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=17 D X17 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X17 S:IBDR20'["22" Y="@42"
 Q
18 S DW=".25;1",DV="FX",DU="",DIFLD=.251,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C18^IBXS21"
 G RE
C18 G C18S:$D(DE(18))[0 K DB
 S X=DE(18),DIC=DIE
 X "S DGXRF=.251 D ^DGDDC Q"
C18S S X="" G:DG(DQ)=X C18F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
C18F1 Q
X18 K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>20!($L(X)<3) X I $D(X) S DFN=DA D MAR^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
19 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=19 D X19 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X19 S:X']"" Y="@42"
 Q
20 D:$D(DG)>9 F^DIE17,DE S DQ=20,DW=".25;2",DV="FX",DU="",DIFLD=.252,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C20^IBXS21"
 G RE
C20 G C20S:$D(DE(20))[0 K DB
 S X=DE(20),DIC=DIE
 X "S DGXRF=.252 D ^DGDDC Q"
C20S S X="" G:DG(DQ)=X C20F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
C20F1 Q
X20 K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>35!($L(X)<3) X I $D(X) S DFN=DA D SE^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 D X21 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X21 S:X']"" Y=.255
 Q
22 D:$D(DG)>9 F^DIE17,DE S DQ=22,DW=".25;3",DV="FX",DU="",DIFLD=.253,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C22^IBXS21"
 G RE
C22 G C22S:$D(DE(22))[0 K DB
 S X=DE(22),DIC=DIE
 X "S DGXRF=.253 D ^DGDDC Q"
C22S S X="" G:DG(DQ)=X C22F1 K DB
 S X=DG(DQ),DIC=DIE
 ;
C22F1 Q
X22 K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>35!($L(X)<3) X I $D(X) S DFN=DA D SE^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
23 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=23 D X23 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X23 S:X']"" Y=.255
 Q
24 D:$D(DG)>9 F^DIE17,DE S DQ=24,DW=".25;4",DV="FX",DU="",DIFLD=.254,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X24 K:$L(X)>35!($L(X)<3) X I $D(X) S DFN=DA D SE^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
25 S DW=".25;5",DV="FX",DU="",DIFLD=.255,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X25 K:$L(X)>20!($L(X)<2) X I $D(X) S DFN=DA D SE^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
26 S DW=".25;6",DV="P5'X",DU="",DIFLD=.256,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="DIC(5,"
 G RE
X26 S DFN=DA D SE^DGLOCK2
 Q
 ;
27 S DW=".22;6",DV="FOX",DU="",DIFLD=.2206,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DQ(27,2)="S Y(0)=Y D ZIPOUT^VAFADDR"
 S DE(DW)="C27^IBXS21"
 G RE
C27 G C27S:$D(DE(27))[0 K DB
 S X=DE(27),DIC=DIE
 D KILL^DGREGDD1(DA,.257,.25,7,$E(X,1,5))
C27S S X="" G:DG(DQ)=X C27F1 K DB
 S X=DG(DQ),DIC=DIE
 D SET^DGREGDD1(DA,.257,.25,7,$E(X,1,5))
C27F1 Q
X27 K:X[""""!($A(X)=45) X I $D(X) S DFN=DA D SE^DGLOCK2 I $D(X) K:$L(X)>15!($L(X)<5) X I $D(X) D ZIPIN^VAFADDR
 I $D(X),X'?.ANP K X
 Q
 ;
28 D:$D(DG)>9 F^DIE17,DE S DQ=28,DW=".25;8",DV="FOX",DU="",DIFLD=.258,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X28 K:$L(X)>20!($L(X)<4) X I $D(X) S DFN=DA D SE^DGLOCK2
 I $D(X),X'?.ANP K X
 Q
 ;
29 S DQ=30 ;@42
30 G 1^DIE17
