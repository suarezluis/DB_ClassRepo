def main():
   counter = 0 
   total = 0 

   grade = int(input('Enter first grade: '))

   while grade >= 0:
      total = total + grade 
      counter = counter + 1  

      grade = int(input('Enter next grade or any negative number to exit: '))

   if counter > 0:
      avg = total / counter
      print('\n', counter, 'Grades entered. The average is:', \
            format(avg, '.1f')) 
   else:
      print('No grades were entered') 

main()
