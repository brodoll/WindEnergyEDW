CREATE TABLE [fact].[Wind]
(
WindPK INTEGER NOT NULL IDENTITY(1,1),
LocalStartDateTime DATETIME NOT NULL,		--current time stamp when data was collected
--grain begins
IntervalStartDateFK INTEGER NOT NULL,		--UTC value
IntervalStartTimeFK INTEGER NOT NULL,		--UTC value
GeneratorEquipmentFK INTEGER NOT NULL,
--grain ends
GeneratorOperationalStatusFK INTEGER NOT NULL,
MaintenanceEventFK INTEGER NOT NULL,
WeatherEventFK INTEGER  NULL,
StationFK INTEGER NOT NULL,
InvestorToStationBridgeFK INTEGER NOT NULL,
InvolvedPartyToGeneratorToStationBridgeFK INTEGER NOT NULL,
MaximumWindSpeedInKMpHr DECIMAL(5,2)  NULL,
AverageWindSpeedInKMpHr DECIMAL(5,2)  NULL,
CalculationOfPotentialEnergyInKWH DECIMAL(11,3)  NULL,
PeakOutputInKW DECIMAL(8,3)  NULL,
EnergyGeneratedInKWH DECIMAL(11,3)  NULL,
DifferenceInActualAndPotentialEnergyInKWH DECIMAL(11,3)  NULL, 
ExpectedOutputModelFK INTEGER  NULL,
AuditTrailFK INTEGER NOT NULL,
    CONSTRAINT [PK_Wind] PRIMARY KEY ([WindPK] ), 
    CONSTRAINT [FK_Wind_AuditTrail] FOREIGN KEY (AuditTrailFK) REFERENCES dim.AuditTrail(AuditTrailPK),
	CONSTRAINT [FK_Wind_ExpectedOutputModel] FOREIGN KEY (ExpectedOutputModelFK) REFERENCES dim.ExpectedOutputModel(ExpectedOutputModelPK),
    CONSTRAINT [FK_Wind_GeneratorEquipment] FOREIGN KEY (GeneratorEquipmentFK) REFERENCES dim.GeneratorEquipment(GeneratorEquipmentPK),	
	CONSTRAINT [FK_Wind_GeneratorOperationalStatus] FOREIGN KEY (GeneratorOperationalStatusFK) REFERENCES dim.GeneratorOperationalStatus(GeneratorOperationalStatusPK),
    CONSTRAINT [FK_Wind_InvestorToStationBridge] FOREIGN KEY (InvestorToStationBridgeFK) REFERENCES dim.InvestorToStationBridge(InvestorToStationBridgePK),	
	CONSTRAINT [FK_Wind_InvolvedPartyToGeneratorToStationBridge] FOREIGN KEY (InvolvedPartyToGeneratorToStationBridgeFK) REFERENCES dim.InvolvedPartyToGeneratorToStationBridge(InvolvedPartyToGeneratorToStationBridgePK),
	CONSTRAINT [FK_Wind_MaintenanceEvent] FOREIGN KEY (MaintenanceEventFK) REFERENCES dim.MaintenanceEvent(MaintenanceEventPK),
    CONSTRAINT [FK_Wind_Station] FOREIGN KEY (StationFK) REFERENCES dim.Station(StationPK),
	CONSTRAINT [FK_Wind_WeatherEvent] FOREIGN KEY (WeatherEventFK) REFERENCES dim.WeatherEvent(WeatherEventPK), 
    CONSTRAINT [FK_Wind_ToDate] FOREIGN KEY ([IntervalStartDateFK]) REFERENCES [dim].[Date]([DatePK]), 
    CONSTRAINT [FK_Wind_ToTime] FOREIGN KEY ([IntervalStartTimeFK]) REFERENCES [dim].[Time]([TimePK])
)
ON SECONDARY;
GO

CREATE INDEX [IX_Wind_LocalDateTime] 
ON [fact].[Wind] (LocalStartDateTime)
INCLUDE ([GeneratorEquipmentFK], StationFK, EnergyGeneratedInKWH)		 
WITH (FILLFACTOR = 100, PAD_INDEX = OFF)		 
ON IndexFileGroup;

GO

CREATE INDEX [IX_Wind_Grain_DateTimeEquipmentKeys] 
ON [fact].[Wind] (IntervalStartDateFK, IntervalStartTimeFK, [GeneratorEquipmentFK])
INCLUDE (StationFK, EnergyGeneratedInKWH)		--TODO: expand?
WITH (FILLFACTOR = 100, PAD_INDEX = OFF)		--TODO: pack the index pages. inserts to it are sorted in this order, so page splits should be rare. 
ON IndexFileGroup;

GO

CREATE INDEX [IX_Wind_Station] ON [fact].[Wind] (StationFK)
INCLUDE (IntervalStartDateFK, IntervalStartTimeFK, [GeneratorEquipmentFK], [EnergyGeneratedInKWH])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_Wind_WeatherEvent] ON [fact].[Wind] (WeatherEventFK)
INCLUDE (IntervalStartDateFK, IntervalStartTimeFK, [GeneratorEquipmentFK], [EnergyGeneratedInKWH])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_Wind_MaintenanceEvent] ON [fact].[Wind] (MaintenanceEventFK)
INCLUDE (IntervalStartDateFK, IntervalStartTimeFK, [GeneratorEquipmentFK], [EnergyGeneratedInKWH])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_Wind_GeneratorOperationalStatus] ON [fact].[Wind] (GeneratorOperationalStatusFK)
INCLUDE (IntervalStartDateFK, IntervalStartTimeFK, [GeneratorEquipmentFK], [EnergyGeneratedInKWH])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_Wind_InvestorToStationBridge] ON [fact].[Wind] (InvestorToStationBridgeFK)
INCLUDE (IntervalStartDateFK, IntervalStartTimeFK, [GeneratorEquipmentFK], [EnergyGeneratedInKWH])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_Wind_InvolvedPartyToGeneratorToStationBridge] ON [fact].[Wind] (InvolvedPartyToGeneratorToStationBridgeFK)
INCLUDE (IntervalStartDateFK, IntervalStartTimeFK, [GeneratorEquipmentFK], [EnergyGeneratedInKWH])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;