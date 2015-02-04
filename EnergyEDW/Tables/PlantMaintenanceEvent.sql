CREATE TABLE [dim].[PlantMaintenanceEvent]
(
MaintenanceEventPK INTEGER NOT NULL,
MaintenanceEventType NVARCHAR(254) NOT NULL,
MaintenanceEventLabel NVARCHAR(254) NOT NULL,
MaintenanceIdNK NVARCHAR(254)  NULL,
MaintenanceEventNotes NVARCHAR(254)  NULL,
MaintenanceEventBeganOnDateTime DATETIME NOT NULL,
MaintenanceEventEndedOnDateTime DATETIME NULL,
MaintnanceEventAppliedAfterTheFactFlag BIT NOT NULL
)
ON [SECONDARY];