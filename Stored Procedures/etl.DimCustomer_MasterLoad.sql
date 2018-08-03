SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO















CREATE PROCEDURE [etl].[DimCustomer_MasterLoad]
AS
    BEGIN

-- CRM_Account
        EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears',
            @LoadView = '[etl].[vw_Load_DimCustomer_DynamicsAccount]',
            @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- CRM_Contact
        EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears',
            @LoadView = '[etl].[vw_Load_DimCustomer_DynamicsContact]',
            @LogLevel = '0', @DropTemp = '1', @IsDataUploaderSource = '0';

-- TM
        EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears',
            @LoadView = '[etl].[vw_Load_DimCustomer_TM]', @LogLevel = '0',
            @DropTemp = '1', @IsDataUploaderSource = '0';

--Eloqua
        EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears', -- varchar(50)
            @LoadView = '[etl].[vw_Load_DimCustomer_Eloqua]', -- varchar(100)
            @LogLevel = '0', -- varchar(10)
            @DropTemp = '1', -- varchar(10)
            @IsDataUploaderSource = '0'; -- varchar(10)

--Fanatics
		EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears', -- varchar(50)
            @LoadView = '[etl].[vw_Load_DimCustomer_Fanatics]', -- varchar(100)
            @LogLevel = '0', -- varchar(10)
            @DropTemp = '1', -- varchar(10)
            @IsDataUploaderSource = '0'; -- varchar(10)

--FanCentric
		EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears', -- varchar(50)
            @LoadView = '[etl].[vw_Load_DimCustomer_FanCentric]', -- varchar(100)
            @LogLevel = '0', -- varchar(10)
            @DropTemp = '1', -- varchar(10)
            @IsDataUploaderSource = '0'; -- varchar(10)

-- LiveA
		--EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears', -- varchar(50)
  --          @LoadView = '[ods].[vw_LoadDimCustomer_LiveA]', -- varchar(100)
  --          @LogLevel = '0', -- varchar(10)
  --          @DropTemp = '1', -- varchar(10)
  --          @IsDataUploaderSource = '0'; -- varchar(10)

--Infogroup
		--EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears', -- varchar(50)
  --          @LoadView = '[ods].[vw_LoadDimCustomer_Infogroup]', -- varchar(100)
  --          @LogLevel = '0', -- varchar(10)
  --          @DropTemp = '1', -- varchar(10)
  --          @IsDataUploaderSource = '0'; -- varchar(10)
 
 --Eloqua_ContactUs
 		EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears', -- varchar(50)
            @LoadView = '[etl].[vw_Load_DimCustomer_Eloqua_ContactUsForm]', -- varchar(100)
            @LogLevel = '0', -- varchar(10)
            @DropTemp = '1', -- varchar(10)
            @IsDataUploaderSource = '0'; -- varchar(10)

 --Eloqua_TicketRequest
 		EXEC MDM.etl.LoadDimCustomer @ClientDB = 'Bears', -- varchar(50)
            @LoadView = '[etl].[vw_Load_DimCustomer_Eloqua_TicketRequestForm]', -- varchar(100)
            @LogLevel = '0', -- varchar(10)
            @DropTemp = '1', -- varchar(10)
            @IsDataUploaderSource = '0'; -- varchar(10)


	UPDATE dc 
SET dc.LastName = comp.CompanyName
FROM dimcustomer dc 
INNER JOIN dbo.vwDimCustomer_ModAcctId ma ON dc.DimCustomerId = ma.DimCustomerId
LEFT JOIN dbo.vwCompositeRecord_ModAcctID comp ON ma.SSB_CRMSYSTEM_CONTACT_ID = comp.SSB_CRMSYSTEM_CONTACT_ID
 WHERE dc.SourceSystem = 'tm' 
 AND ISNULL(dc.CompanyName,'') != ''
 AND ISNULL(dc.firstname,'') + ISNULL(dc.lastname,'') = '' 
 AND ISNULL(comp.firstname,'') + ISNULL(comp.LastName,'') = ''


    END;

















GO
