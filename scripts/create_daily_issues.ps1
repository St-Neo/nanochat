param(
    [string]$Repo = "ZaidKadiri/nanochat",
    [string]$PlanFile = "daily_step_by_step.md",
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $PlanFile)) {
    throw "Plan file not found: $PlanFile"
}

$content = Get-Content -Path $PlanFile -Raw
$dayPattern = '(?ms)^### Day (\d+) - (\d{4}-\d{2}-\d{2}) \(([^)]+)\) - ([^\r\n]+)\r?\n(.*?)(?=^### Day \d+ - |\z)'
$dayMatches = [regex]::Matches($content, $dayPattern)

if ($dayMatches.Count -eq 0) {
    throw "No day sections were parsed from $PlanFile"
}

$existingTitles = @{}
$existingIssuesJson = gh issue list --repo $Repo --state all --limit 500 --json title
$existingIssues = $existingIssuesJson | ConvertFrom-Json
foreach ($issue in $existingIssues) {
    $existingTitles[$issue.title] = $true
}

$created = 0
$skipped = 0

foreach ($match in $dayMatches) {
    $day = [int]$match.Groups[1].Value
    $date = $match.Groups[2].Value
    $dow = $match.Groups[3].Value
    $duration = $match.Groups[4].Value.Trim()
    $block = $match.Groups[5].Value

    $title = ("[Roadmap] Day {0:D2} - {1} ({2})" -f $day, $date, $dow)
    if ($existingTitles.ContainsKey($title)) {
        $skipped++
        continue
    }

    $readWatch = "See daily plan"
    $readMatch = [regex]::Match($block, '(?m)^- Read/Watch:\s*(.+)$')
    if ($readMatch.Success) {
        $readWatch = $readMatch.Groups[1].Value.Trim()
    }

    $learn = "See day learning goal"
    $learnMatch = [regex]::Match($block, '(?m)^- Learn:\s*(.+)$')
    if ($learnMatch.Success) {
        $learn = $learnMatch.Groups[1].Value.Trim()
    }

    $affirmation = "I make steady progress each day."
    $affirmationMatch = [regex]::Match($block, '(?m)^- Affirmation:\s*(.+)$')
    if ($affirmationMatch.Success) {
        $affirmation = $affirmationMatch.Groups[1].Value.Trim()
    }

    $steps = @()
    $stepMatches = [regex]::Matches($block, '(?m)^\d+\.\s+(.+)$')
    foreach ($stepMatch in $stepMatches) {
        $steps += $stepMatch.Groups[1].Value.Trim()
    }
    if ($steps.Count -eq 0) {
        $steps += "Complete planned tasks for today."
    }

    $taskLines = ($steps | ForEach-Object { "- [ ] $_" }) -join "`n"
    $dayPad = ("{0:D2}" -f $day)

    $body = @"
## Schedule
- Date: $date ($dow)
- Planned Duration: $duration
- Time Block: 10:00 PM to 1:00 AM

## Read/Watch
- $readWatch

## Tasks
$taskLines

## Learning Outcome
- $learn

## Daily Affirmation
> $affirmation

## Done Checklist
- [ ] Read/watch completed
- [ ] Tasks implemented
- [ ] Notes saved to ``daily-log/day-$dayPad.md``
- [ ] Twitter + LinkedIn post published
"@

    if ($DryRun) {
        Write-Host "DRY RUN - Would create: $title"
        continue
    }

    $tmp = New-TemporaryFile
    try {
        Set-Content -Path $tmp.FullName -Value $body -NoNewline
        gh issue create --repo $Repo --title $title --body-file $tmp.FullName | Out-Null
        $created++
        $existingTitles[$title] = $true
        Write-Host "Created: $title"
    }
    finally {
        Remove-Item -Path $tmp.FullName -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "Done. Created=$created Skipped=$skipped TotalDays=$($dayMatches.Count)"
