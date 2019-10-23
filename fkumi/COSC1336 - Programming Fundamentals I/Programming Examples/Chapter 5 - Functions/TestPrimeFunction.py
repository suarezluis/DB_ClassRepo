#********************************************************************
#
#  Author:            Instructor
#
#  Program #:         N/A
#
#  File Name:         TestPrimeFunction
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Due Date:          N/A
#
#  Instructor:        Fred Kumi 
#
#  Chapter:           Five
#
#  Description:
#     Calls the PrimeFunction
#
#********************************************************************

import PrimeFunction

def main():

    number = int(input("Enter a positive integer: "))
    value = PrimeFunction.isPrime(number)
	
    if (value):
       print(number, "is a prime number")
    else:
       print(number, "is not a prime number")
	   
    # End of main

#*********************************************************************
#
#  Function    : 
#
#  Description : 
#
#  Parameters  : 
#
#  Returns     : 
#
#*********************************************************************
def developerInfo():
    print('Name:     Instructor')
    print('Course:   Programming Fundamentals I')
    print('Program:  N/A')
    print()
	
# End of developerInfo

# Call the main function the start execution of the program
main()

