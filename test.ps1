./packages\OpenCover.4.6.166\tools\OpenCover.Console.exe -register:user -target:xunit.console.clr4.exe "-targetargs:""tests\RedisMemoryCacheInvalidation.Tests\bin\$env:CONFIGURATION\RedisMemoryCacheInvalidation.dll"" /noshadow /appveyor -notrait ""category=Integration""" -filter:"+[RedisMemoryCacheInvalidation*]*" -output:opencoverCoverage.xml

$coveralls = (Resolve-Path "src/packages/coveralls.net.*/tools/csmacnz.coveralls.exe").ToString()

& $coveralls --opencover -i opencoverCoverage.xml --repoToken $env:COVERALLS_REPO_TOKEN --commitId $env:APPVEYOR_REPO_COMMIT --commitBranch $env:APPVEYOR_REPO_BRANCH --commitAuthor $env:APPVEYOR_REPO_COMMIT_AUTHOR --commitEmail $env:APPVEYOR_REPO_COMMIT_AUTHOR_EMAIL --commitMessage $env:APPVEYOR_REPO_COMMIT_MESSAGE --jobId $env:APPVEYOR_JOB_ID