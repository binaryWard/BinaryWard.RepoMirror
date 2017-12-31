[CmdletBinding()]
param
(
    [Parameter(Mandatory = $True)]
    [System.IO.FileInfo]$Config
)

BEGIN {
    . "$PSScriptRoot\RepositoryMirror.core.ps1"
}

PROCESS {
    try {
        & "$PSScriptRoot\New-RepositoryMirror.ps1" -Config $Config
        & "$PSScriptRoot\Update-RepositoryMirror.ps1" -Config $Config
    }
    finally {}
}

END {

}

