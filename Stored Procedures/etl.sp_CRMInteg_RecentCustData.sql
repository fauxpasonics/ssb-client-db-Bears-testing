SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






/**********************************************
Updated By: Caeleon Work
Updated Date: 05/04/2018
Update Notes: Added STPL Bailout Accounts to Load criteria
Reviewed By: Harry Jordheim
Review Date: 05/04/2018
Review Notes:
*************************************************/
CREATE PROCEDURE [etl].[sp_CRMInteg_RecentCustData]
AS

TRUNCATE TABLE etl.CRMProcess_RecentCustData

DECLARE @Client VARCHAR(50)
SET @Client = 'Bears' --updateme


SELECT x.dimcustomerid, MAX(x.maxtransdate) maxtransdate, x.team
INTO #tmpTicketSales
	FROM (

		SELECT dc.dimcustomerid, MAX(fts.sscreatedDate) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc (NOLOCK)
			INNER JOIN dbo.FactTicketSales fts
				ON dc.DimCustomerId = fts.DimCustomerId AND dc.SourceSystem = 'TM'
		WHERE dc.CustomerType='Primary' AND YEAR(fts.SSCreatedDate)>=YEAR(GETDATE())-3
		GROUP BY dc.dimcustomerid

			UNION
		
		SELECT dc.dimcustomerid, MAX(n.upd_Datetime) maxtransdate, @Client AS team
		FROM dbo.DimCustomer dc
			INNER JOIN ods.TM_Note n
				ON n.acct_id = dc.AccountId
		WHERE dc.CustomerType='Primary' AND CONVERT(DATE,n.upd_Datetime)>= GETDATE()-365
		GROUP BY dc.DimCustomerId

			UNION

		SELECT dc.DimCustomerId, MAX(eloq.createdat) maxtransdate, @Client AS Team
		FROM ods.Eloqua_ActivityFormSubmit eloq
			INNER JOIN dbo.DimCustomer dc WITH (NOLOCK) ON eloq.ContactId = dc.SSID AND dc.SourceSystem = 'eloqua'
		WHERE CONVERT(DATE,eloq.CreatedAt)>= GETDATE()-365
		GROUP BY dc.DimCustomerId

			UNION

		SELECT dc.DimCustomerId, MAX(eloq.createdat) maxtransdate, @Client AS Team
		FROM ods.Eloqua_ActivityEmailSend eloq
			INNER JOIN dbo.DimCustomer dc WITH (NOLOCK) ON eloq.ContactId = dc.SSID AND dc.SourceSystem = 'eloqua'
		WHERE CONVERT(DATE,eloq.CreatedAt)>= GETDATE()-365
		GROUP BY dc.DimCustomerId
		
			UNION

		SELECT dc.DimCustomerId, MAX(eloq.createdat) maxtransdate, @Client AS Team
		FROM ods.Eloqua_ActivityPageView eloq
			INNER JOIN dbo.DimCustomer dc WITH (NOLOCK) ON eloq.ContactId = dc.SSID AND dc.SourceSystem = 'eloqua'
		WHERE CONVERT(DATE,eloq.CreatedAt)>= GETDATE()-365
		GROUP BY dc.DimCustomerId

			UNION

		SELECT dc.DimCustomerId, MAX(eloq.createdat) maxtransdate, @Client AS Team
		FROM ods.Eloqua_ActivityWebVisit eloq
			INNER JOIN dbo.DimCustomer dc WITH (NOLOCK) ON eloq.ContactId = dc.SSID AND dc.SourceSystem = 'eloqua'
		WHERE CONVERT(DATE,eloq.CreatedAt)>= GETDATE()-365
		GROUP BY dc.DimCustomerId

			UNION

		SELECT dc.DimCustomerId, MAX(dc.SSCreatedDate) maxtransdate, @Client AS Team 
		FROM bears.etl.TM_ActiveAccountList tmal
		INNER JOIN dbo.DimCustomer dc ON dc.AccountId = tmal.acct_id
		WHERE sourcetable = 'RawFile__bear2015FULLTKTF'
		OR sourcetable = 'RawFile__bear2016FULLTKTF'
		GROUP BY dc.DimCustomerId

			UNION
		SELECT dc.DimCustomerId, MAX(fo.OrderDate) maxtransdate, @Client AS Team
		FROM ods.Fanatics_Orders fo 
		INNER JOIN dbo.DimCustomer dc ON dc.SSID=fo.Client_ID AND dc.SourceSystem='Fanatics'
		WHERE YEAR(fo.OrderDate)>=YEAR(GETDATE())-3
		GROUP BY dc.DimCustomerId

			UNION
		SELECT dc.DimCustomerId, MAX(ecf.CreatedAt) maxtransdate, @Client AS Team
		FROM src.vw_Eloqua_ContactUsForm_Contacts ecf
		INNER JOIN dbo.DimCustomer dc ON dc.SSID=ecf.ssid AND dc.SourceSystem='Eloqua_ContactUs'
		GROUP BY dc.DimCustomerId

			UNION
		SELECT dc.DimCustomerId, MAX(udc.RecordCreateDate) maxtransdate, @Client AS Team FROM api.UploadDimCustomerStaging udc
		INNER JOIN dbo.DimCustomer dc ON dc.SSID = udc.SSID AND dc.SourceSystem = udc.SourceSystem
		--WHERE DATEDIFF(DAY,udc.RecordCreateDate,GETDATE())<=-3
		GROUP BY dc.DimCustomerId

			UNION
		SELECT dc.DimCustomerId, MAX(ecf.CreatedAt) maxtransdate, @Client AS Team
		FROM src.vw_Eloqua_TicketRequestForm_Contacts ecf
		INNER JOIN dbo.DimCustomer dc ON dc.SSID=ecf.ssid AND dc.SourceSystem='Eloqua_TicketRequest'
		GROUP BY dc.DimCustomerId

		--STPL Bailout Accounts
			UNION
        SELECT dc.DimCustomerId, MAX(dc.SSCreatedDate), @Client AS Team 
		FROM dbo.DimCustomer dc (NOLOCK)
		WHERE dc.SSCreatedBy = 'INET02' AND dc.CustomerType = 'Primary'
		GROUP BY dc.DimCustomerId

		--Experience Rewards
		) x
		GROUP BY x.dimcustomerid, x.team



INSERT INTO etl.CRMProcess_RecentCustData (SSID, MaxTransDate, Team)
SELECT SSID, [MaxTransDate], Team FROM [#tmpTicketSales] a 
INNER JOIN dbo.[vwDimCustomer_ModAcctId] b ON [b].[DimCustomerId] = [a].[DimCustomerId]


GO
