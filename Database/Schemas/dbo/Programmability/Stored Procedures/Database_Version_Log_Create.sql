CREATE PROCEDURE [dbo].[Database_Version_Log_Create]
(
		@Version [dbo].[Version_Type]
	,	@Description [dbo].[Description_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	IF(@DateTime IS NULL)
		SELECT @DateTime = GETDATE();

	INSERT INTO [dbo].[Database_Version_Log]
	(
			[Version]				
		,	[Description]
		,	[DateTime_Applied]
	)
	VALUES
	(
			@Version
		,	@Description
		,	@DateTime
	);
	
END