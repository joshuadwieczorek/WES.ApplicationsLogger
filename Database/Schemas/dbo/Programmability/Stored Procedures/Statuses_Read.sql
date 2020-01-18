CREATE PROCEDURE [dbo].[Statuses_Read]
(
		@ObjectTypeName [dbo].[Name_Type] = NULL
	,	@ObjectTypeID [dbo].[ID_Type] = NULL
)
AS
BEGIN

	SELECT	[Status_ID]
		,	[Object_Type_ID]
		,	[Object_Type_Name]
		,	[Status_Name]
		,	[Status_Description]
	FROM	[dbo].[v_Statuses]
	WHERE	(
				@ObjectTypeID IS NULL
				AND 
				@ObjectTypeName IS NULL
			)
		OR	(
				[Object_Type_ID] = @ObjectTypeID
				AND
				@ObjectTypeName IS NULL
			)
		OR	(
				@ObjectTypeID IS NULL
				AND
				[Object_Type_Name] = @ObjectTypeName
			)
	ORDER BY [Object_Type_Name], [Status_ID];

END