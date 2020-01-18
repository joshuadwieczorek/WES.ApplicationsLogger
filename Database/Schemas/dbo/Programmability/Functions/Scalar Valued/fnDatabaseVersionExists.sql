CREATE FUNCTION [dbo].[fnDatabaseVersionExists]
(
	@Version [dbo].[Version_Type]
)
RETURNS BIT
AS
BEGIN
	
	DECLARE @Exists BIT = 0;

	SELECT	@Exists = 1
		FROM [dbo].[Database_Version_Log] (NOLOCK)
			WHERE [Version] = @Version;

	RETURN @Exists;

END