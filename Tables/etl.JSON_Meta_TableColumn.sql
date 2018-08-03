CREATE TABLE [etl].[JSON_Meta_TableColumn]
(
[JSON_Meta_TableColumn_ID] [int] NOT NULL IDENTITY(1, 1),
[JSON_Meta_Table_ID] [int] NOT NULL,
[Level] [int] NOT NULL,
[Grouping] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HierarchyName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Order] [bigint] NULL,
[DataType] [varchar] (14) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Unpivot] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Active] [bit] NOT NULL CONSTRAINT [DF__JSON_Meta__Activ__1F54F4B6] DEFAULT ((0)),
[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF__JSON_Meta__Creat__204918EF] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[CreatedBy] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__JSON_Meta__Creat__213D3D28] DEFAULT (suser_sname()),
[LastUpdatedOn] [datetime] NOT NULL CONSTRAINT [DF__JSON_Meta__LastU__22316161] DEFAULT ([etl].[ConvertToLocalTime](CONVERT([datetime2](0),getdate(),(0)))),
[LastUpdatedBy] [nvarchar] (400) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__JSON_Meta__LastU__2325859A] DEFAULT (suser_sname()),
[Name_raw] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [etl].[JSON_Meta_TableColumn] ADD CONSTRAINT [PK__JSON_Met__AC7F85BD60E6A589] PRIMARY KEY CLUSTERED  ([JSON_Meta_Table_ID], [Level], [HierarchyName])
GO
GRANT DELETE ON  [etl].[JSON_Meta_TableColumn] TO [db_SSB_IE_Permitted]
GO
GRANT INSERT ON  [etl].[JSON_Meta_TableColumn] TO [db_SSB_IE_Permitted]
GO
GRANT UPDATE ON  [etl].[JSON_Meta_TableColumn] TO [db_SSB_IE_Permitted]
GO
