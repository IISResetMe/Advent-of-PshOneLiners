[regex]::Matches((gc .\input.txt), 'do\(\)|don''t\(\)|mul\((\d{1,3}),(\d{1,3})\)') |ForEach-Object -Begin {
  # track the do/don't state
  $do = $true
  $part1Sum = 0
  $part2Sum = 0
} -Process { 
  # handle do/don't toggles
  if ($_.Value -eq 'do()') {
    $do = $true
  }
  elseif ($_.Value -eq 'don''t()') {
    $do = $false
  }
  else {
    # otherwise perform multiplication, update relevant sums
    $product = +$_.Groups[1].Value * +$_.Groups[2].Value
    $part1Sum += $product
    if ($do) {
      $part2Sum += $product
    }
  }
} -End {
  Write-Host "Part 1: ${part1Sum}"
  Write-Host "Part 2: ${part2Sum}"
}
