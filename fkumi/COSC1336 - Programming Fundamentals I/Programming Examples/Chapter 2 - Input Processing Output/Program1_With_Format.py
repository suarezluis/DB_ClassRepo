#********************************************************************
#
#  Author:            <Your name>
#
#  Program #:         <Assignment Number>
#
#  File Name:         <Program1.py>
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Due Date:          <Due Date>
#
#  Instructor:        Fred Kumi 
#
#  Chapter:           <Chapter #>
#
#  Maximum points:    <20>
#
#  Description:
#     <An explanation of what the program is designed to do>
#
#********************************************************************

def main():
    amount = 32500
    twiceMonth = amount / 24
    biWeekly = amount / 26
    print('Annual Salary           = ', (format(amount, 'd')))
    print('When paid twice a month = ', (format(twiceMonth, '.2f')))
    print('When paid bi-weekly     = ', (format(biWeekly, '.2f')))
    # End of main

def userInfo():
    print('Name:     Fred Kumi')
    print('Course:   Programming Fundamentals I')
    print('Program:  One')
    print()
    # End of userInfo

userInfo()
main()

# End of Program 1
