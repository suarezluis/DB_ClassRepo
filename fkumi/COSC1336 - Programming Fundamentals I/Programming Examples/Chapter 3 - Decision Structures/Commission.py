RATE1 = .02
RATE2 = .05

def main():        
   #get input item
   sales = float(input('Enter the sales amount: ')) 

   #calculate commission
   if sales <= 15000.0:
       commission = sales * RATE1
   else:
       commission = sales * RATE2
   #end if

   #display commission
   print('Your commission is $', \
         format(commission , '.2f'), sep = '')

def userInfo():
    print('Name:     Instructor')
    print('Course:   Programming Fundamentals I')
    print('Program:  Decision Structures')
    print()
    # End of userInfo

userInfo()
main()

# End of Program

