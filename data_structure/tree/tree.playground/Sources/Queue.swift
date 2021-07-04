public struct Queue<T> {
  private var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public var count: Int {
    return array.count
  }

  public var peek: T? {
    return array.first
  }

  // O(1)
  // Because an array in Swift always has some empty space at the end. Adding a new element is just copying memory from one place to another which is a constant-time operation.
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  // O(n)
  // Because it requires all remaining array elements to be shifted in memory.
  public mutating func dequeue() -> T? {
    isEmpty ? nil : array.removeFirst()
  }
}
