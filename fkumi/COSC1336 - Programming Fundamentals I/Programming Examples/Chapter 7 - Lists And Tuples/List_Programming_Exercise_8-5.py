# Programming Exercise 8-5

def main():

    # Local variables
    test_account = ""

    try:

        # Open the file for reading
        input_file = open('charge_accounts.txt', 'r')

        # Read all the lines in the file into a list
        accounts = input_file.readlines()

        # Strip trailing '\n' from all elements of the list
        for i in range(len(accounts)):
            accounts[i] = accounts[i].rstrip("\n")

        # Get user input
        test_account = input("Enter the account number to be validated: ")

        # Use in operator to search for the account specified by user
        if test_account in accounts:
            print("Account number", test_account, "is valid.")
        else:
            print("Account number", test_account, "is not valid.")

    except IOError:
        print("The file could not be found")
    except:
        print("An error occurred")

main()

