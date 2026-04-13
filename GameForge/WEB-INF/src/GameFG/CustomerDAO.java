package GameFG;


import java.sql.*;

public class CustomerDAO extends DBConnect {

    public static void insertCustomer (String name, String email, String password, String phone, String dob ) {

        

        try {
            

            String sql = "INSERT INTO Customer (Name, Email, Password, PhoneNo, BirthDate) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, dob);

            ps.executeUpdate();

        }
        catch(Exception e) {
            System.out.println("Error inserting customer: " + e.getMessage());
        }
    }
}   
     
 