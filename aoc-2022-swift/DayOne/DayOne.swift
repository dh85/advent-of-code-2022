let day1Input = readFile(name: "Day01.txt")

func day1Part1(input: String) -> Int {
    input.parseElves(1)
}

func day1Part2(input: String) -> Int {
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
