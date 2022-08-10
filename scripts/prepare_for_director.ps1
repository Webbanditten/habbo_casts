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
        $backup_name = $_.BaseName + "_" + [int][double]::Parse((Get-Date -UFormat %s)) + "_initial" + $_.Extension
        Copy-Item $_.Name $workspace_backup"/"$backup_name
        Copy-Item $_.Name $workspace_name -Force
    }
    
}