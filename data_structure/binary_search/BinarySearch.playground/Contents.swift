// Example of binary search in a sorted array
let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]

let search31 = array.firstIndex(of: 31)
let binarySearch31 = array.binarySearch(for: 31)

print("firstIndex(of:): \(String(describing: search31))")
print("binarySearch(for:): \(String(describing: binarySearch31))")
