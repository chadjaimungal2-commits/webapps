<%@ page import="GameFG.loginService" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="GameFG.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>



<%
DBConnect db = new DBConnect();
Connection conn = db.getConnection();
String genre = request.getParameter("genre");

PreparedStatement ps = conn.prepareStatement("SELECT * FROM Game");
ResultSet rs = ps.executeQuery();
    if (genre != null&&!genre.equals("All")) {
          ps= conn.prepareStatement("SELECT * FROM Game WHERE Genre LIKE ?");
          ps.setString(1, "%" + genre + "%");
          rs = ps.executeQuery();
         
        }
        else {
            ps= conn.prepareStatement("SELECT * FROM Game");
         
             
        }
        
        
        
        

// this will store the images, titles, and ids in separate lists for later use for db
List<String> imagesCAT = new java.util.ArrayList<>();
List<String> titlesCAT = new java.util.ArrayList<>();
List<Integer> idsCAT = new java.util.ArrayList<>();
List<String> genres = new java.util.ArrayList<>();


while (rs.next()) {
    imagesCAT.add(rs.getString("Image"));
    titlesCAT.add(rs.getString("Title"));
    idsCAT.add(rs.getInt("GameID"));
    genres.add(rs.getString("Genre"));

}
%> 
<html>
<head>
     <link rel="stylesheet" href="navbar.css">
     <link rel="stylesheet" type="text/css" href="index.css"> 
     <link rel ="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="Categories.css">
        
</head>
<body>

    <%@ include file="navbar.jsp" %>
    <section class="Genres"> 
        
    
        <a class="G" href="Categories.jsp?genre=All">All</a>
        <a class="G" href="Categories.jsp?genre=Action">Action</a>
        <a class="G" href="Categories.jsp?genre=Adventure">Adventure</a>
        <a class="G" href="Categories.jsp?genre=RPG">RPG</a>   
        <a class="G" href="Categories.jsp?genre=Sports">Sports</a>
        <a class="G" href="Categories.jsp?genre=Strategy">Strategy</a> 
        <a class="G" href="Categories.jsp?genre=Action-Adventure">Action-Adventure</a>
        <a class="G" href="Categories.jsp?genre=Horror">Horror</a>
        <a class="G" href="Categories.jsp?genre=Indie">Indie</a>
        <a class="G"href="Categories.jsp?genre=Racing">Racing</a>



    </section>
    
    
    <section class ="game-categories">
         <%  for (int i = 0; i < imagesCAT.size();  i++) { %>

                  
                   
       
                <div class = "Game-card">
                    <img src="Images/<%= imagesCAT.get(i) %>" alt="Action Games" class="Game-image">
                    <h2 class="Game-title"><%= titlesCAT.get(i) %></h2>
                    <div class="buttons">
                        <p>
                            <form action ="addToCart.jsp" method ="post">
                                <input type="hidden"  name="gameID"  value="<%= idsCAT.get(i)%>">
                            <button class="cart-button"><i class="fas fa-cart-plus"></i></button>

                            </form>

                            <form action ="buyNow.jsp" method ="post">
                            <input type="hidden" name="gameID" value="<%= idsCAT.get(i) %>">
                            <button class="buy-button">BUY GAME</button>
                            </form>
                        </p>
                    </div>
                     

                </div>
                <% } %>
   
        
        
    </section>
    
</body>
</html>

</html>