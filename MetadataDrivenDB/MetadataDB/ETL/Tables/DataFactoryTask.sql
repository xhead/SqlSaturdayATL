CREATE TABLE [ETL].[DataFactoryTask] (
    [DataFactoryTaskKey] INT            IDENTITY (1, 1) NOT NULL,
    [DataSource]         NVARCHAR (100) NOT NULL,
    [TargetSchema]       NVARCHAR (100) NOT NULL,
    [TargetTable]        NVARCHAR (100) NOT NULL,
    [MergeProc]          NVARCHAR (100) NOT NULL,
    [SourceQuery]        NVARCHAR (MAX) NOT NULL,
    [IncrementalDate]    DATE           NULL,
    [LastCopied]         DATETIME2 (7)  NULL,
    [Ordinal]            INT            NULL,
    [NeedsFormatting]    BIT            NULL,
    [ValidationList]     NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([DataFactoryTaskKey] ASC)
);

