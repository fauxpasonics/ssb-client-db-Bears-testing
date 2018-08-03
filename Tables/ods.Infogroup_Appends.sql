CREATE TABLE [ods].[Infogroup_Appends]
(
[CompanyName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Line1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address_Line2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZIP] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneDay] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneEve] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSTSTEM_CONTACT_ID] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceSystem] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Match_Pass] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sequence_Number] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_ADDRESS_SOURCE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_ADDRESS_STATUS] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_PANDER_CODE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_LOCAL_ADDRESS] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_UNIT_INFORMATION] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_SECONDARY_ADDRESS] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_LONG_CITY_NAME] [varchar] (28) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_SHORT_CITY_NAME] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_STATE_ABBREVIATION] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_ZIP_CODE] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_ZIP4_CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_RESERVED_1] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_MAILABILITY_SCORE] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_RESERVED_2] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_MILITARY_ZIP_CODE] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_OPAC_INDICATOR] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_NDI_AFFIRMED_APT] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_SECONDARY_INDICATOR] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_STATE_CODE] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_COUNTY_CODE] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_LONG_CITY_INDICATOR] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_CARRIER_ROUTE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_LOT_NUMBER] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_LOT_SORTATION_NUMBER] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_PRESTIGE_CITY] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AH1_DELIVERY_POINT] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Match_Level] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Match_Score] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ABI_Number] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Record_Type_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Household_Id] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Selected_Individual_ID] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_Manager] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Company_Name] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_Address] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_City_Name] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_State_Abbreviation] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_ZIP_Code] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_ZIP4_Code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_ZIP_Code_Plus_4] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_Carrier_Route_Code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_State_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_County_Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_County_Description] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_MSA_Code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_MSA_Description] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_CBSA_Code] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_CBSA_Description] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Metro_Micro_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_CSA_Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_CSA_Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Census_Tract] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Block_Group] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_FILLER_SIZE_11] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_FILLER_SIZE_10] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Geo_Match_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_Address] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_City_Name] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_State_Abbreviation] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_State_Code] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_ZIP_Code] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_ZIP4_Code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_ZIP_Plus_Four_Code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_Carrier_Route_Code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Telephone_NumberF1] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Fax_NumberF1] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Toll_Free_NumberF1] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Web_Address_URL] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Selected_SIC_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Selected_SIC_Description] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Code1] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Description1] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Code2] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Description2] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Code3] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Description3] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Code4] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Description4] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Code5] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Description5] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Code6] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Franchise_Specialty_Description6] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_True_Franchise_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Industry_Specific_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Industry_Specific_Description] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_SIC_Code] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Primary_SIC_Description] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Code_1] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Description_1] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Code_2] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Description_2] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Code_3] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Description_3] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Code_4] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Secondary_SIC_Description_4] [varchar] (45) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_NAICS_Code8] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_NAICS_Description] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Location_Employment_Size_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Location_Employment_Size_Description] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Actual_Location_Employment_Size5] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Corporate_Employment_Size_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Corporate_Employment_Size_Description] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Actual_Corporate_Employment_Size] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Modeled_Employment_Size_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Location_Sales_Volume_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Location_Sales_Volume_Description] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Actual_Location_Sales_Volume] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Corporate_Sales_Volume_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Corporate_Sales_Volume_Description] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Actual_Corporate_Sales_Volume] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Asset_Size_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_Last_Name] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_First_Name] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_Salutation] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_Gender_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_Professional_Title_Code] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_Title_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Contact_Title_Description] [varchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Filler_Ethnicity_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Filler_Ethnicity_Description] [varchar] (23) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Key_Code20] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Title_Address] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_ABI_Number] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_infoUSA_Subsidiary_ID] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_infoUSA_Parent_ID] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Site_Number] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Business_Status_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Business_Status_Description] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Public_Private_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Stock_Exchange_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Stock_Exchange_Description] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Ticker_Symbol] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Public_Filing_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Fortune_Magazine_Ranking] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Individual_Firm_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Individual_Firm_Description] [varchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Year_SIC_Added_to_Record] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Year_First_Appeared_in_Yellow_Pages] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Year_Established] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Yellow_Page_Code] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Transaction_Date] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Transaction_Type] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tele_Research_Date] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Call_Status_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Call_Status_Description] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Business_Credit_Score_Code2] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Business_Credit_Score_Description] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Business_Credit_Score] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Ad_Size_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Ad_Size_Description] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Office_Size_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Office_Size_Description] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Population_Size_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Population_Size_Description] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Work_At_Home_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Own_Lease_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Square_Footage8] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Square_Footage_Description] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Radial_Distance_From_Target_Element] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Actual_Num_Bus_at_Multi_Tenant_Location] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Multi_Tenant_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Multi_Tenant_Description] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Building_Number_of_Multi_Tenant_Location] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Number_of_Personal_Computers_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Number_of_Personal_Computers_Description] [varchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Affluent_Neighborhood_Location_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Big_Business_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Female_Business_Exec_Owner_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Growing_Shrinking_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_High_Income_Executive_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_High_Tech_Business_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Medium_Business_Entrepreneur_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Small_Business_Entrepreneur_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Delivery_Point_Bar_Code] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Presort_Endorsement_Line] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Presort_Bag_Number] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Presort_Bundle_Number] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Presort_Line_of_Travel] [varchar] (7) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tertiary_Address] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tertiary_City_Name] [varchar] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tertiary_State_Abbreviation] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tertiary_ZIP_Code] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tertiary_ZIP4_Code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tertiary_ZIP_Plus_Four_Code] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Tertiary_Carrier_Route_Code] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_White_Collar_Percentage_Formatted] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_White_Collar_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Production_Date] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Presort_Sequence_Number] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Obsolescence_Date] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Production_Date_Formatted] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Source] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Book_Number] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Government_Segment_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Foreign_Parent_Indicator] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_Import_Export_Code] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BE_1849_Record_Marker] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ETL__LoadDate] [datetime2] NULL CONSTRAINT [DF__Infogroup__ETL____49FB62E6] DEFAULT (getdate()),
[ETL__UpdatedDate] [datetime2] NULL,
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
