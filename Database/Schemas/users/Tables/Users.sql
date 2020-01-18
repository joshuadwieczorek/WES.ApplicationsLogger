CREATE TABLE [users].[Users]
(
		[ID]					[dbo].[ID_Type]				NOT NULL	IDENTITY(1,1)
	,	[First_Name]			[dbo].[Name_Type]			NOT NULL
	,	[Last_Name]				[dbo].[Name_Type]			NOT NULL
	,	[Email_Address]			[dbo].[EmailAddress_Type]	NOT NULL
	,	[Status]				[dbo].[StatusValue_Type]	NOT NULL	DEFAULT 0
	,	[Created_By]			[dbo].[ID_Type]				NULL
	,	[Updated_By]			[dbo].[ID_Type]				NULL
	,	[DateTime_Created]		[dbo].[DateTime_Type]		NOT NULL	DEFAULT GETDATE()
	,	[DateTime_Updated]		[dbo].[DateTime_Type]		NOT NULL	DEFAULT GETDATE()
	,	CONSTRAINT [PK_Users_Users_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Users_Email_Address] UNIQUE ([Email_Address])
	,	CONSTRAINT [CK_Users_Status_ID] CHECK ([dbo].[fnStatusTypeValueExists]('user', [Status]) = 1)
);