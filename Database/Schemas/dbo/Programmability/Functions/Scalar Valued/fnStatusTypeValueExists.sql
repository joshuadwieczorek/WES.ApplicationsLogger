CREATE FUNCTION [dbo].[fnStatusTypeValueExists]
(
		@ObjecTypeName [dbo].[Name_Type]
	,	@StatusValue SMALLINT
)
RETURNS BIT
AS
BEGIN
	
	DECLARE @Exists BIT = 0;
	
	SELECT @Exists = 1
		FROM [dbo].[v_Statuses]
			WHERE [Object_Type_Name] = @ObjecTypeName
				AND [Status_Value] = @StatusValue;

	RETURN @Exists;

END