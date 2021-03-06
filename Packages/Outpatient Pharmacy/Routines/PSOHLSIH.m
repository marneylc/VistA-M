PSOHLSIH ;BIR/RTR-Parse out and create Instructions line ; 7/20/96
 ;;7.0;OUTPATIENT PHARMACY;**1,18,41,46**;DEC 1997
 ;External reference to File #50.7 supported by DBIA 2223
 ;External reference to File #51 supported by DBIA 2224
 ;External reference to File #51.1 supported by DBIA 2225
 ;External reference to File #51.2 supported by DBIA 2226
 ;External reference to File #50.606 supported by DBIA 2174
 Q:'$D(^PS(52.41,PENDING,1,0))
 N SDF,SZZ,ZZS,ZZSB,SSZZ,SCHHOLD,GGGZ,SGLFLAG,SGLOOP,ZSCHED,SPFG,PSNOUN,PSDUR,NOUN,SCHED,INTERVAL,SIG0,SIG2,SIG3,SDL
 S SIGRT=$P(^PS(52.41,PENDING,0),"^",15),SIGDS=$P(^PS(50.7,$P(^(0),"^",8),0),"^",2),VERB=$P($G(^PS(50.606,SIGDS,"MISC")),"^"),PREP=$P($G(^("MISC")),"^",3)
 F SSS=0:0 S SSS=$O(^PS(52.41,PENDING,1,SSS)) Q:'SSS  D  S SIG1(SSS)=$G(^PS(52.41,PENDING,1,SSS,1))
 .S SIG0(SSS)=$P($G(^PS(52.41,PENDING,1,SSS,0)),"^")
 .I $L(SIG0(SSS)),$E(SIG0(SSS),$L(SIG0(SSS)))="&" S SIG0(SSS)=$E(SIG0(SSS),1,($L(SIG0(SSS))-1))
 .D NON
 ;I SIG0(1)'["&" D SIG1 G STUFF
 S PSOROUTE=$S($P($G(^PS(51.2,+SIGRT,0)),"^",3)'="":$P(^(0),"^",3),1:$P($G(^(0)),"^"))
 F GGG=0:0 S GGG=$O(SIG1(GGG)) Q:'GGG  S SCHED(GGG)=$P(SIG1(GGG),"^")
 ;F GGG=0:0 S GGG=$O(SIG1(GGG)) Q:'GGG  S SDL=$P(SIG1(GGG),"^"),SCHED(GGG)=SDL I SDL'="" F WW=0:0 S WW=$O(^PS(51.1,"B",SDL,WW)) Q:'WW!($G(SCHED(GGG))'=SDL)  S:$P($G(^PS(51.1,WW,0)),"^",8)'="" SCHED(GGG)=$P($G(^(0)),"^",8) S SDF(GGG)=1
 ;F GGG=0:0 S GGG=$O(SIG1(GGG)) Q:'GGG  D:'$G(SDF(GGG))
 ;.S SZZ=1 F ZZS=1:1:$L(SCHED(GGG)) S ZZSB=$E(SCHED(GGG),ZZS) I ZZSB=" " S SZZ=SZZ+1
 ;.Q:SZZ=1
 ;.K ZSCHED F SSZZ=1:1:SZZ S:$P(SCHED(GGG)," ",SSZZ)'="" ZSCHED(SSZZ)=$P(SCHED(GGG)," ",SSZZ)
 ;.S SCHHOLD(GGG)=SCHED(GGG),SCHED(GGG)="",SPFG=0 F GGGZ=0:0 S GGGZ=$O(ZSCHED(GGGZ)) Q:'GGGZ  D  S SCHED(GGG)=SCHED(GGG)_$S($G(SPFG)=1:"",1:" ")_ZSCHED(GGGZ)
 ;..S SGLFLAG=0,SPFG=SPFG+1 F SGLOOP=0:0 S SGLOOP=$O(^PS(51.1,"B",ZSCHED(GGGZ),SGLOOP)) Q:'SGLOOP!(SGLFLAG)  I $P($G(^PS(51.1,SGLOOP,0)),"^",8)'="" S SGLFLAG=1,ZSCHED(GGGZ)=$P($G(^PS(51.1,SGLOOP,0)),"^",8)
 ;.S:SCHED(GGG)="" SCHED(GGG)=SCHHOLD(GGG)
 F TT=0:0 S TT=$O(SIG1(TT)) Q:'TT  D DAYS S PSDUR(TT)=$S($P(SIG1(TT),"^",2)=""!($E($P(SIG1(TT),"^",2))="I"):"NULL",1:"FOR "_$E($P(SIG1(TT),"^",2),2,$L($P(SIG1(TT),"^",2)))) D  I PSDUR(TT)'="NULL" S PSDUR(TT)=PSDUR(TT)_" "_INTERVAL
 .I PSDUR(TT)'="NULL" S INTERVAL=$P(SIG1(TT),"^",2),INTERVAL=$S($E(INTERVAL)="D":"DAY(S)",$E(INTERVAL)="W":"WEEK(S)",$E(INTERVAL)="H":"HOUR(S)",$E(INTERVAL)="L":"MONTH(S)",$E(INTERVAL)="M":"MINUTE(S)",$E(INTERVAL)="S":"SECOND(S)",1:"")
 S PREP="" ; taking preposition out of instructions
 F FFF=0:0 S FFF=$O(SIG0(FFF)) Q:'FFF  D
 .;I SIG0(FFF)'["&" S SIG2(FFF)=SIG0(FFF) Q
 .;S SIG2(FFF)=VERB_" "_$P($G(SIG0(FFF)),"&")_" "_$G(PSNOUN(FFF))_" "_PREP_" "_PSOROUTE_$S(SCHED(FFF)'="":" "_SCHED(FFF),1:"")_$S(PSDUR(FFF)'="NULL":PSDUR(FFF),1:"")_$S($P(SIG1(FFF),"^",6)="A":" AND",$P(SIG1(FFF),"^",6)="S":" THEN",1:"")
 .K PSOSG1,PSOSG2 D VERB^PSOHLSIG
 .S SIG2(FFF)=$S(VERB'=""&('$G(PSOSG1)):VERB_" ",1:"")_$S($P($G(SIG0(FFF)),"&")'="":$P($G(SIG0(FFF)),"&")_" ",1:"")_$S($G(PSNOUN(FFF))'=""&('$G(PSOSG2)):$G(PSNOUN(FFF))_" ",1:"")_$S(PREP'=""&(PSOROUTE'=""):PREP_" ",1:"")
 .S SIG2(FFF)=SIG2(FFF)_$S(PSOROUTE'="":PSOROUTE_" ",1:"")
 .S SIG2(FFF)=SIG2(FFF)_$S(SCHED(FFF)'="":SCHED(FFF)_" ",1:"")_$S(PSDUR(FFF)'="NULL":PSDUR(FFF)_" ",1:"")_$S($P(SIG1(FFF),"^",6)="A":"AND",$P(SIG1(FFF),"^",6)="S":"THEN",1:"")
 .K PSOSG1,PSOSG2
STUFF ;
 S DCOUNT=0
 I '$D(SIG2(1)) G QUIT
 ;I '$O(SIG2(1)),$L(SIG2(1))<72 S ^PS(52.41,PENDING,"SIG",0)="^52.4124A^"_1_"^"_1 S ^PS(52.41,PENDING,"SIG",1,0)=SIG2(1) Q
 S (VAR,VAR1)="",II=1
 F FF=0:0 S FF=$O(SIG2(FF)) Q:'FF  S CT=0 F NN=1:1:$L(SIG2(FF)) I $E(SIG2(FF),NN)=" "!($L(SIG2(FF))=NN) S CT=CT+1 D  I $L(VAR)>200 S SIG3(II)=LIM_" ",II=II+1,VAR=VAR1
 .S VAR1=$P(SIG2(FF)," ",(CT))
 .S LIM=VAR
 .S VAR=$S(VAR="":VAR1,1:VAR_" "_VAR1)
 I $G(VAR)'="" S SIG3(II)=VAR
 F II=0:0 S II=$O(SIG3(II)) Q:'II  S DCOUNT=DCOUNT+1 S ^PS(52.41,PENDING,2,DCOUNT,0)=SIG3(II)
 I DCOUNT S ^PS(52.41,PENDING,2,0)="^52.419^"_DCOUNT_"^"_DCOUNT
QUIT K SSS,TT,DCOUNT,PREP,VERB,FFF,GGG,SIGDS,SIGRT,PSOROUTE,PSOSG1,PSOSG2 Q
SIG1 ;
 F FFF=0:0 S FFF=$O(SIG0(FFF)) Q:'FFF  S SIG2(FFF)=SIG0(FFF)
 Q
DAYS I +$E($P(SIG1(TT),"^",2))!($E($P(SIG1(TT),"^",2))=0) S $P(SIG1(TT),"^",2)="D"_$P(SIG1(TT),"^",2)
 Q
NON ;
 I $P($G(SIG0(SSS)),"&",2)'="" S PSNOUN(SSS)=$P($G(SIG0(SSS)),"&",2) Q
 Q
 F NOUN=0:0 S NOUN=$O(^PS(50.606,SIGDS,"NOUN",NOUN)) Q:'NOUN!($G(PSNOUN(SSS))'="")  I $P($G(^PS(50.606,SIGDS,"NOUN",NOUN,0)),"^")'="" S PSNOUN(SSS)=$P(^(0),"^")
 Q
KL K PSODDRUG,PSORDITE,PSOXQTY,PSOREFIL,ONEFLAG,SERV,WPCT,EFFECT,PROV,PENDING,PSOBCT,PSOIII,PSOLOG,PSOSEG,PSOTYPE,PSORSO Q
