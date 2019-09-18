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
#     <An explanation of what the program is designed to do>
#
#********************************************************************

def main():

    userInfo()
    aCost, aPercent = getUserInputs()
    aRetail = wholeSale(aCost, aPercent)
    displayResults(aRetail)

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

    theCost = float(input("Please enter the cost: "))
    thePercent = float(input("Please enter the markup percentage: "))

    return theCost, thePercent
# End of getUserInputs


#*********************************************************************
#
#  Function    : 
#
#  Description : 
#
#  Parameters  : 
#  Returns     : 
#
#*********************************************************************
def wholeSale(theCost, thePercent):

    aMarkUp = theCost * (thePercent + 100) / 100
    return aMarkUp     

# End of wholeSale


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
def displayResults(theRetail):
    print("Retail price is: ", (format(theRetail, '.2f')))

# End of displayResults


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
    print('Program:  ???')
    print()
# End of userInfo


# Call the main function the start execution of the program
main()

