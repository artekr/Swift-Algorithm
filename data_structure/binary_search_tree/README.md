# Binary Search Trees(BST)

BST is a specify type of Binary Trees that follows two rules:

- The value of a **left child** must be less than the value of its **parent**.
- Consequently, the value of a **right child** must be greater than or equal to the value of its **parent**.

It is a powerful data structure for holding **sorted** data. The goal is to facilitate fast _lookup_, _insert_ and _removal_ operations The average time complexity for _lookup_, _insert_ and _removal_ is **O(log n)**, which is considerably faster than linear data structures such as arrays and linked lists.

However, in the worst cases, the time complexity will degrade to **O(n)** if the tree becomes unbalanced.
