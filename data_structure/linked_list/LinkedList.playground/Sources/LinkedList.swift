
/******************************
 Linked List's Node Class Declaration
*/
public class LinkedListNode<T> {
  var value: T
  var next: LinkedListNode?
  weak var previous: LinkedListNode?

  public init(value: T, next: LinkedListNode? = nil) {
    self.value = value
    self.next = next
  }
}

/// This allows us to directly print stack with a desired format
extension LinkedListNode: CustomStringConvertible {
  public var description: String {
    guard let next = next else {
      return "\(value)"
    }
    return "\(value) -> " + String(describing: next) + " "
  }
}

/******************************
 LinkedList
*/
public struct LinkedList<T> {
  public typealias Node = LinkedListNode<T>

  private(set) var head: Node?
  public var tail: Node?

  public init() { }

  public var isEmpty: Bool {
    head == nil
  }

  /// Insert the node at the front of the list
  public mutating func push(_ value: T) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }

  /// Insert the node at the tail of the list
  public mutating func append(_ value: T) {
    guard !isEmpty else {
      push(value)
      return
    }
    tail!.next = Node(value: value)
    tail = tail!.next
  }

  /// Returns the node at a specific position
  public func node(at index: Int) -> LinkedListNode<T>? {
    var currentNode = head
    var currentIndex = 0

    while currentNode != nil && currentIndex < index {
      currentNode = currentNode!.next
      currentIndex += 1
    }
    return currentNode
  }

  /// Insert a new node
  @discardableResult
  public mutating func insert(_ value: T, after node: LinkedListNode<T>) -> LinkedListNode<T> {
    guard tail !== node else {
      append(value)
      return tail!
    }
    node.next = LinkedListNode(value: value, next: node.next)
    return node.next!
  }

  /** Removing values from the list */
  //  pop: Removes the value at the front of the list.
  //  removeLast: Removes the value at the end of the list.
  //  remove(at:): Removes a value anywhere in the list.

  @discardableResult
  public mutating func pop() -> T? {
    defer {
      head = head?.next
      if isEmpty { tail = nil }
    }
    return head?.value
  }

  @discardableResult
  public mutating func removeLast() -> T? {
    guard let head = head else {
      return nil
    }
    guard head.next != nil else {
      return pop()
    }

    var prev = head
    var current = head
    while let next = current.next {
      prev = current
      current = next
    }
    prev.next = nil
    tail = prev
    return current.value
  }

  @discardableResult
  public mutating func remove(after node: LinkedListNode<T>) -> T? {
    defer {
      if node.next === tail {
        tail = node
      }
      node.next = node.next?.next
    }
    return node.next?.value
  }
}

/// This allows us to directly print stack with a desired format
extension LinkedList: CustomStringConvertible {
  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
