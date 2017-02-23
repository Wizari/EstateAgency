<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Realtor info</title>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="realtors">

    <h2>Realtor</h2>

    <table class="table table-hover">
        <tr>
            <th class="col-md-1">ID</th>
            <th class="col-md-6">FIO</th>
            <th class="col-md-5">Phone</th>
        </tr>
        <tr>
            <td>${realtor.id}</td>
            <td>${realtor.fio}</td>
            <td>${realtor.phone}</td>
        </tr>
    </table>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>
</html>