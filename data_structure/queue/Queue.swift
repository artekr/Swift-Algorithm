//
//  Queue.swift
//  Created by Heng Wang on 2017-05-01.
//
/*
 FIFO
 A queue is a list where you can only insert new items at the back and remove items from the front.
 */

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


/************************************************************/
// MARK: - A more efficient queue

public struct MoreEfficientQueue<T> {

  private var array = [T?]()
  private var head = 0        // The index in the array of the front-most object.

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
