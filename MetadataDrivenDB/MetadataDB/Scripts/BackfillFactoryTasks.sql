
With tasks As (
Select 
	DataSource
	, Ordinal
	, TargetSchema
	, TargetTable
	, MergeProc
	, SourceQuery
From (Values 
( 'CsvBlob-Dims', 1, 'raw', 'Department', 'Staging.MergeDepartment', 'Department.csv'),
( 'CsvBlob-Dims', 1, 'raw', 'Project', 'Staging.MergeProject', 'Project.csv'),
( 'AdventureWorks-Dims', 1, 'Staging', 'Product', 'Staging.MergeProduct', 
'
Select 
	   p.ProductID
     , [Product] = p.Name
     , p.ProductNumber
     , p.Color
     , p.StandardCost
     , p.ListPrice
     , [Model] = pm.Name 
     , [Category] = pc.Name
From SalesLT.Product p
	Join SalesLT.ProductCategory pc On pc.ProductCategoryID = p.ProductCategoryID
	Join SalesLT.ProductModel pm On pm.ProductModelID = p.ProductModelID
'),
( 'AdventureWorks-Facts', 1, 'Staging', 'Sales', 'Staging.MergeSales', 
'
Select
	d.SalesOrderDetailID,
	s.SalesOrderNumber,
	s.PurchaseOrderNumber,
	s.OrderDate,
	s.CustomerID,
	d.ProductID,
	d.OrderQty,
	d.UnitPrice,
	d.UnitPriceDiscount,
	d.LineTotal
From SalesLT.SalesOrderDetail d
	Join SalesLT.SalesOrderHeader s On s.SalesOrderID = d.SalesOrderID
Where d.ModifiedDate >= ''{IncrementalDate}''
	Or s.ModifiedDate >= ''{IncrementalDate}'' 
')
) t (DataSource, Ordinal, TargetSchema, TargetTable, MergeProc, SourceQuery)
)
Merge ETL.DataFactoryTask trg
	Using tasks src 
	On src.DataSource = trg.DataSource
		And src.TargetSchema = trg.TargetSchema
		And src.TargetTable = trg.TargetTable
When Not Matched By Target then 
	Insert (DataSource, Ordinal, TargetSchema, TargetTable, MergeProc, SourceQuery)
	Values (src.DataSource, src.Ordinal, src.TargetSchema, src.TargetTable, src.MergeProc, src.SourceQuery)

When Matched And Exists 
	(Select src.DataSource, src.Ordinal, src.TargetSchema, src.TargetTable, src.MergeProc, src.SourceQuery
	Except 
	Select trg.DataSource, trg.Ordinal, trg.TargetSchema, trg.TargetTable, trg.MergeProc, trg.SourceQuery)
	Then Update Set 
		Ordinal = src.Ordinal
		, MergeProc = src.MergeProc
		, SourceQuery = src.SourceQuery
When Not Matched By Source Then Delete;
