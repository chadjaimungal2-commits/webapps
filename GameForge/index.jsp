<%@ page import="java.util.List" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="GameFG.game" %>
<%@ page import="GameFG.cart" %>
<%@ page import="javax.servlet.http.HttpSession" %>


<%
DBConnect db = new DBConnect();
Connection conn = db.getConnection();

PreparedStatement ps = conn.prepareStatement("SELECT * FROM Game");
ResultSet rs = ps.executeQuery();

// this will store the images, titles, and ids in separate lists for later use for db
List<String> images = new java.util.ArrayList<>();
List<String> titles = new java.util.ArrayList<>();
List<Integer> ids = new java.util.ArrayList<>();

while (rs.next()) {
    images.add(rs.getString("Image"));
    titles.add(rs.getString("Title"));
    ids.add(rs.getInt("GameID"));
}
%> 


 

<html>

    <head>  
     <title>Game Forge Home Page</title>
     <link rel="stylesheet" href="navbar.css">
     <link rel="stylesheet" type="text/css" href="index.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
     
     


    </head>

    <footer class ="footer">
        <a href="About Us.jsp" class="about-link">
        <span class="info-icon">i</span>
        <span class="about-text">About Us</span>
        </a>


    </footer>
    

<body>
     <%@ include file="navbar.jsp" %>
     
     
    
   
        <main>
        <section class ="main-content">

                <div class="content">
                    <div class="arrow left" onclick="prevGame()"><i class="fa-solid fa-arrow-left"></i></div>
                    <div class="arrow right" onclick="nextGame()"><i class="fa-solid fa-arrow-right"></i></div>
                    <h2 class="discover"> Discover | Browse</h2>
                    
                        
                        <% if (!images.isEmpty()) { %>
                            <img id="MainImage" src="Images/<%= images.get(0) %>" 
                        
                            class="game-cover-r">
                        <% } %>
                        <h2  id="MainTitle"class="featured"><%=titles.get(0)%></h2>
         
                </div>
            <div class = "side-content">

                <%  for (int i = 1; i < images.size() && i < 5; i++) {

                  
                    %>

                    <div class="side-game" id="side<%=i%>"> 
                        <img src="Images/<%= images.get(i) %>" class="img-column" onmouseover="changeMain(<%= i%>)", onmouseout="delayedChange(<%= i%>)">
                        <div class = "game-info">
                        <div class="groupbuttons">
                        <p>
                            <form action ="AddToCartServlet" method ="post">
                                <input type="hidden"  name="gameID"  value="<%= ids.get(i)%>">
                            <button class="cart-button"><i class="fas fa-cart-plus"></i></button>

                            </form>

                            <form action ="BuyNowServlet" method ="post">
                            <input type="hidden" name="gameID" value="<%= ids.get(i) %>">
                            <button class="buy-button">BUY NOW</button>
                            </form>
                        </p>
                        </div>
                        <h3 > <%= titles.get(i) %> </h3>
                        
                        </div>
                        </div>

                <% } %>


            </div>

            


                




        </section>


        
    
    
    </main>


</body>




<script>
var game = [
    <% for (int i = 0; i < images.size(); i++) { %>
       {
        image: "Images/<%=images.get(i) %>",
        title: "<%= titles.get(i) %>"
       },
    <% } %>
];
let index = 0;
function updateDisplay() {
    const mainImg = document.getElementById('MainImage');
    const mainTitle = document.getElementById('MainTitle');
    if (index >= game.length) {
        index = 0;
    }
    if (index < 0) {
        index = game.length - 1;
    }


    // smooth fade
    mainImg.style.opacity = 0;

    setTimeout(() => {
        mainImg.src = game[index].image;
        mainTitle.textContent = game[index].title;

        mainImg.style.opacity = 1;

        
        setTimeout(() => {
             updateSideImages();
        }, 1000); // fade out after 4 seconds
       
    }, 300);
}

function updateSideImages() {
    
    for (let i = 1; i <=4; i++) {
        let gameIndex = (index + i ) % game.length;
        let sideDiv = document.getElementById('side' + i);  
        let sideImage = sideDiv.querySelector('.img-column');
        let sideTitle = sideDiv.querySelector('h3');

        
        sideImage.style.opacity = 0;
        sideTitle.style.opacity = 0;
       
        


        setTimeout(() => {
            sideImage.style.opacity = 1;
            sideTitle.style.opacity = 1;
          
      

     
            sideImage.src = game[gameIndex].image;
        
            sideTitle.textContent = game[gameIndex].title;
            sideImage.setAttribute('onmouseover',
            "changeMain(" + gameIndex + ")","delayedChange(" + gameIndex + ")"); 
         }, 1000);
         let hoverTimer;

            function delayedChange(i) {
                clearTimeout(hoverTimer);
                hoverTimer = setTimeout(() => {
                    changeMain(i);
                }, 300); // delay of 3 seconds
            }

           
    }
}



function changeMain(newIndex) {
    index=newIndex;
    updateDisplay ();
 
    
}
function nextGame() {
    index++;
   
    updateDisplay();
    
}
function prevGame() {
    index--;
    updateDisplay();
}

setInterval(function () {
    nextGame();
}, 5000);
    

</script>

</html>
