<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Buyer info</title>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="buyers">

    <h2>Buyer</h2>

    <table class="table table-hover">
        <tr>
            <th class="col-md-1">ID</th>
            <th class="col-md-3">Surname</th>
            <th class="col-md-2">Firstname</th>
            <th class="col-md-2">Lastname</th>
            <th class="col-md-2">Phone</th>
            <th class="col-md-2">Passport</th>
        </tr>
        <tr>
            <td>${buyer.id}</td>
            <td>${buyer.surname}</td>
            <td>${buyer.firstname}</td>
            <td>${buyer.lastname}</td>
            <td>${buyer.phone}</td>
            <td>${buyer.passport}</td>
        </tr>
    </table>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>
</html>