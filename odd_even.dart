import 'dart:io';

void main() {
  print("Please enter a string");
  int? enterANum = stdin.readByteSync();

  String result = isOddOrEven(enterANum);
  print("the given number is $result");
}

String isOddOrEven(int input){
  if(input % 2 == 0){
    return "even";
  } else {
    return "odd";
  }
}
