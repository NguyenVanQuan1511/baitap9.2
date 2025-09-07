<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<html>
<head>
    <title>Cookies</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Cookies</h1>

<%
    String firstName = request.getParameter("firstName");

    // Nếu có tham số từ form -> tạo cookie
    if (firstName != null && !firstName.trim().isEmpty()) {
        Cookie cookie = new Cookie("firstName", firstName);
        cookie.setMaxAge(3600); // 1 giờ
        response.addCookie(cookie);
        out.println("<p class='notification'>Cookie for 'firstName' set to: " + firstName + "</p>");
    } else {
        // Nếu không có param, thử lấy từ cookie
        Cookie[] cookies = request.getCookies();
        String savedName = null;
        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("firstName".equals(c.getName())) {
                    savedName = c.getValue();
                    break;
                }
            }
        }
        if (savedName != null) {
            out.println("<p class='notification'>Welcome back, " + savedName + "!</p>");
        } else {
            out.println("<p class='notification'>No first name provided. Please register first.</p>");
        }
    }
%>

<h2>Cookie List</h2>
<c:if test="${not empty pageContext.request.cookies}">
    <table class="cookie-table">
        <tr>
            <th>Name</th>
            <th>Value</th>
        </tr>
        <c:forEach var="cookie" items="${pageContext.request.cookies}">
            <tr>
                <td><c:out value="${cookie.name}" /></td>
                <td><c:out value="${cookie.value}" /></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<c:if test="${empty pageContext.request.cookies}">
    <p class="notification">No cookies available.</p>
</c:if>

<a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
</body>
</html>
