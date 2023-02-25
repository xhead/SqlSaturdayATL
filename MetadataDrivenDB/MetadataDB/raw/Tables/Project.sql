﻿CREATE TABLE [raw].[Project] (
    [ProjectId]                                NVARCHAR (MAX) NULL,
    [ProjectGuid]                              NVARCHAR (MAX) NULL,
    [Name]                                     NVARCHAR (MAX) NULL,
    [Code]                                     NVARCHAR (MAX) NULL,
    [Description]                              NVARCHAR (MAX) NULL,
    [ClientId]                                 NVARCHAR (MAX) NULL,
    [ClientName]                               NVARCHAR (MAX) NULL,
    [ClientCode]                               NVARCHAR (MAX) NULL,
    [ProjectManagerUserId]                     NVARCHAR (MAX) NULL,
    [ProjectManagerUserName]                   NVARCHAR (MAX) NULL,
    [IsProjectManagerApprovalRequired]         NVARCHAR (MAX) NULL,
    [StartDate]                                NVARCHAR (MAX) NULL,
    [EndDate]                                  NVARCHAR (MAX) NULL,
    [ProgramId]                                NVARCHAR (MAX) NULL,
    [ProgramName]                              NVARCHAR (MAX) NULL,
    [BillingType]                              NVARCHAR (MAX) NULL,
    [BillingContractType]                      NVARCHAR (MAX) NULL,
    [FixedBidAmount]                           NVARCHAR (MAX) NULL,
    [FixedBidAmountBaseCurrency]               NVARCHAR (MAX) NULL,
    [FixedBidCurrencyId]                       NVARCHAR (MAX) NULL,
    [FixedBidCurrencyName]                     NVARCHAR (MAX) NULL,
    [FixedBidCurrencySymbol]                   NVARCHAR (MAX) NULL,
    [FixedBidFrequency]                        NVARCHAR (MAX) NULL,
    [TimeEntryCapPercent]                      NVARCHAR (MAX) NULL,
    [PercentComplete]                          NVARCHAR (MAX) NULL,
    [IsTimeEntryAllowed]                       NVARCHAR (MAX) NULL,
    [EstimatedDurationSeconds]                 NVARCHAR (MAX) NULL,
    [EstimatedDurationHours]                   NVARCHAR (MAX) NULL,
    [EstimatedExpenses]                        NVARCHAR (MAX) NULL,
    [EstimatedExpensesBaseCurrency]            NVARCHAR (MAX) NULL,
    [EstimatedExpensesCurrencyId]              NVARCHAR (MAX) NULL,
    [EstimatedExpensesCurrencyName]            NVARCHAR (MAX) NULL,
    [EstimatedExpensesCurrencySymbol]          NVARCHAR (MAX) NULL,
    [EstimatedCost]                            NVARCHAR (MAX) NULL,
    [EstimatedCostBaseCurrency]                NVARCHAR (MAX) NULL,
    [EstimatedCostCurrencyId]                  NVARCHAR (MAX) NULL,
    [EstimatedCostCurrencyName]                NVARCHAR (MAX) NULL,
    [EstimatedCostCurrencySymbol]              NVARCHAR (MAX) NULL,
    [TimeAndExpenseEntryType]                  NVARCHAR (MAX) NULL,
    [EstimationMode]                           NVARCHAR (MAX) NULL,
    [BillingRateFrequencyName]                 NVARCHAR (MAX) NULL,
    [BillingRateFrequencyDurationSeconds]      NVARCHAR (MAX) NULL,
    [BillingRateFrequencyDurationHours]        NVARCHAR (MAX) NULL,
    [DefaultBillingCurrencyId]                 NVARCHAR (MAX) NULL,
    [DefaultBillingCurrencyName]               NVARCHAR (MAX) NULL,
    [DefaultBillingCurrencySymbol]             NVARCHAR (MAX) NULL,
    [DataAllocatedToClientsBy]                 NVARCHAR (MAX) NULL,
    [TotalEstimatedContractAmount]             NVARCHAR (MAX) NULL,
    [TotalEstimatedContractAmountBaseCurrency] NVARCHAR (MAX) NULL,
    [TotalEstimatedContractCurrencyId]         NVARCHAR (MAX) NULL,
    [TotalEstimatedContractCurrencyName]       NVARCHAR (MAX) NULL,
    [TotalEstimatedContractCurrencySymbol]     NVARCHAR (MAX) NULL,
    [ProjectStatusLabelName]                   NVARCHAR (MAX) NULL,
    [ProjectDepartmentId]                      NVARCHAR (MAX) NULL,
    [ProjectDepartmentName]                    NVARCHAR (MAX) NULL,
    [ProjectEmployeeTypeId]                    NVARCHAR (MAX) NULL,
    [ProjectEmployeeTypeName]                  NVARCHAR (MAX) NULL,
    [RevenueContractId]                        NVARCHAR (MAX) NULL,
    [RevenueContractName]                      NVARCHAR (MAX) NULL,
    [ProjectInvoiceCurrencyId]                 NVARCHAR (MAX) NULL,
    [ProjectInvoiceCurrencyName]               NVARCHAR (MAX) NULL,
    [ProjectInvoiceCurrencySymbol]             NVARCHAR (MAX) NULL,
    [BaseCurrencyId]                           NVARCHAR (MAX) NULL,
    [BaseCurrencyName]                         NVARCHAR (MAX) NULL,
    [BaseCurrencySymbol]                       NVARCHAR (MAX) NULL
);

