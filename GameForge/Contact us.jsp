<html> 

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" href="index.css">
    
</head>
<body>
   <%@ include file="navbar.jsp" %>
    <div class="login-container">
        <h2>Contact Us</h2>
        <form id="loginForm" onsubmit="return verifyLogin()">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>
    </div>
</body>

</html>