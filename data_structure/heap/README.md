# Heap

A heap is a **complete binary tree**, also known as a **binary heap**, that can be constructed using an **array**.

- Max heap, parent nodes must always contain a value that is **greater than or equal** to the value in its children. The root node will always contain the **highest** value.
- Min heap, parent nodes must always contain a value that is **less than or equal** to the value in its children. The root node will always contain the **lowest** value.

## Implementation with array

A heap can also be represented with a simple array. The sequence of elements stored in the array is like doing a **level-order traversal** of the binary tree.

Example, a max heap:

```
       10
     /    \
    8      4
   / \    / \
  7   1  2   3
 /
5
```

To represent it with array:

```
index:(0,  1, 2, 3, 4, 5, 6, 7)

      [10, 8, 4, 7, 1, 2, 3, 5]
```

**Q:** Given a non-zero based parent index _i_, how do we get the index of its left/right child?

- Left child index: _(i * 2) + 1_
- Right child index: _(i * 2) + 2_

**Q:** Given a non-zero based child index _i_, how do we get the index of its parent index?

- Parent index: _(i - 1) / 2_
