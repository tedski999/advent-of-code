import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.stream.Stream;
import java.util.stream.IntStream;

class Solution {
	public static void main(String[] args) throws Exception {
		Integer sum = 0;
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		for (String line = br.readLine(); line != null; line = br.readLine())
			sum += get_next(Stream
				.of(line.split("\\s+"))
				.map(Integer::valueOf)
				.toArray(Integer[]::new));
		System.out.println(sum);
	}

	static Integer get_next(Integer nums[]) {
		for (Integer num : nums)
			if (num != 0)
				return nums[0] + get_next(IntStream
					.range(0, nums.length - 1)
					.mapToObj(i -> nums[i] - nums[i+1])
					.toArray(Integer[]::new));
		return 0;
	}
}
