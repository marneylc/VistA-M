IBDEI01L ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.2)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.2,252,2,3,0)
 ;;=1^ ^^2^^1^^1^^0
 ;;^UTILITY(U,$J,358.2,253,0)
 ;;=ICD-10 DIAGNOSES^435^^^^^4^0^SC^^8^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,253,2,0)
 ;;=^358.22I^5^5
 ;;^UTILITY(U,$J,358.2,253,2,1,0)
 ;;=4^CODE^8^1^1^^0
 ;;^UTILITY(U,$J,358.2,253,2,2,0)
 ;;=3^DIAGNOSIS^64^1^2^^1
 ;;^UTILITY(U,$J,358.2,253,2,3,0)
 ;;=5^ADD^^2^^1^^1^7^0
 ;;^UTILITY(U,$J,358.2,253,2,4,0)
 ;;=1^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,253,2,5,0)
 ;;=2^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,254,0)
 ;;=VISIT TYPE^438^^^^^2^0^C^^6^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,254,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,254,1,1,0)
 ;;=1^2
 ;;^UTILITY(U,$J,358.2,254,2,0)
 ;;=^358.22I^4^3
 ;;^UTILITY(U,$J,358.2,254,2,1,0)
 ;;=1^ ^28^1^2^^1
 ;;^UTILITY(U,$J,358.2,254,2,3,0)
 ;;=3^^^2^^1^^1^^1
 ;;^UTILITY(U,$J,358.2,254,2,4,0)
 ;;=2^ ^5^1^1
 ;;^UTILITY(U,$J,358.2,255,0)
 ;;=CPT CODES^439^^R^^^3^0^UBC^^1^1^^0^^0
 ;;^UTILITY(U,$J,358.2,255,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,255,1,1,0)
 ;;=1^2
 ;;^UTILITY(U,$J,358.2,255,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,255,2,1,0)
 ;;=1^CODE^5^1^1^^0
 ;;^UTILITY(U,$J,358.2,255,2,2,0)
 ;;=2^PROCEDURE^32^1^2^^1
 ;;^UTILITY(U,$J,358.2,255,2,3,0)
 ;;=3^ ^^2^^1^^1^^0
 ;;^UTILITY(U,$J,358.2,256,0)
 ;;=ICD-10 DIAGNOSES^440^^^^^4^0^SC^^8^0^1^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,256,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,256,1,1,0)
 ;;=1^2^1
 ;;^UTILITY(U,$J,358.2,256,2,0)
 ;;=^358.22I^5^5
 ;;^UTILITY(U,$J,358.2,256,2,1,0)
 ;;=4^CODE^8^1^1^^0
 ;;^UTILITY(U,$J,358.2,256,2,2,0)
 ;;=3^DIAGNOSIS^95^1^2^^1
 ;;^UTILITY(U,$J,358.2,256,2,3,0)
 ;;=5^ADD^^2^^1^^1^7^0
 ;;^UTILITY(U,$J,358.2,256,2,4,0)
 ;;=1^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,256,2,5,0)
 ;;=2^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,257,0)
 ;;=VISIT TYPE^441^^^^^2^0^C^^6^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,257,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,257,1,1,0)
 ;;=1^2
 ;;^UTILITY(U,$J,358.2,257,2,0)
 ;;=^358.22I^4^3
 ;;^UTILITY(U,$J,358.2,257,2,1,0)
 ;;=1^ ^28^1^2^^1
 ;;^UTILITY(U,$J,358.2,257,2,3,0)
 ;;=3^^^2^^1^^1^^1
 ;;^UTILITY(U,$J,358.2,257,2,4,0)
 ;;=2^ ^5^1^1
 ;;^UTILITY(U,$J,358.2,258,0)
 ;;=CPT CODES^444^^^^^1^0^UBC^^1^0^3^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,258,1,0)
 ;;=^358.21I^3^3
 ;;^UTILITY(U,$J,358.2,258,1,1,0)
 ;;=1^2^1
 ;;^UTILITY(U,$J,358.2,258,1,2,0)
 ;;=2^2^44
 ;;^UTILITY(U,$J,358.2,258,1,3,0)
 ;;=3^2^79
 ;;^UTILITY(U,$J,358.2,258,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,258,2,1,0)
 ;;=1^ ^^2^^1^^1
 ;;^UTILITY(U,$J,358.2,258,2,2,0)
 ;;=2^ ^5^1^1^^1
 ;;^UTILITY(U,$J,358.2,258,2,3,0)
 ;;=3^ ^35^1^2^^1
 ;;^UTILITY(U,$J,358.2,259,0)
 ;;=ICD-10 DIAGNOSES^445^^^^^4^0^SC^^8^0^1^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,259,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,259,1,1,0)
 ;;=1^2^1
 ;;^UTILITY(U,$J,358.2,259,2,0)
 ;;=^358.22I^6^5
 ;;^UTILITY(U,$J,358.2,259,2,1,0)
 ;;=4^CODE^8^1^1^^0
 ;;^UTILITY(U,$J,358.2,259,2,2,0)
 ;;=3^DIAGNOSIS^95^1^2^^1
 ;;^UTILITY(U,$J,358.2,259,2,3,0)
 ;;=5^ADD^^2^^1^^1^7^0
 ;;^UTILITY(U,$J,358.2,259,2,5,0)
 ;;=2^S^^2^^1^^1^2^0
 ;;^UTILITY(U,$J,358.2,259,2,6,0)
 ;;=1^P^^2^^1^^1^1^1
 ;;^UTILITY(U,$J,358.2,260,0)
 ;;=CPT CODES^448^^^^^1^0^BSC^^1^0^^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,260,2,0)
 ;;=^358.22I^3^3
 ;;^UTILITY(U,$J,358.2,260,2,1,0)
 ;;=4^ ^5^1^1^^0
 ;;^UTILITY(U,$J,358.2,260,2,2,0)
 ;;=2^ ^45^1^2^^1
 ;;^UTILITY(U,$J,358.2,260,2,3,0)
 ;;=1^ ^^2^^1^^1^^0
 ;;^UTILITY(U,$J,358.2,261,0)
 ;;=ICD-10 DIAGNOSES^449^^^^^4^0^SC^^8^0^1^0^^0^3^2
 ;;^UTILITY(U,$J,358.2,261,1,0)
 ;;=^358.21I^1^1
 ;;^UTILITY(U,$J,358.2,261,1,1,0)
 ;;=1^2^1
 ;;^UTILITY(U,$J,358.2,261,2,0)
 ;;=^358.22I^5^5
 ;;^UTILITY(U,$J,358.2,261,2,1,0)
 ;;=4^CODE^8^1^1^^0
