CREATE TABLE [dbo].[Database_Version_Log]
(
		[ID]					[dbo].[ID_Type]			NOT NULL	IDENTITY(1,1)
	,	[Version]				[dbo].[Version_Type]	NOT NULL
	,	[Description]			[dbo].[Description_Type] NULL
	,	[DateTime_Applied]		[dbo].[DateTime_Type]	NOT NULL	DEFAULT GETDATE()
	,	CONSTRAINT [PK_Dbo_Database_Version_Log_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Dbo_Database_Version_Log_Version] UNIQUE ([Version])
);