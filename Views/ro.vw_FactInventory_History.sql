SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [ro].[vw_FactInventory_History] AS (SELECT * FROM dbo.FactInventoryHistory (NOLOCK))

GO
