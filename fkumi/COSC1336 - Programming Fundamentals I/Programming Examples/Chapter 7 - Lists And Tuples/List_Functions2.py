#********************************************************************
#
#********************************************************************

def main():
    a = [1,2,3,4,5]
    b = 3
    print("Before function ", a)

    c = test1(a)
    test2(b)
    print("After function ", c)
    print("B = ", b)
    # End of main

def test1(a1):
    a1[0] = 12
    print("Inside function ", a1)
    return a1

def test2(a2):
    a2 = 5
    
    
main()

# End of Pragram 1
