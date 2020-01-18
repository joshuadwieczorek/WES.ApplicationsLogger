CREATE PROCEDURE [users].[Users_Read]
(
		@UserID [dbo].[ID_Type] = NULL
	,	@EmailAddress [dbo].[EmailAddress_Type] = NULL
	,	@Status [dbo].[StatusValue_Type] = NULL
)
AS
BEGIN

	SELECT	[ID]					
		,	[First_Name]			
		,	[Last_Name]				
		,	[Email_Address]			
		,	[Status]				
		,	[Created_By]			
		,	[Updated_By]			
		,	[DateTime_Created]		
		,	[DateTime_Updated]		
	FROM	[users].[Users] (NOLOCK)
	WHERE	(
				@UserID IS NULL
				AND 
				@EmailAddress IS NULL
				AND
				@Status IS NULL
			)
		OR	(
				[ID] = @UserID
				AND
				@EmailAddress IS NULL
				AND
				@Status IS NULL
			)
		OR	(
				@UserID IS NULL
				AND
				[Email_Address] = @EmailAddress
				AND
				@Status IS NULL
			)
		OR	(
				@UserID IS NULL
				AND
				@EmailAddress IS NULL
				AND
				[Status] = @Status
			)
	ORDER BY [ID];

END