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

bool isSemiPrime(int num) {
  int? factor1;
  int? factor2;

  for (int i = 2; i * i <= num; i++) {
     if (num % i == 0) {
         factor1 = i;
         factor2 = (num ~/ i).toInt();

         return isPrime(factor1) && isPrime(factor2);
     }
  }

  return false;
}

void main() {
  print("Enter the number you want to check whether it's a semiprime");
  int? num = int.parse(stdin.readLineSync()!);
  
  if (isSemiPrime(num)) {
     print("It is a SemiPrime");
  }
  else {
    print("It is not a SemiPrime");
  }
  
}