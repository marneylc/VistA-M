IBDEI0LQ ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,9910,1,2,0)
 ;;=2^99292
 ;;^UTILITY(U,$J,358.3,9911,0)
 ;;=B18.2^^68^659^26
 ;;^UTILITY(U,$J,358.3,9911,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9911,1,3,0)
 ;;=3^Hepatitis C,Chr
 ;;^UTILITY(U,$J,358.3,9911,1,4,0)
 ;;=4^B18.2
 ;;^UTILITY(U,$J,358.3,9911,2)
 ;;=^5000548
 ;;^UTILITY(U,$J,358.3,9912,0)
 ;;=C44.99^^68^659^50
 ;;^UTILITY(U,$J,358.3,9912,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9912,1,3,0)
 ;;=3^Skin Cancer,Unspec
 ;;^UTILITY(U,$J,358.3,9912,1,4,0)
 ;;=4^C44.99
 ;;^UTILITY(U,$J,358.3,9912,2)
 ;;=^5001094
 ;;^UTILITY(U,$J,358.3,9913,0)
 ;;=E11.9^^68^659^15
 ;;^UTILITY(U,$J,358.3,9913,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9913,1,3,0)
 ;;=3^Diabetes Type 2
 ;;^UTILITY(U,$J,358.3,9913,1,4,0)
 ;;=4^E11.9
 ;;^UTILITY(U,$J,358.3,9913,2)
 ;;=^5002666
 ;;^UTILITY(U,$J,358.3,9914,0)
 ;;=E11.40^^68^659^16
 ;;^UTILITY(U,$J,358.3,9914,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9914,1,3,0)
 ;;=3^Diabetes Type 2 w/ Neuropathy
 ;;^UTILITY(U,$J,358.3,9914,1,4,0)
 ;;=4^E11.40
 ;;^UTILITY(U,$J,358.3,9914,2)
 ;;=^5002644
 ;;^UTILITY(U,$J,358.3,9915,0)
 ;;=E78.2^^68^659^27
 ;;^UTILITY(U,$J,358.3,9915,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9915,1,3,0)
 ;;=3^Hyperlipidemia,Mixed
 ;;^UTILITY(U,$J,358.3,9915,1,4,0)
 ;;=4^E78.2
 ;;^UTILITY(U,$J,358.3,9915,2)
 ;;=^78424
 ;;^UTILITY(U,$J,358.3,9916,0)
 ;;=E78.5^^68^659^28
 ;;^UTILITY(U,$J,358.3,9916,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9916,1,3,0)
 ;;=3^Hyperlipidemia,Unspec
 ;;^UTILITY(U,$J,358.3,9916,1,4,0)
 ;;=4^E78.5
 ;;^UTILITY(U,$J,358.3,9916,2)
 ;;=^5002969
 ;;^UTILITY(U,$J,358.3,9917,0)
 ;;=E66.3^^68^659^44
 ;;^UTILITY(U,$J,358.3,9917,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9917,1,3,0)
 ;;=3^Overweight
 ;;^UTILITY(U,$J,358.3,9917,1,4,0)
 ;;=4^E66.3
 ;;^UTILITY(U,$J,358.3,9917,2)
 ;;=^5002830
 ;;^UTILITY(U,$J,358.3,9918,0)
 ;;=D64.9^^68^659^3
 ;;^UTILITY(U,$J,358.3,9918,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9918,1,3,0)
 ;;=3^Anemia,Unspec
 ;;^UTILITY(U,$J,358.3,9918,1,4,0)
 ;;=4^D64.9
 ;;^UTILITY(U,$J,358.3,9918,2)
 ;;=^5002351
 ;;^UTILITY(U,$J,358.3,9919,0)
 ;;=F17.200^^68^659^41
 ;;^UTILITY(U,$J,358.3,9919,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9919,1,3,0)
 ;;=3^Nicotine Dependence,Unspec
 ;;^UTILITY(U,$J,358.3,9919,1,4,0)
 ;;=4^F17.200
 ;;^UTILITY(U,$J,358.3,9919,2)
 ;;=^5003360
 ;;^UTILITY(U,$J,358.3,9920,0)
 ;;=F17.229^^68^659^38
 ;;^UTILITY(U,$J,358.3,9920,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9920,1,3,0)
 ;;=3^Nicotine Dependence,Chewing Tobacco
 ;;^UTILITY(U,$J,358.3,9920,1,4,0)
 ;;=4^F17.229
 ;;^UTILITY(U,$J,358.3,9920,2)
 ;;=^5003374
 ;;^UTILITY(U,$J,358.3,9921,0)
 ;;=F19.10^^68^659^53
 ;;^UTILITY(U,$J,358.3,9921,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9921,1,3,0)
 ;;=3^Substance Abuse,Unspec
 ;;^UTILITY(U,$J,358.3,9921,1,4,0)
 ;;=4^F19.10
 ;;^UTILITY(U,$J,358.3,9921,2)
 ;;=^5003416
 ;;^UTILITY(U,$J,358.3,9922,0)
 ;;=F15.10^^68^659^52
 ;;^UTILITY(U,$J,358.3,9922,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9922,1,3,0)
 ;;=3^Stimulant Abuse,Unspec
 ;;^UTILITY(U,$J,358.3,9922,1,4,0)
 ;;=4^F15.10
 ;;^UTILITY(U,$J,358.3,9922,2)
 ;;=^5003282
 ;;^UTILITY(U,$J,358.3,9923,0)
 ;;=F43.21^^68^659^2
 ;;^UTILITY(U,$J,358.3,9923,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9923,1,3,0)
 ;;=3^Adjustment d/o w/ Depressed Mood
 ;;^UTILITY(U,$J,358.3,9923,1,4,0)
 ;;=4^F43.21
 ;;^UTILITY(U,$J,358.3,9923,2)
 ;;=^331948
 ;;^UTILITY(U,$J,358.3,9924,0)
 ;;=G43.909^^68^659^37
 ;;^UTILITY(U,$J,358.3,9924,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,9924,1,3,0)
 ;;=3^Migraine,Unspec
 ;;^UTILITY(U,$J,358.3,9924,1,4,0)
 ;;=4^G43.909
