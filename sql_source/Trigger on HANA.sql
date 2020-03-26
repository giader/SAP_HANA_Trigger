
CREATE COLUMN TABLE "TST2"."M2M_toAction" (
"NumWO" INTEGER,
"PosWO" INTEGER,
"FaseLav" INTEGER,
"CentroDiLavoro" NVARCHAR(20),
"Action" NVARCHAR(20)
) 
UNLOAD PRIORITY 5 AUTO MERGE 

CREATE COLUMN TABLE "M2M_to_SAP" (
   "NumWO" INTEGER,
   "PosWO" INTEGER,
   "FaseLav" INTEGER, 
   "CentroDiLavoro" NVARCHAR(20), 
   "ColpiCorrenti" INTEGER, 
   "ColpiTotali" INTEGER, 
   "DataCreazione" TIMESTAMP, 
   "DataAggiornamento" TIMESTAMP, 
   "DataSetupPlc" TIMESTAMP,  
   "FlagM2M" CHAR(1), 
   "FlagSAP" CHAR(1), 
   "StatoMacc" CHAR(1),
   "UDF1" NVARCHAR(20), 
   "UDF2" NVARCHAR(20), 
   "UDF3" INTEGER
);

CREATE TRIGGER "M2MtoAction_Upd" 
AFTER INSERT ON "M2M_to_SAP" 
REFERENCING NEW ROW REC00_REF FOR EACH ROW 

BEGIN 
IF :REC00_REF."FlagM2M" = 'J'
THEN INSERT 

INTO "M2M_toAction" VALUES(
	 :REC00_REF."NumWO",
	 :REC00_REF."PosWO",
	 :REC00_REF."FaseLav",
	 :REC00_REF."CentroDiLavoro",
	 'RESET' );

END IF; 
END; 
