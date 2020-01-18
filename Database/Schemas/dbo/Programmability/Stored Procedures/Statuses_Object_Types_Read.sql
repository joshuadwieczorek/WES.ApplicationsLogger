CREATE PROCEDURE [dbo].[Statuses_Object_Types_Read]
(
	@Name [dbo].[Name_Type] = NULL
)
AS
BEGIN

	SELECT	[ID]					
		,	[Object_Type_Name]		
		,	[DateTime_Created]		
		,	[DateTime_Updated]		
	FROM	[dbo].[Statuses_Object_Types] (NOLOCK)
	WHERE	(
				@Name IS NULL
			)
		OR	(
				@Name IS NOT NULL
				AND
				[Object_Type_Name] = @Name
			)
	ORDER BY [ID];

END