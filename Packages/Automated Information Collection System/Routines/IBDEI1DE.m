IBDEI1DE ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,22841,1,4,0)
 ;;=4^C92.21
 ;;^UTILITY(U,$J,358.3,22841,2)
 ;;=^5001796
 ;;^UTILITY(U,$J,358.3,22842,0)
 ;;=D46.9^^104^1065^5
 ;;^UTILITY(U,$J,358.3,22842,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22842,1,3,0)
 ;;=3^Myelodysplastic Syndrome,Unspec
 ;;^UTILITY(U,$J,358.3,22842,1,4,0)
 ;;=4^D46.9
 ;;^UTILITY(U,$J,358.3,22842,2)
 ;;=^334031
 ;;^UTILITY(U,$J,358.3,22843,0)
 ;;=D45.^^104^1065^12
 ;;^UTILITY(U,$J,358.3,22843,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22843,1,3,0)
 ;;=3^Polycythemia Vera
 ;;^UTILITY(U,$J,358.3,22843,1,4,0)
 ;;=4^D45.
 ;;^UTILITY(U,$J,358.3,22843,2)
 ;;=^96105
 ;;^UTILITY(U,$J,358.3,22844,0)
 ;;=D75.1^^104^1065^13
 ;;^UTILITY(U,$J,358.3,22844,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22844,1,3,0)
 ;;=3^Polycythemia,Secondary
 ;;^UTILITY(U,$J,358.3,22844,1,4,0)
 ;;=4^D75.1
 ;;^UTILITY(U,$J,358.3,22844,2)
 ;;=^186856
 ;;^UTILITY(U,$J,358.3,22845,0)
 ;;=D68.51^^104^1065^1
 ;;^UTILITY(U,$J,358.3,22845,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22845,1,3,0)
 ;;=3^Activated Protein C Resistance
 ;;^UTILITY(U,$J,358.3,22845,1,4,0)
 ;;=4^D68.51
 ;;^UTILITY(U,$J,358.3,22845,2)
 ;;=^5002358
 ;;^UTILITY(U,$J,358.3,22846,0)
 ;;=D68.52^^104^1065^16
 ;;^UTILITY(U,$J,358.3,22846,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22846,1,3,0)
 ;;=3^Prothrombin Gene Mutation
 ;;^UTILITY(U,$J,358.3,22846,1,4,0)
 ;;=4^D68.52
 ;;^UTILITY(U,$J,358.3,22846,2)
 ;;=^5002359
 ;;^UTILITY(U,$J,358.3,22847,0)
 ;;=D68.59^^104^1065^17
 ;;^UTILITY(U,$J,358.3,22847,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22847,1,3,0)
 ;;=3^Thrombophilia,Primary,Other
 ;;^UTILITY(U,$J,358.3,22847,1,4,0)
 ;;=4^D68.59
 ;;^UTILITY(U,$J,358.3,22847,2)
 ;;=^5002360
 ;;^UTILITY(U,$J,358.3,22848,0)
 ;;=D68.62^^104^1065^2
 ;;^UTILITY(U,$J,358.3,22848,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22848,1,3,0)
 ;;=3^Lupus Anticoagulant Syndrome
 ;;^UTILITY(U,$J,358.3,22848,1,4,0)
 ;;=4^D68.62
 ;;^UTILITY(U,$J,358.3,22848,2)
 ;;=^5002361
 ;;^UTILITY(U,$J,358.3,22849,0)
 ;;=D72.9^^104^1065^18
 ;;^UTILITY(U,$J,358.3,22849,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22849,1,3,0)
 ;;=3^White Blood Cell Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,22849,1,4,0)
 ;;=4^D72.9
 ;;^UTILITY(U,$J,358.3,22849,2)
 ;;=^5002381
 ;;^UTILITY(U,$J,358.3,22850,0)
 ;;=Z85.038^^104^1066^15
 ;;^UTILITY(U,$J,358.3,22850,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22850,1,3,0)
 ;;=3^Personal Hx Malig Neop Large Intestine
 ;;^UTILITY(U,$J,358.3,22850,1,4,0)
 ;;=4^Z85.038
 ;;^UTILITY(U,$J,358.3,22850,2)
 ;;=^5063399
 ;;^UTILITY(U,$J,358.3,22851,0)
 ;;=Z85.51^^104^1066^3
 ;;^UTILITY(U,$J,358.3,22851,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22851,1,3,0)
 ;;=3^Personal Hx Malig Neop Bladder
 ;;^UTILITY(U,$J,358.3,22851,1,4,0)
 ;;=4^Z85.51
 ;;^UTILITY(U,$J,358.3,22851,2)
 ;;=^5063428
 ;;^UTILITY(U,$J,358.3,22852,0)
 ;;=Z85.830^^104^1066^4
 ;;^UTILITY(U,$J,358.3,22852,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22852,1,3,0)
 ;;=3^Personal Hx Malig Neop Bone
 ;;^UTILITY(U,$J,358.3,22852,1,4,0)
 ;;=4^Z85.830
 ;;^UTILITY(U,$J,358.3,22852,2)
 ;;=^5063444
 ;;^UTILITY(U,$J,358.3,22853,0)
 ;;=Z85.841^^104^1066^5
 ;;^UTILITY(U,$J,358.3,22853,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22853,1,3,0)
 ;;=3^Personal Hx Malig Neop Brain
 ;;^UTILITY(U,$J,358.3,22853,1,4,0)
 ;;=4^Z85.841
 ;;^UTILITY(U,$J,358.3,22853,2)
 ;;=^5063447
 ;;^UTILITY(U,$J,358.3,22854,0)
 ;;=Z85.3^^104^1066^6
 ;;^UTILITY(U,$J,358.3,22854,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,22854,1,3,0)
 ;;=3^Personal Hx Malig Neop Breast
 ;;^UTILITY(U,$J,358.3,22854,1,4,0)
 ;;=4^Z85.3