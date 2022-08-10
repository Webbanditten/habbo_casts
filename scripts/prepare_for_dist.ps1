Get-ChildItem "." |
Foreach-Object {
    if ( $_.Extension -eq ".cst" -or $_.Extension -eq ".dir"  )
    {
        $workspace_name = "workspace";
        $workspace_backup = "backups";
        $workspace_dist = "dist";
        md -Force $workspace_name
        md -Force $workspace_backup
        md -Force $workspace_dist
        Move-Item -Path ./workspace/$_ -Destination dist/$_
        $backup_name = $_.BaseName + "_" + [int][double]::Parse((Get-Date -UFormat %s)) + "_dist" + $_.Extension
        Copy-Item dist/$_ $workspace_backup/$backup_name
    }
    
}