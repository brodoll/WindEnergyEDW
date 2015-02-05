CREATE TABLE [dim].[Station]
(
StationPK INTEGER NOT NULL CONSTRAINT PK_Station PRIMARY KEY,
StationNK NVARCHAR(254) NOT NULL,
StationName NVARCHAR(254) NOT NULL,
SectionID NVARCHAR(254) NULL,
LocationType NVARCHAR(254) NOT NULL,
AccessMeansType NVARCHAR(254) NOT NULL,
ProvinceOrStatePostalCode NVARCHAR(254) NOT NULL,
CountryCode NVARCHAR(3) NOT NULL,
StationOperatingStatus NVARCHAR(254) NOT NULL,
GeneratorCount INTEGER NOT NULL,
NominalPowerOutputInkW DECIMAL(8,3) NOT NULL,
BoundaryMapObject GEOGRAPHY NULL,
CentroidLongitudeWGS84 DECIMAL(8,3) NULL,
CentroidLatitudeWGS84 DECIMAL(8,3) NULL,
DisplayName AS (StationName + CASE WHEN SectionID IS NOT NULL THEN ' #' + SectionID  ELSE ' ' END + ', (' + ProvinceOrStatePostalCode + ', ' + CountryCode + ')'),
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_Station_LastUpdateDate DEFAULT Current_TimeStamp
)
ON [SECONDARY];
GO

CREATE SPATIAL INDEX [SPATIAL_Station_MapObject] 
ON [dim].[Station] ([BoundaryMapObject])
USING  GEOGRAPHY_AUTO_GRID 
ON SECONDARY;
