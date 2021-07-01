//
//  Stack.swift
//  Created by Heng Wang on 2021-07-01.
//
/* 
 LIFO
 
 Notice that a push puts the new element at the end of the array, not the beginning.

 Inserting at the beginning of an array is expensive, an O(n) operation, because it requires all existing array elements to be shifted in memory.

 Adding at the end is O(1); it always takes the same amount of time, regardless of the size of the array.
*/

// MARK: - Stack

public struct Stack<Element> {

  private var storage: [Element] = []

  public init() { }

  public init(_ elements: [Element]) {
    storage = elements
  }

  /// Check if the stack is empty
  public var isEmpty: Bool {
    peek() == nil
  }

  /// The number of items in the stack
  public var count: Int {
    return storage.count
  }

  /**
   Pushes an item to the top of the stack.

   - Parameter element: The item being pushed.
   */
  public mutating func push(_ element: Element) {
    storage.append(element)
  }

  /**
   Removes and returns the item at the top of the stack

   - Returns: The item at the top of the stack
   */
  public mutating func pop() -> Element? {
    return storage.popLast()
  }

  /// Returns the item at the top of the stack
  public func peek() -> Element? {
    return storage.last
  }
}


/// This allows us to directly print stack with a desired format
extension Stack: CustomStringConvertible {
  public var description: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
  }
}


/// With this we can simply create a stack from an array literal
extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}
