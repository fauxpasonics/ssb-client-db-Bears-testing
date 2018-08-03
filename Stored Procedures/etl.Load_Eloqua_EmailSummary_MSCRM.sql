SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [etl].[Load_Eloqua_EmailSummary_MSCRM]
AS

/*========================================================================================================
	Create distinct list of SSB_CRMSYSTEM_CONTACT_IDs and Email Addresses
========================================================================================================*/
IF OBJECT_ID('tempdb..#EmailMatches') IS NOT NULL
    DROP TABLE #EmailMatches
SELECT DISTINCT dc.SSB_CRMSYSTEM_CONTACT_ID, dc.EmailPrimary
INTO #EmailMatches
FROM dbo.vwDimCustomer_ModAcctId dc
WHERE dc.SSB_CRMSYSTEM_CONTACT_ID IS NOT NULL
	AND dc.EmailPrimary IS NOT NULL
	AND dc.EmailPrimary <> ''
	AND dc.EmailPrimaryIsCleanStatus = 'Valid'


/*========================================================================================================
	Map SSBID to mailing summary on email address
========================================================================================================*/
--IF OBJECT_ID('tempdb..#EmailStg') IS NOT NULL
--    DROP TABLE #EmailStg
--SELECT DISTINCT se.ID,
--       se.EmailAddress,
--       se.SendID
--INTO #EmailStg
--FROM ods.Eloqua_Contact se (NOLOCK)
--WHERE se.EventType <> 'Unsubscribe';

IF OBJECT_ID('tempdb..#MappedGUIDs') IS NOT NULL
    DROP TABLE #MappedGUIDs

SELECT mtch.SSB_CRMSYSTEM_CONTACT_ID,
	   es.ContactId AS MemberID,
       es.EmailAddress,
       --eg.Name,
       es.AssetId AS MailingID,
       es.AssetName AS MailingName,
       --es.SubjectLine ,
       es.EmailWebLink AS PublicWebviewURL,
       es.Type AS DeliveryResult,
       MIN(es.CreatedAt) AS MinDeliveryTime,
       COUNT(es.Type) deliverycount,
       --COUNT(eb.Type) bounces,
       COUNT(eo.Type) opencount,
       MIN(eo.CreatedAt) minopentime,
       COUNT(ec.Type) clickcount,
       MIN(ec.CreatedAt) minclicktime
INTO #MappedGUIDS
FROM ods.Eloqua_ActivityEmailSend es
    LEFT JOIN ods.Eloqua_ActivityBounceBack eb
        ON eb.AssetId = es.AssetId
           AND eb.EmailAddress = es.EmailAddress
    LEFT JOIN ods.Eloqua_ActivityEmailClickThrough ec
        ON ec.AssetId = es.AssetId
           AND ec.EmailRecipientId = es.EmailRecipientId
    LEFT JOIN ods.Eloqua_ActivityEmailOpen eo
        ON eo.AssetId = es.AssetId
           AND eo.EmailRecipientId = es.EmailRecipientId
	JOIN #EmailMatches mtch ON mtch.EmailPrimary=es.EmailAddress
GROUP BY mtch.SSB_CRMSYSTEM_CONTACT_ID,
		 es.ContactId,
         es.EmailAddress,
         es.AssetId,
         es.AssetName,
         es.SubjectLine,
         es.EmailWebLink,
         es.Type
ORDER BY es.EmailAddress, mtch.SSB_CRMSYSTEM_CONTACT_ID




/*========================================================================================================
	Merge into 
========================================================================================================*/

BEGIN

	MERGE etl.Eloqua_EmailSummary_MSCRM AS TARGET
	USING
		(
			SELECT SSB_CRMSYSTEM_CONTACT_ID
				, MemberID
				, EmailAddress
				, MailingID
				, MailingName
				, PublicWebviewURL
				, DeliveryResult
				, DeliveryCount
				, MinDeliveryTime
				, OpenCount
				, MinOpenTime
				, ClickCount
				, MinClickTime
			FROM #MappedGUIDs
		) AS SOURCE
	ON (TARGET.SSB_CRMSYSTEM_CONTACT_ID = SOURCE.SSB_CRMSYSTEM_CONTACT_ID
		AND TARGET.MemberID = SOURCE.MemberID
		AND TARGET.EmailAddress = SOURCE.EmailAddress
		AND TARGET.MailingID = SOURCE.MailingID
		AND TARGET.MailingName = SOURCE.MailingName
		AND TARGET.PublicWebviewURL = SOURCE.PublicWebviewURL
		)
	WHEN MATCHED AND (TARGET.DeliveryResult <> SOURCE.DeliveryResult
						OR TARGET.DeliveryCount <> SOURCE.DeliveryCount OR TARGET.MinDeliveryTime <> source.MinDeliveryTime
						OR TARGET.OpenCount <> SOURCE.OpenCount	OR TARGET.MinOpenTime <> SOURCE.MinOpenTime
						OR TARGET.ClickCount <> SOURCE.ClickCount OR TARGET.MinClickTime <> SOURCE.MinClickTime
						)
	THEN
		UPDATE SET
			  TARGET.MailingName = SOURCE.MailingName
			, TARGET.PublicWebviewURL = SOURCE.PublicWebviewURL
			, TARGET.DeliveryResult = SOURCE.DeliveryResult
			, TARGET.DeliveryCount = SOURCE.DeliveryCount
			, TARGET.MinDeliveryTime = SOURCE.MinDeliveryTime
			, TARGET.OpenCount = SOURCE.OpenCount
			, TARGET.MinOpenTime = SOURCE.MinOpenTime
			, TARGET.ClickCount = SOURCE.ClickCount
			, TARGET.MinClickTime = SOURCE.MinClickTime
			, TARGET.ETL_UpdatedDate = GETDATE()
	
	WHEN NOT MATCHED THEN
	INSERT (SSB_CRMSYSTEM_CONTACT_ID, MemberID, EmailAddress, MailingID, MailingName, PublicWebviewURL
			, DeliveryResult, DeliveryCount, MinDeliveryTime, OpenCount, MinOpenTime, ClickCount
			, MinClickTime, ETL_CreatedDate, ETL_UpdatedDate)
	
	VALUES (
		SOURCE.SSB_CRMSYSTEM_CONTACT_ID
		, SOURCE.MemberID
		, SOURCE.EmailAddress
		, SOURCE.MailingID
		, SOURCE.MailingName
		, SOURCE.PublicWebviewURL
		, SOURCE.DeliveryResult
		, SOURCE.DeliveryCount
		, SOURCE.MinDeliveryTime
		, SOURCE.OpenCount
		, SOURCE.MinOpenTime
		, SOURCE.ClickCount
		, SOURCE.MinClickTime
		, GETDATE()
		, GETDATE()
		);

END

GO
