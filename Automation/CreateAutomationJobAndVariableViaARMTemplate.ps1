$AutomationAccountName = "MyAccount"
$RunbookName = "Test-CreateVariableAndGetContentsFromARM"
$AutomationVariableName = "TestOutput"
$RegionId = "East US 2" # Allowed values = "Japan East","East US 2","West Europe","Southeast Asia","South Central US"
$SubscriptionName = "Microsoft Azure Internal Consumption"

#Connect to your Azure account
Login-AzureRmAccount

#Select your subscription if you have more than one
Select-AzureRmSubscription -SubscriptionName $SubscriptionName

#Create a GUID for the job
$JobGUID = [System.Guid]::NewGuid().toString()


#Set the parameter values for the template
$Params = @{
    "accountName" = $AutomationAccountName
    "regionId" = $RegionId
    "jobId" = $JobGUID
    "runbookName" = $RunbookName
    "variableName" = $AutomationVariableName
}

$TemplateUri = "https://raw.githubusercontent.com/jefffanjoy/Test/master/Automation/CreateAutomationVariableAndStartRunbookJob.json"

New-AzureRMResourceGroupDeployment -TemplateParameterObject $Params -ResourceGroupName "Test" -TemplateUri $TemplateUri

