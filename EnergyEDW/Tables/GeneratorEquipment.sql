CREATE TABLE [dim].[GeneratorEquipment]
(
GeneratorEquipmentPK INTEGER NOT NULL CONSTRAINT PK_GeneratorEquipment PRIMARY KEY,
GeneratorNK NVARCHAR(254) NOT NULL,
GeneratorClass NVARCHAR(254) NOT NULL,
Manufacturer NVARCHAR(254) NOT NULL,
MakeAndModel NVARCHAR(254) NOT NULL,
CurrentGeneratorRecordFlag BIT NOT NULL,
OperationalDateFK INT NOT NULL,
OutOfServiceDateFK INT NULL,
DiameterOfRotorBladesInMeters INTEGER NOT NULL,
MinimumRatedOutputInKW DECIMAL(8,3) NOT NULL,
MinimumRatedOutputInKWH DECIMAL(8,3) NOT NULL,
MaximumRatedOutputInKW DECIMAL(8,3) NOT NULL,
MaximumRatedOutputInKWH DECIMAL(8,3) NOT NULL,
MinimumRatedWindSpeed DECIMAL(8,3) NOT NULL,
MaximumRatedWindSpeed DECIMAL(8,3) NOT NULL,
MapLocationLabel NVARCHAR(254) NOT NULL,
MapAddressLabel NVARCHAR(254) NOT NULL,
MapObject GEOGRAPHY NULL,
LongitudeWGS84 DECIMAL(8,3) NOT NULL,
LatitudeWGS84 DECIMAL(8,3) NOT NULL,
MapCoordinateAccuracyType NVARCHAR(254) NOT NULL,
MapCoordinatePrecisionType NVARCHAR(254) NOT NULL,
MapCoordinateSourceType NVARCHAR(254) NOT NULL,
TowerGroundElevationAtBaseInMeters INTEGER NOT NULL,
TowerHeightInMeters INTEGER NOT NULL,
CountryCode NVARCHAR(3) NOT NULL,
ProvinceOrStatePostalCode NVARCHAR(254) NOT NULL,
DistrictOrCountyName NVARCHAR(254) NOT NULL,
NationalLegislativeDistrictID NVARCHAR(254) NOT NULL,
AdministrativeLevelLegislativeDistrictID NVARCHAR(254) NOT NULL,
PreviousNationalLegislativeDistrictID NVARCHAR(254) NULL,
PreviousAdministrativeLevelLegislativeDistrictID NVARCHAR(254) NULL,
DisplayName AS (Manufacturer + '-' + MakeAndModel + ' (' + CAST(MaximumRatedOutputInKW AS VARCHAR(254)) + ' kW)'),
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_GeneratorEquipment_LastUpdateDate DEFAULT Current_TimeStamp
)
ON SECONDARY;
GO

CREATE SPATIAL INDEX [SPATIAL_GeneratorEquipment_EquipmentMapObject] 
ON [dim].[GeneratorEquipment] (MapObject)
USING  GEOGRAPHY_AUTO_GRID 
ON SECONDARY;

GO

CREATE INDEX [IX_GeneratorEquipment_NationalLegislativeDistrict] 
ON [dim].[GeneratorEquipment] ([NationalLegislativeDistrictID])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_GeneratorEquipment_ManufacturerMakeModel] 
ON [dim].[GeneratorEquipment] ([Manufacturer], [MakeAndModel])
INCLUDE ([OperationalDateFK], [CurrentGeneratorRecordFlag])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;
GO

CREATE INDEX [IX_GeneratorEquipment_OperationalDate] 
ON [dim].[GeneratorEquipment] ([OperationalDateFK])
INCLUDE ([CurrentGeneratorRecordFlag], [Manufacturer], [MakeAndModel])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;
GO

CREATE INDEX [IX_GeneratorEquipment_OutOfServiceDate] 
ON [dim].[GeneratorEquipment] ([OutOfServiceDateFK])
INCLUDE ([CurrentGeneratorRecordFlag], [Manufacturer], [MakeAndModel])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;
GO

CREATE INDEX [IX_GeneratorEquipment_CurrentGeneratorRecordFlag] 
ON [dim].[GeneratorEquipment] ([CurrentGeneratorRecordFlag])
INCLUDE ([OperationalDateFK], [OutOfServiceDateFK], [Manufacturer], [MakeAndModel])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;
GO