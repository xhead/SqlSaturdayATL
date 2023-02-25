CREATE TABLE [Staging].[Sales] (
    [SalesKey]            INT             IDENTITY (1, 1) NOT NULL,
    [SalesOrderDetailID]  INT             NULL,
    [CustomerKey]         INT             NULL,
    [ProductKey]          INT             NULL,
    [SalesOrderNumber]    VARCHAR (100)   NULL,
    [PurchaseOrderNumber] VARCHAR (100)   NULL,
    [OrderDate]           DATE            NULL,
    [CustomerID]          INT             NULL,
    [ProductID]           INT             NULL,
    [OrderQty]            DECIMAL (10, 4) NULL,
    [UnitPrice]           MONEY           NULL,
    [UnitPriceDiscount]   MONEY           NULL,
    [LineTotal]           MONEY           NULL,
    [RowHash]             AS              (hashbytes('SHA2_512',concat_ws('|',[CustomerKey],[ProductKey],[SalesOrderNumber],[PurchaseOrderNumber],[OrderDate],[OrderQty],[UnitPrice],[UnitPriceDiscount],[LineTotal]))),
    PRIMARY KEY CLUSTERED ([SalesKey] ASC)
);

