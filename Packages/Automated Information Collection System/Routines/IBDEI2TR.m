IBDEI2TR ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,47415,0)
 ;;=C83.11^^209^2346^288
 ;;^UTILITY(U,$J,358.3,47415,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47415,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Head/Face/Neck Nodes
 ;;^UTILITY(U,$J,358.3,47415,1,4,0)
 ;;=4^C83.11
 ;;^UTILITY(U,$J,358.3,47415,2)
 ;;=^5001562
 ;;^UTILITY(U,$J,358.3,47416,0)
 ;;=C83.12^^209^2346^292
 ;;^UTILITY(U,$J,358.3,47416,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47416,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Intrathoracic Nodes
 ;;^UTILITY(U,$J,358.3,47416,1,4,0)
 ;;=4^C83.12
 ;;^UTILITY(U,$J,358.3,47416,2)
 ;;=^5001563
 ;;^UTILITY(U,$J,358.3,47417,0)
 ;;=C83.13^^209^2346^290
 ;;^UTILITY(U,$J,358.3,47417,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47417,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Intra-Abdominal Nodes
 ;;^UTILITY(U,$J,358.3,47417,1,4,0)
 ;;=4^C83.13
 ;;^UTILITY(U,$J,358.3,47417,2)
 ;;=^5001564
 ;;^UTILITY(U,$J,358.3,47418,0)
 ;;=C83.14^^209^2346^286
 ;;^UTILITY(U,$J,358.3,47418,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47418,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Axilla/Upper Limb Nodes
 ;;^UTILITY(U,$J,358.3,47418,1,4,0)
 ;;=4^C83.14
 ;;^UTILITY(U,$J,358.3,47418,2)
 ;;=^5001565
 ;;^UTILITY(U,$J,358.3,47419,0)
 ;;=C83.15^^209^2346^289
 ;;^UTILITY(U,$J,358.3,47419,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47419,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Ing Region/Lower Limb Nodes
 ;;^UTILITY(U,$J,358.3,47419,1,4,0)
 ;;=4^C83.15
 ;;^UTILITY(U,$J,358.3,47419,2)
 ;;=^5001566
 ;;^UTILITY(U,$J,358.3,47420,0)
 ;;=C83.16^^209^2346^291
 ;;^UTILITY(U,$J,358.3,47420,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47420,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Intrapelvic Nodes
 ;;^UTILITY(U,$J,358.3,47420,1,4,0)
 ;;=4^C83.16
 ;;^UTILITY(U,$J,358.3,47420,2)
 ;;=^5001567
 ;;^UTILITY(U,$J,358.3,47421,0)
 ;;=C83.17^^209^2346^294
 ;;^UTILITY(U,$J,358.3,47421,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47421,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Spleen
 ;;^UTILITY(U,$J,358.3,47421,1,4,0)
 ;;=4^C83.17
 ;;^UTILITY(U,$J,358.3,47421,2)
 ;;=^5001568
 ;;^UTILITY(U,$J,358.3,47422,0)
 ;;=C83.18^^209^2346^293
 ;;^UTILITY(U,$J,358.3,47422,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47422,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Mult Site Nodes
 ;;^UTILITY(U,$J,358.3,47422,1,4,0)
 ;;=4^C83.18
 ;;^UTILITY(U,$J,358.3,47422,2)
 ;;=^5001569
 ;;^UTILITY(U,$J,358.3,47423,0)
 ;;=C83.19^^209^2346^287
 ;;^UTILITY(U,$J,358.3,47423,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47423,1,3,0)
 ;;=3^Mantle Cell Lymphoma,Extranodal/Solid Organ Sites
 ;;^UTILITY(U,$J,358.3,47423,1,4,0)
 ;;=4^C83.19
 ;;^UTILITY(U,$J,358.3,47423,2)
 ;;=^5001570
 ;;^UTILITY(U,$J,358.3,47424,0)
 ;;=C83.30^^209^2346^133
 ;;^UTILITY(U,$J,358.3,47424,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47424,1,3,0)
 ;;=3^Diffuse Large B-Cell Lymphoma,Unspec Site
 ;;^UTILITY(U,$J,358.3,47424,1,4,0)
 ;;=4^C83.30
 ;;^UTILITY(U,$J,358.3,47424,2)
 ;;=^5001571
 ;;^UTILITY(U,$J,358.3,47425,0)
 ;;=C83.31^^209^2346^126
 ;;^UTILITY(U,$J,358.3,47425,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47425,1,3,0)
 ;;=3^Diffuse Large B-Cell Lymphoma,Head/Face/Neck Nodes
 ;;^UTILITY(U,$J,358.3,47425,1,4,0)
 ;;=4^C83.31
 ;;^UTILITY(U,$J,358.3,47425,2)
 ;;=^5001572
 ;;^UTILITY(U,$J,358.3,47426,0)
 ;;=C83.32^^209^2346^130
 ;;^UTILITY(U,$J,358.3,47426,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,47426,1,3,0)
 ;;=3^Diffuse Large B-Cell Lymphoma,Intrathoracic Nodes
 ;;^UTILITY(U,$J,358.3,47426,1,4,0)
 ;;=4^C83.32
 ;;^UTILITY(U,$J,358.3,47426,2)
 ;;=^5001573
 ;;^UTILITY(U,$J,358.3,47427,0)
 ;;=C83.33^^209^2346^128
 ;;^UTILITY(U,$J,358.3,47427,1,0)
 ;;=^358.31IA^4^2
