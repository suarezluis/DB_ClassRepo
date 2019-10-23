#********************************************************************
#
#  Developer:         <Your full name>
#
#  Program #:         7
#
#  File Name:         Program7.py
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
#     This program reads and displays the contents
#     of a file.
#********************************************************************
def main():
    
    inFile = open('program7.txt', 'r')
    
    lineRead = inFile.readline()
    while lineRead != '':
       words = lineRead.split()
       for word in words:
          num = float(word)
          print(format(num, '.2f'))
          
       lineRead = inFile.readline()
       
    # Close the file.
    inFile.close()
    
# Call the main function.
main()
