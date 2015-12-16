param([string]$s)$s-as[char[]]|%{$i,$c=0,1}{switch($_){"("{$i++}")"{$i--}}if($i-eq(-1)){$c;continue}$c++}
