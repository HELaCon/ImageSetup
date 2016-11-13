gci $psscriptroot\*.ps1 -Recurse | where { $_.Name -ne (Split-Path $PSCommandPath -Leaf) } | % { . $_.FullName }
