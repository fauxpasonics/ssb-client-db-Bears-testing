SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROC [etl].[sp_Load_Eloqua_ContactUsForm]
AS
MERGE ods.Eloqua_ContactUsForm AS target
USING
(SELECT * FROM etl.vw_Load_Eloqua_ContactUsForm) AS source
ON (target.ID = source.ID)
WHEN MATCHED THEN
    UPDATE SET target.ETL__UpdatedDate = GETDATE(),
			   target.ContactId = source.ContactId,
			   target.year = source.year,
			   target.month = source.month,
			   target.day = source.day,
			   target.address1 = source.address1,
			   target.city = source.city,
			   target.stateOrProvince = source.stateOrProvince,
			   target.zipOrPostalCode = source.zipOrPostalCode,
			   target.lastName = source.lastName,
			   target.firstName = source.firstName,
			   target.singleLineText = source.singleLineText,
               target.emailAddress = source.emailAddress,
               target.comments = source.comments,
			   target.CreatedAt = source.CreatedAt
WHEN NOT MATCHED BY TARGET THEN
    INSERT
    (
        ETL__CreatedDate,
        ETL__UpdatedDate,
        ID,
        ContactId,
        CreatedAt,
        year,
        month,
        day,
        lastName,
        firstName,
        emailAddress,
        address1,
        city,
        stateOrProvince,
        zipOrPostalCode,
        singleLineText,
        contactUsReason,
        comments,
        birthDate,
        submit
    )
    VALUES
    (GETDATE(),
     GETDATE(),
     source.ID,
     source.ContactId,
     source.CreatedAt,
     source.year,
     source.month,
     source.day,
     source.lastName,
     source.firstName,
     source.emailAddress,
     source.address1,
     source.city,
     source.stateOrProvince,
     source.zipOrPostalCode,
     source.singleLineText,
     source.contactUsReason,
     source.comments,
     source.birthDate,
     source.submit
    );
GO
