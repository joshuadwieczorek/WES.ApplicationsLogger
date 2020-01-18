
DECLARE @DatabaseVersion [dbo].[Version_Type] = '1.0.0';

IF([dbo].[fnDatabaseVersionExists](@DatabaseVersion) = 0)
BEGIN

	EXEC [dbo].[Database_Version_Log_Create] @DatabaseVersion, 'Initial Release';

	EXEC [dbo].[Statuses_Object_Types_Create] 'user';
	EXEC [dbo].[Statuses_Object_Types_Create] 'user.application';
	EXEC [dbo].[Statuses_Object_Types_Create] 'user.application.key';
	EXEC [dbo].[Statuses_Object_Types_Create] 'user.password';

	EXEC [dbo].[Statuses_Create] @StatusName='Inactive', @StatusValue=0, @ObjectTypeName='user'; 
	EXEC [dbo].[Statuses_Create] @StatusName='Active', @StatusValue=1, @ObjectTypeName='user'; 
	EXEC [dbo].[Statuses_Create] @StatusName='Locked', @StatusValue=2, @ObjectTypeName='user'; 
	EXEC [dbo].[Statuses_Create] @StatusName='Deleted', @StatusValue=3, @ObjectTypeName='user'; 
	EXEC [dbo].[Statuses_Create] @StatusName='Suspended', @StatusValue=4, @ObjectTypeName='user'; 

	EXEC [dbo].[Statuses_Create] @StatusName='Active', @StatusValue=1, @ObjectTypeName='user.application';
	EXEC [dbo].[Statuses_Create] @StatusName='Deleted', @StatusValue=2, @ObjectTypeName='user.application';

	EXEC [dbo].[Statuses_Create] @StatusName='Active', @StatusValue=0, @ObjectTypeName='user.application.key';
	EXEC [dbo].[Statuses_Create] @StatusName='Expired', @StatusValue=1, @ObjectTypeName='user.application.key';

	EXEC [dbo].[Statuses_Create] @StatusName='Inactive', @StatusValue=0, @ObjectTypeName='user.password'; 
	EXEC [dbo].[Statuses_Create] @StatusName='Active', @StatusValue=1, @ObjectTypeName='user.password';
	EXEC [dbo].[Statuses_Create] @StatusName='Expired', @StatusValue=2, @ObjectTypeName='user.password';

	
	EXEC [users].[Users_Create] @FirstName='Sys', @LastName='Admin', @EmailAddress='admin@noemail.com', @Status=1;

END