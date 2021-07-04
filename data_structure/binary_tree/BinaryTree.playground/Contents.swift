
var tree: BinaryNode<Int> = {
  let zero = BinaryNode(value: 0)
  let one = BinaryNode(value: 1)
  let five = BinaryNode(value: 5)
  let seven = BinaryNode(value: 7)
  let eight = BinaryNode(value: 8)
  let nine = BinaryNode(value: 9)

  seven.left = one
  one.left = zero
  one.right = five
  seven.right = nine
  nine.left = eight

  return seven
}()


print(tree)
/**
   ┌──nil
 ┌──9
 │ └──8
 7
 │ ┌──5
 └──1
   └──0
 */

// Example of in-order traversal
tree.traverseInOrder { print($0) }
// 0 1 5 7 8 9

print("\n")
// Example of pre-order traversal
tree.traversePreOrder { print($0) }
// 7 1 0 5 9 8

print("\n")
// Example of post-order traversal
tree.traversePostOrder { print($0) }
// 0 5 1 8 9 7

