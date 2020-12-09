import Foundation

let numbers = try String(contentsOfFile: "./input.txt", encoding: .utf8)
  .components(separatedBy: "\n")
  .map { s in Int(s)! }

func firstInvalidNumber(_ seq: [Int], preamble: Int) -> Int? {
  for i in preamble...(seq.count - 1) {
    if isInvalidNumber(seq[i], preamble: seq[(i - preamble)...(i - 1)].sorted()) {
      return seq[i]
    }
  }
  return nil
}

func isInvalidNumber(_ n: Int, preamble: [Int]) -> Bool {
  if n < preamble.first! || n >= preamble.last! * 2 {
    return true
  }

  for a in preamble {
    for b in preamble.reversed() {
      if a != b && a + b == n {
        return false
      }
    }
  }

  return true
}

print(firstInvalidNumber(numbers, preamble: 25)!)
