package GameFG;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteGameServlet extends HttpServlet {

    private String url = "jdbc:mysql://localhost:3306/gamefg";
    private String username = "root";
    private String password = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // We only need the ID to identify which record to remove
        String gameID = request.getParameter("gameID");

        if (gameID != null && !gameID.trim().isEmpty()) {
            try {
                // Registering the driver (good practice in older environments)
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                try (Connection conn = DriverManager.getConnection(url, username, password)) {
                    String sql = "DELETE FROM games WHERE gameID = ?";
                    
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setString(1, gameID);

                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        // Success! Redirect back to the dashboard or inventory list
                        response.sendRedirect("adminDashboard.jsp?message=GameDeleted");
                    } else {
                        // ID not found
                        response.sendRedirect("adminDashboard.jsp?error=GameNotFound");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("adminDashboard.jsp?error=DatabaseError");
            }
        } else {
            response.sendRedirect("adminDashboard.jsp?error=InvalidID");
        }
    }
}