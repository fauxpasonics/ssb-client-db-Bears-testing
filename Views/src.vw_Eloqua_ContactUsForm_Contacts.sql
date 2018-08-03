SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [src].[vw_Eloqua_ContactUsForm_Contacts]
AS 
SELECT CAST(ContactId AS VARCHAR(50))+'-'+CAST(id AS VARCHAR(50)) AS SSID, ContactId , firstName, lastName, emailAddress, address1, city, stateOrProvince, zipOrPostalCode, CONCAT(month,'/',day,'/',Year) AS birthdate,
CreatedAt   
FROM ods.Eloqua_ContactUsForm (NOLOCK)
WHERE 1=1
AND ISNULL(ContactId,'')!=''
--AND CreatedAt>=DATEADD(DAY,-3, GETDATE())
--GROUP BY CONCAT(month, '/', day, '/', Year),
--         ContactId,
--         firstName,
--         lastName,
--         emailAddress,
--         address1,
--         city,
--         stateOrProvince,
--         zipOrPostalCode,
--		 CreatedAt
UNION
SELECT CONCAT('N-',id) AS SSID, ContactId , firstName, lastName, emailAddress, address1, city, stateOrProvince, zipOrPostalCode, CONCAT(month,'/',day,'/',Year) AS birthdate   
, CreatedAt
FROM ods.Eloqua_ContactUsForm (NOLOCK)
WHERE 1=1
AND ISNULL(ContactId,'')=''
AND ISNULL(firstName,'')!='' AND ISNULL(lastName,'')!='' AND ISNULL(emailAddress,'')!=''
--AND CreatedAt>=DATEADD(DAY,-3, GETDATE())
--GROUP BY CONCAT(month, '/', day, '/', Year),
--         ContactId,
--         firstName,
--         lastName,
--         emailAddress,
--         address1,
--         city,
--         stateOrProvince,
--         zipOrPostalCode,
--		 CreatedAt



GO
