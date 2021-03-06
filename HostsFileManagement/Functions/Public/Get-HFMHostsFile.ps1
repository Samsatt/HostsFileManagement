Function Get-HFMHostsfile {
    <#
    .SYNOPSIS
        Get the hosts file of the desired hostname.
    .DESCRIPTION
        Get the hostfile of the desired hostname.
        By default the localhost hosts file is fetched. You can specify a remote computer name.
    .EXAMPLE
        PS C:\> Get-HFMHostsfile
        Return a [HostsFile] object representing the local hosts file.
    .EXAMPLE
        PS C:\> Get-HFMHostsfile -Name Computer1
        Return a [HostsFile] object representing the hosts file of Computer1.
    .EXAMPLE
        PS C:\> "Computer1","Computer2" | Get-HFMHostsfile
        Return an array of [HostsFile] objects representing the hosts file of Computer1 and Computer2.
    .INPUTS
        Input String.
    .OUTPUTS
        Return [HostsFile] Object(s).
    .NOTES
        This cmdlet uses Class.HostsManagement classes, by @StephaneVG
        Fork hist project if you like it: https://github.com/Stephanevg/Class.HostsManagement
        Visit his site, and read his article a boute pratical use of PowerShell Classes: http://powershelldistrict.com/powershell-class/
    #>

    [CmdletBinding()]
    Param
    (
        [Alias("Name")]
        [Parameter(Mandatory=$False,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
        [String[]]$ComputerName
    )

    BEGIN{}

    PROCESS{
        If ( !$ComputerName ) {
            return [HostsFile]::New()
        } Else {
            Foreach ( $Computer in $ComputerName ) {
                Return [HostsFile]::New($Computer)
            }
        }
    }

    END{}
}
