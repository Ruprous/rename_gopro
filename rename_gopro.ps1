# Load GUI assemblies
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName Microsoft.VisualBasic

# Get prefix input from user
$prefix = [Microsoft.VisualBasic.Interaction]::InputBox("Enter file name prefix (e.g. 'geo')", "File Prefix", "video")

if ([string]::IsNullOrWhiteSpace($prefix)) {
    Write-Host "No prefix entered. Operation cancelled."
    exit
}

# Folder selection dialog
$folderDialog = New-Object System.Windows.Forms.FolderBrowserDialog
$folderDialog.Description = "Select folder containing GH0*.mp4 files"
$folderDialog.ShowNewFolderButton = $false

if ($folderDialog.ShowDialog() -eq "OK") {
    $targetFolder = $folderDialog.SelectedPath
    Write-Host "`nTarget folder: $targetFolder`n"

    # Delete .THM and .LRV files (case-insensitive)
    Get-ChildItem -Path $targetFolder | Where-Object {
        $_.Extension.ToLower() -in @(".thm", ".lrv")
    } | ForEach-Object {
        Write-Host "Deleted: $($_.Name)"
        Remove-Item -Path $_.FullName -Force
    }

    # Rename GH0*.mp4 or GH0*.MP4 files with per-date reset counter
    $lastDate = ""
    $counter = 1
    Get-ChildItem -Path $targetFolder | Where-Object {
        $_.Name -like "GH0*" -and $_.Extension.ToLower() -eq ".mp4"
    } | Sort-Object LastWriteTime | ForEach-Object {
        $date = $_.LastWriteTime.ToString("yyyy-MM-dd")
        if ($date -ne $lastDate) {
            $counter = 1
            $lastDate = $date
        }
        $newName = "{0}_{1}_{2:000}.mp4" -f $prefix, $date, $counter
        $newPath = Join-Path $targetFolder $newName
        Write-Host "Renamed: $($_.Name) -> $newName"
        Rename-Item -Path $_.FullName -NewName $newPath
        $counter++
    }

    Write-Host "Renaming completed."
} else {
    Write-Host "Folder selection cancelled."
}
