var exampleTree: BinarySearchTree<Int> = {
  var bst = BinarySearchTree<Int>()
  bst.insert(3)
  bst.insert(1)
  bst.insert(4)
  bst.insert(0)
  bst.insert(2)
  bst.insert(5)
  return bst
}()

// Building a BST
print(exampleTree)

// Finding a node
if exampleTree.contains(5) {
  print("Found 5!")
} else {
  print("Couldn't find 5")
}
