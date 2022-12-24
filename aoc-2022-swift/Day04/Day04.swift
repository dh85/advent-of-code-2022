let day04Input = readFile(name: "Day04.txt").lines()

func day04Part1(input: [String]) -> Int {
    var pairs = 0
    for entry in input {
        let (first, second) = numbersPair(entry)

        if first[0] <= second[0] && first[1] >= second[1] {
            pairs += 1
        } else if second[0] <= first[0] && second[1] >= first[1] {
            pairs += 1
        }
    }
    return pairs
}

func day04Part2(input: [String]) -> Int {
    var pairs = 0
    for entry in input {
        let (first, second) = numbersPair(entry)
        
        if (second[0]...second[1]).contains(first[0]) || (second[0]...second[1]).contains(first[1]) {
            pairs += 1
        } else if (first[0]...first[1]).contains(second[0]) || (first[0]...first[1]).contains(second[1]) {
            pairs += 1
        }
    }
    return pairs
}

private func numbersPair(_ entry: String) -> ([Int], [Int]) {
    let numbers = entry.split(separator: ",")
    let first = (numbers[0].split(separator: "-")).compactMap { Int($0) }
    let second = (numbers[1].split(separator: "-")).compactMap { Int($0) }
    return (first, second)
}
