IBDEI09U ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,4070,2)
 ;;=^5008304
 ;;^UTILITY(U,$J,358.3,4071,0)
 ;;=J81.0^^28^261^57
 ;;^UTILITY(U,$J,358.3,4071,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4071,1,3,0)
 ;;=3^Pulmonary Edema,Acute
 ;;^UTILITY(U,$J,358.3,4071,1,4,0)
 ;;=4^J81.0
 ;;^UTILITY(U,$J,358.3,4071,2)
 ;;=^5008295
 ;;^UTILITY(U,$J,358.3,4072,0)
 ;;=J81.1^^28^261^58
 ;;^UTILITY(U,$J,358.3,4072,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4072,1,3,0)
 ;;=3^Pulmonary Edema,Chronic
 ;;^UTILITY(U,$J,358.3,4072,1,4,0)
 ;;=4^J81.1
 ;;^UTILITY(U,$J,358.3,4072,2)
 ;;=^5008296
 ;;^UTILITY(U,$J,358.3,4073,0)
 ;;=J82.^^28^261^59
 ;;^UTILITY(U,$J,358.3,4073,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4073,1,3,0)
 ;;=3^Pulmonary Eosinophilia NEC
 ;;^UTILITY(U,$J,358.3,4073,1,4,0)
 ;;=4^J82.
 ;;^UTILITY(U,$J,358.3,4073,2)
 ;;=^5008297
 ;;^UTILITY(U,$J,358.3,4074,0)
 ;;=J70.9^^28^261^60
 ;;^UTILITY(U,$J,358.3,4074,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4074,1,3,0)
 ;;=3^Respiratory Conditions d/t Unspec External Agent
 ;;^UTILITY(U,$J,358.3,4074,1,4,0)
 ;;=4^J70.9
 ;;^UTILITY(U,$J,358.3,4074,2)
 ;;=^269985
 ;;^UTILITY(U,$J,358.3,4075,0)
 ;;=J98.9^^28^261^61
 ;;^UTILITY(U,$J,358.3,4075,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4075,1,3,0)
 ;;=3^Respiratory Disorder,Unspec
 ;;^UTILITY(U,$J,358.3,4075,1,4,0)
 ;;=4^J98.9
 ;;^UTILITY(U,$J,358.3,4075,2)
 ;;=^5008366
 ;;^UTILITY(U,$J,358.3,4076,0)
 ;;=J06.9^^28^261^62
 ;;^UTILITY(U,$J,358.3,4076,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4076,1,3,0)
 ;;=3^Respiratory Infection,Upper,Acute,Unspec
 ;;^UTILITY(U,$J,358.3,4076,1,4,0)
 ;;=4^J06.9
 ;;^UTILITY(U,$J,358.3,4076,2)
 ;;=^5008143
 ;;^UTILITY(U,$J,358.3,4077,0)
 ;;=J39.9^^28^261^63
 ;;^UTILITY(U,$J,358.3,4077,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4077,1,3,0)
 ;;=3^Respiratory Tract Disease,Upper,Unspec
 ;;^UTILITY(U,$J,358.3,4077,1,4,0)
 ;;=4^J39.9
 ;;^UTILITY(U,$J,358.3,4077,2)
 ;;=^5008232
 ;;^UTILITY(U,$J,358.3,4078,0)
 ;;=J30.9^^28^261^64
 ;;^UTILITY(U,$J,358.3,4078,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4078,1,3,0)
 ;;=3^Rhinitis,Allgeric,Unspec
 ;;^UTILITY(U,$J,358.3,4078,1,4,0)
 ;;=4^J30.9
 ;;^UTILITY(U,$J,358.3,4078,2)
 ;;=^5008205
 ;;^UTILITY(U,$J,358.3,4079,0)
 ;;=J01.91^^28^261^65
 ;;^UTILITY(U,$J,358.3,4079,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4079,1,3,0)
 ;;=3^Sinusitis,Acute,Recurrent,Unspec
 ;;^UTILITY(U,$J,358.3,4079,1,4,0)
 ;;=4^J01.91
 ;;^UTILITY(U,$J,358.3,4079,2)
 ;;=^5008128
 ;;^UTILITY(U,$J,358.3,4080,0)
 ;;=J01.90^^28^261^66
 ;;^UTILITY(U,$J,358.3,4080,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4080,1,3,0)
 ;;=3^Sinusitis,Acute,Unspec
 ;;^UTILITY(U,$J,358.3,4080,1,4,0)
 ;;=4^J01.90
 ;;^UTILITY(U,$J,358.3,4080,2)
 ;;=^5008127
 ;;^UTILITY(U,$J,358.3,4081,0)
 ;;=J32.9^^28^261^67
 ;;^UTILITY(U,$J,358.3,4081,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4081,1,3,0)
 ;;=3^Sinusitis,Chronic,Unspec
 ;;^UTILITY(U,$J,358.3,4081,1,4,0)
 ;;=4^J32.9
 ;;^UTILITY(U,$J,358.3,4081,2)
 ;;=^5008207
 ;;^UTILITY(U,$J,358.3,4082,0)
 ;;=R06.83^^28^261^68
 ;;^UTILITY(U,$J,358.3,4082,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4082,1,3,0)
 ;;=3^Snoring
 ;;^UTILITY(U,$J,358.3,4082,1,4,0)
 ;;=4^R06.83
 ;;^UTILITY(U,$J,358.3,4082,2)
 ;;=^5019192
 ;;^UTILITY(U,$J,358.3,4083,0)
 ;;=R09.3^^28^261^69
 ;;^UTILITY(U,$J,358.3,4083,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4083,1,3,0)
 ;;=3^Sputum,Abnormal
 ;;^UTILITY(U,$J,358.3,4083,1,4,0)
 ;;=4^R09.3
 ;;^UTILITY(U,$J,358.3,4083,2)
 ;;=^5019202
 ;;^UTILITY(U,$J,358.3,4084,0)
 ;;=R06.82^^28^261^70
 ;;^UTILITY(U,$J,358.3,4084,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4084,1,3,0)
 ;;=3^Tachypnea NEC
