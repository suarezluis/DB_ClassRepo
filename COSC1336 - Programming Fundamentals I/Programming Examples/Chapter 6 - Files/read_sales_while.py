# This program uses the for loop to read
# all of the values in the sales.txt file.

def main():
    # Open the sales.txt file for reading.
    sales_file = open('sales.txt', 'r')

    # Read all the lines from the file.
    line = sales_file.readline()
    while line != '':
        # Convert line to a float.
        amount = float(line)
        # Format and display the amount.
        print(format(amount, '.2f'))
        line = sales_file.readline()
        
    # Close the file.
    sales_file.close()

# Call the main function.
main()
