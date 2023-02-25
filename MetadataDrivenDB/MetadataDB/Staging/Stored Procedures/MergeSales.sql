Create Proc Staging.MergeSales (@DataFactoryTaskKey int) 
As

Update s Set
    -- -1 for Key is "Not Known" (ie. null, no ProductID was provided)
    -- -2 for Key is "Invalid" (ie. ProductID was not found)
    ProductKey = Coalesce(p.ProductKey, case When s.ProductID Is Null Then -1 Else -2 End)
From Staging.Sales s 
    Left Join dw.Product p On s.ProductID = p.ProductID

Merge dw.Sales trg 
	Using Staging.Sales src
	On trg.SalesOrderDetailID= src.SalesOrderDetailID

When Not Matched By Target Then 
	Insert (
		[SalesOrderDetailID] 
              , CustomerKey
              , ProductKey
              , SalesOrderNumber
              , PurchaseOrderNumber
              , OrderDate
              , OrderQty
              , UnitPrice
              , UnitPriceDiscount
              , LineTotal
	)
	Values (
		[SalesOrderDetailID] 
              , CustomerKey
              , ProductKey
              , SalesOrderNumber
              , PurchaseOrderNumber
              , OrderDate
              , OrderQty
              , UnitPrice
              , UnitPriceDiscount
              , LineTotal
	)
	When Matched And src.RowHash <> trg.RowHash Then Update Set
		[SalesOrderDetailID] = src.[SalesOrderDetailID] 
      , CustomerKey          = src.CustomerKey
      , ProductKey           = src.ProductKey
      , SalesOrderNumber     = src.SalesOrderNumber
      , PurchaseOrderNumber  = src.PurchaseOrderNumber
      , OrderDate            = src.OrderDate
      , OrderQty             = src.OrderQty
      , UnitPrice            = src.UnitPrice
      , UnitPriceDiscount    = src.UnitPriceDiscount
      , LineTotal            = src.LineTotal
    ;

update ETL.DataFactoryTask set
	LastCopied = getdate(),
	IncrementalDate = GetDate() 
    -- or, with overlap of five previous days: 
    -- IncrementalDate = DateAdd(Day,-5, GetDate())
where DataFactoryTaskKey = @DataFactoryTaskKey