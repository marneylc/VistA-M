IBDEI3EL ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,57227,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57227,1,3,0)
 ;;=3^Met Malig Neop Ing & Lower Limb LNs
 ;;^UTILITY(U,$J,358.3,57227,1,4,0)
 ;;=4^C77.4
 ;;^UTILITY(U,$J,358.3,57227,2)
 ;;=^5001331
 ;;^UTILITY(U,$J,358.3,57228,0)
 ;;=C77.5^^264^2853^10
 ;;^UTILITY(U,$J,358.3,57228,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57228,1,3,0)
 ;;=3^Met Malig Neop Intrapelvic LNs
 ;;^UTILITY(U,$J,358.3,57228,1,4,0)
 ;;=4^C77.5
 ;;^UTILITY(U,$J,358.3,57228,2)
 ;;=^267319
 ;;^UTILITY(U,$J,358.3,57229,0)
 ;;=C78.01^^264^2853^24
 ;;^UTILITY(U,$J,358.3,57229,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57229,1,3,0)
 ;;=3^Met Malig Neop Rt Lung
 ;;^UTILITY(U,$J,358.3,57229,1,4,0)
 ;;=4^C78.01
 ;;^UTILITY(U,$J,358.3,57229,2)
 ;;=^5001335
 ;;^UTILITY(U,$J,358.3,57230,0)
 ;;=C78.02^^264^2853^17
 ;;^UTILITY(U,$J,358.3,57230,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57230,1,3,0)
 ;;=3^Met Malig Neop Lt Lung
 ;;^UTILITY(U,$J,358.3,57230,1,4,0)
 ;;=4^C78.02
 ;;^UTILITY(U,$J,358.3,57230,2)
 ;;=^5001336
 ;;^UTILITY(U,$J,358.3,57231,0)
 ;;=C78.1^^264^2853^19
 ;;^UTILITY(U,$J,358.3,57231,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57231,1,3,0)
 ;;=3^Met Malig Neop Mediastinum
 ;;^UTILITY(U,$J,358.3,57231,1,4,0)
 ;;=4^C78.1
 ;;^UTILITY(U,$J,358.3,57231,2)
 ;;=^267323
 ;;^UTILITY(U,$J,358.3,57232,0)
 ;;=C78.2^^264^2853^20
 ;;^UTILITY(U,$J,358.3,57232,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57232,1,3,0)
 ;;=3^Met Malig Neop Pleura
 ;;^UTILITY(U,$J,358.3,57232,1,4,0)
 ;;=4^C78.2
 ;;^UTILITY(U,$J,358.3,57232,2)
 ;;=^267324
 ;;^UTILITY(U,$J,358.3,57233,0)
 ;;=C78.4^^264^2853^27
 ;;^UTILITY(U,$J,358.3,57233,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57233,1,3,0)
 ;;=3^Met Malig Neop Small Intestine
 ;;^UTILITY(U,$J,358.3,57233,1,4,0)
 ;;=4^C78.4
 ;;^UTILITY(U,$J,358.3,57233,2)
 ;;=^5001338
 ;;^UTILITY(U,$J,358.3,57234,0)
 ;;=C78.5^^264^2853^13
 ;;^UTILITY(U,$J,358.3,57234,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57234,1,3,0)
 ;;=3^Met Malig Neop Lg Intestine & Rectum
 ;;^UTILITY(U,$J,358.3,57234,1,4,0)
 ;;=4^C78.5
 ;;^UTILITY(U,$J,358.3,57234,2)
 ;;=^267327
 ;;^UTILITY(U,$J,358.3,57235,0)
 ;;=C78.6^^264^2853^21
 ;;^UTILITY(U,$J,358.3,57235,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57235,1,3,0)
 ;;=3^Met Malig Neop Retroperitoneum & Peritoneum
 ;;^UTILITY(U,$J,358.3,57235,1,4,0)
 ;;=4^C78.6
 ;;^UTILITY(U,$J,358.3,57235,2)
 ;;=^108899
 ;;^UTILITY(U,$J,358.3,57236,0)
 ;;=C78.7^^264^2853^14
 ;;^UTILITY(U,$J,358.3,57236,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57236,1,3,0)
 ;;=3^Met Malig Neop Liver & Intrahepatic Duct
 ;;^UTILITY(U,$J,358.3,57236,1,4,0)
 ;;=4^C78.7
 ;;^UTILITY(U,$J,358.3,57236,2)
 ;;=^5001339
 ;;^UTILITY(U,$J,358.3,57237,0)
 ;;=C79.81^^264^2853^6
 ;;^UTILITY(U,$J,358.3,57237,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57237,1,3,0)
 ;;=3^Met Malig Neop Breast
 ;;^UTILITY(U,$J,358.3,57237,1,4,0)
 ;;=4^C79.81
 ;;^UTILITY(U,$J,358.3,57237,2)
 ;;=^267338
 ;;^UTILITY(U,$J,358.3,57238,0)
 ;;=C79.82^^264^2853^7
 ;;^UTILITY(U,$J,358.3,57238,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57238,1,3,0)
 ;;=3^Met Malig Neop Genital Organs
 ;;^UTILITY(U,$J,358.3,57238,1,4,0)
 ;;=4^C79.82
 ;;^UTILITY(U,$J,358.3,57238,2)
 ;;=^267339
 ;;^UTILITY(U,$J,358.3,57239,0)
 ;;=C79.01^^264^2853^23
 ;;^UTILITY(U,$J,358.3,57239,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,57239,1,3,0)
 ;;=3^Met Malig Neop Rt Kidney & Renal Pelvis
 ;;^UTILITY(U,$J,358.3,57239,1,4,0)
 ;;=4^C79.01
 ;;^UTILITY(U,$J,358.3,57239,2)
 ;;=^5001343
 ;;^UTILITY(U,$J,358.3,57240,0)
 ;;=C79.02^^264^2853^16
 ;;^UTILITY(U,$J,358.3,57240,1,0)
 ;;=^358.31IA^4^2
