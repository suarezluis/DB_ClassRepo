#***************************************************************
#
#  Author:               Instructor
#
#  File Name:            stringLoopExample.py
#
#  Course                COSC 1336 Programming Fundamentals I
#
#  Section:              Looping Control Structure
#
#  Due Date:             N/A
#
#  Instructor:           Fred Kumi 
#
#  Chapter:              Chapter 5
#
#  Description:
#    For loop using the split function
#
#***************************************************************

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
#***************************************************************
def main():
    text = "20 40 50 45 67 89 21"
    words = text.split() 
    for word in words:
        num = float(word)
        print(num) 
    # End of for loop
    
main()

# End of Program
