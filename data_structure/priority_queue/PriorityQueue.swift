//
//  Priority Queue.swift
//  Created by Heng Wang on 2017-05-01.
//
/*
 A priority queue is a queue where the most important element is always at the front.
 
 The queue can be a max-priority queue (largest element first) or a min-priority queue (smallest element first).
 
 Based on a heap.
 */


public struct PriorityQueue<T> {
  
  fileprivate var heap: Heap<T>
  
  public init(sort: (T, T) -> Bool) {
    heap = Heap(sort: sort)
  }
  
  public var isEmpty: Bool {
    return heap.isEmpty
  }
  
  public var count: Int {
    return heap.count
  }
  
  public func peek() -> T? {
    return heap.peek()
  }
  
  public mutating func enqueue(element: T) {
    heap.insert(element)
  }
  
  public mutating func dequeue() -> T? {
    return heap.remove()
  }
  
  public mutating func changePriority(index i: Int, value: T) {
    return heap.replace(index: i, value: value)
  }
  
}
