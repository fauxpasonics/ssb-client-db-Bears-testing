SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [etl].[sp_Export_Infogroup_Data_20171206]
AS

WITH Active (DimCustomerID, ssb_crmsystem_contact_id, ssb_crmsystem_account_id)
AS (SELECT dc.DimCustomerId,
       ssbid.SSB_CRMSYSTEM_CONTACT_ID,
	   ssbid.SSB_CRMSYSTEM_ACCT_ID
--INTO #Active
FROM dbo.DimCustomer dc (NOLOCK)
    JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
        ON ssbid.DimCustomerId = dc.DimCustomerId
WHERE DATEDIFF(YEAR, SSCreatedDate, GETDATE()) <= 3
      OR DATEDIFF(YEAR, SSUpdatedDate, GETDATE()) <= 3),

TicketBuyers (dimcustomerid, ssb_crmsystem_contact_id, ssb_crmsystem_account_id)
AS
(SELECT DISTINCT
    fts.DimCustomerId,
    dc.SSB_CRMSYSTEM_CONTACT_ID,
	dc.SSB_CRMSYSTEM_ACCT_ID
--INTO #TicketBuyers
FROM dbo.FactTicketSales fts (NOLOCK)
    JOIN dbo.dimcustomerssbid dc (NOLOCK)
        ON dc.DimCustomerId = fts.DimCustomerId
    JOIN dbo.DimDate dd
        ON dd.DimDateId = fts.DimDateId
WHERE DATEDIFF(YEAR, dd.CalDate, GETDATE()) <= 3)

--SELECT DISTINCT
--	compr.SSB_CRMSYSTEM_CONTACT_ID,
--	NULL AS Blank1,
--	NULLIF(compr.SourceSystem,'') SourceSystem,
--	NULL AS Blank2,
--	NULLIF(compr.CompanyName,'') CompanyName,
--    NULLIF(compr.FirstName,'') FirstName,
--	NULLIF(compr.MiddleName,'') MiddleName,
--    NULLIF(compr.LastName,'') LastName,
--	NULLIF(compr.Suffix,'') Suffix,
--    NULLIF(compr.AddressPrimaryStreet,'') Address_Line1,
--	NULLIF(compr.AddressPrimarySuite, '') Address_Line2,
--	NULLIF(compr.AddressPrimaryCity, '') City,
--	NULLIF(compr.AddressPrimaryState,'') State,
--	NULLIF(compr.AddressPrimaryZip,'') ZIP,
--	NULLIF(compr.AddressPrimaryCountry, '') Country,
--	NULLIF(compr.PhonePrimary,'') PhoneDay,
--	NULLIF(compr.PhoneHome,'') PhoneEve,
--    NULLIF(compr.EmailPrimary, '') Email
--	--INTO #test
--FROM dbo.vwCompositeRecord_ModAcctID compr
--    LEFT JOIN Active a
--        ON a.SSB_CRMSYSTEM_CONTACT_ID = compr.SSB_CRMSYSTEM_CONTACT_ID
--    LEFT JOIN TicketBuyers tb
--        ON tb.SSB_CRMSYSTEM_CONTACT_ID = compr.SSB_CRMSYSTEM_CONTACT_ID
--WHERE ((compr.AddressPrimaryStreet IS NOT NULL
--      AND compr.AddressPrimaryIsCleanStatus = 'Valid')
--	  OR ISNULL(compr.EmailPrimary, '') <> '')
--      AND ISNULL(compr.FirstName, '') <> ''
--      AND ISNULL(compr.LastName, '') <> ''
--      AND (
--              a.SSB_CRMSYSTEM_CONTACT_ID IS NOT NULL
--              OR tb.SSB_CRMSYSTEM_CONTACT_ID IS NOT NULL
--          )
--UNION 
SELECT 	DISTINCT
	NULLIF(compr.CompanyName,'') CompanyName,
    NULLIF(compr.FirstName,'') FirstName,
	NULLIF(compr.MiddleName,'') MiddleName,
    NULLIF(compr.LastName,'') LastName,
	NULLIF(compr.Suffix,'') Suffix,
    NULLIF(compr.AddressPrimaryStreet,'') Address_Line1,
	NULLIF(compr.AddressPrimarySuite, '') Address_Line2,
	NULLIF(compr.AddressPrimaryCity, '') City,
	NULLIF(compr.AddressPrimaryState,'') State,
	NULLIF(compr.AddressPrimaryZip,'') ZIP,
	NULLIF(compr.AddressPrimaryCountry, '') Country,
	NULLIF(compr.PhonePrimary,'') PhoneDay,
	NULLIF(compr.PhoneHome,'') PhoneEve,
    NULLIF(compr.EmailPrimary, '') Email,
	compr.SSB_CRMSYSTEM_CONTACT_ID,
	NULL AS Blank1,
	NULLIF(compr.SourceSystem,'') SourceSystem,
	NULL AS Blank2
FROM dbo.vwCompositeRecord_ModAcctID compr
    LEFT JOIN Active a
        ON a.ssb_crmsystem_account_id = compr.SSB_CRMSYSTEM_ACCT_ID
    LEFT JOIN TicketBuyers tb
        ON tb.ssb_crmsystem_account_id = compr.SSB_CRMSYSTEM_ACCT_ID
WHERE ((compr.AddressPrimaryStreet IS NOT NULL
      AND compr.AddressPrimaryIsCleanStatus = 'Valid')
	  OR ISNULL(compr.EmailPrimary, '') <> '')
      AND ISNULL(compr.CompanyName,'')<>''
      AND (
              a.ssb_crmsystem_account_id IS NOT NULL
              OR tb.ssb_crmsystem_account_id IS NOT NULL
          );


/*1. *     Unique_ID 
2.       <Blank>
3. ** Cust_Source_Cd
4.       <Blank>
5.       Company_Name
6.       First_Name
7.       Middle_Name
8.       Last_Name
9.       Suffix
10.   Address_Line1
11.   Address_Line2
12.   City
13.   State
14.   ZIP
15.   Country_Code
16.   PhoneDay
17.   PhoneEve
18.   Email
*/
GO
