CREATE TABLE [dim].[InvolvedPartyEntity]
(
InvolvedPartyEntityPK INTEGER NOT NULL,
InvolvedPartyName NVARCHAR(254) NOT NULL,
InvolvedPartyParentName NVARCHAR(254)  NULL,
InvolvedPartyExtendedName NVARCHAR(254)  NULL,
BillingCustomerType NVARCHAR(254)  NOT NULL,
UtilityCompanyFlag BIT  NULL,
OwnerInvestorFlag BIT  NULL,
OperatorFlag BIT  NULL,
DeveloperFlag BIT  NULL,
ConsultantFlag BIT  NULL,
ParentNK NVARCHAR(254) NULL,
InvolvedPartyNK NVARCHAR(254)  NULL,
AccountNumberNK NVARCHAR(254) NULL
)
ON [SECONDARY];