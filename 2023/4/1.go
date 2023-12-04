package main

import (
	"fmt"
	"io"
	"os"
	"strings"
	"math"
)

func main() {
	stdin, err := io.ReadAll(os.Stdin)
	if err != nil { panic(err) }
	str := strings.TrimSuffix(string(stdin), "\n")

	sum := 0
	for _, line := range strings.Split(str, "\n") {
		wins := map[string]bool{}
		nums := map[string]bool{}

		for i :=  9; i <  9+10*3; i += 3 { wins[line[i:i+3]] = true }
		for i := 41; i < 41+25*3; i += 3 { nums[line[i:i+3]] = true }

		matches := 0
		for win, _ := range wins { if nums[win] { matches += 1 } }
		if matches > 0 { sum += int(math.Pow(float64(2), float64(matches - 1))) }
	}

	fmt.Println(sum)
}
