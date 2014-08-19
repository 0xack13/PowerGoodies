
Function Get-FolderSize

{

 BEGIN{$fso = New-Object -comobject Scripting.FileSystemObject}

 PROCESS{

    $path = $input.fullname

    $folder = $fso.GetFolder($path)

    $size = $folder.size

    [PSCustomObject]@{'Name' = $path;'Size (MB)' = ($size / 1mb);'Size (GB)' = ($size / 1gb) 
    } 
   }
 }

 Get-ChildItem D:\DevCode\ | Get-FolderSize