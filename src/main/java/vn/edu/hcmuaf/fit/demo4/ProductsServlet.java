package vn.edu.hcmuaf.fit.demo4;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

@WebServlet("/loadProducts")
public class ProductsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Product> products = new ArrayList<>();

        try (InputStream inputStream = getServletContext().getResourceAsStream("/WEB-INF/projects.txt");
             BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            int id = 1;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (!line.isEmpty()) {
                    // Tách tên và giá theo dấu phẩy
                    String[] parts = line.split(",");
                    String name = parts[0].trim();
                    double price = (parts.length > 1) ? Double.parseDouble(parts[1].trim()) : 0.0;

                    products.add(new Product(id++, name, price));
                }
            }
        } catch (Exception e) {
            // Nếu có lỗi đọc file → dùng dữ liệu fallback
            products.add(new Product(1, "Laptop", 1000.0));
            products.add(new Product(2, "Phone", 500.0));
            products.add(new Product(3, "Tablet", 200.0));
        }

        // Lưu vào request
        request.setAttribute("products", products);
        // Chuyển hướng về index.jsp
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
