SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [segmentation].[vw__Eloqua_SubscriptionLists]
AS
    SELECT  ssbid.SSB_CRMSYSTEM_CONTACT_ID AS SSB_CRMSYSTEM_CONTACT_ID
          , eg.ContactID AS C_ID
		  , eg.EmailAddress 
		  , eg.Community 
		  , eg.Direct
		  , eg.Exclusives 
		  , eg.PremiumSeating
		  , eg.ProShop
		  , eg.Surveys
		  , eg.Ticket 
		  , eg.Vamos 
    FROM    [Bears].[ro].[vw_Eloqua_EmailGroupMember_Sub_UnSub_PIVOT] eg WITH ( NOLOCK )
    INNER JOIN dbo.dimcustomerssbid ssbid WITH ( NOLOCK ) ON ssbid.SSID = CAST(eg.ContactID AS VARCHAR(200))
    WHERE   ssbid.SSB_CRMSYSTEM_PRIMARY_FLAG = 1;

GO
