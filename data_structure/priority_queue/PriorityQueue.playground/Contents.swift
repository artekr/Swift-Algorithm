//: Priority Queue

struct PriorityQueue<T: Equatable>: Queue {
  private var heap: Heap<T>

  init(sort: @escaping (T, T) -> Bool, elements: [T] = []) {
    heap = Heap(sort: sort, elements: elements)
  }

  var isEmpty: Bool {
    heap.isEmpty
  }

  var peek: T? {
    heap.peek()
  }

  mutating func enqueue(_ element: T) -> Bool {
    heap.insert(element)
    return true
  }

  mutating func dequeue() -> T? {
    heap.remove()
  }
}

/**
  Testing
 */

var priorityQueue = PriorityQueue(sort: >, elements: [1,12,3,4,1,6,8,7])
while !priorityQueue.isEmpty {
  print(priorityQueue.dequeue()!)
}
