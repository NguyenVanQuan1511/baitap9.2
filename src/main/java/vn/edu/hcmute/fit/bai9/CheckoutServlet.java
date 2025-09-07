package vn.edu.hcmute.fit.bai9;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        out.println("<!DOCTYPE html><html><head><title>Checkout</title>");
        out.println("<link rel='stylesheet' type='text/css' href='" + request.getContextPath() + "/css/styles.css'>");
        out.println("</head><body>");
        out.println("<h3>Checkout Page</h3>");
        if (cart == null || cart.isEmpty()) {
            out.println("<p>Your cart is empty. <a href='" + request.getContextPath() + "/index.jsp'>Continue Shopping</a></p>");
        } else {
            out.println("<p>Review your order:</p>");
            out.println("<table border='1'><tr><th>Product</th><th>Quantity</th><th>Price</th><th>Amount</th></tr>");
            Map<String, Double> products = getProductPrices();
            double total = 0.0;
            for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                String item = entry.getKey();
                int quantity = entry.getValue();
                double price = products.getOrDefault(item, 0.0);
                double amount = price * quantity;
                total += amount;
                out.println("<tr><td>" + item + "</td><td>" + quantity + "</td><td>$" + String.format("%.2f", price) + "</td><td>$" + String.format("%.2f", amount) + "</td></tr>");
            }
            out.println("<tr><td colspan='3'><b>Total</b></td><td><b>$" + String.format("%.2f", total) + "</b></td></tr>");
            out.println("</table>");
            out.println("<form action='" + request.getContextPath() + "/payment' method='post'>");
            out.println("<label for='cardNumber'>Card Number:</label><input type='text' id='cardNumber' name='cardNumber' required><br>");
            out.println("<label for='expiryDate'>Expiry Date (MM/YYYY):</label><input type='text' id='expiryDate' name='expiryDate' required><br>");
            out.println("<input type='submit' value='Submit Payment'>");
            out.println("</form>");
        }
        out.println("<a href='" + request.getContextPath() + "/cart'>Back to Cart</a>");
        out.println("</body></html>");
    }

    private Map<String, Double> getProductPrices() {
        Map<String, Double> products = new HashMap<>();
        products.put("86 (the band) - True Life Songs and Pictures", 14.95);
        products.put("Paddlefoot - The first CD", 12.95);
        products.put("Paddlefoot - The second CD", 14.95);
        products.put("Joe Rut - Genuine Wood Grained Finish", 14.95);
        return products;
    }
}