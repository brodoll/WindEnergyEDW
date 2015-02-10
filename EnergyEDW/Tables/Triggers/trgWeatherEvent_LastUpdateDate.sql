CREATE TRIGGER [trgWeatherEvent_LastUpdateDate]
	ON [dim].[WeatherEvent]
	FOR INSERT, UPDATE
	AS
	BEGIN
		SET NOCOUNT ON;

		/* Always good to know the age of a record. Also helps to verify or confirm the ETL process */
		DECLARE @Now DATETIME = CURRENT_TIMESTAMP;
		
		UPDATE x
		SET LastUpdateDate=@Now
		FROM [dim].[WeatherEvent] x
		JOIN inserted i ON i.WeatherEventPK = x.WeatherEventPK;

	END
