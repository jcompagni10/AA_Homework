package main

import "fmt"

func main() {
	numSlice := []int{5, 4, 345, 36, 1, 1}
	numSlice2 := numSlice[3:5]

	for _, value := range numSlice2 {
		fmt.Println(value)
	}
}
