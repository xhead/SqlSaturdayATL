Create Proc Staging.MergeProduct (@DataFactoryTaskKey int) 
As

Merge dw.Product trg 
	Using Staging.Product src
	On trg.ProductID = src.ProductID
When Not Matched By Target Then 
	Insert (
		[ProductID] 
		, [Product] 
		, [ProductNumber] 
		, [Color] 
		, [StandardCost] 
		, [ListPrice] 
		, [Model] 
		, [Category] 
	)
	Values (
		[ProductID] 
		, [Product] 
		, [ProductNumber] 
		, [Color] 
		, [StandardCost] 
		, [ListPrice] 
		, [Model] 
		, [Category] 
	)
	When Matched And src.RowHash <> trg.RowHash Then Update Set
		  [Product]			= src.[Product] 
		, [ProductNumber] 	= src.[ProductNumber]
		, [Color] 			= src.[Color] 
		, [StandardCost] 	= src.[StandardCost] 
		, [ListPrice] 		= src.[ListPrice] 
		, [Model] 			= src.[Model] 
		, [Category] 		= src.[Category] 
    ;

update ETL.DataFactoryTask set
	LastCopied = getdate()
where DataFactoryTaskKey = @DataFactoryTaskKey