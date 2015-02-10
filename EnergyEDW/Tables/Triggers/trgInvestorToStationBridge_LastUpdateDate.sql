CREATE TRIGGER [trgInvestorToStationBridge_LastUpdateDate]
	ON [dim].[InvestorToStationBridge]
	FOR INSERT, UPDATE
	AS
	BEGIN

		SET NOCOUNT ON;

		/* Always good to know the age of a record. Also helps to verify or confirm the ETL process */
		DECLARE @Now DATETIME = CURRENT_TIMESTAMP;
		
		UPDATE x
		SET LastUpdateDate=@Now
		FROM [dim].[InvestorToStationBridge] x
		JOIN inserted i ON i.InvestorToStationBridgePK = x.InvestorToStationBridgePK;

	END
