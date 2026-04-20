<%@ page import="java.util.*" %>
<%@ page import="GameFG.cart" %>
<%@ page import ="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%


int gameId = Integer.parseInt(request.getParameter("gameId"));
List<Integer> cart = (List<Integer>) session.getAttribute("cart");
if (cart != null) {
    cart.remove(Integer.valueOf(gameId));
    session.setAttribute("cart", cart);
    response.sendRedirect("cart.jsp?message=Item+removed+from+cart");
} 





%>