SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [ro].[vw_FactTicketSales_Base_All]
AS
SELECT  dd.CalDate SaleDate,
    dt.Time24 SaleTime,
    (CAST(dd.CalDate AS DATETIME) + CAST(dt.Time24 AS DATETIME)) SaleDateTime,
    dc.AccountId Archtics_acct_id,
    dc.FirstName,
    dc.LastName,
    dc.AccountRep,
    dc.AccountType,
    ds.SeasonName,
    ds.SeasonYear,
    ds.SeasonClass,
    ds.Active IsActiveSeason,
    --, deh.EventName EventHeaderName
    de.EventCode,
    de.EventName,
    de.EventDate,
    de.EventTime,
    de.EventDateTime,
    di.ItemCode,
    di.ItemName,
    dpl.PlanCode,
    dpl.PlanName,
    dpc.PriceCode,
    dpc.PC1,
    dpc.PC2,
    dpc.PC3,
    dpc.PC4,
    dst.SectionName,
    dst.RowName,
    dst.Seat,
    tt.TicketTypeCode,
    tt.TicketTypeName,
    pt.PlanTypeCode,
    pt.PlanTypeName,
    dstp.SeatTypeCode,
    CASE
        WHEN tt.TicketTypeCode = 'FS' THEN
            tt.TicketTypeName + ' ' + pt.PlanTypeName
        ELSE
            tt.TicketTypeName
    END TicketClass,
    dctm.ClassName,
    dctm.DistStatus,
    dsc.SalesCode,
    dsc.SalesCodeName,
    f.QtySeat,
    f.QtySeatFSE,
    f.TotalRevenue,
    f.TicketRevenue,
    f.PcOther1,
    f.PcOther2,
    f.PcTax,
    f.PcLicenseFee,
    f.Surcharge,
    f.PaidAmount,
    f.OwedAmount,
    f.CompCode,
    f.CompName,
    f.IsComp,
    f.IsHost,
    f.IsPremium,
    f.IsSingleEvent,
    f.IsPlan,
    f.IsPartial,
    f.IsGroup,
    f.IsRenewal,
    f.OrderNum,
    f.OrderLineItem,
    f.OrderLineItemSeq,
    f.RetailTicketType,
    f.RetailQualifiers,
    f.DimSeasonId,
    f.DimCustomerId,
    de.DimEventHeaderId,
    f.DimEventId,
    f.DimItemId,
    f.DimPlanId,
    f.DimPriceCodeId,
    f.DimSeatIdStart,
    f.DimClassTMId
FROM dbo.FactTicketSales f WITH (NOLOCK)
    LEFT JOIN dbo.DimSeason ds WITH (NOLOCK)
        ON ds.DimSeasonId = f.DimSeasonId
    LEFT JOIN dbo.DimEvent de WITH (NOLOCK)
        ON de.DimEventId = f.DimEventId
    LEFT JOIN dbo.DimPriceCode dpc WITH (NOLOCK)
        ON dpc.DimPriceCodeId = f.DimPriceCodeId
    LEFT JOIN dbo.DimItem di WITH (NOLOCK)
        ON di.DimItemId = f.DimItemId
    LEFT JOIN dbo.DimPlan dpl WITH (NOLOCK)
        ON dpl.DimPlanId = f.DimPlanId
    LEFT JOIN dbo.DimCustomer dc WITH (NOLOCK)
        ON dc.DimCustomerId = f.DimCustomerId
    LEFT JOIN dbo.DimSeat dst WITH (NOLOCK)
        ON dst.DimSeatId = f.DimSeatIdStart
    LEFT JOIN dbo.DimDate dd WITH (NOLOCK)
        ON dd.DimDateId = f.DimDateId
    LEFT JOIN dbo.DimTime dt WITH (NOLOCK)
        ON dt.DimTimeId = f.DimTimeId
    LEFT JOIN dbo.DimClassTM dctm WITH (NOLOCK)
        ON f.DimClassTMId = dctm.DimClassTMId
    LEFT JOIN dbo.DimSalesCode dsc WITH (NOLOCK)
        ON f.DimSalesCodeId = dsc.DimSalesCodeId
    LEFT JOIN dbo.DimPlanType pt WITH (NOLOCK)
        ON pt.DimPlanTypeId = f.DimPlanTypeId
    LEFT JOIN dbo.DimTicketType tt WITH (NOLOCK)
        ON tt.DimTicketTypeId = f.DimTicketTypeId
    LEFT JOIN dbo.DimSeatType dstp WITH (NOLOCK)
        ON dstp.DimSeatTypeId = f.DimSeatTypeId

UNION
SELECT  dd.CalDate SaleDate,
    dt.Time24 SaleTime,
    (CAST(dd.CalDate AS DATETIME) + CAST(dt.Time24 AS DATETIME)) SaleDateTime,
    dc.AccountId Archtics_acct_id,
    dc.FirstName,
    dc.LastName,
    dc.AccountRep,
    dc.AccountType,
    ds.SeasonName,
    ds.SeasonYear,
    ds.SeasonClass,
    ds.Active IsActiveSeason,
    --, deh.EventName EventHeaderName
    de.EventCode,
    de.EventName,
    de.EventDate,
    de.EventTime,
    de.EventDateTime,
    di.ItemCode,
    di.ItemName,
    dpl.PlanCode,
    dpl.PlanName,
    dpc.PriceCode,
    dpc.PC1,
    dpc.PC2,
    dpc.PC3,
    dpc.PC4,
    dst.SectionName,
    dst.RowName,
    dst.Seat,
    tt.TicketTypeCode,
    tt.TicketTypeName,
    pt.PlanTypeCode,
    pt.PlanTypeName,
    dstp.SeatTypeCode,
    CASE
        WHEN tt.TicketTypeCode = 'FS' THEN
            tt.TicketTypeName + ' ' + pt.PlanTypeName
        ELSE
            tt.TicketTypeName
    END TicketClass,
    dctm.ClassName,
    dctm.DistStatus,
    dsc.SalesCode,
    dsc.SalesCodeName,
    f.QtySeat,
    f.QtySeatFSE,
    f.TotalRevenue,
    f.TicketRevenue,
    f.PcOther1,
    f.PcOther2,
    f.PcTax,
    f.PcLicenseFee,
    f.Surcharge,
    f.PaidAmount,
    f.OwedAmount,
    f.CompCode,
    f.CompName,
    f.IsComp,
    f.IsHost,
    f.IsPremium,
    f.IsSingleEvent,
    f.IsPlan,
    f.IsPartial,
    f.IsGroup,
    f.IsRenewal,
    f.OrderNum,
    f.OrderLineItem,
    f.OrderLineItemSeq,
    f.RetailTicketType,
    f.RetailQualifiers,
    f.DimSeasonId,
    f.DimCustomerId,
    de.DimEventHeaderId,
    f.DimEventId,
    f.DimItemId,
    f.DimPlanId,
    f.DimPriceCodeId,
    f.DimSeatIdStart,
    f.DimClassTMId
FROM dbo.FactTicketSalesHistory f WITH (NOLOCK)
    LEFT JOIN dbo.DimSeason ds WITH (NOLOCK)
        ON ds.DimSeasonId = f.DimSeasonId
    LEFT JOIN dbo.DimEvent de WITH (NOLOCK)
        ON de.DimEventId = f.DimEventId
    LEFT JOIN dbo.DimPriceCode dpc WITH (NOLOCK)
        ON dpc.DimPriceCodeId = f.DimPriceCodeId
    LEFT JOIN dbo.DimItem di WITH (NOLOCK)
        ON di.DimItemId = f.DimItemId
    LEFT JOIN dbo.DimPlan dpl WITH (NOLOCK)
        ON dpl.DimPlanId = f.DimPlanId
    LEFT JOIN dbo.DimCustomer dc WITH (NOLOCK)
        ON dc.DimCustomerId = f.DimCustomerId
    LEFT JOIN dbo.DimSeat dst WITH (NOLOCK)
        ON dst.DimSeatId = f.DimSeatIdStart
    LEFT JOIN dbo.DimDate dd WITH (NOLOCK)
        ON dd.DimDateId = f.DimDateId
    LEFT JOIN dbo.DimTime dt WITH (NOLOCK)
        ON dt.DimTimeId = f.DimTimeId
    LEFT JOIN dbo.DimClassTM dctm WITH (NOLOCK)
        ON f.DimClassTMId = dctm.DimClassTMId
    LEFT JOIN dbo.DimSalesCode dsc WITH (NOLOCK)
        ON f.DimSalesCodeId = dsc.DimSalesCodeId
    LEFT JOIN dbo.DimPlanType pt WITH (NOLOCK)
        ON pt.DimPlanTypeId = f.DimPlanTypeId
    LEFT JOIN dbo.DimTicketType tt WITH (NOLOCK)
        ON tt.DimTicketTypeId = f.DimTicketTypeId
    LEFT JOIN dbo.DimSeatType dstp WITH (NOLOCK)
        ON dstp.DimSeatTypeId = f.DimSeatTypeId
GO
