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

## History
* [v0.1.0](https://github.com/Windos/PoshPctBar/releases/v0.1.0)
  * First version with basic functionality.

## Credits
TODO: Write credits

## License
* see [LICENSE](LICENSE) file
