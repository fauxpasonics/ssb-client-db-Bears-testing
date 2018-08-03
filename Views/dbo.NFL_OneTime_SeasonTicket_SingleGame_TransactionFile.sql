SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[NFL_OneTime_SeasonTicket_SingleGame_TransactionFile]
AS 
SELECT CASE
           WHEN DB_NAME() = 'Bears' THEN
               'BE'
           WHEN DB_NAME() = 'Broncos' THEN
               'BO'
           WHEN DB_NAME() = 'Buccaneers' THEN
               'BC'
           WHEN DB_NAME() = 'Chargers' THEN
               'CH'
           WHEN DB_NAME() = 'Chiefs' THEN
               'CF'
           WHEN DB_NAME() = 'Colts' THEN
               'CT'
           WHEN DB_NAME() = 'Cowboys' THEN
               'CB'
           WHEN DB_NAME() = 'Dolphins' THEN
               'DO'
           WHEN DB_NAME() = 'Falcons' THEN
               'FA'
           WHEN DB_NAME() = 'Jaguars' THEN
               'JA'
           WHEN DB_NAME() = 'Jets' THEN
               'JE'
           WHEN DB_NAME() = 'Lions' THEN
               'LI'
           WHEN DB_NAME() = 'Panthers' THEN
               'CP'
           WHEN DB_NAME() = 'Raiders' THEN
               'RA'
           WHEN DB_NAME() = 'Rams' THEN
               'RM'
           WHEN DB_NAME() = 'Redskins' THEN
               'RS'
           WHEN DB_NAME() = 'Saints' THEN
               'SA'
           WHEN DB_NAME() = 'Seahawks' THEN
               'SE'
           WHEN DB_NAME() = 'Steelers' THEN
               'ST'
           WHEN DB_NAME() = 'Titans' THEN
               'TT'
           WHEN DB_NAME() = 'Vikings' THEN
               'VI'
           ELSE
               '??'
       END AS nfl_team_code,
       CAST(fts.SSID_acct_id AS NVARCHAR(25)) + ':' + CAST(fts.SSID_event_id AS NVARCHAR(25)) + ':'
       + CAST(fts.SSID_section_id AS NVARCHAR(25)) + ':' + CAST(fts.SSID_row_id AS NVARCHAR(25)) + ':'
       + CAST(fts.SSID_seat_num AS NVARCHAR(25)) + ':' + CAST(fts.QtySeat AS NVARCHAR(25)) AS ticket_orders_id,
       dc.SSID AS ticket_customers_id,
	   DB_NAME() AS Club,
	   de.EventName AS Opponent,
	   dd.CalDate AS DateStamp,
	   ds.SeasonYear AS Season,
	CASE WHEN (ISNULL(dpc.PC2,'') = ''
OR		(ISNULL(dpc.PC2,'') LIKE '[0-9]' AND ISNULL(dpc.PC3,'')='' )
OR		(ISNULL(dpc.PC2,'') IN ('I','O','W') AND ISNULL(dpc.PC3,'')='')
OR		(ISNULL(dpc.PC3,'') IN ('I','O','W') AND ISNULL(dpc.PC4,'')='')) THEN 1
        ELSE
            0
    END AS SeasonTicketFlag, -- Update Season Ticket Holder Logic for your team here
    CASE
        WHEN
((ISNULL(dpc.PC2,'') <> '' AND ISNULL(dpc.PC2,'') NOT IN ('I','O','W') AND ISNULL(dpc.pc2,'') NOT LIKE '[0-9]')
OR		(ISNULL(dpc.PC2,'') LIKE '[0-9]' AND ISNULL(dpc.PC3,'')<>'' )AND ISNULL( dpc.PC3, '' ) NOT IN ( 'I', 'O', 'W' )) THEN 
            1
        ELSE
            0
    END  AS SingleGameFlag, -- Update Single Game Buyer Logic for your team here
	   fts.QtySeat,
	   fts.TotalRevenue
FROM dbo.FactTicketSales fts (NOLOCK)
JOIN dbo.DimCustomer dc ON dc.DimCustomerId = fts.DimCustomerId
JOIN dbo.DimDate dd ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.DimSeasonId
JOIN dbo.DimPlan dp ON dp.DimPlanId = fts.DimPlanId
JOIN  dbo.DimEvent de ON de.DimEventId = fts.DimEventId
JOIN dbo.DimPriceCode dpc ON dpc.DimPriceCodeId = fts.DimPriceCodeId
WHERE (ds.SeasonName LIKE '%Soldier Field' OR ds.SeasonName LIKE '%Playoffs' OR ds.SeasonName LIKE '%Skyline%' OR ds.SeasonName LIKE '%Suite%')
AND ISNULL(de.EventName,'') NOT LIKE '%Family%' -- Update Season Logic here
UNION
SELECT CASE
           WHEN DB_NAME() = 'Bears' THEN
               'BE'
           WHEN DB_NAME() = 'Broncos' THEN
               'BO'
           WHEN DB_NAME() = 'Buccaneers' THEN
               'BC'
           WHEN DB_NAME() = 'Chargers' THEN
               'CH'
           WHEN DB_NAME() = 'Chiefs' THEN
               'CF'
           WHEN DB_NAME() = 'Colts' THEN
               'CT'
           WHEN DB_NAME() = 'Cowboys' THEN
               'CB'
           WHEN DB_NAME() = 'Dolphins' THEN
               'DO'
           WHEN DB_NAME() = 'Falcons' THEN
               'FA'
           WHEN DB_NAME() = 'Jaguars' THEN
               'JA'
           WHEN DB_NAME() = 'Jets' THEN
               'JE'
           WHEN DB_NAME() = 'Lions' THEN
               'LI'
           WHEN DB_NAME() = 'Panthers' THEN
               'CP'
           WHEN DB_NAME() = 'Raiders' THEN
               'RA'
           WHEN DB_NAME() = 'Rams' THEN
               'RM'
           WHEN DB_NAME() = 'Redskins' THEN
               'RS'
           WHEN DB_NAME() = 'Saints' THEN
               'SA'
           WHEN DB_NAME() = 'Seahawks' THEN
               'SE'
           WHEN DB_NAME() = 'Steelers' THEN
               'ST'
           WHEN DB_NAME() = 'Titans' THEN
               'TT'
           WHEN DB_NAME() = 'Vikings' THEN
               'VI'
           ELSE
               '??'
       END AS nfl_team_code,
       CAST(fts.SSID_acct_id AS NVARCHAR(25)) + ':' + CAST(fts.SSID_event_id AS NVARCHAR(25)) + ':'
       + CAST(fts.SSID_section_id AS NVARCHAR(25)) + ':' + CAST(fts.SSID_row_id AS NVARCHAR(25)) + ':'
       + CAST(fts.SSID_seat_num AS NVARCHAR(25)) + ':' + CAST(fts.QtySeat AS NVARCHAR(25)) AS ticket_orders_id,
       dc.SSID AS ticket_customers_id,
	   DB_NAME() AS Club,
	   de.EventName AS Opponent,
	   dd.CalDate AS DateStamp,
	   ds.SeasonYear AS Season,
	CASE WHEN (ISNULL(dpc.PC2,'') = ''
OR		(ISNULL(dpc.PC2,'') LIKE '[0-9]' AND ISNULL(dpc.PC3,'')='' )
OR		(ISNULL(dpc.PC2,'') IN ('I','O','W') AND ISNULL(dpc.PC3,'')='')
OR		(ISNULL(dpc.PC3,'') IN ('I','O','W') AND ISNULL(dpc.PC4,'')='')) THEN 1
        ELSE
            0
    END AS SeasonTicketFlag, -- Update Season Ticket Holder Logic for your team here
    CASE
        WHEN
((ISNULL(dpc.PC2,'') <> '' AND ISNULL(dpc.PC2,'') NOT IN ('I','O','W') AND ISNULL(dpc.pc2,'') NOT LIKE '[0-9]')
OR		(ISNULL(dpc.PC2,'') LIKE '[0-9]' AND ISNULL(dpc.PC3,'')<>'' ) AND ISNULL( dpc.PC3, '' ) NOT IN ( 'I', 'O', 'W' )) THEN 
            1
        ELSE
            0
    END  AS SingleGameFlag, -- Update Single Game Buyer Logic for your team here
	   fts.QtySeat,
	   fts.TotalRevenue
FROM dbo.FactTicketSalesHistory fts (NOLOCK)
JOIN dbo.DimCustomer dc ON dc.DimCustomerId = fts.DimCustomerId
JOIN dbo.DimDate dd ON dd.DimDateId = fts.DimDateId
JOIN dbo.DimSeason ds ON fts.DimSeasonId = ds.DimSeasonId
JOIN dbo.DimPlan dp ON dp.DimPlanId = fts.DimPlanId
JOIN  dbo.DimEvent de ON de.DimEventId = fts.DimEventId
JOIN dbo.DimPriceCode dpc ON dpc.DimPriceCodeId = fts.DimPriceCodeId
WHERE (ds.SeasonName LIKE '%Soldier Field' OR ds.SeasonName LIKE '%Playoffs' OR ds.SeasonName LIKE '%Skyline%' OR ds.SeasonName LIKE '%Suite%')
 AND ISNULL(de.EventName,'') NOT LIKE '%Family%'
GO
