<?php

$dirs = fgets(STDIN);
fgets(STDIN);
while ($line = fgets(STDIN)) {
	[$node, $edges] = explode(" = ", $line);
	[$left, $right] = explode(", ", $edges);
	$network[$node]["L"] = substr($left, 1, 3);
	$network[$node]["R"] = substr($right, 0, 3);
}

$nodes = array_keys($network);
$start = array_filter($nodes, function($node) { return substr($node, -1) == "A"; });
$steps = array_map(function($node) use ($network, $dirs) {
	for ($step = 0; substr($node, -1) != "Z"; $step++)
		$node = $network[$node][substr($dirs, $step % (strlen($dirs) - 1), 1)];
	return $step;
}, $start);
$lcm = array_reduce($steps, function($lcm, $step) { return gmp_lcm($lcm, $step); }, 1);

echo $lcm, "\n";

?>
