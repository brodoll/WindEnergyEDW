﻿CREATE TABLE [dim].[GeneratorEquipment]
(
GeneratorEquipmentPK INTEGER NOT NULL,
GeneratorNK NVARCHAR(254) NOT NULL,
GeneratorClass NVARCHAR(254) NOT NULL,
GeneratorManufacturer NVARCHAR(254) NOT NULL,
GenerateMakeAndModel NVARCHAR(254) NOT NULL,
CurrentGeneratorRecordFlag BIT NOT NULL,
GeneratorOperationalDate DATE NOT NULL,
GeneratorOutofServiceDate DATE NULL,
DiameterOfRotorBladesInMeters INTEGER NOT NULL,
MinimumRatedOutputInKW DECIMAL(8,3) NOT NULL,
MinimumRatedOutputInKWH DECIMAL(8,3) NOT NULL,
MaximumRatedOutputInKW DECIMAL(8,3) NOT NULL,
MaximumRatedOutputInKWH DECIMAL(8,3) NOT NULL,
MinimumRatedWindSpeed DECIMAL(8,3) NOT NULL,
MaximumRatedWindSpeed DECIMAL(8,3) NOT NULL,
EquipmentMapLocationLabel NVARCHAR(254) NOT NULL,
EquipmentMapAddressLabel NVARCHAR(254) NOT NULL,
EquipmentMapObject GEOGRAPHY NULL,
EquipmentLongitudeWGS84 DECIMAL(8,3) NOT NULL,
EquipmentLatitudeWGS84 DECIMAL(8,3) NOT NULL,
MapCoordinateAccuracyType NVARCHAR(254) NOT NULL,
MapCoordinatePrecisionType NVARCHAR(254) NOT NULL,
MapCoordinateSourceType NVARCHAR(254) NOT NULL,
TowerGroundElevationAtBaseInMeters INTEGER NOT NULL,
TowerHeightInMeters INTEGER NOT NULL,
EquipmentCountryCode NVARCHAR(3) NOT NULL,
EquipmentProvinceOrStatePostalCode NVARCHAR(254) NOT NULL,
EquipmentDistrictOrCountyName NVARCHAR(254) NOT NULL,
NationalLegislativeDistrictID NVARCHAR(254) NOT NULL,
AdministrativeLevelDistrictLegislativeDistrictID NVARCHAR(254) NOT NULL
)
ON SECONDARY;