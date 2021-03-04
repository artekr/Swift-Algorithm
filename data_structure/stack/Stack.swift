//
//  Stack.swift
//  Created by Heng Wang on 2017-05-01.
//
/* 
 LIFO
 
 Notice that a push puts the new element at the end of the array, not the beginning.

 Inserting at the beginning of an array is expensive, an O(n) operation, because it requires all existing array elements to be shifted in memory.

 Adding at the end is O(1); it always takes the same amount of time, regardless of the size of the array.
*/

// MARK: - Stack

public struct Stack<T> {
  
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public var top: T? {
    return array.last
  }
  
  public mutating func push(_ element: T) {
    array.append(element)
  }
  
  public mutating func pop() -> T? {
    return array.popLast()
  }
}
