CREATE TRIGGER [trgInvolvedPartyEntity_LastUpdateDate]
	ON [dim].[InvolvedPartyEntity]
	FOR INSERT, UPDATE
	AS
	BEGIN

		SET NOCOUNT ON;

		/* Always good to know the age of a record. Also helps to verify or confirm the ETL process */
		DECLARE @Now DATETIME = CURRENT_TIMESTAMP;
		
		UPDATE x
		SET LastUpdateDate=@Now
		FROM [dim].[InvolvedPartyEntity] x
		JOIN inserted i ON i.InvolvedPartyEntityPK = x.InvolvedPartyEntityPK;

	END
