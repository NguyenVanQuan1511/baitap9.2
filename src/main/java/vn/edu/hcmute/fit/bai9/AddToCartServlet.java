package vn.edu.hcmute.fit.bai9;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product = request.getParameter("product");
        if (product != null && !product.trim().isEmpty()) {
            HttpSession session = request.getSession();
            @SuppressWarnings("unchecked")
            Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }
            cart.put(product, cart.getOrDefault(product, 0) + 1);
            session.setAttribute("cart", cart);
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}