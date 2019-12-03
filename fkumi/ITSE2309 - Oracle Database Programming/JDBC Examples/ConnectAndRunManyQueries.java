//***************************************************************
//
//  Developer:         <Your full name>
//
//  Program #:         12
//
//  File Name:         Program12.java
//
//  Course:            ITSE 2317 Intermediate Java Programming 
//
//  Due Date:          May 15, 2019
//
//  Instructor:        Fred Kumi 
//
//  Chapter:           Chapter 24
//
//  Description:
//      <An explanation of what the program is designed to do>
//
//***************************************************************

package Chapter24;

import java.sql.*;
import java.util.Scanner;

public class ConnectAndRunManyQueries
{
    /** The Constant dbURL. */
    private final static String dbURL = "jdbc:oracle:thin:@coisor.austincc.edu:1527:CSOR";
    
    /** The Database Utils. */
	Connection connection = null;
	
	/** The select. */
	Statement statement = null;

    /** We are okay. */
    private boolean weAreOkay = true;
    
    /** The query1. */
    private String query1 = null;
    
    /** The query2. */
    private String query2 = null;
    
    /** The query3. */
    private String query3 = null;
    
    /** The query4. */
    private String query4 = null;
   
    /** The Result Set. */
    private ResultSet resultSet = null;
	
	Scanner input;
	
	//***************************************************************
	//
	// Method:      main
	//
	// Description: The main method of the program
	//              @param args the arguments
	//              @throws Exception the exception
	//
	// Parameters:  String array
	//
	// Returns:     N/A
	//
	//**************************************************************
	public static void main(String args[]) throws Exception
	{
    	//Initialize timeStamp however you want
	    try {
            Class.forName("oracle.jdbc.OracleDriver");
        }
        catch (ClassNotFoundException e)
		{
		    e.printStackTrace();
			return ;
		}
        catch( Exception e ) {
           System.out.println("Failed to load SQL driver." + e);
           return;
        }
	    
	    ConnectAndRunManyQueries myObject = new ConnectAndRunManyQueries();
	    myObject.testDriver();
   }
	
   //***************************************************************
   //
   // Method: testDriver
   //
   // Description: The main line routine of the program
   //              @throws Exception the exception
   //
   // Parameters: None
   //
   // Returns: N/A
   //
   //**************************************************************
   public void testDriver() throws Exception
   {  
		boolean rtnCode = false;
   		input = new Scanner(System.in);
		
		System.out.print("Enter your user name: ");
		String userName = input.next();

		System.out.print("Enter your password: ");
		String userPassword = input.next();

		System.out.println("\nConnecting to the CIT Oracle database...");
		rtnCode = testConnectToDb(userName, userPassword);

		if (rtnCode)
		{
            createQueries();
 	    
	        System.out.println("Running query 1...");
	        runQueries(query1);
	    
	        System.out.println("Running query 2...");
	        runQueries(query2);
	    
	        System.out.println("Running query 3...");
	        runQueries(query3);
	    
	        System.out.println("Running query 4...");
	        runQueries(query4);
	    
  	        System.out.println("Closing the Database Connection...");
 	        closeDBConnection();
		}
	}
	
	//***************************************************************
	//
	// Method: testConnectToDb
	//
	// Description: Connect to the Database.
	//              @throws Exception the exception
	//
	//  Constructs a new {@link JDBCUtils} with the specified parameters and
	//  creates a connection to the database
	//  
	//  param dbDriver The database driver class param dbURL The URL of the
	//  database to connect to param dbUser The user name param dbPasswd The
	//  password throws SQLException throws ClassNotFoundException
	// 
	//  Parameters: None
	//
	//  Return true, if successful
	//
	//**************************************************************
	private boolean testConnectToDb(String dbUser, String dbPasswd)
	{
		boolean rtnCode = false;
		
		try {
			//dbUtils = new JDBCUtils(DEFAULT_DATABASE_DRIVER, dbURL, dbUser, dbPasswd);
			connection = DriverManager.getConnection(dbURL, dbUser, dbPasswd);
			
			// select = connection.createStatement();
			if(connection != null)
			{
				rtnCode = true;
			}
		}
		catch (SQLException e)
		{
		    e.printStackTrace();
		}
		
	    if (rtnCode)
	     	 System.out.println("The database connection was successful");
	     else
		   	 System.out.println("The database connection was Not successful");
		     
		return rtnCode;
	}
	
	//***************************************************************
	//
	// Method:      createQueries
	//
	// Description: Creates the queries.
	//
	// Parameters:  None
	//
	// Returns:     N/A
	//
	//**************************************************************
	private void createQueries()
	{
		query1 = "SELECT customer#, COUNT(*) FROM orders GROUP BY customer# ";

		query2 = "SELECT  DISTINCT firstname, lastname           " +
		         "  FROM  customers, books, orders, orderitems   " +
		         "  WHERE customers.customer# = orders.customer# " +
		         "    AND orders.order# = orderitems.order#      " +
		         "    AND orderitems.ISBN = books.ISBN           " +
		         "    AND (state = 'GA' OR state = 'FL')         " +
		         "  GROUP BY orders.order#, firstname, lastname  " +
		         "  HAVING SUM(retail*quantity) > 80             ";

		query3 = "SELECT a.lname, a.fname, b.title " +
		         "  FROM customers c JOIN orders USING (customer#) " +
		         "  JOIN orderitems USING (order#)                 " +
		         "  JOIN books b USING (isbn)      " +
		         "  JOIN bookauthor USING (isbn)   " +
		         "  JOIN author a USING (authorid) " +
		         "  WHERE c.firstname = 'BECCA'    " +
		         "  AND c.lastname = 'NELSON'      ";

		query4 = "SELECT customer#                    " +
		         " FROM customers JOIN orders USING (customer#) " +
		         "  JOIN orderitems USING (order#)    " +
		         "  JOIN books USING (isbn)           " +
		         "  WHERE retail =                    " +
		         "        (SELECT MIN(retail)         " +
		         "         FROM books)                ";
	}

	//***************************************************************
	//
	// Method:      runQueries
	//
	// Description: Runs the queries
	//
	// Parameters:  queryToRun the query to run
    //	
	//              @throws Exception the exception
	//
	//  throws SQLException the sQL exception
    //
	// Returns:     N/A
	//
	//**************************************************************
	private void runQueries(String queryToRun) throws Exception, SQLException
	{
		String sqlMessage = null;
		int numberOfColumns = 0;

		// Execute the query and get our result
		try {
            System.out.println("Creating statement...");
            
            statement = connection.createStatement();
		    resultSet = statement.executeQuery(queryToRun);
		}
		catch (SQLException e)
		{
			if (e != null)
				sqlMessage = e.getMessage();
			
			System.out.println("SQL Error Message 1: " + sqlMessage);
		}
		
		try {
		   // process query results
	       ResultSetMetaData metaData = resultSet.getMetaData();
	       numberOfColumns = metaData.getColumnCount();
	       System.out.println("Table of Books Database:\n");
	
	       // display row set header
	       for (int i = 1; i <= numberOfColumns; i++)
	           System.out.printf("%-8s\t", metaData.getColumnName(i));
	       System.out.println();
	         
	       // display each row
	       while (resultSet.next()) 
	       {
	          for (int i = 1; i <= numberOfColumns; i++)
	             System.out.printf("%-8s\t", resultSet.getObject(i));
	          System.out.println();
	       }
        }
		catch (SQLException e)
		{
			weAreOkay = false;
			if (e != null)
				sqlMessage = e.getMessage();
			
			System.out.println("SQL Error Message 2: " + sqlMessage);
			e.printStackTrace();
		} 
	}
	
	//***************************************************************
	//
	// Method:      closeDBConnection
	//
	// Description: Close the Database connection.
	//
    //              @throws Exception the exception
    //              @throws SQLException the sQL exception
	//
	// Parameters:  None
	//
	// Returns:     N/A
	//
	//**************************************************************
    private void closeDBConnection() throws Exception, SQLException
    {
		try
		{
			if (statement != null)
               statement.close();
			if (connection != null)
			   connection.close();  // Close the database connection
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		} 
    }
}
