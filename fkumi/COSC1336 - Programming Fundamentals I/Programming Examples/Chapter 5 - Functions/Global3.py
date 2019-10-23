# Create a global variable.
number = 5
number2 = 15

def main():
    global number2
    number = int(input('Enter a number: '))
    someFunction()
    
    print('The number you entered is - main1', number, number2) #2
    
    show_number()
    
    print('The number you entered is - main2', number, number2) #4
    
def show_number():
    print('The number you entered is - show', number, number2) #3

def someFunction():
    global number
    number = 30
    number2 = 25
    print('The number you entered is - some', number, number2) #1

# Call the main function.
main()

