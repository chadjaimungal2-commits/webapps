package GameFG;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateGameServlet extends HttpServlet {

    private String url = "jdbc:mysql://localhost:3306/gamefg";
    private String username = "root";
    private String password = "mysql";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // 1. Get the gameID (to know which game to update)
        String gameID = request.getParameter("gameID");

        // 2. Get the updated values from the form
        String gameTitle = request.getParameter("gameTitle");
        String gameDescription = request.getParameter("gameDescription");
        double gamePrice = Double.parseDouble(request.getParameter("gamePrice"));
        String gameImage = request.getParameter("gameImage");
        String gameReleaseDate = request.getParameter("gameReleaseDate");
        boolean isDigital = Boolean.parseBoolean(request.getParameter("isDigital"));
        String gameGenre = request.getParameter("gameGenre");
        String DeveloperConsole = request.getParameter("DeveloperConsole");

        try {
            // Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                // SQL UPDATE syntax
                String sql = "UPDATE games SET gameTitle=?, gameDescription=?, gamePrice=?, " +
                             "gameReleaseDate=?, isDigital=?, gameGenre=?, gameImage=?, " +
                             "DeveloperConsole=? WHERE gameID=?";

                PreparedStatement ps = conn.prepareStatement(sql);

                // Set parameters in the order they appear in the SQL string
                ps.setString(1, gameTitle);
                ps.setString(2, gameDescription);
                ps.setDouble(3, gamePrice);
                ps.setString(4, gameReleaseDate);
                ps.setBoolean(5, isDigital);
                ps.setString(6, gameGenre);
                ps.setString(7, gameImage);
                ps.setString(8, DeveloperConsole);
                ps.setString(9, gameID); // The WHERE clause ID

                int rowsUpdated = ps.executeUpdate();

                if (rowsUpdated > 0) {
                    response.sendRedirect("adminDashboard.jsp?message=UpdateSuccess");
                } else {
                    response.sendRedirect("adminDashboard.jsp?message=UpdateFailed");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp?error=ServerException");
        }
    }
}
