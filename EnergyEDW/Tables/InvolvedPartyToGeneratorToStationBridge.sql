CREATE TABLE [dim].[InvolvedPartyToGeneratorToStationBridge]
(
InvolvedPartyToGeneratorToStationBridgePK INTEGER NOT NULL CONSTRAINT PK_InvolvedPartyToGeneratorToStationBridge PRIMARY KEY,
InvolvedPartyFK INTEGER NOT NULL,
GeneratorFK INTEGER NOT NULL,
StationFK INTEGER NOT NULL,
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_InvolvedPartyToGeneratorToStationBridge_LastUpdateDate DEFAULT Current_TimeStamp
)
ON [SECONDARY];

GO

CREATE INDEX [IX_InvolvedPartyToGeneratorToStationBridge_Station] ON [dim].[InvolvedPartyToGeneratorToStationBridge] (StationFK)
INCLUDE (InvolvedPartyFK, GeneratorFK)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_InvolvedPartyToGeneratorToStationBridge_Generator] ON [dim].[InvolvedPartyToGeneratorToStationBridge] (GeneratorFK)
INCLUDE (InvolvedPartyFK, StationFK)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_InvolvedPartyToGeneratorToStationBridge_InvolvedParty] ON [dim].[InvolvedPartyToGeneratorToStationBridge] (InvolvedPartyFK)
INCLUDE (GeneratorFK, StationFK)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;