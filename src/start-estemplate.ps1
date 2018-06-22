<# Start-estemplate.ps

#>

# Enable all debug output
$DebugPreference = "Continue"

$clusterParameters = @{
    "artifactsBaseUrl"="https://raw.githubusercontent.com/darrell-tethr/azure-marketplace/feature-master-nodes-only/src"
    "esVersion" = "6.2.1"
    "esClusterName" = "elasticsearch"
    "loadBalancerType" = "internal"
    "vmDataNodeCount" = "0"
    "vmDataDiskCount" = 1
    "vmHostNamePrefix" = "ctesd"
    "adminUsername" = "russ"
    "adminPassword" = "Password1234"
    "securityAdminPassword" = "Password123"
    "securityReadPassword" = "Password123"
    "securityKibanaPassword" = "Password123"
    "securityLogstashPassword" = "Password123"
}


# Capture all debug info in $output
# Note that 5>&1 is a PS redirector operator. Required for capturing the debug output.
$output = Test-AzureRmResourceGroupDeployment `
    -ResourceGroupName "estemplate-poc-rg" `
    -TemplateUri "https://raw.githubusercontent.com/darrell-tethr/azure-marketplace/feature-master-nodes-only/src/mainTemplate.json" `
    -TemplateParameterObject $clusterParameters `
    -Verbose `
    5>&1

# Run the output for capture debug info
$output | out-file .\start-estemplate.log
