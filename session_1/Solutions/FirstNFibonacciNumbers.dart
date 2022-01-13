import 'dart:io';

class FibonacciSequence {
   int N;
   var fibonacciSequence;

   FibonacciSequence(this.N) {
      fibonacciSequence = List<int>.filled(this.N + 1, 0);
      fibonacciSequence[1] = 1;
   }

   void findFibonacciSequence() {
      for (int i = 2; i <= N; i++) {
      fibonacciSequence[i] = fibonacciSequence[i - 1] + fibonacciSequence[i - 2];
      }
   }

   void printFibonacciSequence() {
      print("First N Fibonacci Numbers");
      for (int i = 0; i <= N; i++) {
        print(fibonacciSequence[i]);
      }
   }
}

void main() {
   print("Enter the number");

   int? n = int.parse(stdin.readLineSync()!);

   FibonacciSequence firstN = new FibonacciSequence(n);

   firstN.findFibonacciSequence();
   firstN.printFibonacciSequence();
}