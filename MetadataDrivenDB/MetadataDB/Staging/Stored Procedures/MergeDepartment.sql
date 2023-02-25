
CREATE proc [Staging].[MergeDepartment] (@DataFactoryTaskKey int) 
as

merge dw.[Department] trg
	using Staging.[Department] src
	on  trg.[DepartmentId] = src.[DepartmentId]


when matched and trg.RowHash <> src.RowHash then 	
	update set          

	   	[Department]		    = src.[Department]		
		,[Department Code]	    = src.[Code]				
		,[Department Enabled]   = src.[Department Enabled]		
		,[LastUpdated]		    = src.[LastUpdated]		
		,[UpdatedBy]		    = src.[UpdatedBy]		
 
when not matched by target then  
	insert (	
		 [DepartmentId]		
		,[Department]		
		,[Department Code]				
		,[Department Enabled]			
		,[LastUpdated]			
		,[UpdatedBy]				
		)

	values (
		 [DepartmentId]			
		,[Department]		
		,[Code]				
		,[Department Enabled]			
		,[LastUpdated]			
		,[UpdatedBy]
	);


update ETL.DataFactoryTask set
	LastCopied = getdate()
where DataFactoryTaskKey = @DataFactoryTaskKey