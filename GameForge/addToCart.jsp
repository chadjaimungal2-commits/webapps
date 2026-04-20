<%@ page import="java.util.*" %>
<%@ page import="GameFG.cart" %>
<%@ page import="GameFG.DBConnect" %>



<%    

        // this is to check if the user is logged in, if not it will redirect to login page cause you must be login to add to the cart
        if (session.getAttribute("custEmail") == null && session.getAttribute("empEmail") == null) {
            response.sendRedirect("Login.jsp?message=Please+log+in+to+add+items+to+your+cart");
            return;
        }
         int gameID = Integer.parseInt(request.getParameter("gameID"));
         List<Integer> cart = (List<Integer>) session.getAttribute("cart");
           // this creates a new cart item with the gameID and adds it to the cart, then updates the session attribute with the new cart
         if (cart == null) {
             cart = new ArrayList<>();
         }
          
            cart.add(gameID);
            session.setAttribute("cart", cart);
            response.sendRedirect("index.jsp?message=Item+added+to+cart");

    






%>