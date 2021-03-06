PSN50627 ;BIR/LDT - API FOR INFORMATION FROM FILE 50.627; 5 Sep 03
 ;;4.0; NATIONAL DRUG FILE;**80**; 30 Oct 98
 ;
DATA(PSNIEN,PSNFT,LIST) ;
 ;PSNIEN - IEN of entry in WARNING LABEL MAP file (#50.627).
 ;PSNFT - Free Text name in  VA DRUG CLASS file (#50.627).
 ;LIST - Subscript of ^TMP array in the form ^TMP($J,LIST,Field Number where Field Number is the
 ;       Field Number of the data piece being returned.
 N DIERR,ZZERR,PSN50627,PSN,CNT
 I $G(LIST)']"" Q
 K ^TMP($J,LIST)
 I +$G(PSNIEN)'>0,($G(PSNFT)']"") S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 I $G(PSNIEN)]"",+$G(PSNIEN)'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 I $G(PSNIEN)]"" N PSNIEN2 S PSNIEN2=$$FIND1^DIC(50.627,"","B","`"_PSNIEN,,,"") D
 .I +PSNIEN2'>0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .S ^TMP($J,LIST,0)=1
 .D GETS^DIQ(50.627,+PSNIEN,".01;1;2","IE","PSN50627") S PSN(1)=0
 .F  S PSN(1)=$O(PSN50627(50.627,PSN(1))) Q:'PSN(1)  D SETZRO
 I $G(PSNIEN)="",$G(PSNFT)]"" D
 .I PSNFT["??" D LOOP Q
 .D FIND^DIC(50.627,,"@;.01;1","QP",PSNFT,,"B",,,"")
 .I +$G(^TMP("DILIST",$J,0))=0 S ^TMP($J,LIST,0)=-1_"^"_"NO DATA FOUND" Q
 .I +^TMP("DILIST",$J,0)>0 S ^TMP($J,LIST,0)=+^TMP("DILIST",$J,0) N PSNXX S PSNXX=0 F  S PSNXX=$O(^TMP("DILIST",$J,PSNXX)) Q:'PSNXX  D
 ..S PSNIEN=+^TMP("DILIST",$J,PSNXX,0) K PSN50627 D GETS^DIQ(50.627,+PSNIEN,".01;1;2","IE","PSN50627") S PSN(1)=0
 ..F  S PSN(1)=$O(PSN50627(50.627,PSN(1))) Q:'PSN(1)  D SETZRO
 K ^TMP("DILIST",$J)
 Q
SETZRO ;
 S ^TMP($J,LIST,+PSN(1),.01)=$G(PSN50627(50.627,PSN(1),.01,"I"))
 S ^TMP($J,LIST,"B",$G(PSN50627(50.627,PSN(1),.01,"I")),+PSN(1))=""
 S ^TMP($J,LIST,+PSN(1),1)=$G(PSN50627(50.627,PSN(1),1,"I"))
 S ^TMP($J,LIST,+PSN(1),2)=$G(PSN50627(50.627,PSN(1),2,"I"))
 Q
LOOP ;
 N PSNIEN,CNT S CNT=0
 S PSNIEN=0 F  S PSNIEN=$O(^PS(50.627,PSNIEN)) Q:'PSNIEN  D
 .K PSN50627 D GETS^DIQ(50.627,+PSNIEN,".01;1;2","IE","PSN50627") S PSN(1)=0 D
 ..F  S PSN(1)=$O(PSN50627(50.627,PSN(1))) Q:'PSN(1)   D SETZRO S CNT=CNT+1
 S ^TMP($J,LIST,0)=$S(+CNT>0:CNT,1:"-1^NO DATA FOUND")
 Q
