# Auto-update script for GitHub
# This script will automatically commit and push changes to GitHub

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$message = "Auto-update: $timestamp"

Write-Host "Checking for changes..." -ForegroundColor Cyan

# Add all changes
git add .

# Check if there are changes to commit
$status = git status --porcelain
if ($status) {
    Write-Host "Changes detected. Committing..." -ForegroundColor Yellow
    git commit -m $message
    
    Write-Host "Pushing to GitHub..." -ForegroundColor Green
    git push
    
    Write-Host "Successfully updated GitHub!" -ForegroundColor Green
} else {
    Write-Host "No changes to commit." -ForegroundColor Gray
}

Write-Host "Done!" -ForegroundColor Cyan
