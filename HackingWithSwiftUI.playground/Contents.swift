import UIKit

// Chackpoint 9
//Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.
// I want you to write your function in a single line of code.

func randomNumber (_ arrayInt : [Int]?) -> Int { arrayInt?.randomElement() ?? Int.random(in: 1..<100) }

let arrayNum: [Int]? = nil

print(randomNumber(arrayNum))
