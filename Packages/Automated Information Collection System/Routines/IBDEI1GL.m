IBDEI1GL ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24371,1,4,0)
 ;;=4^Z75.0
 ;;^UTILITY(U,$J,358.3,24371,2)
 ;;=^5063289
 ;;^UTILITY(U,$J,358.3,24372,0)
 ;;=Z75.1^^118^1213^4
 ;;^UTILITY(U,$J,358.3,24372,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24372,1,3,0)
 ;;=3^Pt Awaiting Admission to Adequate Facility Elsewhere
 ;;^UTILITY(U,$J,358.3,24372,1,4,0)
 ;;=4^Z75.1
 ;;^UTILITY(U,$J,358.3,24372,2)
 ;;=^5063290
 ;;^UTILITY(U,$J,358.3,24373,0)
 ;;=Z75.4^^118^1213^6
 ;;^UTILITY(U,$J,358.3,24373,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24373,1,3,0)
 ;;=3^Unavailability/Inaccessibility of Helping Agencies
 ;;^UTILITY(U,$J,358.3,24373,1,4,0)
 ;;=4^Z75.4
 ;;^UTILITY(U,$J,358.3,24373,2)
 ;;=^5063293
 ;;^UTILITY(U,$J,358.3,24374,0)
 ;;=Z75.8^^118^1213^2
 ;;^UTILITY(U,$J,358.3,24374,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24374,1,3,0)
 ;;=3^Medical Facilities/Health Care Problems
 ;;^UTILITY(U,$J,358.3,24374,1,4,0)
 ;;=4^Z75.8
 ;;^UTILITY(U,$J,358.3,24374,2)
 ;;=^5063295
 ;;^UTILITY(U,$J,358.3,24375,0)
 ;;=Z71.9^^118^1213^1
 ;;^UTILITY(U,$J,358.3,24375,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24375,1,3,0)
 ;;=3^Counseling,Unspec
 ;;^UTILITY(U,$J,358.3,24375,1,4,0)
 ;;=4^Z71.9
 ;;^UTILITY(U,$J,358.3,24375,2)
 ;;=^5063254
 ;;^UTILITY(U,$J,358.3,24376,0)
 ;;=Z51.89^^118^1214^1
 ;;^UTILITY(U,$J,358.3,24376,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24376,1,3,0)
 ;;=3^Aftercare,Oth Spec
 ;;^UTILITY(U,$J,358.3,24376,1,4,0)
 ;;=4^Z51.89
 ;;^UTILITY(U,$J,358.3,24376,2)
 ;;=^5063065
 ;;^UTILITY(U,$J,358.3,24377,0)
 ;;=Z51.5^^118^1214^2
 ;;^UTILITY(U,$J,358.3,24377,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,24377,1,3,0)
 ;;=3^Palliative Care
 ;;^UTILITY(U,$J,358.3,24377,1,4,0)
 ;;=4^Z51.5
 ;;^UTILITY(U,$J,358.3,24377,2)
 ;;=^5063063
 ;;^UTILITY(U,$J,358.3,24378,0)
 ;;=99201^^119^1215^1
 ;;^UTILITY(U,$J,358.3,24378,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24378,1,1,0)
 ;;=1^Problem Focus
 ;;^UTILITY(U,$J,358.3,24378,1,2,0)
 ;;=2^99201
 ;;^UTILITY(U,$J,358.3,24379,0)
 ;;=99202^^119^1215^2
 ;;^UTILITY(U,$J,358.3,24379,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24379,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,24379,1,2,0)
 ;;=2^99202
 ;;^UTILITY(U,$J,358.3,24380,0)
 ;;=99203^^119^1215^3
 ;;^UTILITY(U,$J,358.3,24380,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24380,1,1,0)
 ;;=1^Detailed
 ;;^UTILITY(U,$J,358.3,24380,1,2,0)
 ;;=2^99203
 ;;^UTILITY(U,$J,358.3,24381,0)
 ;;=99204^^119^1215^4
 ;;^UTILITY(U,$J,358.3,24381,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24381,1,1,0)
 ;;=1^Comprehensive, Moderate
 ;;^UTILITY(U,$J,358.3,24381,1,2,0)
 ;;=2^99204
 ;;^UTILITY(U,$J,358.3,24382,0)
 ;;=99205^^119^1215^5
 ;;^UTILITY(U,$J,358.3,24382,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24382,1,1,0)
 ;;=1^Comprehensive, High
 ;;^UTILITY(U,$J,358.3,24382,1,2,0)
 ;;=2^99205
 ;;^UTILITY(U,$J,358.3,24383,0)
 ;;=99211^^119^1216^1
 ;;^UTILITY(U,$J,358.3,24383,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24383,1,1,0)
 ;;=1^Nursing Visit (no MD seen)
 ;;^UTILITY(U,$J,358.3,24383,1,2,0)
 ;;=2^99211
 ;;^UTILITY(U,$J,358.3,24384,0)
 ;;=99212^^119^1216^2
 ;;^UTILITY(U,$J,358.3,24384,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24384,1,1,0)
 ;;=1^Problem Focused
 ;;^UTILITY(U,$J,358.3,24384,1,2,0)
 ;;=2^99212
 ;;^UTILITY(U,$J,358.3,24385,0)
 ;;=99213^^119^1216^3
 ;;^UTILITY(U,$J,358.3,24385,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24385,1,1,0)
 ;;=1^Expanded Problem Focus
 ;;^UTILITY(U,$J,358.3,24385,1,2,0)
 ;;=2^99213
 ;;^UTILITY(U,$J,358.3,24386,0)
 ;;=99214^^119^1216^4
 ;;^UTILITY(U,$J,358.3,24386,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24386,1,1,0)
 ;;=1^Detailed