ICD10TB9 ;KUM - GROUPER UTILITY FUNCTIONS;05/04/2012
 ;;18.0;DRG Grouper;**64**;Oct 20, 2000;Build 103
 ;
DRG901 ;
DRG902 ;
DRG903 ;
 Q
DRG904 ;
DRG905 ;
 Q
DRG906 Q
DRG907 ;
DRG908 ;
DRG909 S ICDRG=$S(ICDMCC=2:907,ICDMCC=1:908,1:909) Q
DRG910 ;
DRG911 ;
DRG912 ;
 Q
DRG913 ;
DRG914 S ICDRG=$S(ICDMCC=2:913,1:914) Q
DRG915 ;
DRG916 S ICDRG=$S(ICDMCC=2:915,1:916) Q
DRG917 ;
DRG918 S ICDRG=$S(ICDMCC=2:917,1:918) Q
DRG919 ;
DRG920 ;
DRG921 ;
 Q
DRG922 ;
DRG923 S ICDRG=$S(ICDMCC=2:922,1:923) Q
DRG927 ;
DRG933 Q
DRG928 ;
DRG929 ;
DRG934 Q
DRG935 ;
DRG939 ;
DRG940 ;
DRG941 ;
 Q
DRG945 ;
DRG946 ;
 Q
DRG947 ;
DRG948 S ICDRG=$S(ICDMCC=2:947,1:948) Q
DRG949 ;
DRG950 ;
 S ICDRG=$S(ICDMCC>0:949,1:950) Q
DRG951 Q
DRG955 Q
DRG956 Q
DRG957 ;
DRG958 ;
DRG959 S ICDRG=$S(ICDMCC=2:957,ICDMCC=1:958,1:959) Q
DRG963 ;
DRG964 ;
DRG965 S ICDRG=$S(ICDMCC=2:963,ICDMCC=1:964,1:965) Q
DRG969 ;
DRG970 S ICDRG=$S(ICDMCC=2:969,1:970) Q
DRG974 ;
DRG975 ;
DRG976 S ICDRG=$S(ICDMCC=2:974,ICDMCC=1:975,1:976) Q
DRG977 S ICDRG=977 Q
DRG981 ;
DRG982 ;
DRG983 ;
 S ICDRG=$S(ICDMCC=2:981,ICDMCC=1:982,1:983) Q
DRG984 ;
DRG985 ;
DRG986 ;
DRG987 ;
DRG988 ;
DRG989 ;
DRG998 ;
DRG999 ;
 Q