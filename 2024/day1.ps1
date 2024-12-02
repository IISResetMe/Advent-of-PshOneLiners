gc input.txt |ForEach-Object -Begin {
  $l1 = @()
  $l2 = @()
} -Process {
  # parse input
  $a,$b = -split $_
  $l1 += +$a
  $l2 += +$b
} -End {
  # sort data
  $l1 = @($l1 |Sort-Object)
  $l2 = @($l2 |Sort-Object)

  # calculate part 1 diff-sum
  0..($l1.Count-1) |ForEach-Object {
    [Math]::Abs($l1[$_] - $l2[$_])
  } |Measure-Object -Sum |ForEach-Object { Write-Host "Part 1: $($_.Sum)" -Foreground Green }

  # calculate part 2 diff-sum
  $h2 = $l2 |Group-Object -AsHashtable
  $l1 |ForEach-Object { $h2[$_] } |Measure-Object -Sum |ForEach-Object { Write-Host "Part 2: $($_.Sum)" -Foreground Green }
}
