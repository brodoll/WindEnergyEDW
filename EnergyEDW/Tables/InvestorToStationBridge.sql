CREATE TABLE [dim].[InvestorToStationBridge]
(
StationInvestorPK INTEGER NOT NULL,
StationFK INTEGER NOT NULL,
InvestorFK INTEGER NOT NULL,
InvolvementInInvestmentUSDollars DECIMAL(11,0)  NULL,
InvolvementInInvestmentPercent DECIMAL(5,2)  NULL,
InvestmentStatusType NVARCHAR(254) NOT NULL,
InvestmentEffectiveDate DATE  NULL,
InvestmentExpirationDate DATE  NULL,
CurrentInvestmentRecordFlag BIT NOT NULL
)
ON [SECONDARY];