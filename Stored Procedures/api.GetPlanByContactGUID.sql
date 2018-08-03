SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


/*************************************************
Created By: Caeleon Work
Created On: 
Updated By: Stephanie Gerber
Update Date: 2018-06-14
Update Notes: Added in the Seat Location (Section, Row, Seat block) and the price codes as well as Waitlist. 
Reviewed By: Caeleon Work 
Review Date: 6/25/2018
Review Notes: Path Approved 
**************************************************/

CREATE   PROCEDURE [api].[GetPlanByContactGUID]
    (
      @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50)
	, @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50)
    , @RowsPerPage INT = 500
    , --APIification
      @PageNumber INT = 0 --APIification
    )
AS
    BEGIN

-- =========================================
-- Initial Variables for API
-- =========================================

        DECLARE @totalCount INT
          , @xmlDataNode XML
          , @recordsInResponse INT
          , @remainingCount INT
          , @rootNodeName NVARCHAR(100)
          , @responseInfoNode NVARCHAR(MAX)
          , @finalXml XML;

-- =========================================
-- GUID Table for GUIDS
-- =========================================
DECLARE @GUIDTable TABLE ( GUID VARCHAR(50) );

IF ( @SSB_CRMSYSTEM_ACCT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @GUIDTable
                ( GUID
                )
                SELECT DISTINCT
                        z.SSB_CRMSYSTEM_CONTACT_ID
                FROM    dbo.vwDimCustomer_ModAcctId z
                WHERE   z.SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID;
    END;

IF ( @SSB_CRMSYSTEM_CONTACT_ID NOT IN ( 'None', 'Test' ) )
    BEGIN
        INSERT  INTO @GUIDTable
                ( GUID
                )
                SELECT  @SSB_CRMSYSTEM_CONTACT_ID;
    END;

-- =========================================
-- Base Table Set
-- =========================================


        DECLARE @baseData TABLE
            (
              Team NVARCHAR(255)
			, Account NVARCHAR(255)
            , SeasonName NVARCHAR(255)
            , OrderNumber NVARCHAR(255)
			, PlanCode NVARCHAR(255)
            , PlanDesc NVARCHAR(255)
            , OrderDate DATE
            , PriceCode NVARCHAR(255)
            , IsComp NVARCHAR(255)
			, Qty INT
			, TotalSeatPrice DECIMAL(18, 6)
			, TotalBlockPrice DECIMAL(18, 6)
            , TotalAmountOwed DECIMAL(18, 6)
            , TotalAmountPaid DECIMAL(18, 6)
			, SalesRep NVARCHAR(255)
			, SectionName NVARCHAR(50) 
			, RowName NVARCHAR(50) 
			, SeatBlock NVARCHAR(25)
			, SeatPriceCode NVARCHAR(15) 
            );

-- =========================================
-- Procedure
-- =========================================
SELECT DISTINCT
        'Bears' AS Team
      , fts.SSID_acct_id
      , ds.SeasonName
	  , fts.OrderNum AS OrderNumber
      , dp.PlanCode AS [Plan]
      , dp.PlanDesc 
	  , MIN(dd.CalDate) AS OrderDate
      , MAX(dpc.PriceCode) AS PlanPriceCode
      , MAX(fts.IsComp) AS IsComp
	  , fts.QtySeat AS Qty
      , SUM(fts.PcPrice)AS TotalSeatPrice
      , SUM(fts.BlockPurchasePrice) AS TotalBlockPrice
      , SUM(fts.OwedAmount) AS TotalOwedAmount
      , SUM(fts.PaidAmount) AS TotalPaidAmount
	  , fts.SSCreatedBy AS SalesRep
	  , ds2.SectionName AS SectionName 
	  , ds2.RowName AS RowName 
	  , CASE 
			WHEN dp.PlanDesc LIKE '%park%'
			THEN NULL 
			ELSE CONCAT (ds2.Seat,':',ds2.seat + fts.QtySeat - 1) 
			END AS SeatBlock 
	  , ds2.DefaultPriceCode AS SeatPriceCode
INTO #Trans
FROM    dbo.FactTicketSales AS fts WITH (NOLOCK)
        JOIN dbo.dimcustomerssbid AS d WITH (NOLOCK) ON d.DimCustomerId = fts.DimCustomerId
        JOIN dbo.DimSeason AS ds WITH (NOLOCK) ON ds.DimSeasonId = fts.DimSeasonId
        JOIN dbo.DimItem AS di WITH (NOLOCK) ON di.DimItemId = fts.DimItemId
        JOIN dbo.DimPriceCode AS dpc WITH (NOLOCK) ON dpc.DimPriceCodeId = fts.DimPriceCodeId
        JOIN dbo.DimTicketClass AS dtc WITH (NOLOCK) ON dtc.DimTicketClassId = fts.DimTicketTypeId
        JOIN dbo.DimTicketType AS dtt WITH (NOLOCK) ON fts.DimTicketTypeId = fts.DimTicketTypeId
        JOIN dbo.DimPlan AS dp WITH (NOLOCK) ON dp.DimPlanId = fts.DimPlanId
        JOIN dbo.DimDate AS dd WITH (NOLOCK) ON dd.DimDateId = fts.DimDateId
		JOIN dbo.DimEvent AS de WITH (NOLOCK) ON de.DimEventId = fts.DimEventId
        JOIN dbo.DimPromo AS dp2 WITH (NOLOCK) ON dp2.DimPromoID = fts.DimPromoId
        JOIN dbo.DimSeat AS ds2 WITH (NOLOCK) ON ds2.DimSeatId = fts.DimSeatIdStart
WHERE  d.SSB_CRMSYSTEM_CONTACT_ID IN (SELECT GUID FROM @GUIDTable)
		AND	dp.PlanCode!= 'None'
		AND SSID_acct_id > 50000
		AND ds.SeasonYear >= DATEADD(YEAR,-2,GETDATE())
GROUP BY 
	 fts.SSID_acct_id
      , ds.SeasonName
      , dp.PlanCode 
 	  , dp.PlanDesc
	  , fts.OrderNum
	  , fts.QtySeat
	  , fts.SSCreatedBy
	  ,ds2.SectionName
	  ,ds2.RowName
	  ,ds2.Seat
	  ,ds2.DefaultPriceCode 
UNION
SELECT DISTINCT
         'Bears' AS Team
      , fts.SSID_acct_id
      , ds.SeasonName
	  , fts.OrderNum AS OrderNumber 
      , dp.PlanCode AS [Plan]
      , dp.PlanDesc 
	  , MIN(dd.CalDate) AS OrderDate
      , MAX(dpc.PriceCode) AS PriceCode
      , MAX(fts.IsComp) AS IsComp
	  , fts.QtySeat AS Qty 
      , SUM(fts.PcPrice)AS TotalSeatPrice
      , SUM(fts.BlockPurchasePrice) AS TotalBlockPrice
      , SUM(fts.OwedAmount) AS TotalOwedAmount
      , SUM(fts.PaidAmount) AS TotalPaidAmount
	  , fts.SSCreatedBy AS SalesRep
	  , ds2.SectionName AS SectionName 
	  , ds2.RowName AS RowName 
	  , CASE 
			WHEN dp.PlanDesc LIKE '%park%'
			THEN NULL 
			ELSE CONCAT (ds2.Seat,':',ds2.seat + fts.QtySeat - 1) 
			END AS SeatBlock 
	  , ds2.DefaultPriceCode AS SeatPriceCode
--INTO #Trans
FROM    dbo.FactTicketSalesHistory AS fts WITH (NOLOCK) 
        JOIN dbo.dimcustomerssbid AS d WITH (NOLOCK) ON d.DimCustomerId = fts.DimCustomerId
        JOIN dbo.DimSeason AS ds WITH (NOLOCK) ON ds.DimSeasonId = fts.DimSeasonId
        JOIN dbo.DimItem AS di WITH (NOLOCK) ON di.DimItemId = fts.DimItemId
        JOIN dbo.DimPriceCode AS dpc WITH (NOLOCK) ON dpc.DimPriceCodeId = fts.DimPriceCodeId
        JOIN dbo.DimTicketClass AS dtc WITH (NOLOCK) ON dtc.DimTicketClassId = fts.DimTicketTypeId
        JOIN dbo.DimTicketType AS dtt WITH (NOLOCK) ON fts.DimTicketTypeId = fts.DimTicketTypeId
        JOIN dbo.DimPlan AS dp WITH (NOLOCK) ON dp.DimPlanId = fts.DimPlanId
        JOIN dbo.DimDate AS dd WITH (NOLOCK) ON dd.DimDateId = fts.DimDateId
		JOIN dbo.DimEvent AS de WITH (NOLOCK) ON de.DimEventId = fts.DimEventId
        JOIN dbo.DimPromo AS dp2 WITH (NOLOCK) ON dp2.DimPromoID = fts.DimPromoId
        JOIN dbo.DimSeat AS ds2 WITH (NOLOCK) ON ds2.DimSeatId = fts.DimSeatIdStart
WHERE   d.SSB_CRMSYSTEM_CONTACT_ID IN (SELECT GUID FROM @GUIDTable)
		AND	dp.PlanCode!= 'None'
		AND SSID_acct_id > 50000
		AND ds.SeasonYear >= DATEADD(YEAR,-2,GETDATE())
GROUP BY 
	 fts.SSID_acct_id
      , ds.SeasonName
      , dp.PlanCode 
 	  , dp.PlanDesc
	  , fts.OrderNum
	  , fts.QtySeat
	  , fts.SSCreatedBy
	  ,ds2.SectionName
	  ,ds2.RowName
	  ,ds2.Seat
	  ,ds2.DefaultPriceCode

UNION ALL 
SELECT DISTINCT 
		'Bears' AS Team
      , fts.SSID_acct_id
      , ds.SeasonName
	  , fts.OrderNum AS OrderNumber 
      , 'WLDEP' AS [Plan]
      , 'Waitlist' AS PlanDesc 
	  , MIN(dd.CalDate) AS OrderDate
      , MAX(dpc.PriceCode) AS PriceCode
      , MAX(fts.IsComp) AS IsComp
	  , fts.QtySeat AS Qty 
      , SUM(fts.PcPrice)AS TotalSeatPrice
      , SUM(fts.BlockPurchasePrice) AS TotalBlockPrice
      , SUM(fts.OwedAmount) AS TotalOwedAmount
      , SUM(fts.PaidAmount) AS TotalPaidAmount
	  , fts.SSCreatedBy AS SalesRep
	  , ds2.SectionName AS SectionName 
	  , ds2.RowName AS RowName 
	  , CASE 
			WHEN dp.PlanDesc LIKE '%park%'
			THEN NULL 
			ELSE CONCAT (ds2.Seat,':',ds2.seat + fts.QtySeat - 1) 
			END AS SeatBlock 
	  , ds2.DefaultPriceCode AS SeatPriceCode
FROM    dbo.FactTicketSalesHistory AS fts WITH (NOLOCK) 
        JOIN dbo.dimcustomerssbid AS d WITH (NOLOCK) ON d.DimCustomerId = fts.DimCustomerId
        JOIN dbo.DimSeason AS ds WITH (NOLOCK) ON ds.DimSeasonId = fts.DimSeasonId
        JOIN dbo.DimItem AS di WITH (NOLOCK) ON di.DimItemId = fts.DimItemId
        JOIN dbo.DimPriceCode AS dpc WITH (NOLOCK) ON dpc.DimPriceCodeId = fts.DimPriceCodeId
        JOIN dbo.DimTicketClass AS dtc WITH (NOLOCK) ON dtc.DimTicketClassId = fts.DimTicketTypeId
        JOIN dbo.DimTicketType AS dtt WITH (NOLOCK) ON fts.DimTicketTypeId = fts.DimTicketTypeId
        JOIN dbo.DimPlan AS dp WITH (NOLOCK) ON dp.DimPlanId = fts.DimPlanId
        JOIN dbo.DimDate AS dd WITH (NOLOCK) ON dd.DimDateId = fts.DimDateId
		JOIN dbo.DimEvent AS de WITH (NOLOCK) ON de.DimEventId = fts.DimEventId
        JOIN dbo.DimPromo AS dp2 WITH (NOLOCK) ON dp2.DimPromoID = fts.DimPromoId
        JOIN dbo.DimSeat AS ds2 WITH (NOLOCK) ON ds2.DimSeatId = fts.DimSeatIdStart
WHERE   d.SSB_CRMSYSTEM_CONTACT_ID IN (SELECT GUID FROM @GUIDTable)
		AND	de.EventCode = 'WLDEP'
		AND SSID_acct_id > 50000
		AND ds.SeasonYear >= DATEADD(YEAR,-2,GETDATE())
GROUP BY 
	 fts.SSID_acct_id
      , ds.SeasonName
      , dp.PlanCode 
 	  , dp.PlanDesc
	  , fts.OrderNum
	  , fts.QtySeat
	  , fts.SSCreatedBy
	  ,ds2.SectionName
	  ,ds2.RowName
	  ,ds2.Seat
	  ,ds2.DefaultPriceCode	  
	  
	  ;

-- =========================================
-- API Pagination
-- =========================================
-- Cap returned results at 1000

        IF @RowsPerPage > 1000
            BEGIN

                SET @RowsPerPage = 1000;

            END;

-- Pull total count

        SELECT  @totalCount = COUNT(*)
        FROM    #Trans AS c;

-- =========================================
-- API Loading
-- =========================================

-- Load base data

        INSERT  INTO @baseData
                SELECT  *
                FROM    #Trans AS c
                ORDER BY c.OrderDate DESC
                      , c.OrderNumber
                      OFFSET ( @PageNumber ) * @RowsPerPage ROWS

FETCH NEXT @RowsPerPage ROWS ONLY;

-- Set records in response

        SELECT  @recordsInResponse = COUNT(*)
        FROM    @baseData;
-- Create XML response data node

        SET @xmlDataNode = (
                             SELECT ISNULL(Team, '') AS Team
                                  , ISNULL(SeasonName,'') AS SeasonName
								  , ISNULL(OrderNumber,'') AS OrderNumber
                                  , ISNULL(PlanCode,'') AS [Plan]
                                  , ISNULL(PlanDesc,'') AS PlanDesc
                                  , ISNULL(OrderDate,'') AS OrderDate                             
                                  , ISNULL(IsComp,0) AS IsComp    
								  , ISNULL(Qty,0) AS Qty                            
                                  , ISNULL(TotalSeatPrice,0) AS TotalSeatPrice
                                  , ISNULL(TotalBlockPrice,0) AS TotalBlockPrice
                                  , ISNULL(TotalAmountOwed,0) AS TotalAmountOwed
                                  , ISNULL(TotalAmountPaid,0) AS TotalAmountPaid
								  , ISNULL(SalesRep,'') AS SalesRep
								  , ISNULL(SectionName,'') AS SectionName 
								  , ISNULL(RowName,'') AS RowName 
								  , ISNULL(SeatBlock,'') AS SeatBlock
								  , ISNULL(SeatPriceCode,'') AS SeatPriceCode
                             FROM   @baseData
                           FOR
                             XML PATH('Parent')
                               , ROOT('Parents')
                           );

        SET @rootNodeName = 'Parents';

		-- Calculate remaining count

        SET @remainingCount = @totalCount - ( @RowsPerPage * ( @PageNumber + 1 ) );

        IF @remainingCount < 0
            BEGIN

                SET @remainingCount = 0;

            END;

			-- Create response info node

        SET @responseInfoNode = ( '<ResponseInfo>' + '<TotalCount>'
                                  + CAST(@totalCount AS NVARCHAR(20))
                                  + '</TotalCount>' + '<RemainingCount>'
                                  + CAST(@remainingCount AS NVARCHAR(20))
                                  + '</RemainingCount>'
                                  + '<RecordsInResponse>'
                                  + CAST(@recordsInResponse AS NVARCHAR(20))
                                  + '</RecordsInResponse>'
                                  + '<PagedResponse>true</PagedResponse>'
                                  + '<RowsPerPage>'
                                  + CAST(@RowsPerPage AS NVARCHAR(20))
                                  + '</RowsPerPage>' + '<PageNumber>'
                                  + CAST(@PageNumber AS NVARCHAR(20))
                                  + '</PageNumber>' + '<RootNodeName>'
                                  + @rootNodeName + '</RootNodeName>'
                                  + '</ResponseInfo>' );
    END;

-- Wrap response info and data, then return    

    IF @xmlDataNode IS NULL
        BEGIN

            SET @xmlDataNode = '<' + @rootNodeName + ' />';

        END;

    SET @finalXml = '<Root>' + @responseInfoNode
        + CAST(@xmlDataNode AS NVARCHAR(MAX)) + '</Root>';

    SELECT  CAST(@finalXml AS XML);

GO
