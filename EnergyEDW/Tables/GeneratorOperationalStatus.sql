CREATE TABLE [dim].[GeneratorOperationalStatus]
(
GeneratorOperationalStatusPK INTEGER NOT NULL,
GeneratorOperationalStatusLabel NVARCHAR(254) NOT NULL,
GeneratorOperationalStatusDescription NVARCHAR(254) NOT NULL
)
ON SECONDARY;