MPIFXMLP ;OAK/ELZ - MPIF PROBLISTIC SEARCH ; 5/21/15 4:22pm
 ;;1.0;MASTER PATIENT INDEX VISTA;**61**;30 Apr 99;Build 3
 ;
 ;
PATIENT(RETURN,MPIARR) ; - query for patients based on traits
 ;  MPIARR("")=""
 ;
 ;
 N MPIXML,MPIXMLR,MPID,MPIPAT
 K RETURN
 S MPIXML=$$XMLBLD(.MPIARR)
 D POST^MPIFHWSC(MPIXML,.MPIXMLR)
 I '$D(MPIXMLR) S RETURN="-1^Query to Person Search returned nothing." Q
 D PARSE(.RETURN,.MPIXMLR)
 ;
 ; convert dob to fm format
 S MPIPAT=0 F  S MPIPAT=$O(RETURN(MPIPAT)) Q:'MPIPAT  I $D(RETURN(MPIPAT,"DOB")) S RETURN(MPIPAT,"DOB")=$$HL7TFM^XLFDT(RETURN(MPIPAT,"DOB"))
 ;
 ;
 Q
 ;
XMLBLD(MPIARR) ; setup xml to search
 ; MPIARR - Array of traits for seach
 ;    Returns XML for the search
 ;
 ; $$SITE^VASITE - #10112
 ;
 N MPIXML,MPISITE,QUOTE,MPITHRES,MPIDT,MPIDUZ,MPIPRID
 S QUOTE=""""
 S MPISITE=$P($$SITE^VASITE,"^",3)
 S MPIPRID=$P($$PARAM^HLCS2,"^",3)
 S MPIDT=$$FMTHL7^XLFDT($$NOW^XLFDT)
 S MPIDUZ=$P(^VA(200,DUZ,0),"^") D STDNAME^XLFNAME(.MPIDUZ,"C")
 S MPITHRES=80
 ;
 ; heading
 S MPIXML="<IDM_REQUEST type="_QUOTE_"SEARCH_PROFILE"_QUOTE_"><METADATA>"
 S MPIXML=MPIXML_"<FIELD name="_QUOTE_"SENDINGFACILITY"_QUOTE_" value="
 S MPIXML=MPIXML_QUOTE_MPISITE_QUOTE_"/><FIELD name="_QUOTE_"matchType"
 S MPIXML=MPIXML_QUOTE_" value="_QUOTE_"VISTA_REG"_QUOTE_"/><FIELD name="
 S MPIXML=MPIXML_QUOTE_"returnMax"_QUOTE_" value="_QUOTE_"100"_QUOTE_"/>"
 S MPIXML=MPIXML_"<FIELD name="_QUOTE_"algorithm"_QUOTE_" value="_QUOTE
 S MPIXML=MPIXML_"PROB"_QUOTE_"/><FIELD name="_QUOTE_"minScore"_QUOTE
 S MPIXML=MPIXML_" value="_QUOTE_MPITHRES_QUOTE_"/><FIELD name="_QUOTE
 S MPIXML=MPIXML_"scopingOrganization"_QUOTE_" value="_QUOTE_"VA_DOD"
 S MPIXML=MPIXML_QUOTE_"/><FIELD name="_QUOTE_"versionCode"_QUOTE
 S MPIXML=MPIXML_" value="_QUOTE_"3.0"_QUOTE_"/><FIELD name="_QUOTE
 S MPIXML=MPIXML_"sendingApplicationName"_QUOTE_" value="_QUOTE
 S MPIXML=MPIXML_"VISTA_REG"_QUOTE_"/><FIELD name="_QUOTE_"PROCESSINGID"
 S MPIXML=MPIXML_QUOTE_" value="_QUOTE_MPIPRID_QUOTE_"/></METADATA>"
 S MPIXML=MPIXML_"<ARGUMENTS><ARGUMENT name="_QUOTE
 S MPIXML=MPIXML_"searchProfile"_QUOTE_"><IDMHEADER>"
 S MPIXML=MPIXML_"<SENDING_APP>VISTA_REG</SENDING_APP><MSG_DATE_TIME>"
 S MPIXML=MPIXML_MPIDT_"</MSG_DATE_TIME><MSG_CONTROL_ID>"_$J
 S MPIXML=MPIXML_"</MSG_CONTROL_ID><PROCESSING_ID>"_MPIPRID
 S MPIXML=MPIXML_"</PROCESSING_ID><TRIGGER><EVENT>Local Client</EVENT>"
 S MPIXML=MPIXML_"<ACTOR>"_DUZ_"~PN~"_MPISITE_"~USVHA^"
 S MPIXML=MPIXML_$G(MPIDUZ("FAMILY"))_"^"_$G(MPIDUZ("GIVEN"))_"</ACTOR>"
 S MPIXML=MPIXML_"<DATETIME>"_MPIDT_"</DATETIME><SOURCE>VISTA</SOURCE>"
 S MPIXML=MPIXML_"</TRIGGER></IDMHEADER><PROFILE>"
 ;
 ; name traits
 S MPIXML=MPIXML_"<NAME type="_QUOTE_"L"_QUOTE_">"
 D IFADD("FirstName",.MPIARR,.MPIXML,"FIRSTNAME")
 D IFADD("MiddleName",.MPIARR,.MPIXML,"MIDDLENAME")
 D IFADD("Suffix",.MPIARR,.MPIXML,"SUFFIX")
 D IFADD("Surname",.MPIARR,.MPIXML,"LASTNAME")
 S MPIXML=MPIXML_"</NAME>"
 ;
 ; other traits
 I $G(MPIARR("SSN"))'="" D
 . S MPIXML=MPIXML_"<IDENTIFIER type="_QUOTE_"SS"_QUOTE_" subtype="
 . S MPIXML=MPIXML_QUOTE_"ACTIVE"_QUOTE_"><ID>"_MPIARR("SSN")
 . S MPIXML=MPIXML_"</ID></IDENTIFIER>"
 I $G(MPIARR("DOB"))'="" D
 . S MPIXML=MPIXML_"<ATTRIBUTE type="_QUOTE_"DOB"_QUOTE_"><VALUE>"
 . S MPIXML=MPIXML_$$FMTHL7^XLFDT(MPIARR("DOB"))_"</VALUE></ATTRIBUTE>"
 I $G(MPIARR("Gender"))'="" D
 . S MPIXML=MPIXML_"<ATTRIBUTE type="_QUOTE_"GENDER"_QUOTE_">"
 . S MPIXML=MPIXML_"<VALUE>"_MPIARR("Gender")_"</VALUE></ATTRIBUTE>"
 I $G(MPIARR("MMN"))'="" D
 . S MPIXML=MPIXML_"<ATTRIBUTE type="_QUOTE_"MMN"_QUOTE_">"
 . S MPIXML=MPIXML_"<VALUE>"_MPIARR("MMN")_"</VALUE></ATTRIBUTE>"
 I $G(MPIARR("MBI"))'="" D
 . S MPIXML=MPIXML_"<ATTRIBUTE type="_QUOTE_"MULTIBIRTH"_QUOTE_">"
 . S MPIXML=MPIXML_"<VALUE>"_MPIARR("MBI")_"</VALUE></ATTRIBUTE>"
 ;
 ;POB stuff
 S MPIARR("MPIVar")=$$CONV($G(MPIARR("POBCity")))
 I MPIARR("MPIVar")'=""!($G(MPIARR("POBState"))'="") D
 . S MPIXML=MPIXML_"<ADDRESS type="_QUOTE_"N"_QUOTE_">"
 . D IFADD("MPIVar",.MPIARR,.MPIXML,"CITY")
 . D IFADD("POBState",.MPIARR,.MPIXML,"STATE")
 . S MPIXML=MPIXML_"</ADDRESS>"
 ;
 ;address stuff
 I $G(MPIARR("ResAddL1"))'=""!($G(MPIARR("ResAddL2"))'="")!($G(MPIARR("ResAddCity"))'="")!($G(MPIARR("ResAddZip4"))'="")!($G(MPIARR("ResAddL3"))'="")!($G(MPIARR("ResAddState"))'="") D
 . S MPIXML=MPIXML_"<ADDRESS type="_QUOTE_"P"_QUOTE_">"
 . S MPIARR("MPIVar")=$$CONV($G(MPIARR("ResAddL1")))
 . D IFADD("MPIVar",.MPIARR,.MPIXML,"STREET1")
 . S MPIARR("MPIVar")=$$CONV($G(MPIARR("ResAddL2")))
 . D IFADD("MPIVar",.MPIARR,.MPIXML,"STREET2")
 . S MPIARR("MPIVar")=$$CONV($G(MPIARR("ResAddL3")))
 . D IFADD("MPIVar",.MPIARR,.MPIXML,"STREET3")
 . S MPIARR("MPIVar")=$$CONV($G(MPIARR("ResAddCity")))
 . D IFADD("MPIVar",.MPIARR,.MPIXML,"CITY")
 . D IFADD("ResAddState",.MPIARR,.MPIXML,"STATE")
 . D IFADD("ResAddZip4",.MPIARR,.MPIXML,"ZIPCODE")
 . D IFADD("ResAddProvince",.MPIARR,.MPIXML,"PROVINCECODE")
 . D IFADD("ResAddPCode",.MPIARR,.MPIXML,"POSTALCODE")
 . D IFADD("ResAddCountry",.MPIARR,.MPIXML,"COUNTRY")
 . S MPIXML=MPIXML_"</ADDRESS>"
 ;
 ; phone
 I $G(MPIARR("ResPhone"))'=""&($G(MPIARR("ResPhone"))'["""") D
 . S MPIARR("MPIVar")=$$CONV($G(MPIARR("ResPhone")))
 . I MPIARR("MPIVar")'="" D
 .. S MPIXML=MPIXML_"<PHONE type="_QUOTE_"HOME"_QUOTE_"><NUMBER>"
 .. S MPIXML=MPIXML_MPIARR("MPIVar")_"</NUMBER></PHONE>"
 ;
 ; dod
 I $G(MPIARR("DOD"))'="" D
 . S MPIXML=MPIXML_"<ATTRIBUTE type="_QUOTE_"DOD"_QUOTE_"><VALUE>"
 . S MPIXML=MPIXML_$$FMTHL7^XLFDT(MPIARR("DOD"))_"</VALUE></ATTRIBUTE>"
 ;
 ; end data
 S MPIXML=MPIXML_"</PROFILE></ARGUMENT></ARGUMENTS></IDM_REQUEST>"
 K MPIARR("MPIVar")
 Q MPIXML
 ;
IFADD(MPIVAR,MPIARR,MPIXML,MPIXMLN) ;check if there, if so add it to the XML
 ; MPIVAR is the MPIARR variable name
 ; MPIXMLN is the name of the XML to encase
 ; modifies MPIXML to add if it is there
 I $G(MPIARR(MPIVAR))'="" D
 . S MPIXML=MPIXML_"<"_MPIXMLN_">"_MPIARR(MPIVAR)_"</"_MPIXMLN_">"
 Q
 ;
CONV(FIELD) ;check for &, ', > and <
 I FIELD["&" S FIELD=$P(FIELD,"&")_"&amp;"_$P(FIELD,"&",2)
 I FIELD["'" S FIELD=$P(FIELD,"'")_"&apos;"_$P(FIELD,"'",2)
 S:(FIELD["<") FIELD=$$CONVA(FIELD,"<")
 S:(FIELD[">") FIELD=$$CONVA(FIELD,">")
 Q FIELD
 ;
CONVA(FIELD,ENCHAR) ;handle <<pob city>>
 N I,X,VAL
 S VAL="",I=$L(FIELD,ENCHAR) F X=1:1:I S VAL=VAL_$P(FIELD,ENCHAR,X)
 Q VAL
 ;
PARSE(MPIDATA,MPIXML) ; - parse the data
 ;
 ; EN^MXMLPRSE - #4149
 ;
 K ^TMP($J,"MPIFXMLP")
 N MPICB,MPIUSE,MPIVAR,MPIPAT,MPIALIAS,MPILOC,MPIIDS
 S (MPIPAT,MPIIDS)=0
 S MPICB("STARTELEMENT")="SE^MPIFXMLP"
 S MPICB("CHARACTERS")="VALUE^MPIFXMLP"
 S ^TMP($J,"MPIFXMLP",1)=MPIXML
 D EN^MXMLPRSE($NA(^TMP($J,"MPIFXMLP")),.MPICB)
 K ^TMP($J,"MPIFXMLP")
 Q
 ;
SE(MPIN,MPIA) ; - used for the parser to call back with STARTELEMENT
 ;
 ; just to protect the process
 S MPIN=$G(MPIN)
 S MPIA("type")=$G(MPIA("type"))
 S MPIA("subtype")=$G(MPIA("subtype"))
 S MPIA("name")=$G(MPIA("name"))
 S MPIA("value")=$G(MPIA("value"))
 ; my variable to protect
 S MPIUSE=$G(MPIUSE)
 ;
 ; got a business rule error
 I MPIN="RESULT",MPIA("type")="AA",MPIA("subtype")="QE" S MPIDATA("Result")="QE" Q
 ; don't use these
 I MPIN="IDM_RESPONSE"!(MPIN="METADATA")!(MPIN="IDATTR") Q
 I MPIN="RESULT"!(MPIN="ISSUER")!(MPIN="STATUS") Q
 I MPIN="EFFECTIVE"!(MPIN="BADADDRESSCODE")!(MPIN="BADADDRESSTEXT") Q
 I MPIN="IDATTR",MPIA("type")="PSEUDO_SSN",MPIA("subtype")="CODE" Q
 I MPIN="ASSOC",MPIA("type")="ALIAS_SSN" Q
 ;
 ; save some field data
 I MPIN="FIELD" S:MPIA("name")]"" MPIDATA(MPIA("name"))=MPIA("value") Q
 ;
 I MPIN="PROFILE" S MPIPAT=MPIPAT+1,MPIALIAS=0,MPILOC="MPIDATA("_MPIPAT Q
 I MPIN="NAME" D  Q
 . S MPIUSE=MPIA("type")
 . S:MPIUSE="A" MPIALIAS=MPIALIAS+1
 I MPIN="FIRSTNAME",MPIUSE="L" S MPIVAR=",""FirstName"")" Q
 I MPIN="LASTNAME",MPIUSE="L" S MPIVAR=",""Surname"")" Q
 I MPIN="MIDDLENAME",MPIUSE="L" S MPIVAR=",""MiddleName"")" Q
 I MPIN="SUFFIX",MPIUSE="L" S MPIVAR=",""Suffix"")" Q
 I MPIN="PREFIX",MPIUSE="L" S MPIVAR=",""Prefix"")" Q
 I MPIN="FIRSTNAME",MPIUSE="A" S MPIVAR=",""ALIAS"","_MPIALIAS_",""FirstName"")" Q
 I MPIN="LASTNAME",MPIUSE="A" S MPIVAR=",""ALIAS"","_MPIALIAS_",""Surname"")" Q
 I MPIN="MIDDLENAME",MPIUSE="A" S MPIVAR=",""ALIAS"","_MPIALIAS_",""MiddleName"")" Q
 I MPIN="SUFFIX",MPIUSE="A" S MPIVAR=",""ALIAS"","_MPIALIAS_",""Suffix"")" Q
 I MPIN="PREFIX",MPIUSE="A" S MPIVAR=",""ALIAS"","_MPIALIAS_",""Prefix"")" Q
 I MPIN="IDENTIFIER" D  Q
 . I MPIA("type")="SS",MPIA("subtype")="ALIAS" S MPIUSE="ALIASSSN" Q
 . I MPIA("type")="SS" S MPIUSE="SSN" Q
 . I MPIA("type")="NI",MPIA("subtype")="IDM" S MPIUSE="ICN" Q
 . I MPIA("type")="NI",MPIA("subtype")="" S MPIIDS=MPIIDS+1,MPIUSE="IDS" Q
 I MPIN="ID" D  Q
 . I MPIUSE="ALIASSSN" S MPIVAR=",""ALIAS"","_MPIALIAS_",""SSN"")" Q
 . I MPIUSE="SSN" S MPIVAR=",""SSN"")" K MPIUSE Q
 . I MPIUSE="ICN" S MPIVAR=",""ICN"")" K MPIUSE Q
 . I MPIUSE="EDIPI" S MPIVAR=",""EDIPI"")" K MPIUSE Q
 . I MPIUSE="IDS" S MPIVAR=",""IDS"","_MPIIDS_",""ID"")" Q
 I MPIN="SOURCE" S MPIVAR=",""IDS"","_MPIIDS_",""SOURCE"")" Q
 I MPIN="ATTRIBUTE" D  Q
 . I MPIA("type")="SCORE" S MPIUSE="Score" Q
 . I MPIA("type")="MMN" S MPIUSE="MMN" Q
 . I MPIA("type")="DOB" S MPIUSE="DOB" Q
 . I MPIA("type")="GENDER" S MPIUSE="Gender" Q
 I MPIN="VALUE" D  K MPIUSE Q
 . I $L(MPIUSE) S MPIVAR=","""_MPIUSE_""")"
 I MPIN="ADDRESS" D  Q
 . I MPIA("type")="N" S MPIUSE="POB"
 . I MPIA("type")="P" S MPIUSE="ResAdd"
 . I MPIA("type")="BA" S MPIUSE="BA"
 I MPIN="CITY" S MPIVAR=","""_MPIUSE_"City"")" Q
 I MPIN="STATE" S MPIVAR=","""_MPIUSE_"State"")" Q
 I MPIN="PROVINCECODE" S MPIVAR=","""_MPIUSE_"Province"")" Q
 I MPIN="COUNTRY" S MPIVAR=","""_MPIUSE_"Country"")" Q
 I MPIN="PHONE",MPIA("type")="Home" S MPIUSE="ResPhone" Q
 I MPIN="NUMBER" S MPIVAR=","""_MPIUSE_""")" Q
 I MPIN="STREET1" S MPIVAR=","""_MPIUSE_"L1"")" Q
 I MPIN="STREET2" S MPIVAR=","""_MPIUSE_"L2"")" Q
 I MPIN="STREET3" S MPIVAR=","""_MPIUSE_"L3"")" Q
 I MPIN="ZIPCODE" S MPIVAR=","""_MPIUSE_"Zip4"")" Q
 I MPIN="POSTALCODE" S MPIVAR=","""_MPIUSE_"PCode"")" Q
 ;
 Q
 ;
VALUE(MPIT) ; - used by the parser to call back with CHARACTERS
 S:$D(MPIVAR) @(MPILOC_MPIVAR)=MPIT K MPIVAR Q
 Q