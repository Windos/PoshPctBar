function New-PercentBar
{
    <#
        .SYNOPSIS

	    .DESCRIPTION

	    .EXAMPLE

	    .EXAMPLE
    #>

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true,
                   Position = 0,
                   ValueFromPipeline = $True,
                   ValueFromPipelineByPropertyName = $True,
                   HelpMessage = '?')]
        [ValidateNotNullOrEmpty()]
        [decimal] $Percentage,

        [ValidateSet('{}', '()', '||', '/\', '--')]
        [string] $Border = '[]'
    )

    begin
    {}

    process
	{
        $Border[0] + 'x' * ([System.Math]::Round(( $Percentage )*100)/10) + '.' * (10-([System.Math]::Round(( $Percentage )*100)/10)) + $Border[1]
    }
}
