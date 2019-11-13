#********************************************************************
#
#  Developer:         <Your full name>
#
#  Program #:         10
#
#  File Name:         Program10.py
#
#  Course:            COSC 1336 Programming Fundamentals I 
#
#  Due Date:          <Due Date>
#
#  Instructor:        Fred Kumi 
#
#  Chapter:           <Chapter #>
#
#  Description:
#
#********************************************************************
def main():
    
    inFile = open('Program10.txt', 'r')
    outFile = open('Program10-out.txt', 'w')
	
    outFile.write(str("%12s    %12s  %16s\n" % ("Account #", "Income", "Members")))
    
    lineRead = inFile.readline()       # Read first record
    while lineRead != '':              # While there are more records
       words = lineRead.split()        # Split the records into substrings
       acctNum = int(words[0])         # Convert first substring to integer
       annualIncome = float(words[1])  # Convert second substring to float
       members = int(words[2])         # Convert third substring to integer
       
       print("%10d  %16.2f  %10d" % (acctNum, annualIncome, members))
       outFile.write(str("%10d   %16.2f   %12d\n" % (acctNum, annualIncome, members)))
	
       lineRead = inFile.readline()    # Read next record
       
    # Close the file.
    inFile.close() # Close file
    
# Call the main function.
main()
