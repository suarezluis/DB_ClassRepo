// Method Example: PrimeNumberTest.java
// Test application for class PrimeNumber
import java.util.Scanner;

public class PrimeNumberTest
{
   public static void main( String args[] )
   {
	  Scanner input = new Scanner( System.in );
      boolean results = false;
	  int number = 0;
	  
      PrimeNumber application = new PrimeNumber();
	  
	  System.out.print("Enter a positive integer: ");
	  number = input.nextInt();
	  while (number >= 0) {
		  results = application.isPrime(number);
		  if (results)
		     System.out.println("The number is a prime number");
		  else
			 System.out.println("The number is not a prime number");
		 
		  System.out.print("Enter a positive integer or negative to end: ");
		  number = input.nextInt();
	  }
   } // end main   
} // end class PrimeNumberTest

