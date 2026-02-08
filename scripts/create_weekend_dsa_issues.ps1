param(
    [string]$Repo = "St-Neo/nanochat",
    [string]$Assignee = "St-Neo",
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$sessions = @(
    @{ Num=1;  Date="2026-02-14"; Day="Sat"; Topic="Big-O, Arrays, and Strings"; RoadmapIssue=6;  Learn="Understand time/space complexity and core array/string patterns."; Implement="Solve 2 beginner problems (one array, one string) and document complexity for each." },
    @{ Num=2;  Date="2026-02-15"; Day="Sun"; Topic="Hash Maps and Sets"; RoadmapIssue=7;  Learn="Use dictionaries/sets for counting, dedup, and frequency-based logic."; Implement="Solve 2 hashing problems and compare brute force vs hashmap approaches." },
    @{ Num=3;  Date="2026-02-21"; Day="Sat"; Topic="Stacks, Queues, and Deque"; RoadmapIssue=13; Learn="Choose correct LIFO/FIFO structure and reason about amortized operations."; Implement="Implement a stack/queue mini exercise and solve 2 stack/queue problems." },
    @{ Num=4;  Date="2026-02-22"; Day="Sun"; Topic="Two Pointers and Sliding Window"; RoadmapIssue=14; Learn="Identify contiguous-window and bidirectional-scan patterns."; Implement="Solve 2 sliding window/two-pointer problems and write template snippets." },
    @{ Num=5;  Date="2026-02-28"; Day="Sat"; Topic="Recursion and Binary Search"; RoadmapIssue=20; Learn="Understand recursion stack behavior and monotonic search boundaries."; Implement="Solve 1 recursion problem and 2 binary-search boundary problems." },
    @{ Num=6;  Date="2026-03-01"; Day="Sun"; Topic="Trees and BST Traversals"; RoadmapIssue=21; Learn="Practice DFS/BFS traversals and BST invariants."; Implement="Implement preorder/inorder/postorder and solve 2 tree problems." },
    @{ Num=7;  Date="2026-03-07"; Day="Sat"; Topic="Heaps and Priority Queues"; RoadmapIssue=27; Learn="Use min-heap/max-heap for top-k and streaming priorities."; Implement="Solve 2 heap-based problems; map one idea to serving queue prioritization." },
    @{ Num=8;  Date="2026-03-08"; Day="Sun"; Topic="Graphs: BFS and DFS"; RoadmapIssue=28; Learn="Build adjacency representations and traverse components."; Implement="Solve 2 graph traversal problems and compare iterative vs recursive DFS." },
    @{ Num=9;  Date="2026-03-14"; Day="Sat"; Topic="Union-Find and Connected Components"; RoadmapIssue=34; Learn="Use disjoint set union for connectivity queries efficiently."; Implement="Implement DSU and solve 1-2 component/merge problems." },
    @{ Num=10; Date="2026-03-15"; Day="Sun"; Topic="Tries and Prefix Search"; RoadmapIssue=35; Learn="Understand prefix trees and autocomplete-like lookups."; Implement="Build a small trie and solve one prefix-query problem." },
    @{ Num=11; Date="2026-03-21"; Day="Sat"; Topic="Dynamic Programming I (1D/2D Basics)"; RoadmapIssue=41; Learn="Translate recursion to memoization/tabulation."; Implement="Solve 2 DP basics and write state-transition notes." },
    @{ Num=12; Date="2026-03-22"; Day="Sun"; Topic="Dynamic Programming II (Patterns)"; RoadmapIssue=42; Learn="Practice knapsack/LCS or similar classic DP patterns."; Implement="Solve 2 pattern-based DP problems and compare complexity tradeoffs." },
    @{ Num=13; Date="2026-03-28"; Day="Sat"; Topic="Greedy Algorithms and Intervals"; RoadmapIssue=48; Learn="Identify greedy-choice property and interval sorting logic."; Implement="Solve 2 greedy/interval problems and justify correctness." },
    @{ Num=14; Date="2026-03-29"; Day="Sun"; Topic="Backtracking and Search Trees"; RoadmapIssue=49; Learn="Use constrained DFS for combinatorial generation."; Implement="Solve 1-2 backtracking problems and prune search space explicitly." },
    @{ Num=15; Date="2026-04-04"; Day="Sat"; Topic="Practical DS in Python for Systems"; RoadmapIssue=55; Learn="Apply dict/list/deque/heapq/cache patterns in real service code."; Implement="Refactor one small utility in repo using a better data structure." },
    @{ Num=16; Date="2026-04-05"; Day="Sun"; Topic="Mixed Mock + DSA Retrospective"; RoadmapIssue=56; Learn="Integrate patterns, timing, and error diagnosis under constraints."; Implement="Do one timed mixed set, summarize weak areas, and define next-month DSA plan." }
)

Write-Host "Ensuring labels exist on $Repo ..."
$labels = @(
    @{ name="dsa"; color="0052CC"; description="Data structures and algorithms practice" },
    @{ name="weekend-track"; color="5319E7"; description="Weekend-focused learning track" }
)

$existingLabels = gh label list --repo $Repo --limit 200 --json name | ConvertFrom-Json
$existingLabelNames = @{}
foreach ($l in $existingLabels) { $existingLabelNames[$l.name] = $true }

foreach ($label in $labels) {
    if (-not $existingLabelNames.ContainsKey($label.name)) {
        if (-not $DryRun) {
            gh label create $label.name --repo $Repo --color $label.color --description $label.description | Out-Null
        }
        Write-Host "Label created: $($label.name)"
    } else {
        Write-Host "Label exists: $($label.name)"
    }
}

Write-Host "Ensuring milestone exists on $Repo ..."
$milestoneTitle = "DSA Weekend Track"
$milestones = gh api "repos/$Repo/milestones?state=all&per_page=100" | ConvertFrom-Json
$msExists = $false
foreach ($m in $milestones) {
    if ($m.title -eq $milestoneTitle) { $msExists = $true; break }
}
if (-not $msExists) {
    if (-not $DryRun) {
        gh api "repos/$Repo/milestones" -f title="$milestoneTitle" -f description="Weekend DSA sessions paired with roadmap weekends" -f due_on="2026-04-06T00:00:00Z" -f state="open" | Out-Null
    }
    Write-Host "Milestone created: $milestoneTitle"
} else {
    Write-Host "Milestone exists: $milestoneTitle"
}

$existingIssueTitles = @{}
$existingIssues = gh issue list --repo $Repo --state all --limit 500 --json title | ConvertFrom-Json
foreach ($ei in $existingIssues) { $existingIssueTitles[$ei.title] = $true }

$created = 0
$skipped = 0

foreach ($s in $sessions) {
    $numPad = "{0:D2}" -f $s.Num
    $title = "[DSA Weekend] Session $numPad - $($s.Date) ($($s.Day)): $($s.Topic)"
    if ($existingIssueTitles.ContainsKey($title)) {
        $skipped++
        Write-Host "Skipped existing: $title"
        continue
    }

    $body = @"
## Weekend DSA Session
- Date: $($s.Date) ($($s.Day))
- Time Budget: 60-90 min DSA + remaining time for roadmap implementation
- Paired roadmap issue: #$($s.RoadmapIssue)

## Learning Goal
$($s.Learn)

## Implementation Goal
$($s.Implement)

## Suggested Flow
- [ ] 15 min: review concept notes
- [ ] 45-60 min: solve problems
- [ ] 10 min: write complexity and pattern summary
- [ ] 5 min: capture one reusable template/snippet

## Completion Checklist
- [ ] DSA practice done
- [ ] Notes added to `daily-log/`
- [ ] Connection to paired roadmap issue documented
"@

    if ($DryRun) {
        Write-Host "DRY RUN - Would create: $title"
        continue
    }

    $tmp = New-TemporaryFile
    try {
        Set-Content -Path $tmp.FullName -Value $body -NoNewline
        gh issue create `
            --repo $Repo `
            --title $title `
            --body-file $tmp.FullName `
            --assignee $Assignee `
            --milestone "$milestoneTitle" `
            --label dsa `
            --label weekend-track | Out-Null
        $created++
        Write-Host "Created: $title"
    }
    finally {
        Remove-Item $tmp.FullName -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "Done. Created=$created Skipped=$skipped"
