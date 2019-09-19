public class Program6
{
   private Scanner input;

   public static void main(String[] args)
   {
	   Program6 myObject = new Program6();
	   
       myObject.openFile();
	  
   } 


   public void openFile()
   {
      try
      {
         input = new Scanner(Paths.get("Program6.txt")); 
      } 
      catch (IOException ioException)
      {
         System.err.println("Error opening file. Terminating.");
         System.exit(1);
      }
   }
   
   
   // Read records from the file
   public void readRecords()
   {
      try 
      {
         while (input.hasNext()) // while there is more to read
         {
            // display record contents                     
            System.out.printf("%10.2f%n", input.nextDouble());
         }
      } 
      catch (NoSuchElementException elementException)
      {
         System.err.println("File improperly formed. Terminating.");
      } 
      catch (IllegalStateException stateException)
      {
         System.err.println("Error reading from file. Terminating.");
      } 
   } 
}

