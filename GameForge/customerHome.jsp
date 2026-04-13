<%@ page import="GameFG.loginService" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="GameFG.*" %>
<html>
<head>
     <link rel="stylesheet" href="navbar.css">
     <link rel="stylesheet" type="text/css" href="index.css">
   
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <br>
    <%
    String uemail = (String) session.getAttribute("custEmail");
    String custName = (String) session.getAttribute("custName");
    String custPass = (String) session.getAttribute("custPass");
    %>
    <%
    if (uemail == null) {
        try{
             response.sendRedirect("Login.jsp");
        }
        catch( Exception e)
        {
            out.println("Redirecting Error:"+e.getMessage());

        }
       
    }   
    %>
    <h1>Welcome, <%= custName %>!</h1>
    <form action="Logout.jsp" method="post">
        <button type="submit" class="log-but">Logout</button>
    </form>
    
    
</body>
</html>

</htm>