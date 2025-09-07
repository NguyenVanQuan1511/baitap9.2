<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Welcome to the Download Application</h1>
<c:if test="${not empty cookie['firstName']}">
    <p>Welcome back, <c:out value="${cookie['firstName'].value}" escapeXml="true"/></p>
</c:if>
<a href="register.jsp">Register</a> | <a href="cookies.jsp">View Cookies</a>
<br><br>
<h2>Product List</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Price</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td><c:out value="${product.id}" escapeXml="true"/></td>
            <td><c:out value="${product.name}" escapeXml="true"/></td>
            <td><c:out value="${product.price}" escapeXml="true"/></td>
        </tr>
    </c:forEach>
</table>
<br>
<a href="${pageContext.request.contextPath}/loadProducts">Refresh Products</a>
</body>
</html>