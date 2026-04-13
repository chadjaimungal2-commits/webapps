package GameFG;
import java.sql.*;

public class DBConnect {

	protected static Connection conn = null;

  	public DBConnect() {
  		if(conn == null){
  			try {

   				Class.forName("com.mysql.cj.jdbc.Driver");

				conn = DriverManager.getConnection(
								"jdbc:mysql://localhost:3306/GameForge?autoReconnect=true&useSSL=false",
								"root",
							"Mustang7200!"
						);
    		}
			catch (Exception e) {
				System.out.println("Database connection error"+ e.getMessage());
			}
  		}

  	}//end constructor
	public Connection getConnection() {
		return conn;
	}

  public void closeConnection(){
    try {
        if (conn != null && !conn.isClosed()) {
            conn.close();
            conn = null;  // reset static conn
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
  
  
  	



}







