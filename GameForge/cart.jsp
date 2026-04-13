<%@ page import="java.util.*" %>
<%@ page import="GameFG.cart" %>
<%@ page import="GameFG.game" %>

<html>
<head>  
    <title>Game Forge Cart</title>

    <link rel="stylesheet" href="navbar.css">
    <link rel="stylesheet" type="text/css" href="index.css">

    <style>
        .cart-container {
            width: 80%;
            margin: auto;
            padding: 20px;
          
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            background: #111;
            color: white;
              border-radius: 12px;
        }

        .cart-table th, .cart-table td {
            padding: 12px;
            border-bottom: 1px solid #333;
            text-align: center;
        }

        .cart-table th {
            background: #222;
        }

        .remove-btn {
            background: red;
            border: none;
            padding: 6px 10px;
            color: white;
            cursor: pointer;
            border-radius: 5px;
        }

        .checkout-btn {
            background: green;
            border: none;
            padding: 10px 15px;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            float: right;
            margin-top: 15px;
        }

        .total {
            text-align: right;
            margin-top: 15px;
            font-size: 18px;
        }

        h2 {
            color: white;
        }

        body {
            background-color: #0b0b0b;
        }
    </style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<main>
    <section class="main-content">

        <div class="cart-container">

            <h2>Your Cart</h2>

            <table class="cart-table">
                <tr>
                    <th>Game</th>
                    <th>Price</th>
                    <th>Action</th>
                </tr>

                
                <%
                    List<Integer> cart = (List<Integer>) session.getAttribute("cart");
                    double total = 0;

                    if (cart != null && !cart.isEmpty()) {

                        for (Integer gameId : cart) {
                            game g = GameDAO.getGameById(gameId);       
                            total += g.getGamePrice();
                %>

                <tr>
                    <td><%= g.getGameTitle() %></td>
                    <td>$<%= g.getGamePrice() %></td>
                    <td>
                        <form action="RemoveFromCartServlet" method="post">
                            <input type="hidden" name="gameId" value="<%= g.getGameID() %>">
                            <button class="remove-btn">Remove</button>
                        </form>
                    </td>
                </tr>

                <%
                        }
                    } else {
                %>

                <tr>
                    <td colspan="3">Your cart is empty</td>
                </tr>

                <%
                    }
                %>
    
            </table>

            <div class="total">
                Total: $<%= total %>
            </div>

            <form action="CheckoutServlet" method="post">
                <button class="checkout-btn">Checkout</button>
            </form>

        </div>

    </section>
</main>

<footer class="footer">
    <a href="About Us.jsp" class="about-link">
        <span class="info-icon">i</span>
        <span class="about-text">About Us</span>
    </a>
</footer>

</body>
</html>