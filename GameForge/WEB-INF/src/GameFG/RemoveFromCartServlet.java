package GameFG;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class RemoveFromCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        cart c = (cart) session.getAttribute("cart");

        if (c != null) {

            String gameID = request.getParameter("gameId");

            
            c.removeItem(gameID);

            session.setAttribute("cart", c);
        }

        
        response.sendRedirect("cart.jsp");
    }
}