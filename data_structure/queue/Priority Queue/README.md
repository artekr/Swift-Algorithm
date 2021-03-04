# Priority Queue

A priority queue is a queue where the most important element is always at the front.

The queue can be a max-priority queue (largest element first) or a min-priority queue (smallest element first).

## Use Case
  * Dijkstra's algorithm for graph searching uses a priority queue to calculate the minimum cost.
  * A* pathfinding for artificial intelligence.

## Operations
  * **Enqueue**: inserts a new element into the queue.
  * **Dequeue**: removes and returns the queue's most important element.
  * **Find Minimum** or **Find Maximum**: returns the most important element but does not remove it.
  * **Change Priority**: for when your algorithm decides that an element has become more important while it's already in the queue.

## How
  * As a **sorted array**. The most important item is at the end of the array. Downside: inserting new items is slow because they must be inserted in sorted order.
  * As a **balanced binary search tree**. This is great for making a double-ended priority queue because it implements both "find minimum" and "find maximum" efficiently.
  * As a **heap**. The heap is a natural data structure for a priority queue. A heap is more efficient than a sorted array because a heap only has to be partially sorted. All heap operations are O(log n).
