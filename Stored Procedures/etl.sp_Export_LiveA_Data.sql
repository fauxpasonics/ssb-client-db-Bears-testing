SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROCEDURE [etl].[sp_Export_LiveA_Data]
AS
/*==========================
New Version 12/14/17 CTW
===========================*/

WITH Active (DimCustomerID, ssb_crmsystem_contact_id)
AS (SELECT dc.DimCustomerId,
           ssbid.SSB_CRMSYSTEM_CONTACT_ID
    --INTO #Active
    FROM dbo.DimCustomer dc (NOLOCK)
        JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
            ON ssbid.DimCustomerId = dc.DimCustomerId
    WHERE DATEDIFF(YEAR, SSCreatedDate, GETDATE()) <= 3
          OR DATEDIFF(YEAR, SSUpdatedDate, GETDATE()) <= 3),
     TicketBuyers (dimcustomerid, ssb_crmsystem_contact_id)
AS (SELECT DISTINCT
        fts.DimCustomerId,
        dc.SSB_CRMSYSTEM_CONTACT_ID
    --INTO #TicketBuyers
    FROM dbo.FactTicketSales fts (NOLOCK)
        JOIN dbo.dimcustomerssbid dc (NOLOCK)
            ON dc.DimCustomerId = fts.DimCustomerId
        JOIN dbo.DimDate dd
            ON dd.DimDateId = fts.DimDateId
    WHERE DATEDIFF(YEAR, dd.CalDate, GETDATE()) <= 3)
SELECT DISTINCT
    compr.SSB_CRMSYSTEM_CONTACT_ID,
    NULL AS Blank1,
    NULLIF(compr.SourceSystem, '') SourceSystem,
    NULL AS Blank2,
    NULLIF(compr.CompanyName, '') CompanyName,
    NULLIF(compr.FirstName, '') FirstName,
    NULLIF(compr.MiddleName, '') MiddleName,
    NULLIF(compr.LastName, '') LastName,
    NULLIF(compr.Suffix, '') Suffix,
    NULLIF(compr.AddressPrimaryStreet, '') Address_Line1,
    NULLIF(compr.AddressPrimarySuite, '') Address_Line2,
    NULLIF(compr.AddressPrimaryCity, '') City,
    NULLIF(compr.AddressPrimaryState, '') State,
    NULLIF(compr.AddressPrimaryZip, '') ZIP,
    NULLIF(compr.AddressPrimaryCountry, '') Country,
    NULLIF(compr.PhonePrimary, '') PhoneDay,
    NULLIF(compr.PhoneHome, '') PhoneEve,
    NULLIF(compr.EmailPrimary, '') Email
--INTO #qa
FROM dbo.vwCompositeRecord_ModAcctID compr
    LEFT JOIN Active a
        ON a.ssb_crmsystem_contact_id = compr.SSB_CRMSYSTEM_CONTACT_ID
    LEFT JOIN TicketBuyers tb
        ON tb.ssb_crmsystem_contact_id = compr.SSB_CRMSYSTEM_CONTACT_ID
	LEFT JOIN ods.LiveAnalytics_Customer la
		ON la.cust_first_nm= compr.FirstName
		AND la.cust_last_nm = compr.LastName
		AND cust_addr_line_1 = compr.AddressPrimaryStreet
		AND la.cust_email_addr = compr.EmailPrimary
WHERE compr.AddressPrimaryStreet IS NOT NULL
      AND ISNULL(compr.FirstName, '') <> ''
      AND ISNULL(compr.LastName, '') <> ''
      AND ISNULL(compr.EmailPrimary, '') <> ''
      AND compr.AddressPrimaryIsCleanStatus = 'Valid'
      AND
      (
          a.ssb_crmsystem_contact_id IS NOT NULL
          OR tb.ssb_crmsystem_contact_id IS NOT NULL
      )
      AND compr.SSB_CRMSYSTEM_CONTACT_ID NOT IN (
        SELECT DISTINCT
            ssbid.SSB_CRMSYSTEM_CONTACT_ID
        FROM dbo.dimcustomerssbid ssbid
            JOIN
            (
                SELECT DISTINCT
                    SSID
                FROM mdm.SSB_ID_History
                WHERE ssb_crmsystem_contact_id IN (
                                                      SELECT acct_id FROM ods.LiveAnalytics_Customer
                                                  )
            ) x
                ON x.SSID = ssbid.SSID
    )
	AND NULLIF(compr.SourceSystem, '')!='Infogroup'
	AND la.acct_id IS NULL
	AND NULLIF(compr.EmailPrimary, '') NOT LIKE '%@bears.nfl.net';


/*=======================
Old Version 12/14/17
========================*/


--WITH Active (DimCustomerID, ssb_crmsystem_contact_id)
--AS (SELECT dc.DimCustomerId,
--           ssbid.SSB_CRMSYSTEM_CONTACT_ID
--    --INTO #Active
--    FROM dbo.DimCustomer dc (NOLOCK)
--        JOIN dbo.dimcustomerssbid ssbid (NOLOCK)
--            ON ssbid.DimCustomerId = dc.DimCustomerId
--    WHERE DATEDIFF(YEAR, SSCreatedDate, GETDATE()) <= 3
--          OR DATEDIFF(YEAR, SSUpdatedDate, GETDATE()) <= 3
--   ),
--     TicketBuyers (dimcustomerid, ssb_crmsystem_contact_id)
--AS (SELECT DISTINCT
--        fts.DimCustomerId,
--        dc.SSB_CRMSYSTEM_CONTACT_ID
--    --INTO #TicketBuyers
--    FROM dbo.FactTicketSales fts (NOLOCK)
--        JOIN dbo.dimcustomerssbid dc (NOLOCK)
--            ON dc.DimCustomerId = fts.DimCustomerId
--        JOIN dbo.DimDate dd
--            ON dd.DimDateId = fts.DimDateId
--    WHERE DATEDIFF(YEAR, dd.CalDate, GETDATE()) <= 3
--   )
--SELECT DISTINCT
--    compr.SSB_CRMSYSTEM_CONTACT_ID,
--    NULL AS Blank1,
--    NULLIF(compr.SourceSystem, '') SourceSystem,
--    NULL AS Blank2,
--    NULLIF(compr.CompanyName, '') CompanyName,
--    NULLIF(compr.FirstName, '') FirstName,
--    NULLIF(compr.MiddleName, '') MiddleName,
--    NULLIF(compr.LastName, '') LastName,
--    NULLIF(compr.Suffix, '') Suffix,
--    NULLIF(compr.AddressPrimaryStreet, '') Address_Line1,
--    NULLIF(compr.AddressPrimarySuite, '') Address_Line2,
--    NULLIF(compr.AddressPrimaryCity, '') City,
--    NULLIF(compr.AddressPrimaryState, '') State,
--    NULLIF(compr.AddressPrimaryZip, '') ZIP,
--    NULLIF(compr.AddressPrimaryCountry, '') Country,
--    NULLIF(compr.PhonePrimary, '') PhoneDay,
--    NULLIF(compr.PhoneHome, '') PhoneEve,
--    NULLIF(compr.EmailPrimary, '') Email
----INTO #qa
--FROM dbo.vwCompositeRecord_ModAcctID compr
--    LEFT JOIN Active a
--        ON a.ssb_crmsystem_contact_id = compr.SSB_CRMSYSTEM_CONTACT_ID
--    LEFT JOIN TicketBuyers tb
--        ON tb.ssb_crmsystem_contact_id = compr.SSB_CRMSYSTEM_CONTACT_ID
--WHERE compr.AddressPrimaryStreet IS NOT NULL
--      AND ISNULL(compr.FirstName, '') <> ''
--      AND ISNULL(compr.LastName, '') <> ''
--      AND ISNULL(compr.EmailPrimary, '') <> ''
--      AND compr.AddressPrimaryIsCleanStatus = 'Valid'
--      AND (
--              a.ssb_crmsystem_contact_id IS NOT NULL
--              OR tb.ssb_crmsystem_contact_id IS NOT NULL
--          )
--      AND compr.SSB_CRMSYSTEM_CONTACT_ID NOT IN (
--                                                    SELECT DISTINCT
--                                                        ssbid.SSB_CRMSYSTEM_CONTACT_ID
--                                                    FROM dbo.dimcustomerssbid ssbid
--                                                        JOIN
--                                                        (
--                                                            SELECT DISTINCT
--                                                                SSID
--                                                            FROM mdm.SSB_ID_History
--                                                            WHERE ssb_crmsystem_contact_id IN (
--                                                                                                  SELECT acct_id FROM ods.Bears_LiveA_Cust_20170906
--                                                                                              )
--                                                        ) x
--                                                            ON x.SSID = ssbid.SSID
--                                                )
--      AND NULLIF(compr.SourceSystem, '') != 'Infogroup';

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
