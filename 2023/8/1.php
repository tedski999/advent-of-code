<?php

$dirs = fgets(STDIN);
fgets(STDIN);
while ($line = fgets(STDIN)) {
	[$node, $edges] = explode(" = ", $line);
	[$left, $right] = explode(", ", $edges);
	$network[$node]["L"] = substr($left, 1, 3);
	$network[$node]["R"] = substr($right, 0, 3);
}

$steps = 0;
$node = "AAA";
while ($node != "ZZZ") {
	$dir = substr($dirs, $steps % (strlen($dirs) - 1), 1);
	$node = $network[$node][$dir];
	$steps += 1;
}

echo $steps, "\n";

?>
