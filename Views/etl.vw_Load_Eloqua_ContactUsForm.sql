SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [etl].[vw_Load_Eloqua_ContactUsForm]
AS

SELECT		  PivotTable.ID,
			  PivotTable.ContactId,
			  PivotTable.CreatedAt,
              PivotTable.zipOrPostalCode,
              PivotTable.year,
              PivotTable.submit,
              PivotTable.stateOrProvince,
              PivotTable.singleLineText,
              PivotTable.month,
              PivotTable.lastName,
              PivotTable.firstName,
              PivotTable.emailAddress,
              PivotTable.day,
              PivotTable.contactUsReason,
              PivotTable.comments,
              PivotTable.city,
              PivotTable.birthDate,
              PivotTable.address1
      FROM      ( SELECT    ID
						  , ContactId
                          , LEFT(value, CHARINDEX('=', value) - 1) AS utmColumnName
                          , CASE WHEN RIGHT(value, CHARINDEX('=', REVERSE(value)) - 1) = ' ' THEN NULL ELSE
                           RIGHT(value, CHARINDEX('=', REVERSE(value)) - 1) END AS utmValue
						  , CreatedAt
                  FROM      [ods].[Eloqua_ActivityFormSubmit]
                            CROSS APPLY STRING_SPLIT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(RawData, '%20', ' '), '%40', '@'),
                                                                     '%2F', '/'), '&', '|'),'%3a',':'), '%21','!'),'%27',''''),'%5b','['),'%5d',']'),'%3f','?'),'%0d',''),
																	 '%0a',''),'%26','&'),'%28','('),'%29',')'),'%E2%80%9C','"'),'%E2%80%9D','"'),'%22','"'),'%2B','+'),'%E2%80%99','''')
																	 ,'%24','$'),'%3b',';'),'%E2%80%93','-'),'%23','#'),'%C2%B4',''''),'%09',' '),'%E2%80%A6','...'),'%5f','_'),'%60',''''),'%25','%')
																	 ,'%2a', '*'),'%3e', '>'),'%3c','<'), '|')
                  WHERE AssetName='Contact Us'          
                ) AS SourceTable PIVOT ( MAX(utmValue) FOR utmColumnName IN ([address1],
[birthDate],
[city],
[comments],
[contactUsReason],
[day],
[emailAddress],
[firstName],
[lastName],
[month],
[singleLineText],
[stateOrProvince],
[submit],
[year],
[zipOrPostalCode]
 ) ) AS PivotTable

GO
