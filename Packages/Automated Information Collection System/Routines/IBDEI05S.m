IBDEI05S ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,2095,1,3,0)
 ;;=3^TC99M Labeled RBC per 30M
 ;;^UTILITY(U,$J,358.3,2096,0)
 ;;=A9500^^17^183^25^^^^1
 ;;^UTILITY(U,$J,358.3,2096,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2096,1,2,0)
 ;;=2^A9500
 ;;^UTILITY(U,$J,358.3,2096,1,3,0)
 ;;=3^Tc99M Sestamibi
 ;;^UTILITY(U,$J,358.3,2097,0)
 ;;=A9501^^17^183^26^^^^1
 ;;^UTILITY(U,$J,358.3,2097,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2097,1,2,0)
 ;;=2^A9501
 ;;^UTILITY(U,$J,358.3,2097,1,3,0)
 ;;=3^Technetium TC-99M Teboroxime
 ;;^UTILITY(U,$J,358.3,2098,0)
 ;;=A9502^^17^183^23^^^^1
 ;;^UTILITY(U,$J,358.3,2098,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2098,1,2,0)
 ;;=2^A9502
 ;;^UTILITY(U,$J,358.3,2098,1,3,0)
 ;;=3^TC99M Tetrofosmin
 ;;^UTILITY(U,$J,358.3,2099,0)
 ;;=J0280^^17^183^1^^^^1
 ;;^UTILITY(U,$J,358.3,2099,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2099,1,2,0)
 ;;=2^J0280
 ;;^UTILITY(U,$J,358.3,2099,1,3,0)
 ;;=3^Aminophyllin 250mg
 ;;^UTILITY(U,$J,358.3,2100,0)
 ;;=J0461^^17^183^2^^^^1
 ;;^UTILITY(U,$J,358.3,2100,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2100,1,2,0)
 ;;=2^J0461
 ;;^UTILITY(U,$J,358.3,2100,1,3,0)
 ;;=3^Atropine Sulfate 0.01mg
 ;;^UTILITY(U,$J,358.3,2101,0)
 ;;=J1245^^17^183^3^^^^1
 ;;^UTILITY(U,$J,358.3,2101,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2101,1,2,0)
 ;;=2^J1245
 ;;^UTILITY(U,$J,358.3,2101,1,3,0)
 ;;=3^Dipyridamole per 10mg
 ;;^UTILITY(U,$J,358.3,2102,0)
 ;;=J2785^^17^183^21^^^^1
 ;;^UTILITY(U,$J,358.3,2102,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2102,1,2,0)
 ;;=2^J2785
 ;;^UTILITY(U,$J,358.3,2102,1,3,0)
 ;;=3^Regadenoson 0.1mg
 ;;^UTILITY(U,$J,358.3,2103,0)
 ;;=J7030^^17^183^14^^^^1
 ;;^UTILITY(U,$J,358.3,2103,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2103,1,2,0)
 ;;=2^J7030
 ;;^UTILITY(U,$J,358.3,2103,1,3,0)
 ;;=3^NS Solution Infusion 1000ml
 ;;^UTILITY(U,$J,358.3,2104,0)
 ;;=J7050^^17^183^15^^^^1
 ;;^UTILITY(U,$J,358.3,2104,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2104,1,2,0)
 ;;=2^J7050
 ;;^UTILITY(U,$J,358.3,2104,1,3,0)
 ;;=3^NS Solution Infusion 250ml
 ;;^UTILITY(U,$J,358.3,2105,0)
 ;;=J7040^^17^183^16^^^^1
 ;;^UTILITY(U,$J,358.3,2105,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2105,1,2,0)
 ;;=2^J7040
 ;;^UTILITY(U,$J,358.3,2105,1,3,0)
 ;;=3^NS Solution Infusion 500ml
 ;;^UTILITY(U,$J,358.3,2106,0)
 ;;=J3240^^17^183^27^^^^1
 ;;^UTILITY(U,$J,358.3,2106,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2106,1,2,0)
 ;;=2^J3240
 ;;^UTILITY(U,$J,358.3,2106,1,3,0)
 ;;=3^Thyrotropin Alpha 0.9mg
 ;;^UTILITY(U,$J,358.3,2107,0)
 ;;=93015^^17^184^7
 ;;^UTILITY(U,$J,358.3,2107,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2107,1,2,0)
 ;;=2^93015
 ;;^UTILITY(U,$J,358.3,2107,1,3,0)
 ;;=3^Cardiovascular Stress Test
 ;;^UTILITY(U,$J,358.3,2108,0)
 ;;=93660^^17^184^16
 ;;^UTILITY(U,$J,358.3,2108,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2108,1,2,0)
 ;;=2^93660
 ;;^UTILITY(U,$J,358.3,2108,1,3,0)
 ;;=3^Tilt Test Study
 ;;^UTILITY(U,$J,358.3,2109,0)
 ;;=78472^^17^184^2^^^^1
 ;;^UTILITY(U,$J,358.3,2109,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2109,1,2,0)
 ;;=2^78472
 ;;^UTILITY(U,$J,358.3,2109,1,3,0)
 ;;=3^Cardiac Blood Pool Gate+EF 
 ;;^UTILITY(U,$J,358.3,2110,0)
 ;;=78473^^17^184^1^^^^1
 ;;^UTILITY(U,$J,358.3,2110,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2110,1,2,0)
 ;;=2^78473
 ;;^UTILITY(U,$J,358.3,2110,1,3,0)
 ;;=3^Cardiac Blood Pool Gate mult
 ;;^UTILITY(U,$J,358.3,2111,0)
 ;;=78481^^17^184^3^^^^1
 ;;^UTILITY(U,$J,358.3,2111,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,2111,1,2,0)
 ;;=2^78481
 ;;^UTILITY(U,$J,358.3,2111,1,3,0)
 ;;=3^Cardiac Blood Pool Imag
 ;;^UTILITY(U,$J,358.3,2112,0)
 ;;=78483^^17^184^5^^^^1
