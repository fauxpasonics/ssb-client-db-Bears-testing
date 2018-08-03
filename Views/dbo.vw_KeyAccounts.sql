SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vw_KeyAccounts]
AS 

--WITH SSBID AS (
--	SELECT DISTINCT ssbid.SSB_CRMSYSTEM_CONTACT_ID
--	FROM mdm.vw_TM_STH vw
--	JOIN dbo.dimcustomerssbid ssbid ON vw.dimcustomerid = ssbid.DimCustomerid
--	WHERE vw.STH = 1 OR vw.Suite = 1
--	)


--SELECT dc.DimCustomerID, ssbid.SSB_CRMSYSTEM_CONTACT_ID SSBID, dc.SSID
--FROM SSBID vw
--JOIN dbo.dimcustomerssbid ssbid ON vw.SSB_CRMSYSTEM_CONTACT_ID = ssbid.SSB_CRMSYSTEM_CONTACT_ID
--JOIN dbo.dimcustomer dc ON ssbid.DimCustomerid = dc.DimCustomerId
--WHERE dc.SourceSystem = 'CRM_Contacts'

SELECT DISTINCT dc.DimCustomerId, dc.SSB_CRMSYSTEM_CONTACT_ID AS SSBID, dc.SSID FROM dbo.vwDimCustomer_ModAcctId dc
JOIN dbo.FactTicketSales fts ON fts.DimCustomerId = dc.DimCustomerId
JOIN dbo.DimSeason ds ON ds.DimSeasonId = fts.DimSeasonId
WHERE fts.DimTicketTypeId = 1
AND ds.SeasonYear = CASE WHEN MONTH(GETDATE()) IN (4,5,6,7,8,9,10,11,12) THEN 
YEAR(GETDATE()) ELSE YEAR(GETDATE()) - 1 END
UNION
SELECT DimCustomerId, SSB_CRMSYSTEM_CONTACT_ID AS SSBID, SSID
FROM dbo.vwDimCustomer_ModAcctId
WHERE AccountId<='200000'
UNION
SELECT DimCustomerId, SSB_CRMSYSTEM_CONTACT_ID, SSID
FROM dbo.vwDimCustomer_ModAcctId
WHERE SourceSystem = 'TM-Suites'


GO
