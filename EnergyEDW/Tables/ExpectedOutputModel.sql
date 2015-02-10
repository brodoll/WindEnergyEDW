CREATE TABLE [dim].[ExpectedOutputModel]
(
ExpectedOutputModelPK INTEGER NOT NULL CONSTRAINT PK_ExpectedOutputModel PRIMARY KEY,
ModelName NVARCHAR(254) NOT NULL,
ExpectedOutputPeakInKW DECIMAL(8,3) NOT NULL,
ExpectedOutputInKWH DECIMAL(8,3) NOT NULL,
ModelEffectiveDate DATE NOT NULL,
ModelExpirationDate DATE  NULL,
ModelNotes NVARCHAR(254)  NULL,
DisplayName AS (ModelName + ' (Published On ' + CONVERT(VARCHAR(10),ModelEffectiveDate,102) + ')'),
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_ExpectedOutputModel_LastUpdateDate DEFAULT Current_TimeStamp
)
ON [SECONDARY];