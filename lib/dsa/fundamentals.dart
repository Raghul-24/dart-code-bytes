import 'dart:math';

/// DSA Fundamentals
/// 
/// This file contains basic implementations of Linear Search, Stack, and Queue.
/// Use these as a reference to understand how they work under the hood.

// ==========================================
// 1. Linear Search
// ==========================================
/// Linear search checks each element in a list sequentially until a match is found.
/// 
/// Time Complexity: O(n) - in worst case, we check all 'n' elements.
/// Space Complexity: O(1) - no extra space used.
int linearSearch(List<int> list, int target) {
  for (int i = 0; i < list.length; i++) {
    // If element matches target, return current index
    if (list[i] == target) {
      return i;
    }
  }
  // Return -1 if target is not found
  return -1;
}

// ==========================================
// 2. Stack (LIFO - Last In, First Out)
// ==========================================
/// A Stack is like a pile of plates. You add to the top and take from the top.
class Stack<T> {
  final List<T> _storage = [];

  /// Add an item to the top of the stack
  void push(T element) {
    _storage.add(element);
  }

  /// Remove and return the top item
  /// Returns null if the stack is empty
  T? pop() {
    if (isEmpty) return null;
    return _storage.removeLast();
  }

  /// Look at the top item without removing it
  T? peek() {
    if (isEmpty) return null;
    return _storage.last;
  }

  bool get isEmpty => _storage.isEmpty;
  int get length => _storage.length;

  @override
  String toString() => 'Stack: $_storage';
}

// ==========================================
// 3. Queue (FIFO - First In, First Out)
// ==========================================
/// A Queue is like a line of people. First one in is the first one out.
class Queue<T> {
  final List<T> _storage = [];

  /// Add an item to the end of the queue
  void enqueue(T element) {
    _storage.add(element);
  }

  /// Remove and return the front item
  /// Returns null if the queue is empty
  T? dequeue() {
    if (isEmpty) return null;
    return _storage.removeAt(0); // Note: removeAt(0) is O(n). In production, use DoubleLinkedQueue.
  }

  /// Look at the front item without removing it
  T? peek() {
    if (isEmpty) return null;
    return _storage.first;
  }

  bool get isEmpty => _storage.isEmpty;
  int get length => _storage.length;

  @override
  String toString() => 'Queue: $_storage';
}

List<int> twoSum(List<int> num, target){
  Map<int, int> numMap = {};
  for(int i = 0; i < num.length ;i++){
    int complement = target - num[i];
    if(numMap.containsKey(complement)){
      return [numMap[complement]!, i];
    }
    numMap[num[i]] = i;
  }
  return [];
}

/// A simple implementation of Bubble Sort (moved here to keep playground clean)
void bubbleSort(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    bool swapped = false;
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) break;
  }
}


int maxSubArray(List<int> num){
  int maxSum = num[0];
  int currentSum = num[0];
  for(int i = 1;i<num.length;i++){
    currentSum = max(num[i], currentSum + num[i]);
    maxSum = max(maxSum, currentSum);
  }
  return maxSum;
}

void merge(List<int> nums1, int m, List<int> nums2, int n) {
  // Pointer for the end of valid data in nums1
  int p1 = m - 1;
  // Pointer for the end of nums2
  int p2 = n - 1;
  // Pointer for the very last index of nums1
  int p = m + n - 1;

  // We only need to loop as long as there are numbers in nums2 to move
  while (p2 >= 0) {
    // If nums1 still has numbers and its current number is larger
    if (p1 >= 0 && nums1[p1] > nums2[p2]) {
      nums1[p] = nums1[p1];
      p1--;
    } else {
      // Otherwise, the number from nums2 is larger (or nums1 is empty)
      nums1[p] = nums2[p2];
      p2--;
    }
    // Move the 'placement' pointer back
    p--;
  }
}

int lengthOfLongestSubstring(String s) {
  int left = 0;
  int maxLength = 0;
  Set<String> charSet = {};

  for (int right = 0; right < s.length; right++) {
    // While we have a duplicate, shrink from the left
    while (charSet.contains(s[right])) {
      charSet.remove(s[left]);
      left++;
    }

    charSet.add(s[right]);
    // Calculate size and update max
    int currentWindowSize = right - left + 1;
    if (currentWindowSize > maxLength) {
      maxLength = currentWindowSize;
    }
  }

  return maxLength;
}

int minSubArrayLen(int target, List<int> nums) {
  int left = 0;
  int currentSum = 0;
  // Initialize with a value larger than any possible answer
  int minLength = nums.length + 1;

  for (int right = 0; right < nums.length; right++) {
    currentSum += nums[right];

    // Shrink the window as much as possible while sum >= target
    while (currentSum >= target) {
      int currentWindowSize = right - left + 1;
      if (currentWindowSize < minLength) {
        minLength = currentWindowSize;
      }

      currentSum -= nums[left];
      left++;
    }
  }

  // If minLength was never updated, no such subarray exists
  return minLength > nums.length ? 0 : minLength;
}


bool isPalindrome(String s) {
  int left = 0;
  int right = s.length - 1;

  while (left < right) {
    if (s[left] != s[right]) {
      return false;
    }
    left++;
    right--;
  }
  return true;
}

int maxArea(List<int> height){
  int right = height.length - 1;
  int left = 0;
  int maxArea = 0;

  while (left < right) {
    int width = right - left;
    int currentHeight = min(height[left], height[right]);
    int area = width * currentHeight;
    maxArea = max(maxArea, area);

    if (height[left] < height[right]) {
      left++;
    } else {
      right--;
    }
  }
  return maxArea;
}

void moveZeroes(List<int> nums) {
  int lastNonZeroFoundAt = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      int temp = nums[lastNonZeroFoundAt];
      nums[lastNonZeroFoundAt] = nums[i];
      nums[i] = temp;
      lastNonZeroFoundAt++;
    }
  }
}

int majorityElement(List<int> nums) {
  int count = 0;
  int? candidate;
  for (int num in nums) {
    if (count == 0) {
      candidate = num;
    }
    count += (num == candidate) ? 1 : -1;
  }
  return candidate!;
}

/// Returns the running sum of a list where result[i] = sum(nums[0]…nums[i]).
List<int> runningSum(List<int> nums) {
  List<int> result = List.filled(nums.length, 0);
  if (nums.isEmpty) return result;
  result[0] = nums[0];
  for (int i = 1; i < nums.length; i++) {
    print(" i value $i");
    print("result[i] ${result[i]}");
    print("nums[i] ${nums[i]}");
    result[i] = result[i - 1] + nums[i];
    print("result[i] ${result[i]}");
  }
  return result;
}


/// 15. Richest Customer Wealth
/// Returns the maximum wealth that any customer has.
int maximumWealth(List<List<int>> accounts) {
  print("--- Starting maximumWealth calculation ---");
  int maxWealthSoFar = 0;
  print("Initial maxWealthSoFar is set to $maxWealthSoFar\n");

  // Added an index counter just to make the print statements clearer
  int customerIndex = 1;

  for (var customer in accounts) {
    print("Checking Customer $customerIndex:");
    print("  Their bank accounts: $customer");

    // Calculate this customer's total wealth
    int currentCustomerWealth = customer.fold(0, (sum, money) => sum + money);
    print("  Calculated total wealth for Customer $customerIndex: $currentCustomerWealth");

    // Compare with the max wealth found so far
    print("  Comparing: Is $currentCustomerWealth > $maxWealthSoFar?");
    if (currentCustomerWealth > maxWealthSoFar) {
      print("    -> Yes! Updating maxWealthSoFar from $maxWealthSoFar to $currentCustomerWealth.");
      maxWealthSoFar = currentCustomerWealth;
    } else {
      print("    -> No. Keeping maxWealthSoFar as $maxWealthSoFar.");
    }

    print("--------------------------------------------------");
    customerIndex++;
  }

  print("Done checking all customers! The absolute maximum wealth is: $maxWealthSoFar");
  return maxWealthSoFar;
}


/// Removes duplicates from a sorted array in-place and returns the count of unique elements.
int removeDuplicates(List<int> nums) {
  if (nums.isEmpty) return 0;

  int k = 1; // Index for the next unique element
  for (int i = 1; i < nums.length; i++) {
    if (nums[i] != nums[i - 1]) {
      nums[k] = nums[i];
      k++;
    }
  }
  return k;
}

/// Best Time to Buy and Sell Stock
///
/// Finds the maximum profit possible by buying on one day and selling on a future day.
/// Time Complexity: O(n), Space Complexity: O(1).
int maxProfit(List<int> prices) {
  if (prices.isEmpty) return 0;
  int minPrice = prices[0];
  int maxProfit = 0;
  for (int i = 1; i < prices.length; i++) {
    if (prices[i] < minPrice) {
      minPrice = prices[i];
    } else if (prices[i] - minPrice > maxProfit) {
      maxProfit = prices[i] - minPrice;
    }
  }
  return maxProfit;
}

/// Binary search finds the position of a target value within a sorted list.
///
/// Time Complexity: O(log n)
/// Space Complexity: O(1)
int binarySearch(List<int> list, int target) {
  int low = 0;
  int high = list.length - 1;

  while (low <= high) {
    int mid = low + (high - low) ~/ 2;
    if (list[mid] == target) {
      return mid;
    } else if (list[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}
