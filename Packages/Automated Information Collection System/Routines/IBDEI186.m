IBDEI186 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,20477,2)
 ;;=^5002633
 ;;^UTILITY(U,$J,358.3,20478,0)
 ;;=E11.40^^97^961^10
 ;;^UTILITY(U,$J,358.3,20478,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20478,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Neuropathy,Unspec
 ;;^UTILITY(U,$J,358.3,20478,1,4,0)
 ;;=4^E11.40
 ;;^UTILITY(U,$J,358.3,20478,2)
 ;;=^5002644
 ;;^UTILITY(U,$J,358.3,20479,0)
 ;;=E11.41^^97^961^9
 ;;^UTILITY(U,$J,358.3,20479,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20479,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Mononeuropathy
 ;;^UTILITY(U,$J,358.3,20479,1,4,0)
 ;;=4^E11.41
 ;;^UTILITY(U,$J,358.3,20479,2)
 ;;=^5002645
 ;;^UTILITY(U,$J,358.3,20480,0)
 ;;=E11.42^^97^961^13
 ;;^UTILITY(U,$J,358.3,20480,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20480,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Polyneuropathy
 ;;^UTILITY(U,$J,358.3,20480,1,4,0)
 ;;=4^E11.42
 ;;^UTILITY(U,$J,358.3,20480,2)
 ;;=^5002646
 ;;^UTILITY(U,$J,358.3,20481,0)
 ;;=E11.43^^97^961^7
 ;;^UTILITY(U,$J,358.3,20481,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20481,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Autonomic Polyneuropathy
 ;;^UTILITY(U,$J,358.3,20481,1,4,0)
 ;;=4^E11.43
 ;;^UTILITY(U,$J,358.3,20481,2)
 ;;=^5002647
 ;;^UTILITY(U,$J,358.3,20482,0)
 ;;=E11.51^^97^961^11
 ;;^UTILITY(U,$J,358.3,20482,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20482,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Peripheral Angiopathy w/o Gangrene
 ;;^UTILITY(U,$J,358.3,20482,1,4,0)
 ;;=4^E11.51
 ;;^UTILITY(U,$J,358.3,20482,2)
 ;;=^5002650
 ;;^UTILITY(U,$J,358.3,20483,0)
 ;;=E11.52^^97^961^12
 ;;^UTILITY(U,$J,358.3,20483,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20483,1,3,0)
 ;;=3^DM Type 2 w/ Diabetic Peripheral Angiopathy w/ Gangrene
 ;;^UTILITY(U,$J,358.3,20483,1,4,0)
 ;;=4^E11.52
 ;;^UTILITY(U,$J,358.3,20483,2)
 ;;=^5002651
 ;;^UTILITY(U,$J,358.3,20484,0)
 ;;=E11.621^^97^961^14
 ;;^UTILITY(U,$J,358.3,20484,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20484,1,3,0)
 ;;=3^DM Type 2 w/ Foot Ulcer
 ;;^UTILITY(U,$J,358.3,20484,1,4,0)
 ;;=4^E11.621
 ;;^UTILITY(U,$J,358.3,20484,2)
 ;;=^5002656
 ;;^UTILITY(U,$J,358.3,20485,0)
 ;;=E11.641^^97^961^16
 ;;^UTILITY(U,$J,358.3,20485,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20485,1,3,0)
 ;;=3^DM Type 2 w/ Hypoglycemia w/ Coma
 ;;^UTILITY(U,$J,358.3,20485,1,4,0)
 ;;=4^E11.641
 ;;^UTILITY(U,$J,358.3,20485,2)
 ;;=^5002661
 ;;^UTILITY(U,$J,358.3,20486,0)
 ;;=E11.649^^97^961^17
 ;;^UTILITY(U,$J,358.3,20486,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20486,1,3,0)
 ;;=3^DM Type 2 w/ Hypoglycemia w/o Coma
 ;;^UTILITY(U,$J,358.3,20486,1,4,0)
 ;;=4^E11.649
 ;;^UTILITY(U,$J,358.3,20486,2)
 ;;=^5002662
 ;;^UTILITY(U,$J,358.3,20487,0)
 ;;=H40.11X0^^97^962^8
 ;;^UTILITY(U,$J,358.3,20487,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20487,1,3,0)
 ;;=3^Glaucoma,Primary Open-Angle,Unspec Stage
 ;;^UTILITY(U,$J,358.3,20487,1,4,0)
 ;;=4^H40.11X0
 ;;^UTILITY(U,$J,358.3,20487,2)
 ;;=^5005753
 ;;^UTILITY(U,$J,358.3,20488,0)
 ;;=H40.11X1^^97^962^5
 ;;^UTILITY(U,$J,358.3,20488,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20488,1,3,0)
 ;;=3^Glaucoma,Primary Open-Angle,Mild Stage
 ;;^UTILITY(U,$J,358.3,20488,1,4,0)
 ;;=4^H40.11X1
 ;;^UTILITY(U,$J,358.3,20488,2)
 ;;=^5005754
 ;;^UTILITY(U,$J,358.3,20489,0)
 ;;=H40.11X2^^97^962^6
 ;;^UTILITY(U,$J,358.3,20489,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20489,1,3,0)
 ;;=3^Glaucoma,Primary Open-Angle,Moderate Stage
 ;;^UTILITY(U,$J,358.3,20489,1,4,0)
 ;;=4^H40.11X2
 ;;^UTILITY(U,$J,358.3,20489,2)
 ;;=^5005755
 ;;^UTILITY(U,$J,358.3,20490,0)
 ;;=H40.11X3^^97^962^7
 ;;^UTILITY(U,$J,358.3,20490,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20490,1,3,0)
 ;;=3^Glaucoma,Primary Open-Angle,Severe Stage
