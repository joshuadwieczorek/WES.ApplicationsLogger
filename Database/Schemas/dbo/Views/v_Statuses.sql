CREATE VIEW [dbo].[v_Statuses]
AS
SELECT		[s].[ID] AS [Status_ID]
		,	[s].[Status_Object_Type_ID] AS [Object_Type_ID]
		,	[sot].[Object_Type_Name]
		,	[s].[Status_Name]
		,	[s].[Status_Value]
		,	[s].[Status_Description]
FROM		[dbo].[Statuses] [s] (NOLOCK)
	JOIN	[dbo].[Statuses_Object_Types] [sot] (NOLOCK)
		ON	[s].[Status_Object_Type_ID] = [sot].[ID];