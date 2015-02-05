CREATE TABLE [dim].[InvestorToStationBridge]
(
InvestorToStationBridgePK INTEGER NOT NULL CONSTRAINT PK_InvestorToStationBridge PRIMARY KEY,
InvestorFK INTEGER NOT NULL,
StationFK INTEGER NOT NULL,
InvolvementInInvestmentUSDollars DECIMAL(11,0)  NULL,
InvolvementInInvestmentPercent DECIMAL(5,2)  NULL,
InvestmentStatusType NVARCHAR(254) NOT NULL,
InvestmentEffectiveDateLocalFK INT  NULL,
InvestmentExpirationDateLocalFK INT  NULL,
CurrentInvestmentRecordFlag BIT NOT NULL,
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_InvestorToStationBridge_LastUpdateDate DEFAULT Current_TimeStamp
)
ON [SECONDARY];

GO

CREATE INDEX [IX_InvestorToStationBridge_Investor] ON [dim].[InvestorToStationBridge] (InvestorFK)
INCLUDE (StationFK, InvolvementInInvestmentUSDollars, InvolvementInInvestmentPercent, CurrentInvestmentRecordFlag)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;

GO

CREATE INDEX [IX_InvestorToStationBridge_Station] ON [dim].[InvestorToStationBridge] (StationFK)
INCLUDE (InvestorFK, InvolvementInInvestmentUSDollars, InvolvementInInvestmentPercent, CurrentInvestmentRecordFlag)
WITH (FILLFACTOR = 90, PAD_INDEX = ON)
ON IndexFileGroup;