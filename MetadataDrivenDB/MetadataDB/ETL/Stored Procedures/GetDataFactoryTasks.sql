
Create   Procedure [ETL].[GetDataFactoryTasks]
(
	  @OptionalTaskKeyList	varchar(250) = Null
	, @DataSource			varchar(50)	 = Null
)
As
Begin
	DECLARE @tasks TABLE (DataFactoryTaskKey INT);

	INSERT @tasks
	SELECT DISTINCT TRY_CONVERT(INT, VALUE)
	FROM STRING_SPLIT(TRIM(@OptionalTaskKeyList),',')
	WHERE TRY_CONVERT(INT, VALUE) IS NOT NULL

	IF NOT EXISTS(SELECT * FROM @tasks) BEGIN
		INSERT @tasks
		SELECT DataFactoryTaskKey FROM ETL.DataFactoryTask
	END
	
	SELECT 
		dft.[DataFactoryTaskKey],
		dft.[DataSource],
		[SourceQuery] = REPLACE(dft.[SourceQuery],'{incrementalDate}',COALESCE(CONVERT(VARCHAR(25),dft.IncrementalDate,121),'1900-1-1')),
		dft.[TargetSchema],
		dft.[TargetTable],
		dft.[MergeProc],
		TruncateStatement =  N'TRUNCATE TABLE ' + QUOTENAME(dft.[TargetSchema]) + N'.' + QUOTENAME(dft.[TargetTable])
	FROM [ETL].[DataFactoryTask] dft
		INNER JOIN @tasks t
			ON dft.DataFactoryTaskKey = t.DataFactoryTaskKey
	WHERE dft.DataSource = @DataSource
	ORDER BY dft.[Ordinal];

END;