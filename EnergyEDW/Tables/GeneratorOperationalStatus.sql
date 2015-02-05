CREATE TABLE [dim].[GeneratorOperationalStatus]
(
GeneratorOperationalStatusPK INTEGER NOT NULL CONSTRAINT PK_GeneratorEquipmentStatus PRIMARY KEY,
OperationalStatusLabel NVARCHAR(254) NOT NULL,
OperationalStatusDescription NVARCHAR(254) NOT NULL,
DisplayName AS (OperationalStatusLabel + '-' + OperationalStatusDescription),
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_GeneratorOperationalStatus_LastUpdateDate DEFAULT Current_TimeStamp
)
ON SECONDARY;