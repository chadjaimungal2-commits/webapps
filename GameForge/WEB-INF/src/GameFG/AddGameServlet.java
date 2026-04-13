package GameFG;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import javax.security.sasl.SaslException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddGameServlet extends HttpServlet {

private String url = "jdbc:mysql://localhost:3306/gamefg";
private String username = "root";
private String password = "mysql";

protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

                String gameID = request.getParameter("gameID");
                String gameTitle = request.getParameter("gameTitle");
                String gameDescription = request.getParameter("gameDescription");
                double gamePrice = Double.parseDouble(request.getParameter("gamePrice"));
                String gameImage = request.getParameter("gameImage");
                String gameReleaseDate = request.getParameter("gameReleaseDate");
                Boolean isDigital = Boolean.parseBoolean(request.getParameter("isDigital"));
                String gameGenre = request.getParameter("gameGenre");
                String DeveloperConsole = request.getParameter("DeveloperConsole");

                try {
                    
                    java.sql.Connection conn = DriverManager.getConnection(url, username, password);

                    String sql = "INSERT INTO games (gameID, gameTitle, gameDescription, gamePrice, gameReleaseDate, isDigital, gameGenre, gameImage, DeveloperConsole) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    java.sql.PreparedStatement ps = conn.prepareStatement(sql);

                    ps.setString(1, gameID);
                    ps.setString(2, gameTitle);
                    ps.setString(3, gameDescription);
                    ps.setDouble(4, gamePrice);
                    ps.setString(5, gameReleaseDate);
                    ps.setBoolean(6, isDigital);
                    ps.setString(7, gameGenre);
                    ps.setString(8, gameImage);
                    ps.setString(9, DeveloperConsole);

                    ps.executeUpdate();
                    conn.close();

                } catch (Exception e) {
                    e.printStackTrace();
                }






             