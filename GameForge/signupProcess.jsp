<%@ page import="GameFG.*" %>
<% 
    
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");
    String dob = request.getParameter("dob");

    if(name != null && email != null){

    CustomerDAO c = new CustomerDAO();
    c.insertCustomer(name, email, password, phone, dob);
    
   
        response.sendRedirect("Feedback.jsp");
    }
    
%>