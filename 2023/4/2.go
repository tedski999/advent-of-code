package main

import (
	"fmt"
	"io"
	"os"
	"strings"
)

func main() {
	stdin, err := io.ReadAll(os.Stdin)
	if err != nil { panic(err) }
	str := strings.TrimSuffix(string(stdin), "\n")

	lines := strings.Split(str, "\n")

	copies := make([]int, len(lines), len(lines))
	for i, _ := range copies { copies[i] = 1 }

	sum := 0
	for n, line := range lines {
		wins := map[string]bool{}
		nums := map[string]bool{}

		for i :=  9; i <  9+10*3; i += 3 { wins[line[i:i+3]] = true }
		for i := 41; i < 41+25*3; i += 3 { nums[line[i:i+3]] = true }

		matches := 0
		for win, _ := range wins { if nums[win] { matches += 1 } }

		for i := 0; i < matches; i++ { copies[n+1+i] += copies[n] }
		sum += copies[n]
	}

	fmt.Println(sum)
}
