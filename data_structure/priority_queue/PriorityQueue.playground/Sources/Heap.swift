public struct Heap<T: Equatable> {
  var elements: [T] = []
  let sort: (T, T) -> Bool

  public init(sort: @escaping (T, T) -> Bool, elements: [T] = []) {
    self.sort = sort
    self.elements = elements

    if !elements.isEmpty {
      for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
        siftDown(from: i)
      }
    }
  }

  public var isEmpty: Bool {
    elements.isEmpty
  }

  public var count: Int {
    elements.count
  }

  public func peek() -> T? {
    elements.first
  }

  func leftChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 1
  }

  func rightChildIndex(ofParentAt index: Int) -> Int {
    (2 * index) + 2
  }

  func parentIndex(ofChildAt index: Int) -> Int {
    (index - 1) / 2
  }

  /// get the min or max node
  public mutating func remove() -> T? {
    guard !isEmpty else {
      return nil
    }
    elements.swapAt(0, count - 1)

    // This block will be performed after the function has been returned
    defer {
      siftDown(from: 0)
    }

    return elements.removeLast()
  }

  mutating func siftDown(from index: Int) {
    var parent = index
    while true {
      let left = leftChildIndex(ofParentAt: parent)
      let right = rightChildIndex(ofParentAt: parent)
      var candidate = parent
      if left < count && sort(elements[left], elements[candidate]) {
        candidate = left
      }
      if right < count && sort(elements[right], elements[candidate]) {
        candidate = right
      }
      if candidate == parent {
        return
      }
      elements.swapAt(parent, candidate)
      parent = candidate
    }
  }

  /// Inserting an elemtents, usually append at the end of the array
  public mutating func insert(_ element: T) {
    elements.append(element)
    siftUp(from: elements.count - 1)
  }

  mutating func siftUp(from index: Int) {
    var child = index
    var parent = parentIndex(ofChildAt: child)
    while child > 0 && sort(elements[child], elements[parent]) {
      elements.swapAt(child, parent)
      child = parent
      parent = parentIndex(ofChildAt: child)
    }
  }

  /// Removing from an arbitrary index
  public mutating func remove(at index: Int) -> T? {
    guard index < elements.count else {
      return nil
    }
    if index == elements.count - 1 {
      return elements.removeLast()
    } else {
      elements.swapAt(index, elements.count - 1)
      defer {
        siftDown(from: index)
        siftUp(from: index)
      }
      return elements.removeLast()
    }
  }

  /// Searching for an element in a heap
  public func index(of element: T, startingAt i: Int) -> Int? {
    if i >= count {
      return nil
    }
    if sort(element, elements[i]) {
      return nil
    }
    if element == elements[i] {
      return i
    }
    if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
      return j
    }
    if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
      return j
    }
    return nil
  }
}
