CREATE TABLE [dim].[InvolvedPartyToGeneratorToStationBridge]
(
InvolvedPartyToGeneratorToStationBridgePK INTEGER NOT NULL CONSTRAINT PK_InvolvedPartyToGeneratorToStationBridge PRIMARY KEY,
[InvolvedPartyEntityFK] INTEGER NOT NULL,
[GeneratorEquipmentFK] INTEGER NOT NULL,
StationFK INTEGER NOT NULL,
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_InvolvedPartyToGeneratorToStationBridge_LastUpdateDate DEFAULT Current_TimeStamp, 
    CONSTRAINT [FK_InvolvedPartyToGeneratorToStationBridge_ToInvolvedPartyEntity] FOREIGN KEY ([InvolvedPartyEntityFK]) REFERENCES [dim].[InvolvedPartyEntity]([InvolvedPartyEntityPK]), 
    CONSTRAINT [FK_InvolvedPartyToGeneratorToStationBridge_ToGenerateEquipment] FOREIGN KEY ([GeneratorEquipmentFK]) REFERENCES [dim].[GeneratorEquipment]([GeneratorEquipmentPK]), 
    CONSTRAINT [FK_InvolvedPartyToGeneratorToStationBridge_ToStation] FOREIGN KEY ([StationFK]) REFERENCES [dim].[Station]([StationPK])
)
ON [SECONDARY];

GO

CREATE INDEX [IX_InvolvedPartyToGeneratorToStationBridge_Station] ON [dim].[InvolvedPartyToGeneratorToStationBridge] (StationFK)
INCLUDE ([InvolvedPartyEntityFK], [GeneratorEquipmentFK])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_InvolvedPartyToGeneratorToStationBridge_Generator] ON [dim].[InvolvedPartyToGeneratorToStationBridge] ([GeneratorEquipmentFK])
INCLUDE ([InvolvedPartyEntityFK], StationFK)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_InvolvedPartyToGeneratorToStationBridge_InvolvedParty] ON [dim].[InvolvedPartyToGeneratorToStationBridge] ([InvolvedPartyEntityFK])
INCLUDE ([GeneratorEquipmentFK], StationFK)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;