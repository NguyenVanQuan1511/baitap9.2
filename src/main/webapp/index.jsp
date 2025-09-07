<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>The Index page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<h3>CD List</h3>
<table border="1">
    <tr>
        <th>Description</th>
        <th>Price</th>
        <th>Action</th>
    </tr>
    <tr>
        <td>86 (the band) - True Life Songs and Pictures</td>
        <td>$14.95</td>
        <td><a href="${pageContext.request.contextPath}/addToCart?product=86 (the band) - True Life Songs and Pictures">Add To Cart</a></td>
    </tr>
    <tr>
        <td>Paddlefoot - The first CD</td>
        <td>$12.95</td>
        <td><a href="${pageContext.request.contextPath}/addToCart?product=Paddlefoot - The first CD">Add To Cart</a></td>
    </tr>
    <tr>
        <td>Paddlefoot - The second CD</td>
        <td>$14.95</td>
        <td><a href="${pageContext.request.contextPath}/addToCart?product=Paddlefoot - The second CD">Add To Cart</a></td>
    </tr>
    <tr>
        <td>Joe Rut - Genuine Wood Grained Finish</td>
        <td>$14.95</td>
        <td><a href="${pageContext.request.contextPath}/addToCart?product=Joe Rut - Genuine Wood Grained Finish">Add To Cart</a></td>
    </tr>
</table>
</body>
</html>