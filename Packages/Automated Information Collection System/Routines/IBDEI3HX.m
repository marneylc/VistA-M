IBDEI3HX ; ; 19-NOV-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.4)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.4,126,0)
 ;;=H DIAGNOSIS^8^12
 ;;^UTILITY(U,$J,358.4,127,0)
 ;;=I DIAGNOSIS^9^12
 ;;^UTILITY(U,$J,358.4,128,0)
 ;;=J/K/L DIAGNOSIS^10^12
 ;;^UTILITY(U,$J,358.4,129,0)
 ;;=M DIAGNOSIS^11^12
 ;;^UTILITY(U,$J,358.4,130,0)
 ;;=N/O DIAGNOSIS^12^12
 ;;^UTILITY(U,$J,358.4,131,0)
 ;;=P DIAGNOSIS^13^12
 ;;^UTILITY(U,$J,358.4,132,0)
 ;;=R DIAGNOSIS^15^12
 ;;^UTILITY(U,$J,358.4,133,0)
 ;;=S DIAGNOSIS^16^12
 ;;^UTILITY(U,$J,358.4,134,0)
 ;;=T/U DIAGNOSIS^17^12
 ;;^UTILITY(U,$J,358.4,135,0)
 ;;=V/W/X/Y/Z DIAGNOSIS^18^12
 ;;^UTILITY(U,$J,358.4,136,0)
 ;;=PRE-OP,POST-OP,COUNSELING^14^12
 ;;^UTILITY(U,$J,358.4,137,0)
 ;;=AUDIOLOGIC FUNCTION TESTS^1^13
 ;;^UTILITY(U,$J,358.4,138,0)
 ;;=SCREENING^7^13
 ;;^UTILITY(U,$J,358.4,139,0)
 ;;=COCHLEAR IMPLANT^2^13
 ;;^UTILITY(U,$J,358.4,140,0)
 ;;=OTHER TREATMENT^5^13
 ;;^UTILITY(U,$J,358.4,141,0)
 ;;=DISPENSING^3^13
 ;;^UTILITY(U,$J,358.4,142,0)
 ;;=REMOVAL FOREIGN BODY/CERUMEN^6^13
 ;;^UTILITY(U,$J,358.4,143,0)
 ;;=VESTIBULAR FUNCT W/ RECORDING^9^13
 ;;^UTILITY(U,$J,358.4,144,0)
 ;;=VESTIBULAR FUNCT W/O RECORDING^10^13
 ;;^UTILITY(U,$J,358.4,145,0)
 ;;=EVALUATIVE & THERAPEUTIC SVCS^4^13
 ;;^UTILITY(U,$J,358.4,146,0)
 ;;=TEAM CONFERENCE^8^13
 ;;^UTILITY(U,$J,358.4,147,0)
 ;;=ACOUSTIC NERVE INJURIES^1^14
 ;;^UTILITY(U,$J,358.4,148,0)
 ;;=AUDITORY DISORDERS^2^14
 ;;^UTILITY(U,$J,358.4,149,0)
 ;;=BALANCE DISORDERS^3^14
 ;;^UTILITY(U,$J,358.4,150,0)
 ;;=BAROTRAUMA^4^14
 ;;^UTILITY(U,$J,358.4,151,0)
 ;;=EAR DISEASE^5^14
 ;;^UTILITY(U,$J,358.4,152,0)
 ;;=FOREIGN BODIES^5^14
 ;;^UTILITY(U,$J,358.4,153,0)
 ;;=HEARING LOSS^6^14
 ;;^UTILITY(U,$J,358.4,154,0)
 ;;=NOISE INJURIES^7^14
 ;;^UTILITY(U,$J,358.4,155,0)
 ;;=NYSTAGMUS^8^14
 ;;^UTILITY(U,$J,358.4,156,0)
 ;;=OTOTOXICITY^9^14
 ;;^UTILITY(U,$J,358.4,157,0)
 ;;=PURPOSE OF ENCOUNTER/HEALTH STATUS^10^14
 ;;^UTILITY(U,$J,358.4,158,0)
 ;;=ASSESSMENT/COUNSELING^1^15
 ;;^UTILITY(U,$J,358.4,159,0)
 ;;=ONE ON ONE TRAINING^6^15
 ;;^UTILITY(U,$J,358.4,160,0)
 ;;=GROUP/FAMILY TRAINING^4^15
 ;;^UTILITY(U,$J,358.4,161,0)
 ;;=TEAM CONFERENCE^8^15
 ;;^UTILITY(U,$J,358.4,162,0)
 ;;=HOME VISIT^5^15
 ;;^UTILITY(U,$J,358.4,163,0)
 ;;=BLIND REHAB SERVICES^2^15
 ;;^UTILITY(U,$J,358.4,164,0)
 ;;=ONLINE EVALUATIONS^7^15
 ;;^UTILITY(U,$J,358.4,165,0)
 ;;=ED/TRAINING FOR SELF-MNGMT^3^15
 ;;^UTILITY(U,$J,358.4,166,0)
 ;;=IMPAIRMENT CODES^1^16
 ;;^UTILITY(U,$J,358.4,167,0)
 ;;=CONTRIBUTORY CONDITION^2^16
 ;;^UTILITY(U,$J,358.4,168,0)
 ;;=TBI-RELATED CONTRIB COND^3^16
 ;;^UTILITY(U,$J,358.4,169,0)
 ;;=PACEMAKER^13^17
 ;;^UTILITY(U,$J,358.4,170,0)
 ;;=CORONARY ANGIOPLASTY & STENTS^2^17
 ;;^UTILITY(U,$J,358.4,171,0)
 ;;=ELECTROPHYSIOLOGICAL PROCs^6^17
 ;;^UTILITY(U,$J,358.4,172,0)
 ;;=PERIPHERAL ANGIOPLASTIES & STENTS^14^17
 ;;^UTILITY(U,$J,358.4,173,0)
 ;;=VASCULAR INJECTION PROCs^18^17
 ;;^UTILITY(U,$J,358.4,174,0)
 ;;=OTHER PROCEDURES^12^17
 ;;^UTILITY(U,$J,358.4,175,0)
 ;;=HEART CATHETERIZATIONS^7^17
 ;;^UTILITY(U,$J,358.4,176,0)
 ;;=CATHETERIZATIONS FOR INT RADIOLOGY^1^17
 ;;^UTILITY(U,$J,358.4,177,0)
 ;;=OTHER HEART CODES^11^17
 ;;^UTILITY(U,$J,358.4,178,0)
 ;;=PROSTHETIC ANEURYSM REPAIR^16^17
 ;;^UTILITY(U,$J,358.4,179,0)
 ;;=DEVICE PROGRAMMING^3^17
 ;;^UTILITY(U,$J,358.4,180,0)
 ;;=ECHO^4^17
 ;;^UTILITY(U,$J,358.4,181,0)
 ;;=EKG^5^17
 ;;^UTILITY(U,$J,358.4,182,0)
 ;;=MEDICATION ADMINISTRATION^8^17
 ;;^UTILITY(U,$J,358.4,183,0)
 ;;=MEDICATIONS^9^17
 ;;^UTILITY(U,$J,358.4,184,0)
 ;;=OTHER CARDIAC^10^17
 ;;^UTILITY(U,$J,358.4,185,0)
 ;;=STRESS TESTS^17^17
 ;;^UTILITY(U,$J,358.4,186,0)
 ;;=PREVENTIVE COUNSELING^15^17
 ;;^UTILITY(U,$J,358.4,187,0)
 ;;=NEW PATIENT^2^18
