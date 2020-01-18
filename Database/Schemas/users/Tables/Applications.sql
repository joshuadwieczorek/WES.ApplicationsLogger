CREATE TABLE [users].[Applications]
(
		[ID]					[dbo].[ID_Type]				NOT NULL	IDENTITY(1,1)
	,	[User_ID]				[dbo].[ID_Type]				NOT NULL
	,	[Application_Name]		[dbo].[Name_Type]			NOT NULL
	,	[Status]				[dbo].[StatusValue_Type]	NOT NULL	DEFAULT 0
	,	[Created_By]			[dbo].[ID_Type]				NULL
	,	[Updated_By]			[dbo].[ID_Type]				NULL
	,	[DateTime_Created]		[dbo].[DateTime_Type]		NOT NULL	DEFAULT GETDATE()
	,	[DateTime_Updated]		[dbo].[DateTime_Type]		NOT NULL	DEFAULT GETDATE()
	,	CONSTRAINT [PK_Users_Applications_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Users_Applications_User_ID_Application_Name] UNIQUE ([User_ID], [Application_Name])
	,	CONSTRAINT [FK_Users_Applications_User_ID] FOREIGN KEY ([User_ID]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Applications_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Applications_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [CK_Users_Applications_Status_ID] CHECK ([dbo].[fnStatusTypeValueExists]('user.application', [Status]) = 1)
);