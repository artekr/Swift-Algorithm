public protocol Queue {
  associatedtype T
  var isEmpty: Bool { get }
  var peek: T? { get }
  mutating func enqueue(_ element: T) -> Bool
  mutating func dequeue() -> T?
}
