CREATE TABLE [dim].[GeneratorOperationalStatus]
(
GeneratorOperationalStatusPK INTEGER NOT NULL CONSTRAINT PK_GeneratorEquipmentStatus PRIMARY KEY,
GeneratorOperationalStatusLabel NVARCHAR(254) NOT NULL,
GeneratorOperationalStatusDescription NVARCHAR(254) NOT NULL
)
ON SECONDARY;