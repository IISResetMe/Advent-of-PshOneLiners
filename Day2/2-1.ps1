param([string[]]$boxes)$boxes|%{$p=0}{$l,$w,$h=$_-split'x'-as[int[]];$p+=($l*$w+$w*$h+$h*$l)*2+(($l*$w*$h)/[Math]::Max($h,[Math]::Max($l,$w)))}{$p}
