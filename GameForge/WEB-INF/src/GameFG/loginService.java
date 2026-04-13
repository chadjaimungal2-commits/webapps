package GameFG;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginService  {
  private String email;
  private String password;
  private DBConnect dbConnect;
  // constructor

      public loginService(String email, String password){ 
        this.email = email;
        this.password = password;
        
        this.dbConnect = new DBConnect();
          




      }
  //method to validate login credentials
  public String getLoginService() {
    Connection conn = dbConnect.getConnection();
    try { 
      String customerQuery  = "SELECT * FROM Customer WHERE email = ? AND password = ?";
      PreparedStatement psCustomer =conn.prepareStatement(customerQuery);
      psCustomer.setString(1, email);
      psCustomer.setString(2, password);
      ResultSet rsCustomer = psCustomer.executeQuery();
      if (rsCustomer.next()) {
        return "customer";
      } 
      else {
                String employeeQuery = "SELECT * FROM Employee WHERE email=? AND password=?";
                PreparedStatement psEmployee = conn.prepareStatement(employeeQuery);
                psEmployee.setString(1, email);
                psEmployee.setString(2, password);
                ResultSet rsEmployee = psEmployee.executeQuery();
                if (rsEmployee.next()) {
                    return "employee";
                } else {
                    return "invalid";
                    
                }
                
      }
      
      
    } catch (SQLException e) {
      e.printStackTrace();  




    } finally {
      
    }
    return null;
      

}
// method to fetch Employee name from database using email
public String getEmployeeName(){
  Connection conn = dbConnect.getConnection();
  try {
    String Ename="Select Name From Employee where Email=?";
    PreparedStatement Eps= conn.prepareStatement(Ename);
    Eps.setString(1,email);
    ResultSet RsName= Eps.executeQuery();
    if(RsName.next()){
     return RsName.getString("Name");
    } 
  } 
  catch (SQLException e) {
    e.printStackTrace();
  }
  return null;

}

public String getCustomerName(){
  Connection conn = dbConnect.getConnection();
  try {
    String Cname="Select Name From Customer where Email=?";
    PreparedStatement Cps= conn.prepareStatement(Cname);
    Cps.setString(1,email);
    ResultSet RsName= Cps.executeQuery();
    if(RsName.next()){
     return RsName.getString("Name");
    }
    
      
  } 
  catch (SQLException e) {
    e.printStackTrace();
  }
  return null;


}          
  

}