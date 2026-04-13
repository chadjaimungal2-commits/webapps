
<%@ page import="GameFG.loginService" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="GameFG.*" %>

<!DOCTYPE html>

<html>
<head>
    <link rel="stylesheet" href="navbar.css">
     <link rel="stylesheet" type="text/css" href="index.css">
   
   
</head>
<body>
    <%@ include file="navbar.jsp" %>

    <br>
    <%
    String UserEmail = (String) session.getAttribute("empEmail");
    String empPass = (String) session.getAttribute("empPass");
    String empName = (String) session.getAttribute("empName");
    %>
       <%
    if (UserEmail == null) {
        try{
        response.sendRedirect("Login.jsp");
        }
        catch(Exception e){
            out.println("Redirecting Error:"+e.getMessage());

        }
    }   
    %>
    <h1>Welcome, <%= empName %>!</h1>
    <form action="Logout.jsp" method="post">
        <button type="submit" class="log-but">Logout</button>
    </form>
    
    
</body>
</html>

</htm>