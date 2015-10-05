function New-PercentBar
{
    <#
        .SYNOPSIS
        Creates a new Percentage Bar.

	    .DESCRIPTION
        The New-PercentBar cmdlet creates a new Percentage Bar, a visual representation of an quanity out of 100.

        The percentage bar is returned as a string with a border. The borderer can be excluded if desired.

	    .EXAMPLE
        New-PercentBar -Percent 0.5

        This example generates a Percentage Bar that is 50% filled, with a default square bracket border:

        [xxxxx.....]

	    .EXAMPLE
        New-PercentBar -Percent 0.3 -Border '||'

        This example generates a Percentage Bar that is 30% filled, with a border constructed out of pipe (|) characters:

        |xxx.......|

        .EXAMPLE
        0.8 | New-PercentBar -NoBorder

        This example takes a decimal value from the pipeline and generates a Percentage Bar that is 80% filled and doesn't have a border:

        xxxxxxxx..

        .INPUTS
        System.Decimal
        
        .LINK
        https://github.com/Windos/PoshPctBar
    #>

    [CmdletBinding(DefaultParameterSetName='Border')]
    [OutputType("System.String")]
    param
    (
        [Parameter(Mandatory = $true,
                   Position = 0,
                   ValueFromPipeline = $True,
                   ValueFromPipelineByPropertyName = $True,
                   HelpMessage = 'Enter the percentage in the form of a decimal value between 0 and 1.')]
        [ValidateNotNullOrEmpty()]
        [decimal] $Percentage,

        [Parameter(Mandatory=$false,
                   Position = 1,
                   ParameterSetName='Border')]
        [ValidateSet('[]', '{}', '()', '||', '/\', '--')]
        [string] $Border = '[]',

        [Parameter(Mandatory=$true,
                   Position = 1,
                   ParameterSetName='NoBorder')]
        [switch] $NoBorder
    )

    process
	{
        try
        {
            $PercentBar = 'x' * ([System.Math]::Round(( $Percentage )*100)/10) + '.' * (10-([System.Math]::Round(( $Percentage )*100)/10))

            if (!$NoBorder)
            {
                $PercentBar = $Border[0] + $PercentBar + $Border[1]
            }

            $PercentBar
        }
        catch
        {
            Throw $_.Exception
        }
    }
}
