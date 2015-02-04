CREATE TABLE [dim].[InvolvedPartyToGeneratorToStationBridge]
(
InvolvedPartyGeneratorStationPK INTEGER NOT NULL,
InvolvedPartyFK INTEGER NOT NULL,
GeneratorFK INTEGER NOT NULL,
StationFK INTEGER NOT NULL
)
ON [SECONDARY];