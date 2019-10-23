# This program reads and displays the contents
# of the philosophers.txt file.
def main():
    try:
       # Open a file named philosophers.txt.
       infile = open('philosophers.txt', 'r')

       # Read the file's contents.
       file_contents = infile.read()

       # Close the file.
       infile.close()

       # Print the data that was read into
       # memory.
       print(file_contents)
    except ValueError as err:
       print(err)
    except FileNotFoundError as err:
       print(err)
# Call the main function.
main()
