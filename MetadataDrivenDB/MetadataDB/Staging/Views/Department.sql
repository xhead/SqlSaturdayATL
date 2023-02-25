
CREATE VIEW [Staging].[Department] AS 
WITH Department AS (
	SELECT d.[DepartmentId],
		   [Department]        = [Name],
		   d.[Code],
		   [Department Enabled] = CASE WHEN d.[IsEnabled] = 'false' THEN 'Disabled' ELSE 'Enabled' END,
		   [LastUpdated]	   = GETDATE(),
		   [UpdatedBy]		   = SUSER_SNAME()
	FROM [raw].[Department]	d
)
SELECT   [DepartmentId]      
		,[Department]        
		,[Code] 
		,[Department Enabled]
		,[LastUpdated]
		,[UpdatedBy]	
	    ,[RowHash] = hashbytes('SHA2_512',
									CONCAT_WS('|'				         																				
										,[Department]        
										,[Code] 
										,[Department Enabled]											
									)
								) 
FROM Department