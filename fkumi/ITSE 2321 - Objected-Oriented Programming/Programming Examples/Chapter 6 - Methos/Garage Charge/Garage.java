// Method Example: Garage.java
// Program calculates charges for parking
import java.util.Scanner;

public class Garage
{
   // begin calculating charges
   public void startCharging()
   {
      Scanner input = new Scanner( System.in );
      
      double totalReceipts = 0.0; // total fee collected for the day
      double fee;                 // the charge for the current customer
      double hours;               // hours for the current customer
            
      // read in the first customer's hours
      System.out.print( 
         "Enter number of hours (a negative to quit): " );
      hours = input.nextDouble();
      
      while ( hours >= 0.0 )
      {
         // calculate and print the charges
         fee = calculateCharges( hours );
         totalReceipts += fee;
         System.out.printf(
            "Current charge: $%.2f, Total receipts: $%.2f\n",
            fee, totalReceipts );

         // read in the next customer's hours
         System.out.print( 
            "Enter number of hours (a negative to quit): " );
            hours = input.nextDouble();
      } // end while loop      
   } // end method startCharging

   // determines fee based on time
   public double calculateCharges( double hours )
   {
      // apply minimum charge
      double charge = 2.0;

      // add extra fees as applicable
      if ( hours > 3.0 )
         charge = 2.0 + 0.5 * Math.ceil( hours - 3.0 );

      // apply maximum value if needed
      if ( charge > 10.0 )
         charge = 10.0;

      return charge;
   } // end method calculateCharges
} // end class Garage
