CREATE PROCEDURE [dbo].[Statuses_Create]
(
		@StatusName [dbo].[Name_Type]
	,	@StatusValue [dbo].[StatusValue_Type]
	,	@Description [dbo].[Description_Type] = NULL
	,	@ObjectTypeName [dbo].[Name_Type] = NULL
	,	@ObjectTypeID [dbo].[ID_Type] = NULL
	,	@DateTime [DateTime_Type] = NULL
)
AS
BEGIN

	BEGIN TRANSACTION;

	SET XACT_ABORT ON;

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

	BEGIN TRY

		IF(@DateTime IS NULL)
			SELECT @DateTime = GETDATE();

		IF(@ObjectTypeID IS NULL)
			SELECT @ObjectTypeID = [ID]
				FROM [dbo].[Statuses_Object_Types]
					WHERE [Object_Type_Name] = @ObjectTypeName;

		IF(@ObjectTypeID IS NULL)
		BEGIN
			DECLARE @ErrorMessage NVARCHAR(500);
			RAISERROR(@ErrorMessage, 16, 1);
		END

		INSERT INTO [dbo].[Statuses]
		(
				[Status_Object_Type_ID]
			,	[Status_Name]		
			,	[Status_Value]
			,	[Status_Description]	
			,	[DateTime_Created]		
			,	[DateTime_Updated]	
		)
		VALUES
		(
				@ObjectTypeID
			,	@StatusName
			,	@StatusValue
			,	@Description
			,	@DateTime
			,	@DateTime
		);

		EXEC [dbo].[Statuses_Read] @ObjectTypeID=@ObjectTypeID;

		COMMIT;

	END TRY

	BEGIN CATCH
		ROLLBACK;
		THROW;
	END CATCH

END