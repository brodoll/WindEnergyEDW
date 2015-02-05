CREATE TABLE [dim].[MaintenanceEvent]
(
MaintenanceEventPK INTEGER NOT NULL CONSTRAINT PK_MaintenanceEvent PRIMARY KEY,
MaintenanceEventNK NVARCHAR(254)  NULL,
ScheduleType NVARCHAR(254) NOT NULL,
StandardName NVARCHAR(254) NOT NULL,
SummaryNotes NVARCHAR(254)  NULL,
BeganOnDateLocalFK INT NOT NULL,
EndedOnDateLocalFK INT NULL,
[AppliedToFactAfterTheFactFlag] BIT NOT NULL,
DisplayName AS (ScheduleType + '-'+ StandardName),
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_MaintenanceEvent_LastUpdateDate DEFAULT Current_TimeStamp
)
ON [SECONDARY];