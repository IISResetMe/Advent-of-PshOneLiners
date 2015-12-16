param([string]$s)$s-as[char[]]|%{$i=0}{switch($_){"("{$i++}")"{$i--}}}{$i}
