IBDEI3BH ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,55740,1,3,0)
 ;;=3^Chest Pain,Unspec
 ;;^UTILITY(U,$J,358.3,55740,1,4,0)
 ;;=4^R07.9
 ;;^UTILITY(U,$J,358.3,55740,2)
 ;;=^5019201
 ;;^UTILITY(U,$J,358.3,55741,0)
 ;;=R09.01^^256^2787^41
 ;;^UTILITY(U,$J,358.3,55741,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55741,1,3,0)
 ;;=3^Asphyxia
 ;;^UTILITY(U,$J,358.3,55741,1,4,0)
 ;;=4^R09.01
 ;;^UTILITY(U,$J,358.3,55741,2)
 ;;=^11005
 ;;^UTILITY(U,$J,358.3,55742,0)
 ;;=R09.3^^256^2787^20
 ;;^UTILITY(U,$J,358.3,55742,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55742,1,3,0)
 ;;=3^Abnormal Sputum
 ;;^UTILITY(U,$J,358.3,55742,1,4,0)
 ;;=4^R09.3
 ;;^UTILITY(U,$J,358.3,55742,2)
 ;;=^5019202
 ;;^UTILITY(U,$J,358.3,55743,0)
 ;;=R12.^^256^2787^80
 ;;^UTILITY(U,$J,358.3,55743,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55743,1,3,0)
 ;;=3^Heartburn
 ;;^UTILITY(U,$J,358.3,55743,1,4,0)
 ;;=4^R12.
 ;;^UTILITY(U,$J,358.3,55743,2)
 ;;=^5019238
 ;;^UTILITY(U,$J,358.3,55744,0)
 ;;=R14.0^^256^2787^1
 ;;^UTILITY(U,$J,358.3,55744,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55744,1,3,0)
 ;;=3^Abdominal Distension
 ;;^UTILITY(U,$J,358.3,55744,1,4,0)
 ;;=4^R14.0
 ;;^UTILITY(U,$J,358.3,55744,2)
 ;;=^5019240
 ;;^UTILITY(U,$J,358.3,55745,0)
 ;;=R14.1^^256^2787^77
 ;;^UTILITY(U,$J,358.3,55745,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55745,1,3,0)
 ;;=3^Gas Pain
 ;;^UTILITY(U,$J,358.3,55745,1,4,0)
 ;;=4^R14.1
 ;;^UTILITY(U,$J,358.3,55745,2)
 ;;=^5019241
 ;;^UTILITY(U,$J,358.3,55746,0)
 ;;=R14.2^^256^2787^70
 ;;^UTILITY(U,$J,358.3,55746,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55746,1,3,0)
 ;;=3^Eructation
 ;;^UTILITY(U,$J,358.3,55746,1,4,0)
 ;;=4^R14.2
 ;;^UTILITY(U,$J,358.3,55746,2)
 ;;=^5019242
 ;;^UTILITY(U,$J,358.3,55747,0)
 ;;=R14.3^^256^2787^74
 ;;^UTILITY(U,$J,358.3,55747,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55747,1,3,0)
 ;;=3^Flatulence
 ;;^UTILITY(U,$J,358.3,55747,1,4,0)
 ;;=4^R14.3
 ;;^UTILITY(U,$J,358.3,55747,2)
 ;;=^5019243
 ;;^UTILITY(U,$J,358.3,55748,0)
 ;;=R15.9^^256^2787^76
 ;;^UTILITY(U,$J,358.3,55748,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55748,1,3,0)
 ;;=3^Full Incontinence of Feces
 ;;^UTILITY(U,$J,358.3,55748,1,4,0)
 ;;=4^R15.9
 ;;^UTILITY(U,$J,358.3,55748,2)
 ;;=^5019247
 ;;^UTILITY(U,$J,358.3,55749,0)
 ;;=R17.^^256^2787^99
 ;;^UTILITY(U,$J,358.3,55749,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55749,1,3,0)
 ;;=3^Jaundice,Unspec
 ;;^UTILITY(U,$J,358.3,55749,1,4,0)
 ;;=4^R17.
 ;;^UTILITY(U,$J,358.3,55749,2)
 ;;=^5019251
 ;;^UTILITY(U,$J,358.3,55750,0)
 ;;=R19.30^^256^2787^2
 ;;^UTILITY(U,$J,358.3,55750,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55750,1,3,0)
 ;;=3^Abdominal Rigidity,Unspec Site
 ;;^UTILITY(U,$J,358.3,55750,1,4,0)
 ;;=4^R19.30
 ;;^UTILITY(U,$J,358.3,55750,2)
 ;;=^5019266
 ;;^UTILITY(U,$J,358.3,55751,0)
 ;;=R19.4^^256^2787^45
 ;;^UTILITY(U,$J,358.3,55751,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55751,1,3,0)
 ;;=3^Bowel Habit Changes
 ;;^UTILITY(U,$J,358.3,55751,1,4,0)
 ;;=4^R19.4
 ;;^UTILITY(U,$J,358.3,55751,2)
 ;;=^5019273
 ;;^UTILITY(U,$J,358.3,55752,0)
 ;;=R19.8^^256^2787^59
 ;;^UTILITY(U,$J,358.3,55752,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55752,1,3,0)
 ;;=3^Digestive System/Abdomen Symptoms NEC
 ;;^UTILITY(U,$J,358.3,55752,1,4,0)
 ;;=4^R19.8
 ;;^UTILITY(U,$J,358.3,55752,2)
 ;;=^5019277
 ;;^UTILITY(U,$J,358.3,55753,0)
 ;;=R20.0^^256^2787^35
 ;;^UTILITY(U,$J,358.3,55753,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55753,1,3,0)
 ;;=3^Anesthesia of Skin
 ;;^UTILITY(U,$J,358.3,55753,1,4,0)
 ;;=4^R20.0
 ;;^UTILITY(U,$J,358.3,55753,2)
 ;;=^5019278
 ;;^UTILITY(U,$J,358.3,55754,0)
 ;;=R20.1^^256^2787^87
