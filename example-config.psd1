@{
    MirrorDirectory = "E:\Example_PathToSaveAllProjects\";
    Projects = @(
        @{
            Name = "Example_Project01";
            Repositories = @(
                "https://example.gitserver.tld/example_project01/repository01.git"
            );
        },
        @{
            Name = "Example_Project02";
            Repositories = @(
                "https://example.gitserver.tld/example_project02/repository01.git",
                "https://example.gitserver.tld/example_project02/repository02.git",
                "https://example.gitserver.tld/example_project02/repository03.git",
                "https://example.gitserver.tld/example_project02/repository04.git",
                "https://example.gitserver.tld/example_project02/repository05.git"
            );
        }
    );
}