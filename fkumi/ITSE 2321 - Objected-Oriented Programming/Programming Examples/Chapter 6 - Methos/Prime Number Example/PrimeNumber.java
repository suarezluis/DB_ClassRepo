// Method Example: PrimeNumber.java
// Program checks to see if an integer entered is a prime number.

import java.util.*;

public class PrimeNumber
{
  /*************************************************************
   *                          isPrime                          *
   * This function returns true if the integer passed to it is *
   * a prime number, and returns false if it is not.           *
   *************************************************************/
   public boolean isPrime(int num)
   {  
      if (num < 2)      // Integers < 2 cannot be prime
         return false;
   
      if (num == 2)     // Special case: 2 is the only even prime number
         return true;   
   
      if (num %2 == 0)  // Other even numbers are not prime
         return false;
   
      // Test odd divisors up to the square root of num
      // If any of them divide evenly into it, then num is not prime
      for (int divisor = 3; divisor <= sqrt(num); divisor +=2)
      {  
         if (num % divisor == 0)
            return false;
      }
   
      // If we got this far without returning, num is prime
      return true;
   }
}
