IBTUBAV1 ;ALB/AAS - UNBILLED AMOUNTS - AVERAGE BILL AMOUNT LOGIC ; 29-SEP-94
 ;;2.0;INTEGRATED BILLING;**19,32,123**;21-MAR-94
 ;;Per VHA Directive 10-93-142, this routine should not be modified.
 ;
MANUAL ; - When manually updating, recompute yearly totals to current month.
 Q  ;;**NO LONGER USED**
 ;;N IBSAV,IBI
 ;;S IBSAV=IBTIMON,IBTMON=IBTIMON D BLD^IBTUBAV,DQ^IBTUBO
 ;;S (IBTMON,IBTIMON)=IBSAV
 ;;F IBI=1:1:12 S IBTMON=$O(^IBE(356.19,IBTMON)) Q:'IBTMON  D
 ;;.I $G(^IBE(356.19,+IBTMON,1))'="" D YEAR^IBTUBAV(IBTMON)
 ;;Q
