SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [api].[CRM_FanaticsOrders]
    @SSB_CRMSYSTEM_ACCT_ID VARCHAR(50) = 'Test',
    @SSB_CRMSYSTEM_CONTACT_ID VARCHAR(50) = 'Test',
    @DisplayTable INT = 0,
    @RowsPerPage INT = 500,
    @PageNumber INT = 0
AS
BEGIN


    -- =========================
    -- Init vars needed for API
    -- =========================

    DECLARE @totalCount INT,
            @xmlDataNode XML,
            @recordsInResponse INT,
            @remainingCount INT,
            @rootNodeName NVARCHAR(100),
            @responseInfoNode NVARCHAR(MAX),
            @finalXml XML;

    PRINT 'Acct-' + @SSB_CRMSYSTEM_ACCT_ID;
    PRINT 'Contact-' + @SSB_CRMSYSTEM_CONTACT_ID;

    -- ==========================
    -- GUIDS
    -- ==========================

    DECLARE @GUIDTable TABLE (GUID VARCHAR(50));

    IF (@SSB_CRMSYSTEM_ACCT_ID NOT IN ( 'None', 'Test' ))
    BEGIN
        INSERT INTO @GUIDTable
        (
            GUID
        )
        SELECT DISTINCT
            z.SSB_CRMSYSTEM_CONTACT_ID
        FROM Bears.dbo.vwDimCustomer_ModAcctId z
        WHERE z.SSB_CRMSYSTEM_ACCT_ID = @SSB_CRMSYSTEM_ACCT_ID;
    END;

    IF (@SSB_CRMSYSTEM_CONTACT_ID NOT IN ( 'None', 'Test' ))
    BEGIN
        INSERT INTO @GUIDTable
        (
            GUID
        )
        SELECT @SSB_CRMSYSTEM_CONTACT_ID;
    END;

    -- ============================
    -- Base Table Set
    -- ============================

    DECLARE @baseData TABLE
    (
        First_Name NVARCHAR(255),
        Last_Name NVARCHAR(255),
        Email NVARCHAR(255),
        Order_Id INT,
        OrderDate DATETIME,
        ProductName NVARCHAR(500),
        QtySold INT,
        UnitPrice MONEY,
        LineTotal MONEY,
        OrderTotal MONEY,
        OrderPromoCode NVARCHAR(255),
        IsTeamShop INT
    );

    -- ==============================
    -- Procedure
    -- ==============================
    SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID,
           fo.Client_First_Name,
           fo.Client_Last_Name,
           fo.Client_Email,
           fo.Order_ID,
           fo.OrderDate,
           fo.ProductName,
           fo.QtySold,
           fo.UnitPrice,
           CAST(fo.QtySold AS INT) * CAST(fo.UnitPrice AS MONEY) Linetotal,
           fo.OrderNetTotal,
           fo.OrderPromo,
           fo.IsTeamShop
    INTO #tmpbase
    FROM ods.Fanatics_Orders fo
        JOIN dbo.DimCustomer dc
            ON dc.SSID = fo.Client_ID
               AND dc.SourceSystem = 'Fanatics'
        INNER JOIN dbo.dimcustomerssbid ssbid WITH (NOLOCK)
            ON ssbid.DimCustomerId = dc.DimCustomerId
    WHERE ssbid.SSB_CRMSYSTEM_CONTACT_ID IN (
                                                SELECT GUID FROM @GUIDTable
                                            );


    -- =========================================
    -- API Pagination
    -- =========================================
    -- Cap returned results at 1000

    IF @RowsPerPage > 1000
    BEGIN

        SET @RowsPerPage = 1000;

    END;

    -- Pull total count

    SELECT @totalCount = COUNT(*)
    FROM #tmpbase AS c;
    -- =========================================
    -- API Loading
    -- =========================================

    -- Load base data

    INSERT INTO @baseData
    (
        First_Name,
        Last_Name,
        Email,
        Order_Id,
        OrderDate,
        ProductName,
        QtySold,
        UnitPrice,
        LineTotal,
        OrderTotal,
        OrderPromoCode,
        IsTeamShop
    )
    SELECT ISNULL(Client_First_Name, '') First_Name,
           ISNULL(Client_Last_Name, '') Last_Name,
           ISNULL(Client_Email, '') Email,
           ISNULL(Order_ID, 0) Order_Id,
           ISNULL(OrderDate, '') OrderDate,
           ISNULL(ProductName, '') ProductName,
           ISNULL(QtySold, 0) QtySold,
           ISNULL(UnitPrice, 0) UnitPrice,
           ISNULL(Linetotal, 0) LineTotal,
           ISNULL(OrderNetTotal, 0) OrderTotal,
           ISNULL(OrderPromo, '') OrderPromoCode,
           ISNULL(IsTeamShop, 0) IsTeamShop
    FROM #tmpbase
    ORDER BY OrderDate DESC OFFSET (@PageNumber) * @RowsPerPage ROWS FETCH NEXT @RowsPerPage ROWS ONLY;

    -- DROP TABLE #tmpParent

    -- Pull counts
    SELECT @recordsInResponse = COUNT(*)
    FROM @baseData;


    SET @xmlDataNode =
    (
        SELECT First_Name,
               Last_Name,
               Email,
               Order_Id,
               OrderDate,
               ProductName,
               QtySold,
               UnitPrice,
               LineTotal,
               OrderTotal,
               OrderPromoCode,
               IsTeamShop
        FROM @baseData p
        ORDER BY p.OrderDate DESC
        FOR XML PATH('Parent'), ROOT('Parents')
    );

    SET @rootNodeName = 'Parents';

    -- Calculate remaining count
    SET @remainingCount = @totalCount - (@RowsPerPage * (@PageNumber + 1));
    IF @remainingCount < 0
    BEGIN
        SET @remainingCount = 0;
    END;

    -- Create response info node
    SET @responseInfoNode
        = ('<ResponseInfo>' + '<TotalCount>' + CAST(@totalCount AS NVARCHAR(20)) + '</TotalCount>' + '<RemainingCount>'
           + CAST(@remainingCount AS NVARCHAR(20)) + '</RemainingCount>' + '<RecordsInResponse>'
           + CAST(@recordsInResponse AS NVARCHAR(20)) + '</RecordsInResponse>' + '<PagedResponse>true</PagedResponse>'
           + '<RowsPerPage>' + CAST(@RowsPerPage AS NVARCHAR(20)) + '</RowsPerPage>' + '<PageNumber>'
           + CAST(@PageNumber AS NVARCHAR(20)) + '</PageNumber>' + '<RootNodeName>' + @rootNodeName + '</RootNodeName>'
           + '</ResponseInfo>'
          );

    PRINT @responseInfoNode;

    -- Wrap response info and data, then return	
    IF @xmlDataNode IS NULL
    BEGIN
        SET @xmlDataNode = '<' + @rootNodeName + ' />';
    END;

    SET @finalXml = '<Root>' + @responseInfoNode + CAST(@xmlDataNode AS NVARCHAR(MAX)) + '</Root>';

    IF @DisplayTable = 1
        SELECT *
        FROM #tmpbase;

    --IF @DisplayTable = 0
    SELECT CAST(@finalXml AS XML);

    DROP TABLE #tmpbase;


END;





















GO
