CREATE TABLE [users].[Applications_Keys]
(
		[ID]					[dbo].[ID_Type]				NOT NULL	IDENTITY(1,1)
	,	[Application_ID]		[dbo].[ID_Type]				NOT NULL
	,	[Key_Value]				UNIQUEIDENTIFIER			NOT NULL
	,	[Status]				[dbo].[StatusValue_Type]	NOT NULL	DEFAULT 0
	,	[Created_By]			[dbo].[ID_Type]				NULL
	,	[Updated_By]			[dbo].[ID_Type]				NULL
	,	[DateTime_Created]		[dbo].[DateTime_Type]		NOT NULL	DEFAULT GETDATE()
	,	[DateTime_Updated]		[dbo].[DateTime_Type]		NOT NULL	DEFAULT GETDATE()
	,	CONSTRAINT [PK_Users_Applications_Keys_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [FK_Users_Applications_Keys_Application_ID] FOREIGN KEY ([Application_ID]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Applications_Keys_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Applications_Keys_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [CK_Users_Applications_Keys_Status_ID] CHECK ([dbo].[fnStatusTypeValueExists]('user.application.key', [Status]) = 1)
);