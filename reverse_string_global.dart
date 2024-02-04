import 'dart:io';

void main() {
  print("Please enter a string");
  String? enteredString = stdin.readLineSync()!;

  String reverse = reverseString(enteredString);
  print("The Given String is $enteredString");
  print("The reversed String is $reverse");
}

String reversedStringUsingFor(String input) {
  String reverse = '';
  for (int i = input.length - 1; i >= 0; i--) {
    reverse += input[i];
  }
  return reverse;
}

String reverseString(String input){
  List<String> givenInput = input.split('').reversed.toList();
  String? reverse = givenInput.join();
  return reverse;
}