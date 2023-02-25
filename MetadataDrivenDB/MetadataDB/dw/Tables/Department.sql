CREATE TABLE [dw].[Department] (
    [DepartmentKey]      INT           IDENTITY (1, 1) NOT NULL,
    [DepartmentId]       VARCHAR (70)  NOT NULL,
    [Department]         VARCHAR (70)  NULL,
    [Department Code]    VARCHAR (70)  NULL,
    [Department Enabled] VARCHAR (50)  NULL,
    [LastUpdated]        DATETIME2 (7) CONSTRAINT [DF__Departmen__LastU__71D1E811] DEFAULT (getdate()) NULL,
    [UpdatedBy]          VARCHAR (100) CONSTRAINT [DF__Departmen__Updat__72C60C4A] DEFAULT (suser_sname()) NULL,
    [RowHash]            AS            (hashbytes('SHA2_512',concat_ws('|',[Department],[Department Code],[Department Enabled]))),
    CONSTRAINT [PK__Departme__18D372EA90E1D6DE] PRIMARY KEY CLUSTERED ([DepartmentKey] ASC)
);

