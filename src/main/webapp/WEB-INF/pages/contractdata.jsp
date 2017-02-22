<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Contract info</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>

</head>
<body>
<h1>Contract info</h1>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Seller</th>
        <th width="120">Buyer</th>
        <th width="120">Realtor</th>
        <th width="120">Flat</th>
        <th width="120">Comission</th>
        <th width="120">Total price</th>
        <th width="120">Purchase date</th>
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
</body>
</html>