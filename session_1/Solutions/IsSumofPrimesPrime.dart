import 'dart:io';

bool isPrime(int n) {
  if (n == 2 || n== 3) {
    return true;
  }

  if (n < 2 || n % 2 == 0) {
    return false;
  }

  if (n < 9) {
    return true;
  }

  if (n % 3 == 0) {
    return false;
  }

  for (int i = 5; i * i <= n; i += 6) {
     if (n % i == 0) {
       return false;
     }
     if (n % (i + 2) == 0) {
       return false;
     }
  }

  return true;
}

void main() {
  print("Enter the size of array");
  int? size = int.parse(stdin.readLineSync()!);

  final ListOfElements = <int>[];

  int SumOfPrimes = 0;

  for (int i = 0; i < size; i++) {
    print("Enter ${i + 1} number");
    int? x = int.parse(stdin.readLineSync()!);
    ListOfElements.add(x);
    if (isPrime(x)) {
      SumOfPrimes += x;
    }
  }

  if (isPrime(SumOfPrimes)) {
    print("The Sum of Prime numbers in the array $SumOfPrimes is also Prime");
  }
  else {
    print("The Sum of Prime numbers in the array $SumOfPrimes is not a Prime");
  }
  
}