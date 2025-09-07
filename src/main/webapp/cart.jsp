<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<html>
<head>
    <title>The Cart page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h3>Your cart</h3>
<table border="1">
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th>Action</th>
    </tr>
    <%
        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
    <tr><td colspan="5">Your cart is empty</td></tr>
    <%
    } else {
        Map<String, Double> products = new HashMap<>();
        products.put("86 (the band) - True Life Songs and Pictures", 14.95);
        products.put("Paddlefoot - The first CD", 12.95);
        products.put("Paddlefoot - The second CD", 14.95);
        products.put("Joe Rut - Genuine Wood Grained Finish", 14.95);

        for (Map.Entry<String, Integer> entry : cart.entrySet()) {
            String item = entry.getKey();
            int quantity = entry.getValue();
            double price = products.getOrDefault(item, 0.0);
            double amount = price * quantity;
    %>
    <tr>
        <td>
            <form action="${pageContext.request.contextPath}/updateCart" method="post" style="display:inline;">
                <input type="number" name="quantity" value="<%= quantity %>" min="0" style="width: 60px; margin-right: 5px;">
                <input type="hidden" name="item" value="<%= item %>">
                <input type="submit" value="Update" style="padding: 5px 10px;">
            </form>
        </td>
        <td><%= item %></td>
        <td>$<%= String.format("%.2f", price) %></td>
        <td>$<%= String.format("%.2f", amount) %></td>
        <td>
            <form action="${pageContext.request.contextPath}/removeItem" method="post" style="display:inline;">
                <input type="hidden" name="item" value="<%= item %>">
                <input type="submit" value="Remove Item" style="padding: 5px 10px;">
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
<p>To change the quantity, enter the new quantity and click on the Update button.</p>
<a href="${pageContext.request.contextPath}/index.jsp">Continue Shopping</a> |
<a href="${pageContext.request.contextPath}/checkout">Checkout</a>
</body>
</html>