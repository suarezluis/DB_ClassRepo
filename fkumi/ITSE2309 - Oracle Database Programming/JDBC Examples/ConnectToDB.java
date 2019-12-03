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

public class ConnectToDB
{
	/** The Constant dbURL. */
	private final static String dbURL = "jdbc:oracle:thin:@coisor.austincc.edu:1527:CSOR";

	Scanner input;

	/** The Database Utils. */
	Connection connection = null;

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
	public static void main(String args[]) throws Exception {
		try {
			// Load the driver class
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return;
		} catch (Exception e) {
			System.err.println("Failed to load SQL driver." + e);
			return;
		}

		ConnectToDB myObject = new ConnectToDB();
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
	// Parameters: None
	//
	// Rreturn true, if successful
	//
	//**************************************************************
	private boolean testConnectToDb(String dbUser, String dbPasswd) throws SQLException
	{
		boolean rtnCode = false;
		DatabaseMetaData databaseMetaData = null;
		
		try {
			connection = DriverManager.getConnection(dbURL, dbUser, dbPasswd);
			if (connection != null) {
				rtnCode = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (rtnCode)
		{
			System.out.println("The database connection was successful\n");
		    databaseMetaData = connection.getMetaData();
		    System.out.println("Product Name    : " +  databaseMetaData.getDatabaseProductName());
		    System.out.println("Product Version : " +  databaseMetaData.getDatabaseProductVersion());
		    System.out.println("Driver Version  : " +  databaseMetaData.getDriverVersion());
		}
		else
		{
			System.err.println("The database connection was Not successful\n");
		}
		
		return rtnCode;
	}

	//***************************************************************
	//
	// Method:      closeDBConnection
	//
	// Description: Close the Database connection
	//
    //              @throws Exception the exception
    //              @throws SQLException the sQL exception
	//
	// Parameters:  None
	//
	// Returns:     N/A
	//
	//**************************************************************
	private void closeDBConnection() throws Exception, SQLException {
		try {
			if (connection != null)
				connection.close(); // Close the database connection
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
