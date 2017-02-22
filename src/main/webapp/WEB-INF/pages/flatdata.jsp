<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Flat info</title>

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
<h1>Flat info</h1>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Rooms</th>
        <th width="120">Area</th>
        <th width="120">Floor</th>
        <th width="120">District</th>
        <th width="120">Price</th>
        <th width="120">Address</th>
        <th width="120">Purchased</th>
    </tr>
    <tr>
        <td><a href="/flat/${flat.id}" target="_blank">${flat.id}</a></td>
        <td>${flat.rooms}</td>
        <td>${flat.area}</td>
        <td>${flat.floor}</td>
        <td>${flat.district}</td>
        <td>${flat.price}</td>
        <td>${flat.address}</td>
        <td>${flat.purchased ? "Yes" : "No"}</td>
    </tr>
</table>
</body>
</html>