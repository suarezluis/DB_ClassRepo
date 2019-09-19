#********************************************************************
#
#  Developer:         <Your full name>
#
#  Program #:         <Assignment Number>
#
#  File Name:         <Program8.py>
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Due Date:          <Due Date>
#
#  Instructor:        Fred Kumi 
#
#  Chapter:           <Chapter #>
#
#  Description:
#     <An explanation of what the program is designed to do>
#
#********************************************************************

import math
import Disc

def main():
    coeffA = int(input('Enter the coefficient A: '))
    coeffB = int(input('Enter the coefficient B: '))
    coeffC = int(input('Enter the coefficient B: '))
    
    disc = Disc.discriminant(coeffA, coeffB, coeffC)
    
    print('\nDiscriminant is: ', disc)
    
   # End of the main function

main()

# End of Program 8
