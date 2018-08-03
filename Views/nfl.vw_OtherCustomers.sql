SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [nfl].[vw_OtherCustomers]
AS  (
    SELECT CAST('BE' AS VARCHAR (2))            AS nfl_team_code
         , DimCustomerId                        SSB_DimCustomerId
         , SourceSystem
         , CASE WHEN SourceSystem = 'Eloqua' THEN 'Email'
                WHEN SourceSystem = 'Fanatics' THEN 'Merch'
                ELSE 'Other'
           END                                  AS SourceType
         , SSB_CRMSYSTEM_CONTACT_ID             SSB_GUID
         , SSID                                 SourceSystem_ID
         , Prefix
         , FirstName
         , MiddleName
         , LastName
         , Suffix
         , AddressPrimaryStreet
         , AddressPrimarySuite
         , AddressPrimaryCity
         , AddressPrimaryState
         , AddressPrimaryZip
         , AddressPrimaryCounty
         , AddressPrimaryCountry
         , EmailPrimary
         , PhonePrimary
         , PhoneHome
         , PhoneCell
         , PhoneBusiness
         , PhoneFax
         , PhoneOther
         , Gender
         , CustomerType
         , ISNULL( SSCreatedDate, CreatedDate ) CreatedDate
         , ISNULL( SSUpdatedDate, UpdatedDate ) UpdatedDate
    FROM dbo.vwDimCustomer_ModAcctId
    WHERE SourceSystem NOT IN ( 'TM', 'TM-Suites', 'CRM_Account', 'CRM_Contact', 'CI Model', 'FanCentric', 'InfoGroup'
                              , 'LiveA' ))
GO
