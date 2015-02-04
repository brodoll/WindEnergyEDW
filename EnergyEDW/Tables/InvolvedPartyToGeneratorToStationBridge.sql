CREATE TABLE [dim].[InvolvedPartyToGeneratorToStationBridge]
(
InvolvedPartyGeneratorStationPK INTEGER NOT NULL CONSTRAINT PK_InvolvedPartyGeneratorStation PRIMARY KEY,
InvolvedPartyFK INTEGER NOT NULL,
GeneratorFK INTEGER NOT NULL,
StationFK INTEGER NOT NULL
)
ON [SECONDARY];