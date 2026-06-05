import 'fundamentals.dart';

void main() {
  print('--- DSA Learning Playground ---');

  // 1. BUBBLE SORT (Existing)
  final numbers = [64, 34, 25, 12, 22, 11, 90];
  print('\n[1] Bubble Sort');
  print('Original list: $numbers');
  bubbleSort(numbers);
  print('Sorted list:   $numbers');

  // 2. LINEAR SEARCH
  print('\n[2] Linear Search');
  final searchList = [10, 23, 45, 70, 11, 15];
  final target = 70;
  final index = linearSearch(searchList, target);
  print('List: $searchList, Target: $target');
  if (index != -1) {
    print('Found target at index: $index');
  } else {
    print('Target not found');
  }

  // 3. STACK (LIFO)
  print('\n[3] Stack (Last In, First Out)');
  final stack = Stack<String>();
  stack.push('Book 1');
  stack.push('Book 2');
  stack.push('Book 3');
  print('Current $stack');
  print('Popped: ${stack.pop()}');
  print('After pop: $stack');

  // 4. QUEUE (FIFO)
  print('\n[4] Queue (First In, First Out)');
  final queue = Queue<int>();
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  print('Current $queue');
  print('Dequeued: ${queue.dequeue()}');
  print('After dequeue: $queue');

  //5. Two sum
  final twoSumNumbers = [2,0,21,12,34,3,2,6];
  final twoSumTarget = 8;
  final twoSumResult = twoSum(twoSumNumbers, twoSumTarget);
  print('\n[5] Two Sum');
  print('List: $twoSumNumbers, Target: $twoSumTarget');
  print('Result: $twoSumResult');


  //6. Maximum Subarray
  final maxSubArrayNumbers = [-2,1,-3,4,-1,2,1,-5,4];
  final maxSubArrayResult = maxSubArray(maxSubArrayNumbers);
  print('\n[6] Maximum Subarray');
  print('List: $maxSubArrayNumbers');
  print('Result: $maxSubArrayResult');


  //7. Merge Sorted Arrays
  final mergeList1 = [1,2,3,0,0,0];
  final mergeList2 = [2,5,6];
  merge(mergeList1, 3, mergeList2, 3);
  print('\n[7] Merge Sorted Arrays');
  print('List 1: $mergeList1, List 2: $mergeList2');
  print('Result: $mergeList1');

  //8. Longest Substring Without Repeating Characters
  final longestSubstring = 'abcabc';
  final longestSubstringResult = lengthOfLongestSubstring(longestSubstring);
  print('\n[8] Longest Substring Without Repeating Characters');
  print('String: $longestSubstring');
  print('Result: $longestSubstringResult');

  //9. Minimum Size Subarray Sum
  final minSubArrayNumbers = [2, 3, 6];
  final minSubArrayTarget = 55;
  final minSubArrayResult = minSubArrayLen(minSubArrayTarget, minSubArrayNumbers);
  print('\n[9] Minimum Size Subarray Sum');
  print('List: $minSubArrayNumbers, Target: $minSubArrayTarget');
  print('Result: $minSubArrayResult');

  //10. Palindrome
  final palindromeString = 'racecarasdc';
  final isPal = isPalindrome(palindromeString);
  print('\n[10] Palindrome');
  print('String: $palindromeString, Is Palindrome: $isPal');

  //11. Container With Most Water
  final heights = [1, 8, 6, 2, 5, 4, 8, 3, 7];
  final resultArea = maxArea(heights);
  print('\n[11] Container With Most Water');
  print('Heights: $heights');
  print('Max Area: $resultArea');

  print('\n--- End of Playground ---');


  //12. move zeros
  final zeroNumbers = [0, 1, 0, 3, 12];
  print('\n[12] Move Zeroes');
  print('Original: $zeroNumbers');
  moveZeroes(zeroNumbers);
  print('Result:   $zeroNumbers');

  //13. majority element
  final majorityNumbers = [3, 2, 3];
  final majorityResult = majorityElement(majorityNumbers);
  print('\n[13] Majority Element');
  print('List: $majorityNumbers');
  print('Result: $majorityResult');


  //14. Running sum of 1D array
  final runningSumNumbers = [1, 2, 3, 4];
  final runningSumResult = runningSum(runningSumNumbers);
  print('\n[14] Running Sum of 1D Array');
  print('List: $runningSumNumbers');
  print('Result: $runningSumResult');

  //15. Richest Customer Wealth
  final accounts = [[1, 2, 3], [3, 2, 1],[12,1,22],[14,65,8]];
  final richestWealth = maximumWealth(accounts);
  print('\n[15] Richest Customer Wealth');
  print('Accounts: $accounts');
  print('Result: $richestWealth');

  //16. Remove Duplicates from Sorted Array
  final sortedNumbers = [1, 1, 2, 2, 3, 4, 4, 5];
  print('\n[16] Remove Duplicates from Sorted Array');
  print('Original: $sortedNumbers');
  final k = removeDuplicates(sortedNumbers);
  print('Unique count: $k, Modified list: ${sortedNumbers.sublist(0, k)}');


  //17. Best Time to Buy and Sell Stock
  final stockPrices = [7, 1, 5, 3, 6, 4];
  final profit = maxProfit(stockPrices);
  print('\n[17] Best Time to Buy and Sell Stock');
  print('Prices: $stockPrices');
  print('Max Profit: $profit');

  //18. Binary Search
  final sortedForSearch = [10, 20, 30, 40, 50];
  final binaryTarget = 30;
  final binaryIndex = binarySearch(sortedForSearch, binaryTarget);
  print('\n[18] Binary Search');
  print('Sorted List: $sortedForSearch, Target: $binaryTarget');
  print('Found at index: $binaryIndex');

}

