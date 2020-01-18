CREATE TABLE [dbo].[Statuses]
(
		[ID]					[dbo].[ID_Type]			NOT NULL	IDENTITY(1,1)
	,	[Status_Object_Type_ID]	[dbo].[ID_Type]			NOT NULL
	,	[Status_Name]			[dbo].[Name_Type]		NOT NULL
	,	[Status_Value]			SMALLINT				NOT NULL
	,	[Status_Description]	[dbo].[Description_Type] NULL
	,	[DateTime_Created]		[dbo].[DateTime_Type]	NOT NULL	DEFAULT GETDATE()
	,	[DateTime_Updated]		[dbo].[DateTime_Type]	NOT NULL	DEFAULT GETDATE()
	,	CONSTRAINT [PK_Dbo_Statuses_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Dbo_Statuses_Status_Object_Type_ID_Status_Name_Status_Value] UNIQUE ([Status_Object_Type_ID], [Status_Name], [Status_Value])
	,	CONSTRAINT [FK_Dbo_Statuses_Status_Object_Type_ID] FOREIGN KEY ([Status_Object_Type_ID]) REFERENCES [dbo].[Statuses_Object_Types]([ID])
);