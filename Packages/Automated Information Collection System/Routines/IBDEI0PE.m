IBDEI0PE ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11634,2)
 ;;=^5019713
 ;;^UTILITY(U,$J,358.3,11635,0)
 ;;=R93.2^^68^687^9
 ;;^UTILITY(U,$J,358.3,11635,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11635,1,3,0)
 ;;=3^Abnormal Finding on Dx Image of Liver/Biliary Tract
 ;;^UTILITY(U,$J,358.3,11635,1,4,0)
 ;;=4^R93.2
 ;;^UTILITY(U,$J,358.3,11635,2)
 ;;=^5019715
 ;;^UTILITY(U,$J,358.3,11636,0)
 ;;=R93.3^^68^687^7
 ;;^UTILITY(U,$J,358.3,11636,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11636,1,3,0)
 ;;=3^Abnormal Finding on Dx Image of Digestive Tract Part
 ;;^UTILITY(U,$J,358.3,11636,1,4,0)
 ;;=4^R93.3
 ;;^UTILITY(U,$J,358.3,11636,2)
 ;;=^5019716
 ;;^UTILITY(U,$J,358.3,11637,0)
 ;;=R93.4^^68^687^11
 ;;^UTILITY(U,$J,358.3,11637,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11637,1,3,0)
 ;;=3^Abnormal Finding on Dx Image of Urinary Organs
 ;;^UTILITY(U,$J,358.3,11637,1,4,0)
 ;;=4^R93.4
 ;;^UTILITY(U,$J,358.3,11637,2)
 ;;=^5019717
 ;;^UTILITY(U,$J,358.3,11638,0)
 ;;=R93.5^^68^687^6
 ;;^UTILITY(U,$J,358.3,11638,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11638,1,3,0)
 ;;=3^Abnormal Finding on Dx Image of Abdominal Regions
 ;;^UTILITY(U,$J,358.3,11638,1,4,0)
 ;;=4^R93.5
 ;;^UTILITY(U,$J,358.3,11638,2)
 ;;=^5019718
 ;;^UTILITY(U,$J,358.3,11639,0)
 ;;=R93.6^^68^687^8
 ;;^UTILITY(U,$J,358.3,11639,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11639,1,3,0)
 ;;=3^Abnormal Finding on Dx Image of Limbs
 ;;^UTILITY(U,$J,358.3,11639,1,4,0)
 ;;=4^R93.6
 ;;^UTILITY(U,$J,358.3,11639,2)
 ;;=^5019719
 ;;^UTILITY(U,$J,358.3,11640,0)
 ;;=R94.4^^68^687^16
 ;;^UTILITY(U,$J,358.3,11640,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11640,1,3,0)
 ;;=3^Abnormal Kidney Function Studies
 ;;^UTILITY(U,$J,358.3,11640,1,4,0)
 ;;=4^R94.4
 ;;^UTILITY(U,$J,358.3,11640,2)
 ;;=^5019741
 ;;^UTILITY(U,$J,358.3,11641,0)
 ;;=R94.5^^68^687^17
 ;;^UTILITY(U,$J,358.3,11641,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11641,1,3,0)
 ;;=3^Abnormal Liver Function Studies
 ;;^UTILITY(U,$J,358.3,11641,1,4,0)
 ;;=4^R94.5
 ;;^UTILITY(U,$J,358.3,11641,2)
 ;;=^5019742
 ;;^UTILITY(U,$J,358.3,11642,0)
 ;;=R94.6^^68^687^21
 ;;^UTILITY(U,$J,358.3,11642,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11642,1,3,0)
 ;;=3^Abnormal Thyroid Function Studies
 ;;^UTILITY(U,$J,358.3,11642,1,4,0)
 ;;=4^R94.6
 ;;^UTILITY(U,$J,358.3,11642,2)
 ;;=^5019743
 ;;^UTILITY(U,$J,358.3,11643,0)
 ;;=R94.7^^68^687^5
 ;;^UTILITY(U,$J,358.3,11643,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11643,1,3,0)
 ;;=3^Abnormal Endocrine Function Sutdies NEC
 ;;^UTILITY(U,$J,358.3,11643,1,4,0)
 ;;=4^R94.7
 ;;^UTILITY(U,$J,358.3,11643,2)
 ;;=^5019744
 ;;^UTILITY(U,$J,358.3,11644,0)
 ;;=R94.31^^68^687^4
 ;;^UTILITY(U,$J,358.3,11644,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11644,1,3,0)
 ;;=3^Abnormal EKG
 ;;^UTILITY(U,$J,358.3,11644,1,4,0)
 ;;=4^R94.31
 ;;^UTILITY(U,$J,358.3,11644,2)
 ;;=^5019739
 ;;^UTILITY(U,$J,358.3,11645,0)
 ;;=R97.0^^68^687^67
 ;;^UTILITY(U,$J,358.3,11645,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11645,1,3,0)
 ;;=3^Elevated Carcinoembryonic Antigen 
 ;;^UTILITY(U,$J,358.3,11645,1,4,0)
 ;;=4^R97.0
 ;;^UTILITY(U,$J,358.3,11645,2)
 ;;=^5019746
 ;;^UTILITY(U,$J,358.3,11646,0)
 ;;=R97.1^^68^687^66
 ;;^UTILITY(U,$J,358.3,11646,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11646,1,3,0)
 ;;=3^Elevated Cancer Antigen 125
 ;;^UTILITY(U,$J,358.3,11646,1,4,0)
 ;;=4^R97.1
 ;;^UTILITY(U,$J,358.3,11646,2)
 ;;=^5019747
 ;;^UTILITY(U,$J,358.3,11647,0)
 ;;=R97.2^^68^687^68
 ;;^UTILITY(U,$J,358.3,11647,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,11647,1,3,0)
 ;;=3^Elevated PSA
 ;;^UTILITY(U,$J,358.3,11647,1,4,0)
 ;;=4^R97.2