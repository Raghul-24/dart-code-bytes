import 'dart:io';

void main() {
  print("Please the Enter the name to Find the Number of Vowels");
  String? userInput = stdin.readLineSync();
  int output = vowelCount(userInput!);

  print("The count of the vowels in the given sample is $output");
}

int vowelCount(String input) {
  int count = 0;
  for (int i = 0; i < input.length; i++) {
    String char = input[i].toString();
    if (char == 'a' ||
        char == 'e' ||
        char == 'i' ||
        char == 'o' ||
        char == 'u') {
      count++;
    }
  }
  return count;
}
