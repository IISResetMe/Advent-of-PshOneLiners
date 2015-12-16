param([string[]]$boxes)$boxes|%{$p=0}{$l,$w,$h=$_-split'x'-as[int[]];$p+=$l*$w*$h+($l+$w+$h-[Math]::Max($h,[Math]::Max($l,$w)))*2}{$p}
