
DECLARE 
    @folder_id bigint,
    @environment_id bigint
 
IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[folders] WHERE name = N'Adv_Works_Demo')
    EXEC [SSISDB].[catalog].[create_folder] @folder_name=N'Adv_Works_Demo', @folder_id=@folder_id OUTPUT
ELSE
    SET @folder_id = (SELECT folder_id FROM [SSISDB].[catalog].[folders] WHERE name = N'Adv_Works_Demo')
 
IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[environments] WHERE folder_id = @folder_id AND name = N'Development')
    EXEC [SSISDB].[catalog].[create_environment] @environment_name=N'Development', @folder_name=N'Adv_Works_Demo'
 
SET @environment_id = (SELECT environment_id FROM [SSISDB].[catalog].[environments] WHERE folder_id = @folder_id and name = N'Development')
 
DECLARE @var sql_variant
 
SET @var = N'CW_DataWarehouse'
IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[environment_variables] WHERE environment_id = @environment_id AND name = N'DW_Database')
            EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'DW_Database', @sensitive=0, @description=N'Data Warehouse Database', @environment_name=N'Development', @folder_name=N'Adv_Works_Demo', @value=@var, @data_type=N'String'
 
SET @var = N'CW-00002456'
IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[environment_variables] WHERE environment_id = @environment_id AND name = N'DW_Server')
            EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'DW_Server', @sensitive=0, @description=N'Data Warehouse Server', @environment_name=N'Development', @folder_name=N'Adv_Works_Demo', @value=@var, @data_type=N'String'
 
SET @var = N'DW_Staging'
IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[environment_variables] WHERE environment_id = @environment_id AND name = N'DW_StagingDatabase')
            EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'DW_StagingDatabase', @sensitive=0, @description=N'Data Warehouse Staging Database', @environment_name=N'Development', @folder_name=N'Adv_Works_Demo', @value=@var, @data_type=N'String'
 
SET @var = N'AdventureWorks2014'
IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[environment_variables] WHERE environment_id = @environment_id AND name = N'Src_Database')
            EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'Src_Database', @sensitive=0, @description=N'Data Source Database', @environment_name=N'Development', @folder_name=N'Adv_Works_Demo', @value=@var, @data_type=N'String'
 
SET @var = N'CW-00002456'
IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[environment_variables] WHERE environment_id = @environment_id AND name = N'Src_Server')
            EXEC [SSISDB].[catalog].[create_environment_variable] @variable_name=N'Src_Server', @sensitive=0, @description=N'Data Source For Data being pulled into Data Warehouse', @environment_name=N'Development', @folder_name=N'Adv_Works_Demo', @value=@var, @data_type=N'String'
 
