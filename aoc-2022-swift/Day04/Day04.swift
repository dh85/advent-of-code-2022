let day04Input = readFile(name: "Day04.txt").lines()

func day04Part1(input: [String]) -> Int {
    var pairs = 0
    for entry in input {
        let rows = entry.split(separator: ",")
        let first = (rows[0].split(separator: "-")).compactMap { Int($0) }
        let second = (rows[1].split(separator: "-")).compactMap { Int($0) }

        if first[0] <= second[0] && first[1] >= second[1] {
            pairs += 1
        } else if second[0] <= first[0] && second[1] >= first[1] {
            pairs += 1
        }
    }
    return pairs
}
