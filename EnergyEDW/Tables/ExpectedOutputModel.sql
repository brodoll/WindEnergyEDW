CREATE TABLE [dim].[ExpectedOutputModel]
(
ExpectedEquipmentOutputPK INTEGER NOT NULL CONSTRAINT PK_ExpectedOutputModel PRIMARY KEY,
ExpectedOutputModelName NVARCHAR(254) NOT NULL,
ExpectedOutputPeakInKW DECIMAL(8,3) NOT NULL,
ExpectedOutputInKWH DECIMAL(8,3) NOT NULL,
ExpectedOutputEffectiveDate DATE NOT NULL,
ExpectedOutputExpirationDate DATE  NULL,
ExpectedOutputModelNotes NVARCHAR(254)  NULL
)
ON [SECONDARY];