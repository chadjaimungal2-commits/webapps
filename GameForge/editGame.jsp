<%@ page import="java.sql.*, GameFG.DBConnection" %>

<%
    String id = request.getParameter("gameID");

    Connection conn = DBConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM games WHERE gameID = ?");
    ps.setString(1, id);

    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<h2>Edit Game</h2>

<form action="UpdateGameServlet" method="post">
    <input type="hidden" name="gameID" value="<%= rs.getString("gameID") %>">

    <input type="text" name="gameTitle" value="<%= rs.getString("gameTitle") %>">
    <input type="text" name="gameDescription" value="<%= rs.getString("gameDescription") %>">
    <input type="text" name="gamePrice" value="<%= rs.getDouble("gamePrice") %>">

    <button type="submit">Update</button>
</form>