//: Stack


/************************************************************************/
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


// MARK: - Test
var stackOfNames = Stack(["Tom", "Jobn", "Ben", "Wade"])
stackOfNames.push("Mike")
print(stackOfNames)

var intStack: Stack = [1, 2, 3, 4, 5]
print(intStack.peek())
print(intStack)
intStack.pop()
print(intStack)

