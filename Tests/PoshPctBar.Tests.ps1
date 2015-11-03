# Heavily borrowed from Boe Prox's PoshPrivilage Module

# Adjust for running in PS2
if(-not $PSScriptRoot)
{
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}
 
# Verbose output if this isn't master, or we are testing locally
$Verbose = @{}
if($env:APPVEYOR_REPO_BRANCH -and $env:APPVEYOR_REPO_BRANCH -notlike "master" -or -not $env:APPVEYOR_REPO_BRANCH)
{
    $Verbose.add("Verbose",$False)
}
 
Import-Module $PSScriptRoot\..\PoshPctBar\PoshPctBar -Verbose -Force -ErrorAction SilentlyContinue
 
Describe "PoshPctBar PS$PSVersion" {
    Context 'Strict mode' {
        Set-StrictMode -Version latest
        It 'should load all functions' {
            $Commands = @( Get-Command -CommandType Function -Module PoshPctBar | Select -ExpandProperty Name)
            $Commands.Count | Should be 1
            $Commands -contains "New-PercentBar" | Should be $True
        }
        # It 'should load all aliases' {
        #     $Commands = @( Get-Command -CommandType Alias -Module PoshPrivilege | Select -ExpandProperty Name)
        #     $Commands.count | Should be 5
        #     $Commands -contains "appv"     | Should be $True
        #     $Commands -contains "dppv" | Should be $True
        #     $Commands -contains "eppv"  | Should be $True
        #     $Commands -contains "gppv"   | Should be $True
        #     $Commands -contains "rppv"    | Should be $True           
        # }
    }
}
