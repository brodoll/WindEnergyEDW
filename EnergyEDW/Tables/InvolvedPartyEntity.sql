CREATE TABLE [dim].[InvolvedPartyEntity]
(
InvolvedPartyEntityPK INTEGER NOT NULL CONSTRAINT PK_InvolvedPartyEntity PRIMARY KEY,
EntityName NVARCHAR(254) NOT NULL,
ParentName NVARCHAR(254)  NULL,
ProvinceOrStatePostalCode NVARCHAR(254)  NULL,
CountryCode NVARCHAR(3)  NULL,
BillingCustomerType NVARCHAR(254)  NOT NULL,
UtilityCompanyFlag BIT  NULL,
OwnerInvestorFlag BIT  NULL,
OperatorFlag BIT  NULL,
DeveloperFlag BIT  NULL,
ConsultantFlag BIT  NULL,
ParentNK NVARCHAR(254) NULL,
InvolvedPartyNK NVARCHAR(254)  NULL,
AccountNumberNK NVARCHAR(254) NULL,
DisplayName AS (CASE WHEN ParentName IS NOT NULL THEN ParentName + '-' + EntityName ELSE EntityName END + ' (' + ProvinceOrStatePostalCode + ', ' + CountryCode + ')'),
LastUpdateDate DATETIME NOT NULL CONSTRAINT DF_InvolvedPartyEntity_LastUpdateDate DEFAULT Current_TimeStamp
)
ON [SECONDARY];