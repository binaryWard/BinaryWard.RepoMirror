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
            New-Item -Type Directory -Path $private:mirrorDirectory | Out-Null
        }

        foreach ($project in $private:repositoryConfig.Projects) {
            $private:projectDirectory = [System.IO.Path]::Combine($private:mirrorDirectory, $project.Name)
         
            if ( !$(Test-Path $private:projectDirectory) ) {
                New-Item -Type Directory -Path $private:projectDirectory | Out-Null
            }   

            Push-Location $private:projectDirectory
            try {
                foreach ($repo in $project.Repositories) {
                    git clone --mirror $repo
                }
            }
            finally {
                Pop-Location   
            }
        }
    }
    finally {}
}

END {

}

