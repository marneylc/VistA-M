IBDEI0Q6 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11986,1,3,0)
 ;;=3^Exp to Sunlight,Init Encntr
 ;;^UTILITY(U,$J,358.3,11986,1,4,0)
 ;;=4^X32.XXXA
 ;;^UTILITY(U,$J,358.3,11986,2)
 ;;=^5060847
 ;;^UTILITY(U,$J,358.3,11987,0)
 ;;=X32.XXXD^^68^694^16
 ;;^UTILITY(U,$J,358.3,11987,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11987,1,3,0)
 ;;=3^Exp to Sunlight,Subs Encntr
 ;;^UTILITY(U,$J,358.3,11987,1,4,0)
 ;;=4^X32.XXXD
 ;;^UTILITY(U,$J,358.3,11987,2)
 ;;=^5060848
 ;;^UTILITY(U,$J,358.3,11988,0)
 ;;=Y04.0XXA^^68^694^7
 ;;^UTILITY(U,$J,358.3,11988,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11988,1,3,0)
 ;;=3^Assault by Unarmed Fight,Init Encntr
 ;;^UTILITY(U,$J,358.3,11988,1,4,0)
 ;;=4^Y04.0XXA
 ;;^UTILITY(U,$J,358.3,11988,2)
 ;;=^5061165
 ;;^UTILITY(U,$J,358.3,11989,0)
 ;;=Y04.0XXD^^68^694^8
 ;;^UTILITY(U,$J,358.3,11989,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11989,1,3,0)
 ;;=3^Assault by Unarmed Fight,Subs Encntr
 ;;^UTILITY(U,$J,358.3,11989,1,4,0)
 ;;=4^Y04.0XXD
 ;;^UTILITY(U,$J,358.3,11989,2)
 ;;=^5061166
 ;;^UTILITY(U,$J,358.3,11990,0)
 ;;=Y04.1XXA^^68^694^1
 ;;^UTILITY(U,$J,358.3,11990,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11990,1,3,0)
 ;;=3^Assault by Human Bite,Init Encntr
 ;;^UTILITY(U,$J,358.3,11990,1,4,0)
 ;;=4^Y04.1XXA
 ;;^UTILITY(U,$J,358.3,11990,2)
 ;;=^5061168
 ;;^UTILITY(U,$J,358.3,11991,0)
 ;;=Y04.1XXD^^68^694^2
 ;;^UTILITY(U,$J,358.3,11991,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11991,1,3,0)
 ;;=3^Assault by Human Bite,Subs Encntr
 ;;^UTILITY(U,$J,358.3,11991,1,4,0)
 ;;=4^Y04.1XXD
 ;;^UTILITY(U,$J,358.3,11991,2)
 ;;=^5061169
 ;;^UTILITY(U,$J,358.3,11992,0)
 ;;=Y04.2XXA^^68^694^5
 ;;^UTILITY(U,$J,358.3,11992,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11992,1,3,0)
 ;;=3^Assault by Strike/Bumped by Another Person,Init Encntr
 ;;^UTILITY(U,$J,358.3,11992,1,4,0)
 ;;=4^Y04.2XXA
 ;;^UTILITY(U,$J,358.3,11992,2)
 ;;=^5061171
 ;;^UTILITY(U,$J,358.3,11993,0)
 ;;=Y04.8XXA^^68^694^3
 ;;^UTILITY(U,$J,358.3,11993,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11993,1,3,0)
 ;;=3^Assault by Oth Bodily Force,Init Encntr
 ;;^UTILITY(U,$J,358.3,11993,1,4,0)
 ;;=4^Y04.8XXA
 ;;^UTILITY(U,$J,358.3,11993,2)
 ;;=^5061174
 ;;^UTILITY(U,$J,358.3,11994,0)
 ;;=Y04.2XXD^^68^694^6
 ;;^UTILITY(U,$J,358.3,11994,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11994,1,3,0)
 ;;=3^Assault by Strike/Bumped by Another Person,Subs Encntr
 ;;^UTILITY(U,$J,358.3,11994,1,4,0)
 ;;=4^Y04.2XXD
 ;;^UTILITY(U,$J,358.3,11994,2)
 ;;=^5061172
 ;;^UTILITY(U,$J,358.3,11995,0)
 ;;=Y04.8XXD^^68^694^4
 ;;^UTILITY(U,$J,358.3,11995,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11995,1,3,0)
 ;;=3^Assault by Oth Bodily Force,Subs Encntr
 ;;^UTILITY(U,$J,358.3,11995,1,4,0)
 ;;=4^Y04.8XXD
 ;;^UTILITY(U,$J,358.3,11995,2)
 ;;=^5061175
 ;;^UTILITY(U,$J,358.3,11996,0)
 ;;=Y36.200A^^68^694^124
 ;;^UTILITY(U,$J,358.3,11996,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11996,1,3,0)
 ;;=3^War Op Inv Unspec Explosion/Fragments,Milt,Init Encntr
 ;;^UTILITY(U,$J,358.3,11996,1,4,0)
 ;;=4^Y36.200A
 ;;^UTILITY(U,$J,358.3,11996,2)
 ;;=^5061607
 ;;^UTILITY(U,$J,358.3,11997,0)
 ;;=Y36.200D^^68^694^125
 ;;^UTILITY(U,$J,358.3,11997,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11997,1,3,0)
 ;;=3^War Op Inv Unspec Explosion/Fragments,Milt,Subs Encntr
 ;;^UTILITY(U,$J,358.3,11997,1,4,0)
 ;;=4^Y36.200D
 ;;^UTILITY(U,$J,358.3,11997,2)
 ;;=^5061608
 ;;^UTILITY(U,$J,358.3,11998,0)
 ;;=Y36.300A^^68^694^126
 ;;^UTILITY(U,$J,358.3,11998,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11998,1,3,0)
 ;;=3^War Op Inv Unspec Fire/Conflagr/Hot Subst,Milt,Init Encntr
 ;;^UTILITY(U,$J,358.3,11998,1,4,0)
 ;;=4^Y36.300A