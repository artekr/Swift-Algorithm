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
  public mutating func remove(_ value: T) {
    root = remove(node: root, value: value)
  }

  private func remove(node: BinaryNode<T>?, value: T) -> BinaryNode<T>? {
    guard let node = node else {
      return nil
    }
    if value == node.value {
      // In the case in which the node is a leaf node, you simply return nil, thereby removing the current node.
      if node.left == nil && node.right == nil { return nil }
      // If the node has no left child, you return node.rightChild to reconnect the right subtree.
      if node.left == nil { return node.right }
      // If the node has no right child, you return node.leftChild to reconnect the left subtree.
      if node.right == nil { return node.left }

      // This is the case in which the node to be removed has both a left and right child.
      // You replace the node’s value with the smallest value from the right subtree.
      // You then call remove on the right child to remove this swapped value.
      node.value = node.right!.min.value
      node.right = remove(node: node.right, value: node.value)
    } else if value < node.value {
      node.left = remove(node: node.left, value: value)
    } else {
      node.right = remove(node: node.right, value: value)
    }
    return node
  }
}

private extension BinaryNode {
  var min: BinaryNode {
    left?.min ?? self
  }
}
