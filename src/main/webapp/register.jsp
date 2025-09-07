<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h1>Register</h1>
<c:if test="${not empty param.error}">
    <p class="error"><c:out value="${param.error}" escapeXml="true"/></p>
</c:if>
<form action="${pageContext.request.contextPath}/cookies.jsp" method="post">
    First Name: <input type="text" name="firstName" value="${param.firstName}" required><br>
    <input type="submit" value="Submit">
</form>
<br>
<a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
</body>
</html>