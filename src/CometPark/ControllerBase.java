package CometPark;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import CometPark.models.ParkingLot;


public abstract class ControllerBase {

   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/cometpark";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "";
   
   private Connection conn = null;
   private Statement stmt = null;
   
   protected Statement getStatement()
   {
	   return stmt;
   }
   
   protected Connection getConnection() throws Exception
   {
	   if (conn == null)
		   OpenConnection();
	   
	   return conn;
   }
   
   
	protected void OpenConnection() throws Exception
	{
      Class.forName(JDBC_DRIVER);

      System.out.println("Connecting to a selected database...");
      conn = DriverManager.getConnection(DB_URL, USER, PASS);
      System.out.println("Connected database successfully...");
      
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
   }
	
	
	
	
	protected void CloseConnection()
	{
		try{
	         if(stmt!=null)
	            conn.close();
	      }catch(SQLException se){
	      }// do nothing
	      try{
	         if(conn!=null)
	            conn.close();
	      }catch(SQLException se){
	         se.printStackTrace();
	      }//end finally try
	      stmt = null;
	      conn = null;
	}
	
	





}
