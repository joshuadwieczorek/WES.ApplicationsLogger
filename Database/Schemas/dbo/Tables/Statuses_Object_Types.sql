CREATE TABLE [dbo].[Statuses_Object_Types]
(
		[ID]					[dbo].[ID_Type]			NOT NULL	IDENTITY(1,1)
	,	[Object_Type_Name]		[dbo].[Name_Type]		NOT NULL	
	,	[DateTime_Created]		[dbo].[DateTime_Type]	NOT NULL	DEFAULT GETDATE()
	,	[DateTime_Updated]		[dbo].[DateTime_Type]	NOT NULL	DEFAULT GETDATE()
	,	CONSTRAINT [PK_Dbo_Statuses_Object_Types_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Dbo_Statuses_Object_Types_Object_Type_Name] UNIQUE ([Object_Type_Name])
);