"use strict";

const rl = require("readline").createInterface({ input: process.stdin, output: process.stdout, terminal: false });

let state = 0;
let nums = [];
let mapped = [];

function on_line(line) {
	switch (state) {

		case 0:
			const input = Array.from(line.slice(7).split(" "), Number);
			for (let i = 0; i < input.length; i += 2)
			nums.push([input[i+0], input[i+0] + input[i+1]]);
			state = 1;
			break;

		case 1:
			if (line) {
				const [dst, src, rng] = Array.from(line.split(" "), Number);
				const end = src + rng;
				const d = dst - src;
				for (let i = nums.length - 1; i >= 0; i--) {
					if (nums[i][1] < src || nums[i][0] >= end) {
						continue;
					} else if (nums[i][0] < src && nums[i][1] <= end) {
						mapped.push([src + d, nums[i][1] + d]);
						nums[i][1] = src;
					} else if (nums[i][0] < src && nums[i][1] > end) {
						mapped.push([src + d, end + d]);
						nums.push([end, nums[i][1]]);
						nums[i][1] = src;
					} else if (nums[i][0] >= src && nums[i][1] <= end) {
						mapped.push([nums[i][0] + d, nums[i][1] + d]);
						nums.splice(i, 1);
					} else if (nums[i][0] >= src && nums[i][1] > end) {
						mapped.push([nums[i][0] + d, end + d]);
						nums[i][0] = end;
					}
				}
			} else {
				nums = nums.concat(mapped);
				mapped = [];
				state = 2;
				if (line == undefined) {
					console.log(nums.reduce((a, b) => a[0] < b[0] ? a : b)[0]);
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
