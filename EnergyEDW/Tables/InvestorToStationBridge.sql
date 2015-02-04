CREATE TABLE [dim].[InvestorToStationBridge]
(
InvestorToStationBridgePK INTEGER NOT NULL CONSTRAINT PK_InvestorToStationBridge PRIMARY KEY,
InvestorFK INTEGER NOT NULL,
StationFK INTEGER NOT NULL,
InvolvementInInvestmentUSDollars DECIMAL(11,0)  NULL,
InvolvementInInvestmentPercent DECIMAL(5,2)  NULL,
InvestmentStatusType NVARCHAR(254) NOT NULL,
InvestmentEffectiveDate DATE  NULL,
InvestmentExpirationDate DATE  NULL,
CurrentInvestmentRecordFlag BIT NOT NULL
)
ON [SECONDARY];