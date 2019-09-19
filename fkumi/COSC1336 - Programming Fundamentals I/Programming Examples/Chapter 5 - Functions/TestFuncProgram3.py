#********************************************************************
#
#  Author:            <Your name>
#
#  Program #:         <Assignment Number>
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Instructor:        Fred Kumi 
#
#  Chapter:           <Chapter #>
#
#  Description:
#     <An explanation of what the program is designed to do>
#
#********************************************************************
PI = 3.14159

import math

def main():
    global PI
    
    aValue = float(input('Enter side A of the triangle: '))
    bValue = float(input('Enter side B of the triangle: '))
    
    cValue = aValue ** 2 + bValue ** 2
    cValue = math.sqrt(cValue)
    PI = PI + 4
    
    print('Side C of the triangle is ', format(cValue, '.2f'), sep='')
#    print(format(cValue, '.2f'))
    print("PI = ", PI)
    
    # End of main

main()

print("PI2 = ", PI)

# End of Pragram 1
