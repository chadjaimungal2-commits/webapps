<%@ page import="java.sql.*, GameFG.DBConnect" %>

<html>
<head>
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

        /* ADD GAME FORM */
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

        /* GAME CARDS */
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

        .game-card h3 {
            margin: 0;
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

<div class="container">

    <h2>Admin Dashboard</h2>

    <!-- ADD GAME -->
    <div class="form-box">
        <form action="AddGameServlet" method="post">
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
        Connection conn = DBConnect.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM games");

        while (rs.next()) {
    %>

        <div class="game-card">
            <h3><%= rs.getString("gameTitle") %></h3>
            <div class="price">$<%= rs.getDouble("gamePrice") %></div>

            <!-- DELETE -->
            <form action="DeleteGameServlet" method="post" style="display:inline;">
                <input type="hidden" name="gameID" value="<%= rs.getString("gameID") %>">
                <button class="btn delete">Delete</button>
            </form>

            <!-- EDIT -->
            <form action="editGame.jsp" method="get" style="display:inline;">
                <input type="hidden" name="gameID" value="<%= rs.getString("gameID") %>">
                <button class="btn edit">Edit</button>
            </form>
        </div>

    <%
        }
        conn.close();
    %>

    </div>

</div>

</body>
</html>