struct Heap<T: Equatable> {
  var elements: [T] = []
  let sort: (T, T) -> Bool

  init(sort: @escaping (T, T) -> Bool) {
    self.sort = sort
  }

  var isEmpty: Bool {
    elements.isEmpty
  }

  var count: Int {
    elements.count
  }

  func peek() -> T? {
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
}

