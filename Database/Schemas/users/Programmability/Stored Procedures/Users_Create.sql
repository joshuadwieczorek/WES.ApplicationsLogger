CREATE PROCEDURE [users].[Users_Create]
(
		@FirstName [dbo].[Name_Type]
	,	@LastName [dbo].[Name_Type]
	,	@EmailAddress [dbo].[EmailAddress_Type]
	,	@Status [dbo].[StatusValue_Type]
	,	@UserID [dbo].[ID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	IF(@DateTime IS NULL)
		SELECT @DateTime = GETDATE();
	
	INSERT INTO [users].[Users]
	(
			[First_Name]			
		,	[Last_Name]				
		,	[Email_Address]			
		,	[Status]				
		,	[Created_By]			
		,	[Updated_By]			
		,	[DateTime_Created]		
		,	[DateTime_Updated]		
	)
	VALUES
	(
			@FirstName
		,	@LastName
		,	@EmailAddress
		,	@Status
		,	@UserID
		,	@UserID
		,	@DateTime
		,	@DateTime
	);	

	SELECT @UserID = SCOPE_IDENTITY();

	EXEC [users].[Users_Read] @UserID=@UserID;

END