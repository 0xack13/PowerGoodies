
Function Get-FolderSize

{

 BEGIN{$fso = New-Object -comobject Scripting.FileSystemObject}

 PROCESS{

    $path = $input.fullname

    $folder = $fso.GetFolder($path)

    $size = $folder.size

    [PSCustomObject]@{'Name' = $path;'Size (GB)' = ($size / 1gb) 
    } 
   }
 }

 Get-ChildItem D:\DevCode\0xack13 | Get-FolderSize