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
        
        $private:repositoryConfig = Get-RepositoryMirrorConfig -Config $Config
        $private:mirrorDirectory = $private:repositoryConfig.MirrorDirectory
    
        if ( !$(Test-Path $private:mirrorDirectory) ) {
            return
        }

        Push-Location $private:mirrorDirectory

        try {
            $private:repositoryDirectories = Get-ChildItem -Recurse -Force -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match ".git$" }
            foreach ($repositoryDirectory in $private:repositoryDirectories) {
                Push-Location $repositoryDirectory.FullName
                try {
                    git fetch --all --tags
                }
                finally {
                    Pop-Location   
                }
            }
        }
        finally {
            Pop-Location
        }
    }
    finally {}
}

END {

}

