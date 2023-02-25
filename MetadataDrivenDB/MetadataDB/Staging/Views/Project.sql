
CREATE VIEW [Staging].[Project] AS 
WITH Project AS (
	SELECT [ProjectId]                = CONVERT(INT, p.[ProjectId]),
		   [Project]                  = p.[Name],
		   [Project Code]             = NULLIF(p.[Code],''),
		   [Project Description]      = NULLIF(p.[Description],''),
		   [Project Start Date]       = TRY_CONVERT(DATE, p.[StartDate]),
		   [Project End Date]         = TRY_CONVERT(DATE, p.[EndDate]),
		   [Project Status]           = p.[ProjectStatusLabelName],
		   [LastUpdated]	          = GETDATE(),
		   [UpdatedBy]		          = SUSER_SNAME()
	FROM [raw].[Project] p
)
SELECT   [ProjectId]     
		,[Project]       
		,[Project Code]  
		,[Project Description]  
		,[Project Start Date]    
		,[Project End Date]      
		,[Project Status]
		,[LastUpdated]
		,[UpdatedBy]		
	    ,[RowHash] = hashbytes('SHA2_512',
									CONCAT_WS('|',				         																				
										 [Project]       
										,[Project Code]  
										,[Project Description]   
										,[Project Start Date]    
										,[Project End Date]      
										,[Project Status]
									)
								) 
FROM Project