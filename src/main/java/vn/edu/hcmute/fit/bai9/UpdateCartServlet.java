package vn.edu.hcmute.fit.bai9;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/updateCart")
public class UpdateCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String item = request.getParameter("item");
        String quantityStr = request.getParameter("quantity");

        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        if (cart != null && item != null && quantityStr != null) {
            try {
                int quantity = Integer.parseInt(quantityStr);
                if (quantity <= 0) {
                    cart.remove(item);
                } else {
                    cart.put(item, quantity);
                }
                session.setAttribute("cart", cart);
            } catch (NumberFormatException e) {
                // Xử lý lỗi nếu cần
            }
        }
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}