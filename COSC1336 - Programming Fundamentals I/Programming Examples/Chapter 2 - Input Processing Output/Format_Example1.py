#********************************************************************
#
#  Author:            <Your name>
#
#  Program #:         <Assignment Number>
#
#  File Name:         <Format_Example1.py>
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

def main():
    amount1 = 45500
    amount2 = 45500
    amount3 = 4760.23546
    amount4 = 2003000
    
    print('Amount 1 = ', (format(amount1, 'd')))
    print('Amount 2 = ', (format(amount2, '.2f')))
    print('Amount 3 = ', (format(amount3, ',.2f')))
    print('Amount 3 = ', (format(amount4, ',.2f')))
    
    # End of main

def userInfo():
    print('Name:     <Name>')
    print('Course:   Programming Fundamentals I')
    print('Program:  One')
    print()
    # End of userInfo

userInfo()
main()

# End of Program 1
