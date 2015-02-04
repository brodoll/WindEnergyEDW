CREATE TABLE [dim].[AuditTrail]
(
AuditTrailPK INTEGER NOT NULL CONSTRAINT PK_AuditTrail PRIMARY KEY,
ETLFailureFlag BIT NOT NULL,
EquipmentFailureFlag BIT NOT NULL,
PotentialMeasureOutOfBounds BIT NOT NULL,
OutputMeasureOutOfBounds BIT NOT NULL,
ReferenceAuditLogForAdditionalInfoFlag BIT NULL
)
ON [SECONDARY];
