
function Get-RepositoryMirrorConfig()
{
    param
    (
        [Parameter(Mandatory=$True)]
        [System.IO.FileInfo]$Config
    )

    Write-Output $(Import-LocalizedData -BaseDirectory $Config.Directory.FullName -FileName $Config.Name)
}