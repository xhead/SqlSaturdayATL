CREATE TABLE [dw].[Project] (
    [ProjectKey]          INT           IDENTITY (1, 1) NOT NULL,
    [ProjectId]           VARCHAR (70)  NOT NULL,
    [Project]             VARCHAR (150) NULL,
    [Project Code]        VARCHAR (70)  NULL,
    [Project Description] VARCHAR (150) NULL,
    [Project Start Date]  DATE          NULL,
    [Project End Date]    DATE          NULL,
    [Project Status]      VARCHAR (70)  NULL,
    [LastUpdated]         DATETIME2 (7) CONSTRAINT [DF__Project__LastUpd__6A30C649] DEFAULT (getdate()) NULL,
    [UpdatedBy]           VARCHAR (100) CONSTRAINT [DF__Project__Updated__6B24EA82] DEFAULT (suser_sname()) NULL,
    [RowHash]             AS            (hashbytes('SHA2_512',concat_ws('|',[Project],[Project Code],[Project Description],[Project Start Date],[Project End Date],[Project Status]))),
    CONSTRAINT [PK__Project__C048AC9442F6D54E] PRIMARY KEY CLUSTERED ([ProjectKey] ASC)
);

