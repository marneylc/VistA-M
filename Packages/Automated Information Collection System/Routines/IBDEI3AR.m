IBDEI3AR ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,55403,1,3,0)
 ;;=3^Temporomandibular Joint Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,55403,1,4,0)
 ;;=4^M26.60
 ;;^UTILITY(U,$J,358.3,55403,2)
 ;;=^5011714
 ;;^UTILITY(U,$J,358.3,55404,0)
 ;;=L40.52^^256^2781^120
 ;;^UTILITY(U,$J,358.3,55404,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55404,1,3,0)
 ;;=3^Psoriatic Arthritis Mutilans
 ;;^UTILITY(U,$J,358.3,55404,1,4,0)
 ;;=4^L40.52
 ;;^UTILITY(U,$J,358.3,55404,2)
 ;;=^5009167
 ;;^UTILITY(U,$J,358.3,55405,0)
 ;;=L40.53^^256^2781^121
 ;;^UTILITY(U,$J,358.3,55405,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55405,1,3,0)
 ;;=3^Psoriatic Spondylitis
 ;;^UTILITY(U,$J,358.3,55405,1,4,0)
 ;;=4^L40.53
 ;;^UTILITY(U,$J,358.3,55405,2)
 ;;=^5009168
 ;;^UTILITY(U,$J,358.3,55406,0)
 ;;=M32.9^^256^2781^162
 ;;^UTILITY(U,$J,358.3,55406,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55406,1,3,0)
 ;;=3^Systemic Lupus Erythematosus,Unspec
 ;;^UTILITY(U,$J,358.3,55406,1,4,0)
 ;;=4^M32.9
 ;;^UTILITY(U,$J,358.3,55406,2)
 ;;=^5011761
 ;;^UTILITY(U,$J,358.3,55407,0)
 ;;=M32.0^^256^2781^158
 ;;^UTILITY(U,$J,358.3,55407,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55407,1,3,0)
 ;;=3^Systemic Lupus Erythematosus,Drug-Induced
 ;;^UTILITY(U,$J,358.3,55407,1,4,0)
 ;;=4^M32.0
 ;;^UTILITY(U,$J,358.3,55407,2)
 ;;=^5011752
 ;;^UTILITY(U,$J,358.3,55408,0)
 ;;=M32.13^^256^2781^160
 ;;^UTILITY(U,$J,358.3,55408,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55408,1,3,0)
 ;;=3^Systemic Lupus Erythematosus,Lung Involvement
 ;;^UTILITY(U,$J,358.3,55408,1,4,0)
 ;;=4^M32.13
 ;;^UTILITY(U,$J,358.3,55408,2)
 ;;=^5011756
 ;;^UTILITY(U,$J,358.3,55409,0)
 ;;=M32.14^^256^2781^159
 ;;^UTILITY(U,$J,358.3,55409,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55409,1,3,0)
 ;;=3^Systemic Lupus Erythematosus,Glomerular Disease
 ;;^UTILITY(U,$J,358.3,55409,1,4,0)
 ;;=4^M32.14
 ;;^UTILITY(U,$J,358.3,55409,2)
 ;;=^5011757
 ;;^UTILITY(U,$J,358.3,55410,0)
 ;;=M32.12^^256^2781^161
 ;;^UTILITY(U,$J,358.3,55410,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55410,1,3,0)
 ;;=3^Systemic Lupus Erythematosus,Pericarditis
 ;;^UTILITY(U,$J,358.3,55410,1,4,0)
 ;;=4^M32.12
 ;;^UTILITY(U,$J,358.3,55410,2)
 ;;=^5011755
 ;;^UTILITY(U,$J,358.3,55411,0)
 ;;=M05.59^^256^2781^142
 ;;^UTILITY(U,$J,358.3,55411,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55411,1,3,0)
 ;;=3^Rheumatoid Polyneuropathy w/ Rheumatoid Arthritis of Mult Sites
 ;;^UTILITY(U,$J,358.3,55411,1,4,0)
 ;;=4^M05.59
 ;;^UTILITY(U,$J,358.3,55411,2)
 ;;=^5009976
 ;;^UTILITY(U,$J,358.3,55412,0)
 ;;=M05.711^^256^2781^136
 ;;^UTILITY(U,$J,358.3,55412,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55412,1,3,0)
 ;;=3^Rheumatoid Arthritis of Right Shoulder
 ;;^UTILITY(U,$J,358.3,55412,1,4,0)
 ;;=4^M05.711
 ;;^UTILITY(U,$J,358.3,55412,2)
 ;;=^5010001
 ;;^UTILITY(U,$J,358.3,55413,0)
 ;;=M05.712^^256^2781^129
 ;;^UTILITY(U,$J,358.3,55413,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55413,1,3,0)
 ;;=3^Rheumatoid Arthritis of Left Shoulder
 ;;^UTILITY(U,$J,358.3,55413,1,4,0)
 ;;=4^M05.712
 ;;^UTILITY(U,$J,358.3,55413,2)
 ;;=^5010002
 ;;^UTILITY(U,$J,358.3,55414,0)
 ;;=M05.731^^256^2781^137
 ;;^UTILITY(U,$J,358.3,55414,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55414,1,3,0)
 ;;=3^Rheumatoid Arthritis of Right Wrist
 ;;^UTILITY(U,$J,358.3,55414,1,4,0)
 ;;=4^M05.731
 ;;^UTILITY(U,$J,358.3,55414,2)
 ;;=^5010007
 ;;^UTILITY(U,$J,358.3,55415,0)
 ;;=M05.732^^256^2781^130
 ;;^UTILITY(U,$J,358.3,55415,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,55415,1,3,0)
 ;;=3^Rheumatoid Arthritis of Left Wrist
 ;;^UTILITY(U,$J,358.3,55415,1,4,0)
 ;;=4^M05.732
 ;;^UTILITY(U,$J,358.3,55415,2)
 ;;=^5010008
