IBDEI1NH ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,27613,0)
 ;;=D63.1^^132^1320^23
 ;;^UTILITY(U,$J,358.3,27613,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27613,1,3,0)
 ;;=3^Anemia in Chronic Kidney Disease
 ;;^UTILITY(U,$J,358.3,27613,1,4,0)
 ;;=4^D63.1
 ;;^UTILITY(U,$J,358.3,27613,2)
 ;;=^332908
 ;;^UTILITY(U,$J,358.3,27614,0)
 ;;=D63.0^^132^1320^24
 ;;^UTILITY(U,$J,358.3,27614,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27614,1,3,0)
 ;;=3^Anemia in Neoplastic Disease
 ;;^UTILITY(U,$J,358.3,27614,1,4,0)
 ;;=4^D63.0
 ;;^UTILITY(U,$J,358.3,27614,2)
 ;;=^321978
 ;;^UTILITY(U,$J,358.3,27615,0)
 ;;=D63.8^^132^1320^22
 ;;^UTILITY(U,$J,358.3,27615,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27615,1,3,0)
 ;;=3^Anemia in Chronic Diseases Classified Elsewhere
 ;;^UTILITY(U,$J,358.3,27615,1,4,0)
 ;;=4^D63.8
 ;;^UTILITY(U,$J,358.3,27615,2)
 ;;=^5002343
 ;;^UTILITY(U,$J,358.3,27616,0)
 ;;=C22.3^^132^1320^25
 ;;^UTILITY(U,$J,358.3,27616,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27616,1,3,0)
 ;;=3^Angiosarcoma of Liver
 ;;^UTILITY(U,$J,358.3,27616,1,4,0)
 ;;=4^C22.3
 ;;^UTILITY(U,$J,358.3,27616,2)
 ;;=^5000936
 ;;^UTILITY(U,$J,358.3,27617,0)
 ;;=D61.9^^132^1320^26
 ;;^UTILITY(U,$J,358.3,27617,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27617,1,3,0)
 ;;=3^Aplastic Anemia,Unspec
 ;;^UTILITY(U,$J,358.3,27617,1,4,0)
 ;;=4^D61.9
 ;;^UTILITY(U,$J,358.3,27617,2)
 ;;=^5002342
 ;;^UTILITY(U,$J,358.3,27618,0)
 ;;=D56.1^^132^1320^28
 ;;^UTILITY(U,$J,358.3,27618,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27618,1,3,0)
 ;;=3^Beta Thalassemia
 ;;^UTILITY(U,$J,358.3,27618,1,4,0)
 ;;=4^D56.1
 ;;^UTILITY(U,$J,358.3,27618,2)
 ;;=^340495
 ;;^UTILITY(U,$J,358.3,27619,0)
 ;;=C83.79^^132^1320^29
 ;;^UTILITY(U,$J,358.3,27619,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27619,1,3,0)
 ;;=3^Burkitt Lymphoma,Extranodal/Solid Organ Sites
 ;;^UTILITY(U,$J,358.3,27619,1,4,0)
 ;;=4^C83.79
 ;;^UTILITY(U,$J,358.3,27619,2)
 ;;=^5001600
 ;;^UTILITY(U,$J,358.3,27620,0)
 ;;=C83.70^^132^1320^30
 ;;^UTILITY(U,$J,358.3,27620,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27620,1,3,0)
 ;;=3^Burkitt Lymphoma,Unspec Site
 ;;^UTILITY(U,$J,358.3,27620,1,4,0)
 ;;=4^C83.70
 ;;^UTILITY(U,$J,358.3,27620,2)
 ;;=^5001591
 ;;^UTILITY(U,$J,358.3,27621,0)
 ;;=D09.0^^132^1320^37
 ;;^UTILITY(U,$J,358.3,27621,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27621,1,3,0)
 ;;=3^Carcinoma in Situ of Bladder
 ;;^UTILITY(U,$J,358.3,27621,1,4,0)
 ;;=4^D09.0
 ;;^UTILITY(U,$J,358.3,27621,2)
 ;;=^267742
 ;;^UTILITY(U,$J,358.3,27622,0)
 ;;=D06.9^^132^1320^38
 ;;^UTILITY(U,$J,358.3,27622,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27622,1,3,0)
 ;;=3^Carcinoma in Situ of Cervix
 ;;^UTILITY(U,$J,358.3,27622,1,4,0)
 ;;=4^D06.9
 ;;^UTILITY(U,$J,358.3,27622,2)
 ;;=^5001941
 ;;^UTILITY(U,$J,358.3,27623,0)
 ;;=D06.0^^132^1320^40
 ;;^UTILITY(U,$J,358.3,27623,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27623,1,3,0)
 ;;=3^Carcinoma in Situ of Endocervix
 ;;^UTILITY(U,$J,358.3,27623,1,4,0)
 ;;=4^D06.0
 ;;^UTILITY(U,$J,358.3,27623,2)
 ;;=^5001938
 ;;^UTILITY(U,$J,358.3,27624,0)
 ;;=D06.1^^132^1320^41
 ;;^UTILITY(U,$J,358.3,27624,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27624,1,3,0)
 ;;=3^Carcinoma in Situ of Exocervix
 ;;^UTILITY(U,$J,358.3,27624,1,4,0)
 ;;=4^D06.1
 ;;^UTILITY(U,$J,358.3,27624,2)
 ;;=^5001939
 ;;^UTILITY(U,$J,358.3,27625,0)
 ;;=D06.7^^132^1320^39
 ;;^UTILITY(U,$J,358.3,27625,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27625,1,3,0)
 ;;=3^Carcinoma in Situ of Cervix,Other Parts
 ;;^UTILITY(U,$J,358.3,27625,1,4,0)
 ;;=4^D06.7
 ;;^UTILITY(U,$J,358.3,27625,2)
 ;;=^5001940
 ;;^UTILITY(U,$J,358.3,27626,0)
 ;;=D04.9^^132^1320^42