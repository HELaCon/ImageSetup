function Add-Path{
     [cmdletbinding()]
     param(
         [Parameter(Mandatory=$True,ValueFromPipeline=$True,Position=0)]
         [string[]]$pathToAdd
     )
     process{
         # Get the current search path from the environment keys in the registry.
         $oldpath=$env:path
         if (!$pathToAdd){
             ‘No Folder Supplied. $env:path Unchanged’ | Write-Verbose
         }
         elseif (!(test-path $pathToAdd)){
             ‘Folder [{0}] does not exist, Cannot be added to $env:path’ -f $pathToAdd | Write-Verbose
         }
         elseif ($env:path | Select-String -SimpleMatch $pathToAdd){
             'Folder already within $env:path' | Write-Verbose
         }
         else{
             'Adding [{0}] to the path' -f $pathToAdd | Write-Verbose
             $newpath = $oldpath
             # set the new path
             foreach($path in $pathToAdd){
                 $newPath += ";$path"
             }

             $env:path = $newPath
             [Environment]::SetEnvironmentVariable('path',$newPath,[EnvironmentVariableTarget]::Machine) | Out-Null
         }
     }
 }

