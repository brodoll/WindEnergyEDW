CREATE TRIGGER [trgMaintenanceEvent_LastUpdateDate]
	ON [dim].[MaintenanceEvent]
	FOR INSERT, UPDATE
	AS
	BEGIN

		SET NOCOUNT ON;

		/* Always good to know the age of a record. Also helps to verify or confirm the ETL process */
		DECLARE @Now DATETIME = CURRENT_TIMESTAMP;
		
		UPDATE x
		SET LastUpdateDate=@Now
		FROM [dim].[MaintenanceEvent] x
		JOIN inserted i ON i.MaintenanceEventPK = x.MaintenanceEventPK;

	END
