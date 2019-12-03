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
    acct, income, member, fileObj = readFile()
    avg = getAvg(income)
    calPoverty(acct, income, member, fileObj)
    
def readFile():
    
    inFile = open('Program10.txt', 'r')
    outFile = open('Program10-out.txt', 'w')
    
    acct = []
    income = []
    member = []
    
    outFile.write(str("%12s    %12s  %16s\n" % ("Account #", "Income", "Members")))
    
    lineRead = inFile.readline()       # Read first record
    while lineRead != '':              # While there are more records
       words = lineRead.split()        # Split the records into substrings
       acctNum = int(words[0])         # Convert first substring to integer
       acct.append(acctNum)
       annualIncome = float(words[1])  # Convert second substring to float
       income.append(annualIncome)
       members = int(words[2])         # Convert third substring to integer
       member.append(members)
       
       print("%10d  %16.2f  %10d" % (acctNum, annualIncome, members))
       outFile.write(str("%10d   %16.2f   %12d\n" % (acctNum, annualIncome, members)))
	
       lineRead = inFile.readline()    # Read next record
       
    # Close the file.
    inFile.close() # Close file
    
    return acct, income, member, outFile
def getAvg(income):
   total = 0
   for i in income:
       total += i
   return total/len(income)

def calPoverty(acct, income, member, fileObj):
   i = 0
   count = 0
   print("\n\n")
   fileObj.write("\n\n")
   size = len(member)
   while i < size:
     pv = 16910.00 + 4420.00 * (member[i] - 2)
     if pv > income[i]:
        print("%10d  %16.2f  %10d" % (acct[i], income[i], member[i]))
        fileObj.write(str("%10d   %16.2f   %12d\n" % (acct[i], income[i], member[i])))
        count += 1
     i += 1

   p = count/size * 100 
   print("\nPercent = ", p)
  
# Call the main function.
main()
