// I wrote this playground to help me prepare for the Women Who Code Interview workshop,
// where I got to practice being an interviewer and help people with their interview coding questions!
// https://www.meetup.com/Women-Who-Code-Boulder-Denver/events/265112019/
// Fun picture of event that I tweeted here:
// https://twitter.com/sunfishgurl/status/1192099163481051136?s=20

/*
 // Single Number
 */
// This function is the Swift solution to the single number problem described here:
// https://github.com/jenniferwiner/technical-interview-practice/blob/master/easy/single-number.md

var numbers = [3,4,1,9,3,5,1,4,9]
print(numbers)

// Sorting the numbers helps you to see the unique number easily
// but is not necessary to solve the problem
numbers.sort()
print(numbers)

func findUnique(numArray: [Int]) -> Int? {
  let uniqueNum: Int = -1

  var occurances = [Int: Int]()
  for number in numArray {
    if occurances.keys.contains(number) {
      occurances[number] = occurances[number]! + 1
    } else {
      occurances[number] = 1
    }
  }

  for key in occurances.keys {
    if occurances[key] == 1 {
      return key
    }
  }
  return uniqueNum
}

let uniqueNum = findUnique(numArray: numbers)
print(uniqueNum)

/*
 // Array: Left Rotation
 */
// This function is the Swift solution to the Array Left Rotation problem described here:
// https://github.com/jenniferwiner/technical-interview-practice/blob/master/medium/array_leftrotation.md

func leftRotation(numArray: [Int], numRotations: Int) -> [Int] {
  var updatedArray = [Int]()
  let appendedArray = numArray.prefix(numRotations)
  updatedArray = Array(numArray.dropFirst(numRotations))
  updatedArray.append(contentsOf: Array(appendedArray))
  return updatedArray
}

let rotatedArray = leftRotation(numArray: numbers, numRotations: 5)
print(rotatedArray)

/*
 // Valid Parens
 */
// This function is the Swift solution to the Valid Parens problem described here:
// https://github.com/jenniferwiner/technical-interview-practice/blob/master/medium/valid_parens.md

let badParens =  ["(","[",")","]"]
let goodParens = ["{","[","]","}"]

func isValid(parens: [String]) -> Bool {
  let parensDict: [String: String] = [")": "(", "]": "[", "}": "{"]
  var matchingParens = [String]()

  for index in 0..<parens.count {
    if parens[index] == "(" || parens[index] == "[" || parens[index] == "{" {
      matchingParens.append(parens[index])
    } else {

      if matchingParens[matchingParens.count-1] == parensDict[parens[index]] {
        matchingParens.removeLast()
      } else {
        return false
      }

    }
  }

  return matchingParens.count == 0 ? true : false
}

print(isValid(parens: badParens))
print(isValid(parens: goodParens))
