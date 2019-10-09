package Chapter15;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Formatter;
import java.util.FormatterClosedException;
import java.util.NoSuchElementException;
import java.util.Scanner;

public class CreateInputFile
{
	private static File filename; // file object
	private static Scanner input;
	private static Scanner input2;
	
	public static void main(String[] args) {
		openFile();
		addRecords();
		closeFile();
	}

	// open file clients.txt
	public static void openFile()
	{
		try {
			filename = new File("Test2.txt");
			input = new Scanner(Paths.get("Test1.txt"));  // open the file
			input2 = new Scanner(filename);
		}
		catch (IOException ioException)
	    {
	       System.err.println("Error opening file. Terminating.");
	       System.exit(1);
		} catch (SecurityException securityException) {
			System.err.println("Write permission denied. Terminating.");
			System.exit(1); // terminate the program
		}
	}

	// add records to file
	public static void addRecords()
	{
		while (input.hasNext()) // loop until end-of-file indicator
		{
			try {
				int acctNum = input.nextInt();
				String fName = input.next();
				String lName = input.next();
				double balance = input.nextDouble();

				// output new record to file; assumes valid input
				System.out.printf("%d %s %s %.2f%n", acctNum, fName, lName, balance);
			} catch (FormatterClosedException formatterClosedException) {
				System.err.println("Error writing to file. Terminating.");
				break;
			} catch (NoSuchElementException elementException) {
				System.err.print("Invalid input. Please try again.");
				input.nextLine(); // discard input so user can try again
			}
		}
	}

	// close file
	public static void closeFile()
	{
		if (input != null)
			input.close();
		if (input2 != null)
			input2.close();

	}
} // end class CreateTextFile
