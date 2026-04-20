<%@ page import="GameFG.loginService" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="GameFG.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
            
            <head>  
            <title> Discover Games</title>
            <link rel="stylesheet" href="navbar.css">
            <link rel="stylesheet" type="text/css" href="index.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
            </head>
        <body>
        <head>
            <title>Discover Games</title>
            <link rel="stylesheet" href="styles.css">
        </head>
        <body>
            <%@ include file="navbar.jsp" %>

            <h1>🎮 Discover Games</h1>

            
            <section>
                <h2>🔥 New Games</h2>
                <div class="game-container">
                    <%
                        if (newGames != null) {
                            for (Game game : newGames) {
                    %>
                        <div class="game-card">
                            <img src="<%= game.getImageUrl() %>" alt="Game Image">
                            <h3><%= game.getTitle() %></h3>
                            <p>$<%= game.getPrice() %></p>
                            <a href="gameDetails.jsp?id=<%= game.getId() %>">View</a>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <p>No new games available.</p>
                    <%
                        }
                    %>
                </div>
            </section>

          
            <section>
                <h2>⭐ Popular Games</h2>
                <div class="game-container">
                    <%
                        if (popularGames != null) {
                            for (Game game : popularGames) {
                    %>
                        <div class="game-card">
                            <img src="<%= game.getImageUrl() %>" alt="Game Image">
                            <h3><%= game.getTitle() %></h3>
                            <p>$<%= game.getPrice() %></p>
                            <a href="gameDetails.jsp?id=<%= game.getId() %>">View</a>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <p>No popular games available.</p>
                    <%
                        }
                    %>
                </div>
            </section>


           
            <section>
                <h2>💡 Recommended For You</h2>
                <div class="game-container">
                    <%
                        if (recommendedGames != null) {
                            for (Game game : recommendedGames) {
                    %>
                        <div class="game-card">
                            <img src="<%= game.getImageUrl() %>" alt="Game Image">
                            <h3><%= game.getTitle() %></h3>
                            <p>$<%= game.getPrice() %></p>
                            <a href="gameDetails.jsp?id=<%= game.getId() %>">View</a>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <p>No recommendations yet.</p>
                    <%
                        }
                    %>
                </div>
            </section>

         
            <section>
                <h2>🆓 Free Games</h2>
                <div class="game-container">
                    <%
                        if (freeGames != null) {
                            for (Game game : freeGames) {
                    %>
                        <div class="game-card">
                            <img src="<%= game.getImageUrl() %>" alt="Game Image">
                            <h3><%= game.getTitle() %></h3>
                            <p>FREE</p>
                            <a href="gameDetails.jsp?id=<%= game.getId() %>">Play Now</a>
                        </div>
                    <%
                            }
                        } else {
                    %>
                        <p>No free games available.</p>
                    <%
                        }
                    %>
                </div>
            </section>



        </body>
    </html>

    <section>
        <h2>💡 Recommended For You</h2>
       
        <h2>🆓 Free Games</h2>
       
        </div>
    </section>

        </body>