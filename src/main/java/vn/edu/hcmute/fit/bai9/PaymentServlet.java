package vn.edu.hcmute.fit.bai9;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@WebServlet("/payment")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");

        if (cart != null && !cart.isEmpty()) {
            String cardNumber = request.getParameter("cardNumber");
            String expiryDate = request.getParameter("expiryDate");

            if (cardNumber != null && expiryDate != null && !cardNumber.trim().isEmpty() && !expiryDate.trim().isEmpty()) {
                session.removeAttribute("cart");
                response.sendRedirect(request.getContextPath() + "/payment_success.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/checkout?error=invalid_payment");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/checkout?error=empty_cart");
        }
    }
}