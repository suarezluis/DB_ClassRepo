#***************************************************************
#
#  Developer:         <Your full name>
#
#  Program #:         <Assignment Number>
#
#  File Name:         <Program11.py>
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Course Synonym:    <392XX>
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
#***************************************************************

BASE_YEAR = 1903

#***************************************************************
#
#  Function:     main
# 
#  Description:  The main function of the program
#
#  Parameters:   None
#
#  Returns:      Nothing 
#
#**************************************************************
def main():
    # Local dictionary variables
    year_dict = {}
    count_dict = {}
	
    developerInfo()
	
    # Open the file for reading
    input_file = open('Program11.txt', 'r')


    
    # End of the main function

#***************************************************************
#
#  Function:     main
# 
#  Description:  The main function of the program
#
#  Parameters:   None
#
#  Returns:      Nothing 
#
#**************************************************************
def showResults(year_dict, count_dict):
    
    # Receive user input
    year = int(input('Enter a year in the range 1903-2019: '))

    # Print results
    if year == 1904 or year == 1994:
        print("The world series wasn't played in the year", year)
    elif year < 1903 or year > 2019:
        print('The data for the year', year, \
              'is not included in our database.')
    else:
        winner = year_dict[year]
        wins = count_dict[winner]
        print('The team that won the world series in ', \
              year, ' is the ', winner, '.', sep='')
        print('They have won the world series', wins, 'times.')
        
    # End of showResults

#***************************************************************
#
#  Function:     developerInfo
# 
#  Description:  Prints Programmer's information
#
#  Parameters:   None
#
#  Returns:      Nothing 
#
#**************************************************************
def developerInfo():
    print('Name:     <Put your full name here>')
    print('Course:   Programming Fundamentals I')
    print('Program:  Eleven')
    print()
    # End of the developerInfo function

# Call the main function.
main()

