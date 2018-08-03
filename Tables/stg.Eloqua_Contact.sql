CREATE TABLE [stg].[Eloqua_Contact]
(
[ETL_ID] [int] NOT NULL IDENTITY(1, 1),
[ETL_CreatedDate] [datetime] NOT NULL CONSTRAINT [DF__Eloqua_Co__ETL_C__2F8501C7] DEFAULT (getdate()),
[ID] [int] NOT NULL,
[Name] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BouncebackDate] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsBounceback] [bit] NULL,
[IsSubscribed] [bit] NULL,
[PostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Province] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriptionDate] [datetime] NULL,
[UnsubscriptionDate] [datetime] NULL,
[CreatedAt] [datetime] NULL,
[CreatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccessedAt] [datetime] NULL,
[CurrentStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Depth] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UpdatedAt] [datetime] NULL,
[UpdatedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailAddress] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Company] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BusinessPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalesPerson] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_EmailDisplayName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_State_Prov] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Zip_Postal] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Salutation] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCContactID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCLeadID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_DateCreated] [date] NULL,
[C_DateModified] [date] NULL,
[ContactIDExt] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCAccountID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_LastModifiedByExtIntegrateSystem] [date] NULL,
[C_SFDCLastCampaignID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDCLastCampaignStatus] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Company_Revenue1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SFDC_EmailOptOut1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Source___Most_Recent1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Source___Original1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Industry1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Annual_Revenue1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Status1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Job_Role1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_LS___High_Value_Website_Content1] [numeric] (38, 6) NULL,
[C_Lead_Score_Date___Most_Recent1] [date] NULL,
[C_Integrated_Marketing_and_Sales_Funnel_Stage] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Product_Solution_of_Interest1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Region1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_elqPURLName1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Rating___Combined1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_EmailAddressDomain] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_FirstAndLastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Company_Size1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Score___Last_High_Touch_Event_Date1] [date] NULL,
[C_Lead_Rating___Explicit1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Rating___Implicit1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Score___Explicit1] [numeric] (38, 6) NULL,
[C_Lead_Score___Implicit1] [numeric] (38, 6) NULL,
[C_Lead_Score_Date___Profile___Most_Recent1] [date] NULL,
[C_Employees1] [numeric] (38, 6) NULL,
[C_Territory] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Lead_Score] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_ElqPURLName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Birthdate1] [date] NULL,
[C_Favorite_Player1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Contact_Us___Reason1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Gender1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Global_Unsubscribe1] [numeric] (38, 6) NULL,
[C_Birthdate_Code1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_State_Normalization1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Vamos_Bears1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Mobile_Field___Normalize1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_First_Name___Normalize1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Last_Name___Normalize1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Email_Address___Normalize1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Country___Normalize1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Name_Analyzer___Validation_Results1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Name_Analyzer___Gender_Results1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Business_Phone_Normalize1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_75_Mile_Radius1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_75_Mile_Radius___Halas_Hall1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_75_Mile_Radius___Training_Camp1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Email_Sign_Up1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Promo_Code1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Preference_Center_Last_Updated1] [date] NULL,
[C_Test_Email_Sign_Up1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_STH_Account_Number1] [numeric] (38, 6) NULL,
[C_MD5HashedEmailAddress] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SHA256HashedEmailAddress] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MD5HashedBusPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SHA256HashedBusPhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_MD5HashedMobilePhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SHA256HashedMobilePhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Kids_Club_Member1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Kids_Club___Birthday_Code1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_STH_Presale1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_STH_Presale_Ticket_Limit1] [numeric] (38, 6) NULL,
[C_Birthday_Month1] [numeric] (38, 6) NULL,
[C_Birthday_Date1] [numeric] (38, 6) NULL,
[C_Birthday_Year1] [numeric] (38, 6) NULL,
[C_Birthday_Year_21] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Birthday_Month_21] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Birthdate_C1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Birthdate_041] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Birthdate_051] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SP___Email_Verification_Results1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_SP___Updated_Email1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Sideline_Club_Seats1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Touchdown_Club_Seats1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_United_Club_PSL_Seats1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Program_Entry___Unreachables_Unsubscribe1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Program_Entry___Unreachables_Hard_Bouncebac] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Interest_in_Single_Game_Tickets1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Interest_in_Priority_List1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Interest_in_Group_Tickets1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[C_Interest_in_Season_Tickets1] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [stg].[Eloqua_Contact] ADD CONSTRAINT [PK__Eloqua_C__3214EC276D8333C8] PRIMARY KEY CLUSTERED  ([ID])
GO
