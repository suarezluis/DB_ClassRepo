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

public class ConnectAndUpdateRecord
{
    /** The Constant dbURL. */
    private final static String dbURL = "jdbc:oracle:thin:@coisor.austincc.edu:1527:CSOR";

    Scanner input;
    
    /** The Database Utils. */
	Connection connection = null;
	
	/** The select. */
	Statement statement = null;

	// ***************************************************************
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
	// **************************************************************
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
	    
	    ConnectAndUpdateRecord myObject = new ConnectAndUpdateRecord();
	    myObject.testDriver();
   }
	
	// ***************************************************************
	//
	// Method:      testDriver
	//
	// Description: The main line routine of the program
	//              @throws Exception the exception
	//
	// Parameters:  None
	//
	// Returns:     N/A
	//
	// **************************************************************
	public void testDriver() throws Exception
	{
		boolean rtnCode = false;
        int count = 0;
		
		input = new Scanner(System.in);
		System.out.print("Enter your user name: ");
		String userName = input.next();

		System.out.print("Enter your password: ");
		String userPassword = input.next();

		System.out.println("\nConnecting to the CIT Oracle database...");
		rtnCode = testConnectToDb(userName, userPassword);

	    if (rtnCode)
		{
			String query1 = "Update Customers " +
			                "Set City = 'DALLAS' where lastName = 'GIANA' ";

			String query2 = "Update Customers " +
			        "Set State = ? where lastName = ?";
				
    		System.out.println("Running the query 1 ...");
	        count = runQuery(query1, 1);
	        System.out.println("Number of records updated for query one is " + count);
	        
    		System.out.println("\nRunning the query 2 ...");	        
	        count = runQuery(query2, 2);
	        System.out.println("Number of records updated for query two is " + count);

			System.out.println("\nClosing the Database Connection...");
			closeDBConnection();
		}
	}

	// ***************************************************************
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
	// Parameters: None
	//
	// Rreturn true, if successful
	//
	// **************************************************************
	private boolean testConnectToDb(String dbUser, String dbPasswd)
	{
		boolean rtnCode = false;
		
		try {
			connection = DriverManager.getConnection(dbURL, dbUser, dbPasswd);
			if (connection != null) {
				rtnCode = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (rtnCode)
			System.out.println("The database connection was successful\n");
		else
			System.err.println("The database connection was Not successful\n");

		return rtnCode;
	}

	//***************************************************************
	//
	// Method:      runQuery
	//
	// Description: Runs the query
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
	private int runQuery(String queryToRun, int nmbr) throws Exception, SQLException
	{
		String sqlMessage = null;
        int count = 0;
        String lastName = "";

        if (nmbr == 2) 
        {
		   System.out.print("Enter customer's lastname to delete: ");
		   lastName = input.next();
        }
        
        System.out.println("Creating statement...");
        
		// Execute the query
		try {
			if (nmbr == 2)
			{	
               PreparedStatement statement = connection.prepareStatement(queryToRun);
			   statement.setString(1, lastName);
			   count = statement.executeUpdate();
		    }
			else
			{
	           statement = connection.createStatement();
			   count = statement.executeUpdate(queryToRun);
			}
		}
		catch (SQLException e)
		{
			if (e != null)
				sqlMessage = e.getMessage();
			
			System.err.println("SQL Error Message 1: " + sqlMessage);
			return count;
		} 
        catch(Exception e)
		{
			if (e != null)
			{
				sqlMessage = e.getMessage();
                System.err.println("Failed to run query. \n" + sqlMessage);
			}
            return count;
        }
		
		return count;
	}

	// ***************************************************************
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
	// **************************************************************
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
