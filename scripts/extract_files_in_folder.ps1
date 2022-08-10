Get-ChildItem "." |
Foreach-Object {
    if ( $_.Extension -eq ".cct" -or $_.Extension -eq ".dcr"  )
    {
        Write-Output $_.Name
        if($_.Extension -eq ".cct") {
            .\projector_rays.exe $_.Name $_.Name.Replace(".cct", ".cst")
        }
        
        if($_.Extension -eq ".dcr") {
            .\projector_rays.exe $_.Name $_.Name.Replace(".dcr", ".dir")
        }
    }
    
}