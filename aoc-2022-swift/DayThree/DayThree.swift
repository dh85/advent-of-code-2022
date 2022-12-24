private let day3Input = readFile(name: "Day03.txt").lines()
private let characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

func day3Part1() -> Int {
    var totalSum = 0
    for rucksack in day3Input {
        let half = rucksack.count / 2
        let left = Set(rucksack.prefix(half))
        let right = Set(rucksack.suffix(half))

        for (priority, char) in characters.enumerated() {
            if left.contains(char) && right.contains(char) {
                totalSum += priority + 1
            }
        }
    }
    return totalSum
}

func day3Part2() -> Int {
    var j = 3
    var totalSum = 0
    for i in stride(from: 0, to: day3Input.count, by: 3) {
        let rucksacks = Array(day3Input[i..<j])
        j += 3
        
        for (priority, char) in characters.enumerated() {
            if rucksacks[0].contains(char) && rucksacks[1].contains(char) && rucksacks[2].contains(char) {
                totalSum += priority + 1
            }
        }
    }
    return totalSum
}
