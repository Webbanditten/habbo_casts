$versionFolder = ".\custom_versions";

$basePath = $versionFolder + "\";

function Extract-CCT {

    param (
        $pVersionFolder
    )

    cd $pVersionFolder

    Get-ChildItem "." |
    Foreach-Object {
        if ( $_.Extension -eq ".cct" -or $_.Extension -eq ".dcr"  )
        {
            $folderPath = ".\decompiled\" + $_.BaseName;
            Write-Output $_.Name
            if($_.Extension -eq ".cct" -and $_.Name -ne "empty.cct") {
                createFolderIfNotExist($folderPath)
                Copy-Item $_.Name $folderPath
                cd $folderPath
                ..\..\..\..\projector_rays.exe $_.Name $_.Name.Replace(".cct", ".cst") --dump-scripts
                cd ..\..
            }
        
            if($_.Extension -eq ".dcr") {
                createFolderIfNotExist($folderPath)
                Copy-Item $_.Name $folderPath
                cd $folderPath
                ..\..\..\..\projector_rays.exe $_.Name $_.Name.Replace(".dcr", ".dir") --dump-scripts
                cd ..\..
            }
        }
    
    }
    cd ..\..

}

function createFolderIfNotExist {
    param (
        $path
    )
    If(!(test-path $path))
    {
          New-Item -ItemType Directory -Force -Path $path
    }
}

 
Get-ChildItem $basePath -Directory |
Foreach-Object {
    Extract-CCT($basePath + $_.Basename)
}

#Extract-CCT(".\current_version\hotel")