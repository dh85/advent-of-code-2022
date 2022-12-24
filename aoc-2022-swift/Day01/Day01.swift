private let input = readFile(name: "Day01.txt")

func day01Part1() -> Int {
    input.parseElves(1)
}

func day01Part2() -> Int {
    input.parseElves(3)
}


private extension Array where Element: Numeric, Element: Comparable {
    func topNElves(_ n: Int) -> Element {
        self
            .sorted(by: <)
            .suffix(n)
            .sum()
    }
}

private extension String {
    func parseElves(_ n: Int) -> Int {
        let data = self
            .split(separator: "\n\n")
            .map { elf in
                elf.lines()
                    .compactMap { Int($0) }
                    .sum()
            }

        return data.topNElves(n)
    }
}
