[![Build status](https://ci.appveyor.com/api/projects/status/ybxevtcn2mil3fds?svg=true)](https://ci.appveyor.com/project/Windos/poshpctbar)

# PoshPctBar
Rudimentary PowerShell module for generating Percentage Bars

## Installation

### Manual Install

Download [PoshPctBar.zip](https://github.com/Windos/PoshPctBar/releases/download/v0.1.0/PoshPctBar.zip) and extract the contents into `C:\Users\[User]\Documents\WindowsPowerShell\modules\PoshPctBar` (you may have to create these directories if they don't exist.)

### PowerShell Gallery Install (Requires PowerShell v5)

_See the [PowerShell Gallery](http://www.powershellgallery.com/packages/PoshPctBar/) for the complete details and instructions._

## Usage

    # This example generates a Percentage Bar that is 50% filled, with a default square bracket border:
    PS C:\> New-PercentBar -Percent 0.5
    
    [xxxxx.....]
    
    # This example generates a Percentage Bar that is 30% filled, with a border constructed out of pipe (|) characters:
    PS C:\> New-PercentBar -Percent 0.3 -Border '||'
    
    |xxx.......|
    
    # This example takes a decimal value from the pipeline and generates a Percentage Bar that is 80% filled and doesn't have a border:
    PS C:\> 0.8 | New-PercentBar -NoBorder
    
    xxxxxxxx..
	
	# This example uses customized characters:
	PS C:\> New-PercentBar -Percent 0.8 -BarCharacter '-' -RemainderCharacter ' '
	
	[--------  ]
	
	# This example is twice as long as the default percentage bar:
	PS C:\> New-PercentBar -Percent 0.2 -Length 20
	
	[xxxx................]
	
	# This example displays the Disk Letter, Label, Size and a Percent Bar prepresenting the freespace of all disks on the local system.
	PS C:\> Get-WmiObject Win32_LogicalDisk | Select-Object -Property DeviceID, VolumeName, Size, @{N = 'Used'; E = {1 - ($_.FreeSpace / $_.Size) | New-PercentBar}}

	DeviceID VolumeName          Size Used        
	-------- ----------          ---- ----        
	C:       OS          499512242176 [x.........]
	D:       Games       320070479872 [xxxxx.....]
	M:       MEDIA      1500299390976 [xxxxxxx...]

## History
* [v0.2.1](https://github.com/Windos/PoshPctBar/releases/v0.2.1)
  * Adjusted parameter names, less ambiguity.
  * Border parameter no longer defined as a set, was causing errors when using IntelliSense.
  * Border parameter can now be any set of two characters provided as a string.
  * Included a practical example of usage.
* [v0.2.0](https://github.com/Windos/PoshPctBar/releases/v0.2.0)
  * Customizable percentage bar characters.
  * Optional leading character (e.g. [---->     ])
  * Customizable length of bar.
* [v0.1.0](https://github.com/Windos/PoshPctBar/releases/v0.1.0)
  * First version with basic functionality.

## Credits
Thanks to Kevin Dresser for the original idea and implementation, which has since been bastardized beyond recognition (sorry...).

## License
* see [LICENSE](LICENSE) file
