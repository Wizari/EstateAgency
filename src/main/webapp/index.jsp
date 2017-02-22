<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Estate agency</title>
</head>
<body>
<h3>Estate agency</h3>
<br/>
<a href="<c:url value="/sellers"/>" >Sellers list</a><br>
<a href="<c:url value="/buyers"/>" >Buyers list</a><br>
<a href="<c:url value="/realtors"/>" >Realtors list</a><br>
<a href="<c:url value="/flats"/>" >Flats list</a><br>
<a href="<c:url value="/contracts"/>" >Contracts list</a><br>
<br/>
</body>
</html>