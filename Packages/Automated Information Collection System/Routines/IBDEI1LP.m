IBDEI1LP ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,26782,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26782,1,2,0)
 ;;=2^36600
 ;;^UTILITY(U,$J,358.3,26782,1,3,0)
 ;;=3^ABG
 ;;^UTILITY(U,$J,358.3,26783,0)
 ;;=29580^^131^1299^25^^^^1
 ;;^UTILITY(U,$J,358.3,26783,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26783,1,2,0)
 ;;=2^29580
 ;;^UTILITY(U,$J,358.3,26783,1,3,0)
 ;;=3^Strapping, Unna Boot
 ;;^UTILITY(U,$J,358.3,26784,0)
 ;;=97602^^131^1299^26^^^^1
 ;;^UTILITY(U,$J,358.3,26784,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26784,1,2,0)
 ;;=2^97602
 ;;^UTILITY(U,$J,358.3,26784,1,3,0)
 ;;=3^Wound Care, non-selective debridement
 ;;^UTILITY(U,$J,358.3,26785,0)
 ;;=51701^^131^1299^14^^^^1
 ;;^UTILITY(U,$J,358.3,26785,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26785,1,2,0)
 ;;=2^51701
 ;;^UTILITY(U,$J,358.3,26785,1,3,0)
 ;;=3^Insert Catheter for Residual Urine
 ;;^UTILITY(U,$J,358.3,26786,0)
 ;;=51702^^131^1299^15^^^^1
 ;;^UTILITY(U,$J,358.3,26786,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26786,1,2,0)
 ;;=2^51702
 ;;^UTILITY(U,$J,358.3,26786,1,3,0)
 ;;=3^Insert Foley Cath
 ;;^UTILITY(U,$J,358.3,26787,0)
 ;;=51798^^131^1299^27^^^^1
 ;;^UTILITY(U,$J,358.3,26787,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26787,1,2,0)
 ;;=2^51798
 ;;^UTILITY(U,$J,358.3,26787,1,3,0)
 ;;=3^Ultrasound for Resid Urine
 ;;^UTILITY(U,$J,358.3,26788,0)
 ;;=96360^^131^1299^2^^^^1
 ;;^UTILITY(U,$J,358.3,26788,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26788,1,2,0)
 ;;=2^96360
 ;;^UTILITY(U,$J,358.3,26788,1,3,0)
 ;;=3^Hydration,IV,first hour
 ;;^UTILITY(U,$J,358.3,26789,0)
 ;;=96361^^131^1299^3^^^^1
 ;;^UTILITY(U,$J,358.3,26789,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26789,1,2,0)
 ;;=2^96361
 ;;^UTILITY(U,$J,358.3,26789,1,3,0)
 ;;=3^Hydration,IV,EA addl hour (+96360)
 ;;^UTILITY(U,$J,358.3,26790,0)
 ;;=96365^^131^1299^4^^^^1
 ;;^UTILITY(U,$J,358.3,26790,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26790,1,2,0)
 ;;=2^96365
 ;;^UTILITY(U,$J,358.3,26790,1,3,0)
 ;;=3^Infusion,IV up to 1 hour
 ;;^UTILITY(U,$J,358.3,26791,0)
 ;;=96366^^131^1299^5^^^^1
 ;;^UTILITY(U,$J,358.3,26791,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26791,1,2,0)
 ;;=2^96366
 ;;^UTILITY(U,$J,358.3,26791,1,3,0)
 ;;=3^Infusion,IV ea add hr (+96365)
 ;;^UTILITY(U,$J,358.3,26792,0)
 ;;=29105^^131^1300^1^^^^1
 ;;^UTILITY(U,$J,358.3,26792,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26792,1,2,0)
 ;;=2^29105
 ;;^UTILITY(U,$J,358.3,26792,1,3,0)
 ;;=3^Long Arm Splint
 ;;^UTILITY(U,$J,358.3,26793,0)
 ;;=29125^^131^1300^2^^^^1
 ;;^UTILITY(U,$J,358.3,26793,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26793,1,2,0)
 ;;=2^29125
 ;;^UTILITY(U,$J,358.3,26793,1,3,0)
 ;;=3^Short Arm Splint; Static
 ;;^UTILITY(U,$J,358.3,26794,0)
 ;;=29126^^131^1300^3^^^^1
 ;;^UTILITY(U,$J,358.3,26794,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26794,1,2,0)
 ;;=2^29126
 ;;^UTILITY(U,$J,358.3,26794,1,3,0)
 ;;=3^Short Arm Splint; Dynamic
 ;;^UTILITY(U,$J,358.3,26795,0)
 ;;=29130^^131^1300^4^^^^1
 ;;^UTILITY(U,$J,358.3,26795,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26795,1,2,0)
 ;;=2^29130
 ;;^UTILITY(U,$J,358.3,26795,1,3,0)
 ;;=3^Finger Splint
 ;;^UTILITY(U,$J,358.3,26796,0)
 ;;=99347^^131^1301^1^^^^1
 ;;^UTILITY(U,$J,358.3,26796,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26796,1,2,0)
 ;;=2^99347
 ;;^UTILITY(U,$J,358.3,26796,1,3,0)
 ;;=3^Est Pt-Prob Focus Home Visit
 ;;^UTILITY(U,$J,358.3,26797,0)
 ;;=99348^^131^1301^2^^^^1
 ;;^UTILITY(U,$J,358.3,26797,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,26797,1,2,0)
 ;;=2^99348
 ;;^UTILITY(U,$J,358.3,26797,1,3,0)
 ;;=3^Est Pt-Exp Prob Focus Home Visit