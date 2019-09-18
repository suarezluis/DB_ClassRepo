# Programming Exercise 8-4

def main():
    # List to store numbers
    number_list = []

    # Variables
    low = 0.0
    high = 0.0
    total = 0.0
    average = 0.0
    number = 0

    # Prompt for numbers
        
    for i in range(10):
        number = float(input("Enter a number: "))
        number_list.append(number)

    low = min(number_list)
    high = max(number_list)
    total = sum(number_list)
    average = total / 10.0

    print ("Low:", low)
    print ("High:", high)
    print ("Total:", format(total, '.2f'))
    print ("Average:", format(average, '.2f'))

main()
