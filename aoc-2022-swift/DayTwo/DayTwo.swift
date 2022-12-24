let day2Input = readFile(name: "Day02.txt").lines()

private let xAscii = Character("X").asciiValue!

func day2Part1(input: [String]) -> Int {
    func shapeScore(_ shape: Character) -> Int {
        Int(shape.asciiValue! - xAscii + 1)
    }

    func resultScore(_ theirShape: Character, _ myShape: Character) -> Int {
        switch (theirShape, myShape) {
        case ("B", "X"), ("C", "Y"), ("A", "Z"): return 0
        case ("A", "X"), ("B", "Y"), ("C", "Z"): return 3
        case ("C", "X"), ("A", "Y"), ("B", "Z"): return 6
        default: fatalError("Check your inputs")
        }
    }

    return input
        .map { shapeScore($0.last!) + resultScore($0.first!, $0.last!) }
        .sum()
}

func day2Part2(input: [String]) -> Int {
    func shapeScore(_ theirShape: Character, _ desiredResult: Character) -> Int {
        switch (theirShape, desiredResult) {
        case ("A", "Y"), ("B", "X"), ("C", "Z"): return 1
        case ("B", "Y"), ("C", "X"), ("A", "Z"): return 2
        case ("C", "Y"), ("A", "X"), ("B", "Z"): return 3
        default: fatalError("Check your inputs")
        }
    }

    func resultScore(_ result: Character) -> Int {
        Int((result.asciiValue! - xAscii) * 3)
    }

    return input
        .map { shapeScore($0.first!, $0.last!) + resultScore($0.last!) }
        .sum()
}
