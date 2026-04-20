<%@ page import="java.util.List" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="GameFG.game" %>
<%@ page import="GameFG.cart" %>
<%
   DBConnect db = new DBConnect();
    Connection conn = db.getConnection();

   
    String GameID = request.getParameter("GameID");

    if (GameID != null && request.getParameter("gameTitle") != null) {

        String title = request.getParameter("gameTitle");
        String desc = request.getParameter("gameDescription");
        double price = Double.parseDouble(request.getParameter("gamePrice"));

        PreparedStatement ps = conn.prepareStatement(
            "INSERT INTO Game (Title, Description, Price) VALUES (?, ?, ?)"
        );

       
        ps.setString(1, title);
        ps.setString(2, desc);
        ps.setDouble(3, price);

        ps.executeUpdate();
    }

    String deleteID = request.getParameter("deleteID");

    if (deleteID != null) {
        PreparedStatement ps = conn.prepareStatement(
            "DELETE FROM Game WHERE GameID = ?"
        );

        ps.setString(1, deleteID);
        ps.executeUpdate();
    }
%>

<html>
<head>
    
     <link rel="stylesheet" href="navbar.css">
    <title>Admin Dashboard</title>

    <style>
        body {
            background-color: #0b0b0b;
            color: white;
            font-family: Arial;
        }

        h2 {
            text-align: center;
        }

        .container {
            width: 90%;
            margin: auto;
        }

        .form-box {
            background: #1a1a1a;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .form-box input {
            padding: 8px;
            margin: 5px;
            border-radius: 5px;
            border: none;
        }

        .form-box button {
            padding: 10px 15px;
            background: #00c853;
            border: none;
            color: white;
            border-radius: 5px;
            cursor: pointer;
        }

        .games-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .game-card {
            background: #1a1a1a;
            padding: 15px;
            border-radius: 10px;
        }

        .price {
            color: #00e676;
            margin: 10px 0;
        }

        .btn {
            padding: 6px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
        }

        .delete {
            background: red;
        }

        .edit {
            background: orange;
        }
    </style>
</head>

<body>
  <%@ include file="navbar.jsp" %>

<div class="container">

    <h2>Admin Dashboard</h2>

    
    <div class="form-box">
        <form method="post">
            <input type="text" name="gameID" placeholder="Game ID" required>
            <input type="text" name="gameTitle" placeholder="Title" required>
            <input type="text" name="gameDescription" placeholder="Description">
            <input type="text" name="gamePrice" placeholder="Price" required>
            <button type="submit">Add Game</button>
        </form>
    </div>

    <h3>All Games</h3>

    <div class="games-grid">

    <%
            conn = db.getConnection();
        
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Game");
        ResultSet rs = ps.executeQuery();
    

        while (rs.next()) {
    %>

        <div class="game-card">
            <h3><%= rs.getString("Title") %></h3>
            <div class="price">$<%= rs.getDouble("Price") %></div>

          
            <form method="post" style="display:inline;">
                <input type="hidden" name="deleteID" value="<%= rs.getString("GameID") %>">
                <button class="btn delete">Delete</button>
            </form>

            <form action="editGame.jsp" method="get" style="display:inline;">
                <input type="hidden" name="gameID" value="<%= rs.getString("GameID") %>">
                <button class="btn edit">Edit</button>
            </form>
        </div>

    <%
        }
        
    %>

    </div>

</div>

</body>
</html>