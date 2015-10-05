function New-PercentBar
{
    <#
        .SYNOPSIS

	    .DESCRIPTION

	    .EXAMPLE

	    .EXAMPLE
    #>

    [CmdletBinding(DefaultParameterSetName='Border')]
    param
    (
        [Parameter(Mandatory = $true,
                   Position = 0,
                   ValueFromPipeline = $True,
                   ValueFromPipelineByPropertyName = $True,
                   HelpMessage = 'What is the percentage?')]
        [ValidateNotNullOrEmpty()]
        [decimal] $Percentage,

        [Parameter(Mandatory=$false,
                   ParameterSetName='Border')]
        [ValidateSet('[]', '{}', '()', '||', '/\', '--')]
        [string] $Border = '[]',

        [Parameter(Mandatory=$true,
                   ParameterSetName='NoBorder')]
        [switch] $NoBorder
    )

    begin
    {}

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
