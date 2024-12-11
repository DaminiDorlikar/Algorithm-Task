import 'package:get/get.dart';

class AlgorithmController extends GetxController {
  var selectedRule = "Select Rule".obs;
  String? dropdownValue;
  List<int> numbers = List.generate(100, (index) => index + 1);

  // Functions to define rules
  bool isOdd(int number) => number % 2 != 0;
  bool isEven(int number) => number % 2 == 0;
  bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  List<int> fibonacciNumbers(int limit) {
    List<int> fib = [0, 1];
    while (true) {
      int next = fib[fib.length - 1] + fib[fib.length - 2];
      if (next > limit) break;
      fib.add(next);
    }
    return fib;
  }

  late final List<int> fibonacciList = fibonacciNumbers(100);

  bool isFibonacci(int number) => fibonacciList.contains(number);

  // Function to get the current rule
  bool Function(int)? getRule() {
    switch (selectedRule.value) {
      case "Odd Numbers":
        return isOdd;
      case "Even Numbers":
        return isEven;
      case "Prime Numbers":
        return isPrime;
      case "Fibonacci Numbers":
        return isFibonacci;
      case "Select Rule":
      default:
        return (number) => false;
    }
  }
}