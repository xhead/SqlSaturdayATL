CREATE USER [adf-metadatadriven-dev] FOR EXTERNAL PROVIDER;
Go

ALTER ROLE [db_owner] ADD MEMBER [adf-metadatadriven-dev];

