// Method Example: Multiply.java
// Program generates single digit multiplication problems

import java.util.*;

public class Multiply
{
   Random randomNumbers = new Random();
   
   int answer; // the correct answer
   
   // ask the user to answer multiplication problems
   public void quiz()
   {
      Scanner input = new Scanner( System.in );

      int guess; // the user's guess

      createQuestion(); // display the first question

      System.out.println( "Enter your answer (-1 to exit):" );
      guess = input.nextInt();

      while ( guess != -1 )
      {
         checkResponse( guess );
         
         System.out.println( "Enter your answer (-1 to exit):" );
         guess = input.nextInt();
      } // end while
   } // end method
   
   // prints a new question and stores the corresponding answer
   public void createQuestion()
   {
      // get two random numbers between 0 and 9
      int digit1 = randomNumbers.nextInt( 10 );
      int digit2 = randomNumbers.nextInt( 10 );

      answer = digit1 * digit2;
      System.out.printf( "How much is %d times %d?\n", digit1, digit2 );
   } // end method createQuestion
   
   // checks if the user answered correctly
   public void checkResponse( int guess )
   {
      if ( guess != answer )
         System.out.println( "No. Please try again." );
      else
      {
         System.out.println( "Very Good!" );
         createQuestion();
      } // end else      
   } // end method checkResponse   
} // end class Multiply
