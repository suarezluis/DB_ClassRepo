# This program averages test scores.

def main():
    
   # Get the number of test scores.
   num_test_scores = int(input('How many test scores? '))

   total = 0.0
   
   for test_num in range(num_test_scores):
       
        print('Enter test number', test_num + 1, end='')
        score = float(input(': '))
        
        # Add the score to the accumulator.
        total = total + score

   # Calculate the average test score for this student.
   average = total / num_test_scores

   # Display the average.
   print('\nThe average for the test is:', format(average, '.1f'))
   print()

main()

        
