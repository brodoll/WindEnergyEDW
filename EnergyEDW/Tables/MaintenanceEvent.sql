CREATE TABLE [dim].[MaintenanceEvent]
(
MaintenanceEventPK INTEGER NOT NULL CONSTRAINT PK_MaintenanceEvent PRIMARY KEY,
MaintenanceEventNK NVARCHAR(254)  NULL,
ScheduleType NVARCHAR(254) NOT NULL,
StandardName NVARCHAR(254) NOT NULL,
SummaryNotes NVARCHAR(254)  NULL,
MaintenanceRequestedDateFK INT NULL,
BeganOnDateFK INT NOT NULL,
EndedOnDateFK INT NULL,
MaintenanceDurationInDays INT NULL,
MaintenanceDurationInHours AS (CASE WHEN MaintenanceDurationInDays IS NOT NULL THEN CAST(ROUND(CAST(MaintenanceDurationInDays AS FLOAT) / 24.0,0) AS INTEGER) ELSE NULL END),
AppliedToFactAfterTheFactFlag BIT NOT NULL,
DisplayName AS (ScheduleType + '-'+ StandardName),
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_MaintenanceEvent_LastUpdateDate DEFAULT Current_TimeStamp, 
    CONSTRAINT [FK_MaintenanceEvent_ToDate_ForBegan] FOREIGN KEY ([BeganOnDateFK]) REFERENCES [dim].[Date]([DatePK]), 
    CONSTRAINT [FK_MaintenanceEvent_ToDate_ForEnd] FOREIGN KEY ([EndedOnDateFK]) REFERENCES [dim].[Date]([DatePK]), 
    CONSTRAINT [FK_MaintenanceEvent_ToDate_ForRequested] FOREIGN KEY ([MaintenanceRequestedDateFK]) REFERENCES [dim].[Date]([DatePK])
)
ON [SECONDARY];
GO

CREATE INDEX [IX_MaintenanceEvent_ScheduleType] ON [dim].[MaintenanceEvent] ([ScheduleType])
INCLUDE (MaintenanceDurationInHours, MaintenanceRequestedDateFK, BeganOnDateFK, EndedOnDateFK)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_MaintenanceEvent_BeganOnDate] ON [dim].[MaintenanceEvent] ([BeganOnDateFK])
INCLUDE ([ScheduleType])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;
GO

CREATE INDEX [IX_MaintenanceEvent_EndedOnDate] ON [dim].[MaintenanceEvent] ([EndedOnDateFK])
INCLUDE ([ScheduleType])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;
GO

CREATE INDEX [IX_MaintenanceEvent_MaintenanceRequestedDate] ON [dim].[MaintenanceEvent] ([MaintenanceRequestedDateFK])
INCLUDE ([ScheduleType])
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;
