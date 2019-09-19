def main():
    print('Testing Decisions in Phyhon')
    grade = int(input('Enter your average grade: '))

    if grade >= 90:
       print('Letter grade for your average grade of', end=' ') 
       print(grade, end=' ') 
       print('is \'A\'')
    elif grade >= 80:
       print('Letter grade for your average grade of', end=' ') 
       print(grade, end=' ') 
       print('is \'B\'')
    elif grade >= 70:
       print('Letter grade for your average grade of', end=' ') 
       print(grade, end=' ') 
       print('is \'C\'')
    elif grade >= 60:
       print('Letter grade for your average grade of', end=' ') 
       print(grade, end=' ') 
       print('is \'C\'')
    else: 
       print('Letter grade for your average grade of', end=' ') 
       print(grade, end=' ') 
       print('is \'F\'')

def userInfo():
    print('Name:     Instructor')
    print('Course:   Programming Fundamentals I')
    print('Program:  Decision Structures')
    print()
    # End of userInfo

userInfo()
main()

# End of Test Program
