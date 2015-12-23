#requires -Version 2
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

        .EXAMPLE
        New-PercentBar -Percent 0.8 -BarCharacter '-' -RemainderCharacter ' '
        
        This example uses customized characters:
	    
        [--------  ]
    	
        .EXAMPLE
        New-PercentBar -Percent 0.2 -Length 20
        
        This example is twice as long as the default percentage bar:
	    
        [xxxx................]

        .EXAMPLE
        Get-WmiObject Win32_LogicalDisk | Select-Object -Property DeviceID, VolumeName, Size, @{N = 'Used'; E = {1 - ($_.FreeSpace / $_.Size) | New-PercentBar}}

        This example displays the Disk Letter, Label, Size and a Percent Bar prepresenting the freespace of all disks on the local system.

        DeviceID VolumeName          Size Used        
        -------- ----------          ---- ----        
        C:       OS          499512242176 [x.........]
        D:       Games       320070479872 [xxxxx.....]
        M:       MEDIA      1500299390976 [xxxxxxx...]

        .INPUTS
        System.Decimal
        
        .LINK
        https://github.com/Windos/PoshPctBar
    #>

    [CmdletBinding(DefaultParameterSetName = 'Border')]
    [OutputType('System.String')]
    param
    (
        [Parameter(Mandatory = $true,
                   Position = 0,
                   ValueFromPipeline = $true,
                   ValueFromPipelineByPropertyName = $true,
                   HelpMessage = 'Enter the percentage in the form of a decimal value between 0 and 1.')]
        [ValidateNotNullOrEmpty()]
        [decimal] $Percent,

        [char] $BarCharacter = 'x',

        [char] $RemainderCharacter = '.',

        [char] $LeadingCharacter,

        [int] $Length = 10,

        [Parameter(Mandatory = $false,
                   ParameterSetName = 'Border')]
        [ValidateLength(2,2)]
        [string] $Border = '[]',

        [Parameter(Mandatory = $true,
                   ParameterSetName = 'NoBorder')]
        [switch] $NoBorder
    )

    process
    {
        try
        {
            $PercentBar = $BarCharacter.ToString() * ($Percent * $Length) 

            if ($LeadingCharacter)
            {
                $PercentBar += $LeadingCharacter.ToString()
                $Length = $Length - 1
            }

            $PercentBar += $RemainderCharacter.ToString() * ($Length - ($Percent * $Length))

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
#test

