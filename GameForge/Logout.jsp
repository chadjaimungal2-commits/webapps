
<html>
<head>
    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" type="text/css" href="index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
   
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <main>  
    <br>
   
        <%
            session.setAttribute("empEmail",null);
            session.setAttribute("empName",null);
            session.setAttribute("empPass",null);
            session.setAttribute ("custEmail",null);
            session.setAttribute("custName",null);
            session.setAttribute("custPass",null);


    
        %>
        
        <h1>You have been logged out.</h1>
</main>
    
    
    
</body>
</html>

</htm>