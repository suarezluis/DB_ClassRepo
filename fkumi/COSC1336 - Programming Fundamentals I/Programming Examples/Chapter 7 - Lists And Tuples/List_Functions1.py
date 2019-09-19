#********************************************************************
#
#  Author:            <Your name>
#
#  Program #:         <Assignment Number>
#
#  File Name:         <Test_Function1.py>
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Description:
#     <An explanation of what the program is designed to do>
#
#********************************************************************

def main():
    a = [1,2,3,4,5]
    b = 3
    print("Before function ", a)

    test1(a)
    test2(b)
    print("After function ", a)
    print("B = ", b)
    # End of main

def test1(a1):
    a1[0] = 12
    print("Inside function ", a1)

def test2(a2):
    a2 = 5
    
    
main()

# End of Pragram 1
