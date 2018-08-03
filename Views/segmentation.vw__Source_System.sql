SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE  VIEW  [segmentation].[vw__Source_System] AS (

SELECT  dc.SSB_CRMSYSTEM_CONTACT_ID
		, dc.SourceSystem CustomerSourceSystem

FROM    [dbo].[vwDimCustomer_ModAcctId] dc

WHERE dc.SourceSystem NOT IN ('CRM_Account', 'CRM_Contact', 'Eloqua', 'TM', 'TM-Suites', 'Fanatics', 'FanCentric', 'Eloqua_ContactUs', 'Infogroup')


) 

GO
