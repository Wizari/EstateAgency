<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Contract info</title>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="contracts">

    <h2>Contract</h2>

    <table class="table table-hover">
        <tr>
            <th class="col-md-1">ID</th>
            <th class="col-md-2">Seller</th>
            <th class="col-md-2">Buyer</th>
            <th class="col-md-2">Realtor</th>
            <th class="col-md-1">Flat</th>
            <th class="col-md-1">Comission</th>
            <th class="col-md-1">Total price</th>
            <th class="col-md-2">Purchase date</th>
        </tr>
        <tr>
            <td>${contract.id}</td>
            <td><a href="/seller/${contract.seller.id}">${contract.seller.FIO}</a></td>
            <td><a href="/buyer/${contract.buyer.id}">${contract.buyer.FIO}</a></td>
            <td><a href="/realtor/${contract.realtor.id}">${contract.realtor.FIO}</a></td>
            <td><a href="/flat/${contract.flat.id}">${contract.flat.district}, ${contract.flat.address}</a></td>
            <td>${contract.comission}</td>
            <td>${contract.totalPrice}</td>
            <td>${contract.purchaseDate}</td>
        </tr>
    </table>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>
</html>