//: Queue

// A queue is a list where you can only insert new items at the back and remove items from the front.

/************************************************************************/
// MARK: - Queue
public struct Queue<T> {
  
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public var front: T? {
    return array.first
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  // To dequeue, we remove the element from the beginning of the array. This is always an O(n) operation because it requires all remaining array elements to be shifted in memory.
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
}

/************************************************************************/
// MARK: - More Efficient Queue

public struct MoreEfficientQueue<T> {
  
  fileprivate var array = [T?]()
  fileprivate var head = 0        // The index in the array of the front-most object.
  
  public var isEmpty: Bool {
    return count == 0
  }
  
  public var count: Int {
    return array.count - head
  }
  
  public var front: T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }
  
  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  // Whenever we dequeue an item, we do not shift the contents of the array to the front (slow) but mark the item's position in the array as empty (fast).
  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else {
      return nil
    }
    
    array[head] = nil
    head += 1
    
    // To periodically trim down the array, we do the following:
    let percentage = Double(head) / Double(array.count)
    if array.count > 50 && percentage > 0.25 {
      array.removeFirst(head)
      head = 0
    }
    return element
  }
}


/************************************************************************/
// MARK: - Test

// Queue Test
var q1 = Queue<String>()
q1.array

q1.enqueue("Ada")
q1.enqueue("Steve")
q1.enqueue("Tim")
q1.array
q1.count

q1.dequeue()
q1.array
q1.count

q1.dequeue()
q1.array
q1.count

q1.enqueue("Kevin")
q1.array
q1.count

// More Efficient Queue Test
var q2 = MoreEfficientQueue<String>()
q2.array

q2.enqueue("Ada")
q2.enqueue("Steve")
q2.enqueue("Tim")
q2.array
q2.count

q2.dequeue()
q2.array
q2.count

q2.dequeue()
q2.array
q2.count

q2.enqueue("Kevin")
q2.array
q2.count










