CREATE TABLE [fact].[Wind]
(
Wind_PK INTEGER NOT NULL CONSTRAINT WindPK PRIMARY KEY,
LocalStartDateFK INTEGER NOT NULL,
LocalStartTimeFK INTEGER NOT NULL,
UniversalDateFK INTEGER NOT NULL,
UniversalStartTimeFK INTEGER NOT NULL,
StationFK INTEGER NOT NULL,
GeneratorFK INTEGER NOT NULL,
GeneratorOperationalStatusFK INTEGER NOT NULL,
MaintenanceEventFK INTEGER NOT NULL,
WeatherEventFK INTEGER  NULL,
ExpectedOutputModelFK INTEGER  NULL,
StationInvestorBridgeFK INTEGER NOT NULL,
GeneratorStationNonInvestorBridgeFK INTEGER NOT NULL,
AuditTrailFK INTEGER NOT NULL,
MaximumWindSpeedInKMpHr DECIMAL(5,2)  NULL,
AverageWindSpeedInKMpHr DECIMAL(5,2)  NULL,
CalculationOfPotentialEnergyInKWH DECIMAL(11,3)  NULL,
PeakOutputInKW DECIMAL(8,3)  NULL,
EnergyGeneratedInKWH DECIMAL(11,3)  NULL,
DifferenceInActualAndPotentialEnergyInKWH DECIMAL(11,3)  NULL
)
ON SECONDARY;