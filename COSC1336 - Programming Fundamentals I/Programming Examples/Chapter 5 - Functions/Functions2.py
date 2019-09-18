#********************************************************************
#
#  Author:            <Your name>
#
#  Program #:         <Assignment Number>
#
#  File Name:         <Program#.py>
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Due Date:          <Due Date>
#
#  Instructor:        Fred Kumi 
#
#  Chapter:           <Chapter #>
#
#  Maximum points:    < ? >
#
#  Description:
#          This program calculates the sum of all odd or
#          even integers between two integers entered  
#          by the user.  A third input (1 or 2) is used to
#          determine whether to sum the odd or even integers.
#
#********************************************************************

def main():

    userInfo()
    displayMessage()
    
    theFirst, theSecond, theSelector = getUserInputs()
    theSum = getSumOddOrEven(theFirst, theSecond, theSelector)

    printResults(theSum, theSelector)

    # End of main

#*********************************************************************
#
#  Function    : 
#
#  Description : 
#
#  Parameters  : 
#
#  Returns     : 
#
#*********************************************************************
def getUserInputs():

    theFirst = int(input("Please enter the first number: "))
    theSecond = int(input("Please enter the second number: "))
    theSelector = int(input("Enter 1 to sum up odd integers " +  
                            "or 2 to sum up even integers: "))

    return theFirst, theSecond, theSelector

# End of getUserInputs


#*********************************************************************
#
#  Function    : 
#
#  Description : 
#
#  Parameters  : 
#
#  Returns     : 
#
#*********************************************************************
def displayMessage():
    
    print("This program will calculate the sum of all odd or ")
    print("even integers between two integers entered by the ")
    print("user.  A third input (1 or 2) is used to indicate")
    print("whether to sum the odd or even integers. \n")
    
#End of displayMessage


#*********************************************************************
#
#    Function    : getSumOddOrEven
#
#    Description : Gets data from the user
#
#    Parameters  : The first number
#                  The second number
#                  The odd/even indicator
#
#    Returns     : Sum of odd or even numbers between the first
#                  number and second number
#
#*********************************************************************
def getSumOddOrEven(theFirst, theSecond, theSelector):

   sum = 0;
   x   = 0;

   if theSelector == 1:                 # Sum odd numbers
      if theFirst % 2 == 0:
         theFirst = theFirst + 1;

      for x in range(theFirst, theSecond + 1, 2):
         sum = sum + x;
   else:                                # Sum even numbers
      if theFirst % 2 == 1:
         theFirst = theFirst + 1;

      for x in range(theFirst, theSecond + 1, 2):
         sum = sum + x;

   return sum;

#End of getSumOddOrEven

#*********************************************************************
#
#    Function    : printResults
#
#    Description : Prints the results
#
#    Parameters  : The sum of the odd or even integers
#                  The odd/even selector
#
#    Returns     : None
#
#*********************************************************************
def printResults(theSum, theSelector):
    
   if theSelector == 1:
       print("The sum of all the odd integers is: ", theSum)
   else:
       print("The sum of all the even integers is: ", theSum)

#End of printResults


#*********************************************************************
#
#  Function    : 
#
#  Description : 
#
#  Parameters  : 
#
#  Returns     : 
#
#*********************************************************************
def userInfo():
    
    print('Name:     <Name>')
    print('Course:   Programming Fundamentals I')
    print('Program:  ???\n')
     
# End of userInfo


# Call the main function the start execution of the program
main()

