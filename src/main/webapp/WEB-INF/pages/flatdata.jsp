<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Flat info</title>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="flats">

    <h2>Flat</h2>

    <table class="table table-hover">
        <tr>
            <th class="col-md-1">ID</th>
            <th class="col-md-1">Rooms</th>
            <th class="col-md-1">Area</th>
            <th class="col-md-1">Floor</th>
            <th class="col-md-2">District</th>
            <th class="col-md-2">Price</th>
            <th class="col-md-3">Address</th>
            <th class="col-md-2">Purchased</th>
        </tr>
        <tr>
            <td>${flat.id}</td>
            <td>${flat.rooms}</td>
            <td>${flat.area}</td>
            <td>${flat.floor}</td>
            <td>${flat.district}</td>
            <td>${flat.price}</td>
            <td>${flat.address}</td>
            <td>${flat.purchased ? "Yes" : "No"}</td>
        </tr>
    </table>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>
</html>