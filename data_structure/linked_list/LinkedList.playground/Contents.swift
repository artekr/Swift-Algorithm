// MARK: - Example
let node1 = LinkedListNode(value: 1)
let node2 = LinkedListNode(value: 2)
let node3 = LinkedListNode(value: 3)

/******************/
var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)
print(list)
// 1 -> 2 -> 3

// Example to insert at a particular index
var list1 = LinkedList<Int>()
list1.push(4)
list1.push(3)
list1.push(2)
list1.push(1)
print("Before inserting: \(list1)")
// 1 -> 2 -> 3 -> 4

var aNode = list1.node(at: 2)!
list1.insert(0, after: aNode)
print("After inserting: \(list1)")
// 1 -> 2 -> 3 -> 0 -> 4

// Example to pop a node
var list2 = LinkedList<Int>()
list2.push(3)
list2.push(2)
list2.push(1)

print("Before popping list: \(list2)")
let poppedValue = list2.pop()
print("After popping list: \(list2)")
print("Popped value: " + String(describing: poppedValue))

// Example to remove the last node
var list3 = LinkedList<Int>()
list3.push(3)
list3.push(2)
list3.push(1)

print("Before removing last node: \(list3)")
let removedValue = list3.removeLast()

print("After removing last node: \(list3)")
print("Removed value: " + String(describing: removedValue))

