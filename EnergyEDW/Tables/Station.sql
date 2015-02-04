CREATE TABLE [dim].[Station]
(
StationPK INTEGER NOT NULL CONSTRAINT PK_Station PRIMARY KEY,
StationNK NVARCHAR(254) NOT NULL,
StationName NVARCHAR(254) NOT NULL,
StationSectionID NVARCHAR(254) NOT NULL,
StationExtendedName NVARCHAR(254) NOT NULL,
StationLocationType NVARCHAR(254) NOT NULL,
StationAccessMeansType NVARCHAR(254) NOT NULL,
StationProvinceOrStatePostalCode NVARCHAR(254) NOT NULL,
StationCountryCode NVARCHAR(3) NOT NULL,
StationOperatingStatus NVARCHAR(254) NOT NULL,
GeneratorCount INTEGER NOT NULL,
StationNominalPowerOutputInkW DECIMAL(8,3) NOT NULL,
StationMapObject GEOGRAPHY NOT NULL,
StationCentroidLongitudeWGS84 DECIMAL(8,3) NOT NULL,
StationCentroidLatitudeWGS84 DECIMAL(8,3) NOT NULL
)
ON [SECONDARY];