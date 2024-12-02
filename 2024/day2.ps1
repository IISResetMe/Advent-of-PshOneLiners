gc .\input.txt |ForEach-Object -Begin {
  $part1Count = 0
  $part2Count = 0
  function IsSafe {
    param([int[]]$levels)
    $intervals = 1..($levels.Count - 1) |ForEach-Object {
      ($levels[$_-1] - $levels[$_])
    }

    # mixed sign = not strictly inclining/declining
    if (@($intervals |Group-Object {[math]::Sign($_)}).Count -gt 1) {
      return $false
    }

    # empty intervals or too large intervals = unsafe
    if (@($intervals |ForEach-Object {[math]::Abs($_)} |Where-Object {$_ -notin 1..3}).Count) {
      return $false
    }

    return $true
  }
} -Process {
  # parse levels
  $levels = @(-split $_ -as [int[]])
  if(IsSafe -levels:$levels) {
    # test without omissions - this would satisfy both part 1 and part 2 criteria
    $part1Count++
    $part2Count++
    return
  }
  foreach($index in 0..($levels.Count - 1)) {
    # continue testing with fault tolerance, only counts towards part 2
    if(IsSafe -levels:($levels |Select-Object -SkipIndex $index)) {
      $part2Count++
      return
    }
  }
} -End {
  Write-Host "Part 1: $part1Count"
  Write-Host "Part 2: $part2Count"
}
