"use strict";

const rl = require("readline").createInterface({ input: process.stdin, output: process.stdout, terminal: false });

let state = 0;
let nums = [];
let mapped = [];

function on_line(line) {
	switch (state) {

		case 0:
			nums = Array.from(line.slice(7).split(" "), Number);
			state = 1;
			break;

		case 1:
			if (line) {
				const [dst, src, rng] = Array.from(line.split(" "), Number);
				for (let i = nums.length - 1; i >= 0; i--) {
					if (nums[i] >= src && nums[i] < src + rng) {
						mapped.push(nums[i] + (dst - src));
						nums.splice(i, 1);
					}
				}
			} else {
				nums = nums.concat(mapped);
				mapped = [];
				state = 2;
				if (line == undefined) {
					console.log(Math.min(...nums));
				}
			}
			break;

		case 2:
			state = 1;
			break;
	}
}

rl.on("line", on_line);
rl.once("close", on_line);
