IBDEI35R ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,53019,0)
 ;;=L76.21^^243^2657^21
 ;;^UTILITY(U,$J,358.3,53019,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53019,1,3,0)
 ;;=3^Postprocedure Hemor/Hemtom of Skin/SQ Tissue Following Derm Procedure
 ;;^UTILITY(U,$J,358.3,53019,1,4,0)
 ;;=4^L76.21
 ;;^UTILITY(U,$J,358.3,53019,2)
 ;;=^5009306
 ;;^UTILITY(U,$J,358.3,53020,0)
 ;;=L76.22^^243^2657^22
 ;;^UTILITY(U,$J,358.3,53020,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53020,1,3,0)
 ;;=3^Postprocedure Hemor/Hemtom of Skin/SQ Tissue Following Oth Procedure
 ;;^UTILITY(U,$J,358.3,53020,1,4,0)
 ;;=4^L76.22
 ;;^UTILITY(U,$J,358.3,53020,2)
 ;;=^5009307
 ;;^UTILITY(U,$J,358.3,53021,0)
 ;;=L41.9^^243^2657^3
 ;;^UTILITY(U,$J,358.3,53021,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53021,1,3,0)
 ;;=3^Parapsoriasis,Unspec
 ;;^UTILITY(U,$J,358.3,53021,1,4,0)
 ;;=4^L41.9
 ;;^UTILITY(U,$J,358.3,53021,2)
 ;;=^5009177
 ;;^UTILITY(U,$J,358.3,53022,0)
 ;;=L70.5^^243^2657^12
 ;;^UTILITY(U,$J,358.3,53022,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53022,1,3,0)
 ;;=3^Picker's Acne
 ;;^UTILITY(U,$J,358.3,53022,1,4,0)
 ;;=4^L70.5
 ;;^UTILITY(U,$J,358.3,53022,2)
 ;;=^5009272
 ;;^UTILITY(U,$J,358.3,53023,0)
 ;;=L81.9^^243^2657^13
 ;;^UTILITY(U,$J,358.3,53023,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53023,1,3,0)
 ;;=3^Pigmentation Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,53023,1,4,0)
 ;;=4^L81.9
 ;;^UTILITY(U,$J,358.3,53023,2)
 ;;=^5009319
 ;;^UTILITY(U,$J,358.3,53024,0)
 ;;=L71.9^^243^2658^7
 ;;^UTILITY(U,$J,358.3,53024,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53024,1,3,0)
 ;;=3^Rosacea,Unspec
 ;;^UTILITY(U,$J,358.3,53024,1,4,0)
 ;;=4^L71.9
 ;;^UTILITY(U,$J,358.3,53024,2)
 ;;=^5009276
 ;;^UTILITY(U,$J,358.3,53025,0)
 ;;=L71.1^^243^2658^6
 ;;^UTILITY(U,$J,358.3,53025,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53025,1,3,0)
 ;;=3^Rhinophyma
 ;;^UTILITY(U,$J,358.3,53025,1,4,0)
 ;;=4^L71.1
 ;;^UTILITY(U,$J,358.3,53025,2)
 ;;=^106083
 ;;^UTILITY(U,$J,358.3,53026,0)
 ;;=I73.00^^243^2658^2
 ;;^UTILITY(U,$J,358.3,53026,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53026,1,3,0)
 ;;=3^Raynaud's Syndrome w/o Gangrene
 ;;^UTILITY(U,$J,358.3,53026,1,4,0)
 ;;=4^I73.00
 ;;^UTILITY(U,$J,358.3,53026,2)
 ;;=^5007796
 ;;^UTILITY(U,$J,358.3,53027,0)
 ;;=I73.01^^243^2658^1
 ;;^UTILITY(U,$J,358.3,53027,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53027,1,3,0)
 ;;=3^Raynaud's Syndrome w/ Gangrene
 ;;^UTILITY(U,$J,358.3,53027,1,4,0)
 ;;=4^I73.01
 ;;^UTILITY(U,$J,358.3,53027,2)
 ;;=^5007797
 ;;^UTILITY(U,$J,358.3,53028,0)
 ;;=Z48.01^^243^2658^4
 ;;^UTILITY(U,$J,358.3,53028,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53028,1,3,0)
 ;;=3^Removal/Change Surgical Wound Dressing
 ;;^UTILITY(U,$J,358.3,53028,1,4,0)
 ;;=4^Z48.01
 ;;^UTILITY(U,$J,358.3,53028,2)
 ;;=^5063034
 ;;^UTILITY(U,$J,358.3,53029,0)
 ;;=Z48.02^^243^2658^3
 ;;^UTILITY(U,$J,358.3,53029,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53029,1,3,0)
 ;;=3^Removal of Sutures
 ;;^UTILITY(U,$J,358.3,53029,1,4,0)
 ;;=4^Z48.02
 ;;^UTILITY(U,$J,358.3,53029,2)
 ;;=^5063035
 ;;^UTILITY(U,$J,358.3,53030,0)
 ;;=Z48.03^^243^2658^5
 ;;^UTILITY(U,$J,358.3,53030,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53030,1,3,0)
 ;;=3^Removal/Change of Drains
 ;;^UTILITY(U,$J,358.3,53030,1,4,0)
 ;;=4^Z48.03
 ;;^UTILITY(U,$J,358.3,53030,2)
 ;;=^5063036
 ;;^UTILITY(U,$J,358.3,53031,0)
 ;;=B86.^^243^2659^17
 ;;^UTILITY(U,$J,358.3,53031,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,53031,1,3,0)
 ;;=3^Scabies
 ;;^UTILITY(U,$J,358.3,53031,1,4,0)
 ;;=4^B86.
 ;;^UTILITY(U,$J,358.3,53031,2)
 ;;=^108096
 ;;^UTILITY(U,$J,358.3,53032,0)
 ;;=L98.8^^243^2659^26
