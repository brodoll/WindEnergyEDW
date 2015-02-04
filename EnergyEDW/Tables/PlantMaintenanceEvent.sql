CREATE TABLE [dim].[MaintenanceEvent]
(
MaintenanceEventPK INTEGER NOT NULL CONSTRAINT PK_MaintenanceEvent PRIMARY KEY,
MaintenanceEventType NVARCHAR(254) NOT NULL,
MaintenanceEventLabel NVARCHAR(254) NOT NULL,
MaintenanceIdNK NVARCHAR(254)  NULL,
MaintenanceEventNotes NVARCHAR(254)  NULL,
MaintenanceEventBeganOnDateTime DATETIME NOT NULL,
MaintenanceEventEndedOnDateTime DATETIME NULL,
MaintnanceEventAppliedAfterTheFactFlag BIT NOT NULL
)
ON [SECONDARY];