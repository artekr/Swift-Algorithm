public struct BinarySearchTree<T: Comparable> {
  public private(set) var root: BinaryNode<T>?

  public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
  public var description: String {
    guard let root = root else { return "Empty Tree!" }
    return String(describing: root)
  }
}

/**
  Implementation
 */
extension BinarySearchTree {
  /// Lookup elements
  public func contains(_ value: T) -> Bool {
    var current = root
    while let node = current {
      if node.value == value {
        return true
      }
      if value < node.value {
        current = node.left
      } else {
        current = node.right
      }
    }
    return false
  }

  /// Inserting elements
  public mutating func insert(_ value: T) {
    root = insert(from: root, value: value)
  }

  private func insert(from node: BinaryNode<T>?, value: T) -> BinaryNode<T> {
    guard let node = node else {
      return BinaryNode(value: value)
    }

    if value < node.value {
      node.left = insert(from: node.left, value: value)
    } else {
      node.right = insert(from: node.right, value: value)
    }
    return node
  }

  /// Removing elements
}


