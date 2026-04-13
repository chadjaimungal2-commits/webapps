<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="GameFG.CustomerDAO" %>
<html>
<head>
 <title>Game Forge Sign Up</title>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" href="GameForgeDesign.css">
    
 

 <script>
    

function verifySignup(){

    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var dob = document.getElementById("dob").value;
    var phone = document.getElementById("phone").value;

    if(name == ""){
        alert("Name cannot be empty");
        return false;
    }

    if(dob == "") {
        alert("Date of Birth cannot be empty");
        return false;
    }

    if(phone == "") {
        alert("Phone number cannot be empty");
        return false;
    }

    if(email == ""){
        alert("Email cannot be empty");
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

            <!-- Top-right button -->


            <div id="signup-container">

            <div id="signup-header">
                <h1 id="heading1">Create Account</h1>
            </div>


            <div id="login-card">

                <form action="signupProcess.jsp" method="post" onsubmit="return verifySignup()">

                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" id="name" name="name">
                    </div>

                    <div class="form-group">
                        <label>Date of Birth:</label>
                        <input type="date" id="dob" name="dob" max="2026-03-08">
                    </div>

                    <div class="form-group">
                        <label>Phone Number:</label>
                        <input type="tel" id="phone" name="phone">
                    </div>

                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" id="email" name="email">
                    </div>

                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" id="password" name="password">
                    </div>

                    <button type="submit" class="log-but">Create Account</button>

                </form>

            </div>

            </div>
    </main>
</body>
</html>