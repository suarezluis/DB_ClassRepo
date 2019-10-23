import math

#*********************************************************************
#
#  Function    : isPrime
#
#  Description : This function returns true if the integer passed to it
#                is a prime number, and returns false if it is not.          
#
#  Parameters  : None
#
#  Returns     : true/false
#
#*********************************************************************

def isPrime(num):
   if num < 2:      # Integers < 2 cannot be prime
      return False
   
   if num == 2:     # Special case: 2 is the only even prime number
      return True   
   
   if num % 2 == 0:  # Other even numbers are not prime
      return False
   
   # Test odd divisors up to the square root of num
   # If any of them divide evenly into it, then num is not prime
   divisor = 3
   while divisor <= math.sqrt(num):
     if num % divisor == 0:
         return False
     divisor +=2 
	 
   # If we got this far without returning, num is prime
   return True


