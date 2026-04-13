
<%@ page import="GameFG.loginService" %>
<%@ page import="GameFG.DBConnect" %>
<%@ page import="java.sql.*" %>
<%@ page import="GameFG.*" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

loginService role = new loginService(email, password);
String type = role.getLoginService();

String location = "http://localhost:8080/GameForge/";

if (type.equals("invalid")){
    location = location + "Login.jsp?loggedIn=no";
}

else if (type.equals("employee")){
    location = location + "employeeHome.jsp";
	String ename = role.getEmployeeName(); 

    session.setAttribute ("empEmail",email);
    session.setAttribute("empName",ename);
    session.setAttribute("empPass", password);
}

else if (type.equals("customer")){
    location = location + "customerHome.jsp";
	String cname = role.getCustomerName();

    session.setAttribute ("custEmail",email);
    session.setAttribute("custName",cname);
    session.setAttribute("custPass", password);
    
}

	   try{
			 response.sendRedirect(location); 
	   }
	   catch(Exception e){
        out.println("Redirecting Error: "+ e.getMessage());
       }
%>
