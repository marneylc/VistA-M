IBDEI0Z3 ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16162,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16162,1,3,0)
 ;;=3^Crohn's Disease,Small Intestine w/o Complications
 ;;^UTILITY(U,$J,358.3,16162,1,4,0)
 ;;=4^K50.00
 ;;^UTILITY(U,$J,358.3,16162,2)
 ;;=^5008624
 ;;^UTILITY(U,$J,358.3,16163,0)
 ;;=K92.9^^88^843^19
 ;;^UTILITY(U,$J,358.3,16163,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16163,1,3,0)
 ;;=3^Digestive System Disease,Unspec
 ;;^UTILITY(U,$J,358.3,16163,1,4,0)
 ;;=4^K92.9
 ;;^UTILITY(U,$J,358.3,16163,2)
 ;;=^5008917
 ;;^UTILITY(U,$J,358.3,16164,0)
 ;;=K57.93^^88^843^22
 ;;^UTILITY(U,$J,358.3,16164,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16164,1,3,0)
 ;;=3^Dvtrcli of Intest w/o Perf/Abscess w/ Bleeding
 ;;^UTILITY(U,$J,358.3,16164,1,4,0)
 ;;=4^K57.93
 ;;^UTILITY(U,$J,358.3,16164,2)
 ;;=^5008738
 ;;^UTILITY(U,$J,358.3,16165,0)
 ;;=K57.92^^88^843^23
 ;;^UTILITY(U,$J,358.3,16165,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16165,1,3,0)
 ;;=3^Dvtrcli of Intest w/o Perf/Abscess w/o Bleeding
 ;;^UTILITY(U,$J,358.3,16165,1,4,0)
 ;;=4^K57.92
 ;;^UTILITY(U,$J,358.3,16165,2)
 ;;=^5008737
 ;;^UTILITY(U,$J,358.3,16166,0)
 ;;=K57.91^^88^843^20
 ;;^UTILITY(U,$J,358.3,16166,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16166,1,3,0)
 ;;=3^Dvrtclos of Intest w/o Perf/Abscess w/ Bleed
 ;;^UTILITY(U,$J,358.3,16166,1,4,0)
 ;;=4^K57.91
 ;;^UTILITY(U,$J,358.3,16166,2)
 ;;=^5008736
 ;;^UTILITY(U,$J,358.3,16167,0)
 ;;=K57.90^^88^843^21
 ;;^UTILITY(U,$J,358.3,16167,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16167,1,3,0)
 ;;=3^Dvrtclos of Intest w/o Perf/Abscess w/o Bleed
 ;;^UTILITY(U,$J,358.3,16167,1,4,0)
 ;;=4^K57.90
 ;;^UTILITY(U,$J,358.3,16167,2)
 ;;=^5008735
 ;;^UTILITY(U,$J,358.3,16168,0)
 ;;=K30.^^88^843^24
 ;;^UTILITY(U,$J,358.3,16168,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16168,1,3,0)
 ;;=3^Dyspepsia,Functional
 ;;^UTILITY(U,$J,358.3,16168,1,4,0)
 ;;=4^K30.
 ;;^UTILITY(U,$J,358.3,16168,2)
 ;;=^5008558
 ;;^UTILITY(U,$J,358.3,16169,0)
 ;;=K08.109^^88^843^25
 ;;^UTILITY(U,$J,358.3,16169,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16169,1,3,0)
 ;;=3^Edentulous
 ;;^UTILITY(U,$J,358.3,16169,1,4,0)
 ;;=4^K08.109
 ;;^UTILITY(U,$J,358.3,16169,2)
 ;;=^5008410
 ;;^UTILITY(U,$J,358.3,16170,0)
 ;;=K22.9^^88^843^26
 ;;^UTILITY(U,$J,358.3,16170,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16170,1,3,0)
 ;;=3^Esophagus Disease,Unspec
 ;;^UTILITY(U,$J,358.3,16170,1,4,0)
 ;;=4^K22.9
 ;;^UTILITY(U,$J,358.3,16170,2)
 ;;=^5008516
 ;;^UTILITY(U,$J,358.3,16171,0)
 ;;=R14.3^^88^843^27
 ;;^UTILITY(U,$J,358.3,16171,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16171,1,3,0)
 ;;=3^Flatulence
 ;;^UTILITY(U,$J,358.3,16171,1,4,0)
 ;;=4^R14.3
 ;;^UTILITY(U,$J,358.3,16171,2)
 ;;=^5019243
 ;;^UTILITY(U,$J,358.3,16172,0)
 ;;=K81.9^^88^843^11
 ;;^UTILITY(U,$J,358.3,16172,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16172,1,3,0)
 ;;=3^Cholecystitis,Unspec
 ;;^UTILITY(U,$J,358.3,16172,1,4,0)
 ;;=4^K81.9
 ;;^UTILITY(U,$J,358.3,16172,2)
 ;;=^87388
 ;;^UTILITY(U,$J,358.3,16173,0)
 ;;=K80.70^^88^843^28
 ;;^UTILITY(U,$J,358.3,16173,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16173,1,3,0)
 ;;=3^GB & Bile Duct Calculus w/o Cholecyst or Obstruction
 ;;^UTILITY(U,$J,358.3,16173,1,4,0)
 ;;=4^K80.70
 ;;^UTILITY(U,$J,358.3,16173,2)
 ;;=^5008870
 ;;^UTILITY(U,$J,358.3,16174,0)
 ;;=K80.71^^88^843^29
 ;;^UTILITY(U,$J,358.3,16174,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16174,1,3,0)
 ;;=3^GB & Bile Duct Calculus w/o Cholecyst w/ Obstruction
 ;;^UTILITY(U,$J,358.3,16174,1,4,0)
 ;;=4^K80.71
 ;;^UTILITY(U,$J,358.3,16174,2)
 ;;=^5133640
 ;;^UTILITY(U,$J,358.3,16175,0)
 ;;=K82.9^^88^843^32
