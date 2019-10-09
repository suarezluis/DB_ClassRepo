// Fig. 15.3: CreateTextFile.java
// Writing data to a sequential text file with class Formatter.

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.SecurityException;       
import java.nio.file.Paths;
import java.util.Formatter;               
import java.util.FormatterClosedException;
import java.util.NoSuchElementException;  
import java.util.Scanner;                 


public class CreateOutputFile
{
   private static Formatter fOutput;    // outputs text to a file       
   private static File filename;       // file object 
   private static PrintWriter pOutput;
   private static Scanner input;
   
   public static void main(String[] args) throws IOException
   {
      openFile();
      addRecords();
      closeFile();
   } 

   // open file clients.txt
   public static void openFile()
   {
      try
      {
         fOutput = new Formatter("Test1.txt"); // open the file
      }
      catch (SecurityException securityException)
      {
         System.err.println("Write permission denied. Terminating.");
         System.exit(1); // terminate the program
      } 
      catch (FileNotFoundException fileNotFoundException)
      {
         System.err.println("Error opening file. Terminating.");
         System.exit(1); // terminate the program
      } 
   } 

   // add records to file
   public static void addRecords() throws IOException
   {
      input = new Scanner(Paths.get("clients.txt"));
      System.out.printf("%s%n%s%n? ", 
         "Enter account number, first name, last name and balance.",
         "Enter end-of-file indicator to end input.");

      while (input.hasNext()) // loop until end-of-file indicator
      {
         try
         {
            int acctNum = input.nextInt();
            String fName = input.next();
            String lName = input.next();
            double balance = input.nextDouble();
            
        	// output new record to file; assumes valid input
            fOutput.format("%d %s %s %.2f%n", acctNum, fName, lName, balance);
         } 
         catch (FormatterClosedException formatterClosedException)
         {
            System.err.println("Error writing to file. Terminating.");
            break;
         } 
         catch (NoSuchElementException elementException)
         {
            System.err.print("Invalid input. Please try again.");
            input.nextLine(); // discard input so user can try again
         } 
      }
   }

   // close file
   public static void closeFile()
   {
      if (fOutput != null)
         fOutput.close();
  
      if (input != null)
         input.close();
   } 
} // end class CreateTextFile

