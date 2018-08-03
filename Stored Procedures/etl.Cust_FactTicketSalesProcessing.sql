SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE PROCEDURE [etl].[Cust_FactTicketSalesProcessing]
(
	@BatchId INT = 0,
	@LoadDate DATETIME = NULL,
	@Options NVARCHAR(MAX) = NULL
)

AS


BEGIN


/*****************************************************************************************************************
												Ticket Type
******************************************************************************************************************/

----FULL SEASON----

UPDATE fts
SET fts.DimTicketTypeId = CASE WHEN (ISNULL(PriceCode.PC2,'') = ''
OR		(ISNULL(PriceCode.PC2,'') LIKE '[0-9]' AND ISNULL(PriceCode.PC3,'')='' )
OR		(ISNULL(PriceCode.PC2,'') IN ('I','O','W') AND ISNULL(PriceCode.PC3,'')='')
OR		(ISNULL(PriceCode.PC3,'') IN ('I','O','W') AND ISNULL(PriceCode.PC4,'')='')) THEN 1 
WHEN ((ISNULL(PriceCode.PC2,'') <> '' AND ISNULL(PriceCode.PC2,'') NOT IN ('I','O','W') AND ISNULL(PriceCode.pc2,'') NOT LIKE '[0-9]')
OR		(ISNULL(PriceCode.PC2,'') LIKE '[0-9]' AND ISNULL(PriceCode.PC3,'')<>'' AND ISNULL( PriceCode.PC3, '' ) NOT IN ( 'I', 'O', 'W' ))) THEN 2 ELSE -1 END
FROM    #stgFactTicketSales fts
        INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
WHERE   SeasonYear IN (2016, 2017)
	
	

----SINGLE GAME----

--UPDATE fts
--SET fts.DimTicketTypeId = 2
--FROM    #stgFactTicketSales fts
--        INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
--		JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
--WHERE   SeasonYear IN (2016, 2017)
--AND		((ISNULL(PriceCode.PC2,'') <> '' AND ISNULL(PC2,'') NOT IN ('I','O','W'))
--OR		(ISNULL(PriceCode.PC2,'') LIKE '[0-9]' AND ISNULL(PriceCode.PC3,'')<>'' ))




/*****************************************************************************************************************
													PLAN TYPE
******************************************************************************************************************/

----NEW----

UPDATE fts
SET fts.DimPlanTypeId = 1
FROM    #stgFactTicketSales fts
        INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		JOIN ods.TM_Cust tc ON fts.SSID_acct_id = tc.acct_id
WHERE   SeasonYear IN (2016, 2017)
AND		tc.acct_rep_name = '04 WAIT LIST'
AND		(ISNULL(PriceCode.PC2,'') = ''
OR		(ISNULL(PriceCode.PC2,'') LIKE '[0-9]' AND ISNULL(PriceCode.PC3,'')='' )
OR		(ISNULL(PriceCode.PC2,'') IN ('I','O','W') AND ISNULL(PriceCode.PC3,'')='')
OR		(ISNULL(PriceCode.PC3,'') IN ('I','O','W') AND ISNULL(PriceCode.PC4,'')=''))

----RENEW----

UPDATE fts
SET fts.DimPlanTypeId = 2
FROM    #stgFactTicketSales fts
        INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
		JOIN ods.TM_Cust tc ON fts.SSID_acct_id = tc.acct_id
WHERE   SeasonYear IN (2016, 2017)
AND		tc.acct_rep_name <> '04 WAIT LIST'
AND		(ISNULL(PriceCode.PC2,'') = ''
OR		(ISNULL(PriceCode.PC2,'') LIKE '[0-9]' AND ISNULL(PriceCode.PC3,'')='' )
OR		(ISNULL(PriceCode.PC2,'') IN ('I','O','W') AND ISNULL(PriceCode.PC3,'')='')
OR		(ISNULL(PriceCode.PC3,'') IN ('I','O','W') AND ISNULL(PriceCode.PC4,'')=''))



----NO PLAN----

UPDATE fts
SET fts.DimPlanTypeId = 3
FROM    #stgFactTicketSales fts
        INNER JOIN dbo.DimPriceCode PriceCode ON PriceCode.DimPriceCodeId = fts.DimPriceCodeId
		JOIN dbo.DimSeason season ON season.DimSeasonId = fts.DimSeasonId
WHERE   SeasonYear IN (2016, 2017)
AND		(ISNULL(PriceCode.PC2,'') <> ''
OR		(ISNULL(PriceCode.PC2,'') LIKE '[0-9]' AND ISNULL(PriceCode.PC3,'')<>'' ))





/*****************************************************************************************************************
													TICKET CLASS
******************************************************************************************************************/

----FULL SEASON RENEW----

UPDATE fts
SET fts.DimTicketClassId = 3
FROM    #stgFactTicketSales fts
WHERE	DimTicketTypeID = 1 AND DimPlanTypeID = 1



----FULL SEASON RENEW----

UPDATE fts
SET fts.DimTicketClassId = 1
FROM    #stgFactTicketSales fts
WHERE	DimTicketTypeID = 1 AND DimPlanTypeID = 2



----SINGLE GAME NO PLAN----

UPDATE	fts
SET		fts.DimTicketClassId = 2
FROM    #stgFactTicketSales fts
WHERE	DimTicketTypeID = 2
AND		DimPlanTypeID = 3
--	AND		dbo.DimPlanType = 3		DCH 2017-06-15





/*****************************************************************************************************************
															SEAT TYPE
******************************************************************************************************************/






/*****************************************************************************************************************
													FACT TAGS
******************************************************************************************************************/

/*
UPDATE f
SET f.IsComp = 1
FROM #stgFactTicketSales f
	JOIN dbo.DimPriceCode dpc
	ON dpc.DimPriceCodeId = f.DimPriceCodeId
WHERE f.compname <> 'Not Comp'
	  OR PriceCodeDesc = 'Comp'
	  OR f.TotalRevenue = 0


UPDATE f
SET f.IsComp = 0
FROM #stgFactTicketSales f
	JOIN dbo.DimPriceCode dpc
	ON dpc.DimPriceCodeId = f.DimPriceCodeId
WHERE NOT (f.compname <> 'Not Comp'
		   OR PriceCodeDesc = 'Comp'
		   OR f.TotalRevenue = 0)

UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 0
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM #stgFactTicketSales f
WHERE DimTicketTypeId IN (1, 2, 3) 



UPDATE f
SET f.IsPlan = 1
, f.IsPartial = 1
, f.IsSingleEvent = 0
, f.IsGroup = 0
FROM #stgFactTicketSales f
WHERE DimTicketTypeId IN (4, 5, 6, 7, 8) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 1
FROM #stgFactTicketSales f
WHERE DimTicketTypeId IN (9) 


UPDATE f
SET f.IsPlan = 0
, f.IsPartial = 0
, f.IsSingleEvent = 1
, f.IsGroup = 0
FROM #stgFactTicketSales f
WHERE DimTicketTypeId IN (10) 


UPDATE f
SET f.IsPremium = 1
FROM #stgFactTicketSales f
INNER JOIN dbo.DimSeatType dst ON f.DimSeatTypeId = dst.DimSeatTypeId
WHERE dst.SeatTypeCode <> 'GA'


UPDATE f
SET f.IsPremium = 0
FROM #stgFactTicketSales f
INNER JOIN dbo.DimSeatType dst ON f.DimSeatTypeId = dst.DimSeatTypeId
WHERE dst.SeatTypeCode = 'GA'



UPDATE f
SET f.IsRenewal = 1
FROM #stgFactTicketSales f
INNER JOIN dbo.DimPlanType dpt ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID = 3


UPDATE f
SET f.IsRenewal = 0
FROM #stgFactTicketSales f
INNER JOIN dbo.DimPlanType dpt ON f.DimPlanTypeId = dpt.DimPlanTypeId
WHERE dpt.DimPlanTypeID <> 3
*/



	

END





















































GO
