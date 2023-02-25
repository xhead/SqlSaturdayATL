CREATE TABLE [dw].[Product] (
    [ProductKey]    INT            IDENTITY (1, 1) NOT NULL,
    [ProductID]     INT            NULL,
    [Product]       NVARCHAR (100) NULL,
    [ProductNumber] NVARCHAR (100) NULL,
    [Color]         NVARCHAR (100) NULL,
    [StandardCost]  MONEY          NULL,
    [ListPrice]     MONEY          NULL,
    [Model]         NVARCHAR (100) NULL,
    [Category]      NVARCHAR (100) NULL,
    [LastUpdated]   DATETIME2 (7)  CONSTRAINT [DF_Product_LastUpdated] DEFAULT (getdate()) NULL,
    [UpdatedBy]     VARCHAR (100)  CONSTRAINT [DF_Product_UpdatedBy] DEFAULT (suser_sname()) NULL,
    [RowHash]       AS             (hashbytes('SHA2_512',concat_ws('|',[Product],[ProductNumber],[Color],[StandardCost],[ListPrice],[Model],[Category]))),
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductKey] ASC)
);

