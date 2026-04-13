<html>
<head>
    <link rel="stylesheet" href="navbar.css">
     <link rel="stylesheet" type="text/css" href="index.css">
    <style>
        #heading1{
            color: darkblue;
            text-align: center;
            font-family: Helvetica;
        }

               
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
	
	<h1 id="heading1"> Successfully Submitted</h1>
	<br/> <br/>
	
    <%
       String userName = request.getParameter("uName");
    %>

    
</body>
</html>