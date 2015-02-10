CREATE TABLE [dim].[WeatherEvent]
(
WeatherEventPK INTEGER NOT NULL  CONSTRAINT PK_WeatherEvent PRIMARY KEY,
WeatherEventType NVARCHAR(254) NOT NULL,
StormNameUsedByMedia NVARCHAR(254) NOT NULL,
WeatherEventAppliedAfterTheFactFlag BIT NOT NULL,
WeatherEventEventDateTimeSpanLabel NVARCHAR(254) NOT NULL,
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_WeatherEvent_LastUpdateDate DEFAULT Current_TimeStamp
)
ON [SECONDARY];