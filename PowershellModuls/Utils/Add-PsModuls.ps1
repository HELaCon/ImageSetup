function Add-PSModulePath{
     [cmdletbinding()]
     param(
         [Parameter(Mandatory=$True,ValueFromPipeline=$True,Position=0)]
         [string[]]$pathToAdd
     )
     process{
         # Get the current search path from the environment keys in the registry.
         $oldpath=$env:PSModulePath
         if (!$pathToAdd){
             ‘No Folder Supplied. $env:PSModulePath Unchanged’ | Write-Verbose
         }
         elseif (!(test-path $pathToAdd)){
             ‘Folder [{0}] does not exist, Cannot be added to $env:PSModulePath’ -f $pathToAdd | Write-Verbose
         }
         elseif ($env:path | Select-String -SimpleMatch $pathToAdd){
             'Folder already within $env:PSModulePath' | Write-Verbose
         }
         else{
             'Adding [{0}] to the path' -f $pathToAdd | Write-Verbose
             $newpath = $oldpath
             # set the new path
             foreach($path in $pathToAdd){
                 $newPath += ";$path"
             }

             $env:path = $newPath
             [Environment]::SetEnvironmentVariable('PSModulePath',$newPath,[EnvironmentVariableTarget]::Machine) | Out-Null
         }
     }
 }

