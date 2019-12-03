
import Test1_Class

def main():
    # Create three objects 
    testA = Test1_Class.Test1()
    testB = Test1_Class.Test1()
 
    print('Print test variables:')
    print("testVar1 - TestA = ", testA.testVar1)
    print("testVar1 - TestB = ", testB.testVar1)

    Test1_Class.Test1.testVar1 += 1
    print()
    print("testVar1 - TestA = ", testA.testVar1)
    print("testVar1 - TestB = ", testB.testVar1)

#    Test1_Class.Test1.testVar2 += 1
    testA.setTestVar2(5)
    testA.setTestVar1(10)
    
    print()
    print("testVar2 - TestA = ", testA.testVar3)
    print("testVar2 - TestB = ", testA.getTestVar2())

# Call the main function.
main()
