public class BinaryNode<T> {
  public var value: T
  public var left: BinaryNode?
  public var right: BinaryNode?

  public init(value: T) {
    self.value = value
  }
}

/**
  Tree traversals
 */
extension BinaryNode {
  /// In-order traversal
  public func traverseInOrder(visit: (T) -> Void) {
    left?.traverseInOrder(visit: visit)
    visit(value)
    right?.traverseInOrder(visit: visit)
  }

  /// Pre-order traversal
  public func traversePreOrder(visit: (T) -> Void) {
    visit(value)
    left?.traversePreOrder(visit: visit)
    right?.traversePreOrder(visit: visit)
  }

  /// Post-order traversal
  public func traversePostOrder(visit: (T) -> Void) {
    left?.traversePostOrder(visit: visit)
    right?.traversePostOrder(visit: visit)
    visit(value)
  }
}


/// Print out a diagram of a binary tree
extension BinaryNode: CustomStringConvertible {
  public var description: String {
    diagram(for: self)
  }

  private func diagram(for node: BinaryNode?,
                       _ top: String = "",
                       _ root: String = "",
                       _ bottom: String = "") -> String {
    guard let node = node else {
      return root + "nil\n"
    }
    if node.left == nil && node.right == nil {
      return root + "\(node.value)\n"
    }
    return diagram(for: node.right,
                   top + "  ", top + "┌──", top + "│ ")
      + root + "\(node.value)\n"
      + diagram(for: node.left,
                bottom + "│ ", bottom + "└──", bottom + "  ")
  }
}
