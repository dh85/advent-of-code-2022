import Foundation

func readFile(name: String) -> String {
    let url = URL(filePath: name)
    let data = try! Data(contentsOf: url)
    return String(data: data, encoding: .utf8)!
}


extension String.SubSequence {
    func lines() -> [String] { components(separatedBy: "\n") }
}

extension String {
    func lines() -> [String] { components(separatedBy: "\n") }
}

extension Collection where Element: Numeric {
    func sum() -> Element { reduce(0, +) }
}
