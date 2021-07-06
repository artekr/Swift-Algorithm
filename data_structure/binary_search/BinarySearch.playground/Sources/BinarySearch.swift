
public extension RandomAccessCollection where Element: Comparable {
  func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
    // First check if range was nil. If so, create a range that covers the entire collection.
    let range = range ?? startIndex..<endIndex
    // Check if the range contains at least one element. If it doesn’t, the search has failed and return nil.
    guard range.lowerBound < range.upperBound else {
      return nil
    }

    // Find the middle index in the range.
    let size = distance(from: range.lowerBound, to: range.upperBound)
    let middle = index(range.lowerBound, offsetBy: size / 2)

    // Return the middle index if value matches.
    if self[middle] == value {
      return middle
    // Recursively search either the left or right half of the collection.
    } else if self[middle] > value {
      return binarySearch(for: value, in: range.lowerBound..<middle)
    } else {
      return binarySearch(for: value, in: index(after: middle)..<range.upperBound)
    }
  }
}
