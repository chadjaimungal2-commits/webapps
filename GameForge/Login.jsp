
<%@ page import="GameFG.loginService"%>    
<%@ page import="GameFG.DBConnect"%>

<!DOCTYPE html>
<html>
<head>
   
    <title>Game Forge Login</title>
    <link rel="stylesheet"href="navbar.css">
    <link rel="stylesheet" href="GameForgeDesign.css">
    
    <script>
    function verifyLogin() {
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;

        if(email == ""){
            alert("Email cannot be empty");
            return false;
        }

        if(password == ""){
            alert("Password cannot be empty");
            return false;
        }

        if(password.length < 6){
            alert("Password must be at least 6 characters");
            return false;
        }

        return true;
    }
    </script>
</head>

<body>
        <%@ include file="navbar.jsp" %>
    <main> 

        

        
        <!-- About Us button bottom-right -->
        <a href="About Us.jsp" id="aboutus-button">About Us</a>

        <!-- Login Container -->
        <div id="login-container">

            <div id="login-header">
                <h1 id="heading1">Login</h1>
            </div>

            <div id="login-card">

                <form action="loginProcess.jsp" method="post" onsubmit="return verifyLogin()">

                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" id="email" name="email">
                    </div>

                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" id="password" name="password">
                    </div>

                    <button type="submit" class="log-but">Login</button>

                </form>

            </div>

        </div>
 </main>
</body>
</html>