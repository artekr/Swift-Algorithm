# Queue

Queues use FIFO or first-in first-out ordering. Think about you are in line to buy tickets for your favorite movie.

```swift
public protocol Queue {
  associatedtype Element
  mutating func enqueue(_ element: Element) -> Bool
  mutating func dequeue() -> Element?
  var isEmpty: Bool { get }
  var peek: Element? { get }
}
```

Some core operations for a queue includes:
`enqueue`: Insert an element at the back of the queue. Returns true if the operation was successful.
`dequeue`: Remove the element at the front of the queue and return it.
`isEmpty`: Check if the queue is empty.
`peek`: Return the element at the front of the queue without removing it.

We can use different other data structure to implement a Queue.

- An array
- A doubly linked list
- A ring buffer
- Two stacks
