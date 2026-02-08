param(
    [string]$Repo = "ZaidKadiri/nanochat",
    [string]$Assignee = "ZaidKadiri"
)

$ErrorActionPreference = "Stop"

Write-Host "Configuring labels for $Repo ..."
$desiredLabels = @(
    @{ name = "roadmap"; color = "0E8A16"; description = "Day-by-day roadmap tasks" },
    @{ name = "ml";      color = "1D76DB"; description = "ML, modeling, and training tasks" },
    @{ name = "gcp";     color = "FBCA04"; description = "Google Cloud deployment and operations" },
    @{ name = "obs";     color = "5319E7"; description = "Observability and reliability tasks" },
    @{ name = "rag";     color = "C2E0C6"; description = "Retrieval-augmented generation tasks" },
    @{ name = "week-1";  color = "BFDADC"; description = "Week 1 tasks (Days 1-7)" },
    @{ name = "week-2";  color = "BFD4F2"; description = "Week 2 tasks (Days 8-14)" },
    @{ name = "week-3";  color = "C5DEF5"; description = "Week 3 tasks (Days 15-21)" },
    @{ name = "week-4";  color = "D4C5F9"; description = "Week 4 tasks (Days 22-28)" },
    @{ name = "week-5";  color = "F9D0C4"; description = "Week 5 tasks (Days 29-35)" },
    @{ name = "week-6";  color = "F7C6C7"; description = "Week 6 tasks (Days 36-42)" },
    @{ name = "week-7";  color = "FEF2C0"; description = "Week 7 tasks (Days 43-49)" },
    @{ name = "week-8";  color = "D4E2A9"; description = "Week 8 tasks (Days 50-56)" },
    @{ name = "week-9";  color = "BFD4F2"; description = "Week 9 tasks (Days 57-60)" }
)

$existingLabels = gh label list --repo $Repo --limit 200 --json name | ConvertFrom-Json
$existingLabelNames = @{}
foreach ($label in $existingLabels) { $existingLabelNames[$label.name] = $true }

foreach ($label in $desiredLabels) {
    if (-not $existingLabelNames.ContainsKey($label.name)) {
        gh label create $label.name --repo $Repo --color $label.color --description $label.description | Out-Null
        Write-Host "Created label: $($label.name)"
    }
    else {
        Write-Host "Label exists: $($label.name)"
    }
}

Write-Host "Configuring milestones for $Repo ..."
$milestones = @(
    @{ title = "Week 1"; description = "Days 1-7 (2026-02-09 to 2026-02-15)"; due_on = "2026-02-15T23:59:00Z" },
    @{ title = "Week 2"; description = "Days 8-14 (2026-02-16 to 2026-02-22)"; due_on = "2026-02-22T23:59:00Z" },
    @{ title = "Week 3"; description = "Days 15-21 (2026-02-23 to 2026-03-01)"; due_on = "2026-03-01T23:59:00Z" },
    @{ title = "Week 4"; description = "Days 22-28 (2026-03-02 to 2026-03-08)"; due_on = "2026-03-08T23:59:00Z" },
    @{ title = "Week 5"; description = "Days 29-35 (2026-03-09 to 2026-03-15)"; due_on = "2026-03-15T23:59:00Z" },
    @{ title = "Week 6"; description = "Days 36-42 (2026-03-16 to 2026-03-22)"; due_on = "2026-03-22T23:59:00Z" },
    @{ title = "Week 7"; description = "Days 43-49 (2026-03-23 to 2026-03-29)"; due_on = "2026-03-29T23:59:00Z" },
    @{ title = "Week 8"; description = "Days 50-56 (2026-03-30 to 2026-04-05)"; due_on = "2026-04-05T23:59:00Z" },
    @{ title = "Week 9"; description = "Days 57-60 (2026-04-06 to 2026-04-09)"; due_on = "2026-04-12T23:59:00Z" }
)

$existingMilestones = gh api "repos/$Repo/milestones?state=all&per_page=100" | ConvertFrom-Json
$existingMilestoneTitles = @{}
foreach ($ms in $existingMilestones) { $existingMilestoneTitles[$ms.title] = $true }

foreach ($ms in $milestones) {
    if (-not $existingMilestoneTitles.ContainsKey($ms.title)) {
        gh api "repos/$Repo/milestones" -f title="$($ms.title)" -f description="$($ms.description)" -f due_on="$($ms.due_on)" -f state="open" | Out-Null
        Write-Host "Created milestone: $($ms.title)"
    }
    else {
        Write-Host "Milestone exists: $($ms.title)"
    }
}

Write-Host "Assigning labels, milestones, and assignee ..."
$issues = gh issue list --repo $Repo --state open --limit 200 --json number,title | ConvertFrom-Json

$updated = 0
$skipped = 0
foreach ($issue in $issues) {
    $m = [regex]::Match($issue.title, '^\[Roadmap\] Day (\d{2}) - ')
    if (-not $m.Success) {
        $skipped++
        continue
    }

    $day = [int]$m.Groups[1].Value
    $week = [math]::Ceiling($day / 7.0)
    if ($week -lt 1) { $week = 1 }
    if ($week -gt 9) { $week = 9 }
    $weekLabel = "week-$week"
    $milestone = "Week $week"

    $domainLabels = @()
    if ($day -ge 1 -and $day -le 28) { $domainLabels += "ml" }
    elseif ($day -ge 29 -and $day -le 35) { $domainLabels += "gcp" }
    elseif ($day -ge 36 -and $day -le 42) { $domainLabels += "obs" }
    elseif ($day -ge 43 -and $day -le 49) { $domainLabels += "rag" }
    else { $domainLabels += "ml" }

    $args = @("issue", "edit", "$($issue.number)", "--repo", $Repo, "--add-assignee", $Assignee, "--milestone", $milestone, "--add-label", "roadmap", "--add-label", $weekLabel)
    foreach ($label in $domainLabels) {
        $args += @("--add-label", $label)
    }

    gh @args | Out-Null
    $updated++
    Write-Host "Updated issue #$($issue.number) -> $milestone, $weekLabel, $($domainLabels -join ',')"
}

Write-Host "Done. Updated=$updated Skipped=$skipped"
