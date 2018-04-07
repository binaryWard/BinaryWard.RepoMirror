BinaryWard.RepoMirror is a utility to create local mirror git repositories based upon a configuration file.

The script will create the local mirror if it does not exist.  The script will synchronize the mirror upon repeat runs.

BinaryWard.RepoMirror will save the git repositories in a specified directory grouping repositories into a project and saving them under this directory.
[path]\[project name]\[git repo]

Authentication to the git repositories is implicit and does not store or access any git server authentication credentials.

The BinaryWard.RepoMirror console output is the raw git output.  