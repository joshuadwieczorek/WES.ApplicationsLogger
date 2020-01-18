CREATE PROCEDURE [dbo].[Statuses_Object_Types_Create]
(
		@Name [dbo].[Name_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN
	
	IF(@DateTime IS NULL)
		SELECT @DateTime = GETDATE();

	INSERT INTO [dbo].[Statuses_Object_Types]
	(
			[Object_Type_Name]
		,	[DateTime_Created]
		,	[DateTime_Updated]
	)
	VALUES
	(
			@Name
		,	@DateTime
		,	@DateTime
	);

	EXEC [dbo].[Statuses_Object_Types_Read] @Name;

END