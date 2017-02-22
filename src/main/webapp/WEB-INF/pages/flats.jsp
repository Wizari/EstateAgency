<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flats</title>

    <style type="text/css">

        .error {
            color: #ff0000;
        }

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
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Flats list</h1>

<c:if test="${!empty listFlats}">
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
        <c:forEach items="${listFlats}" var="flat">
            <tr>
                <td><a href="/flat/${flat.id}" target="_blank">${flat.id}</a></td>
                <td>${flat.rooms}</td>
                <td>${flat.area}</td>
                <td>${flat.floor}</td>
                <td>${flat.district}</td>
                <td>${flat.price}</td>
                <td>${flat.address}</td>
                <td>${flat.purchased ? "Yes" : "No"}</td>
                <td><a href="<c:url value='/flat/${flat.id}/edit'/>">Edit</a></td>
                <td><a href="<c:url value='/flat/${flat.id}/remove'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add a flat</h1>

<c:url var="addAction" value="/flats/add"/>

<form:form action="${addAction}" commandName="flat">
    <table>
        <c:if test="${flat.id != 0}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="rooms">
                    <spring:message text="Rooms"/>
                </form:label>
            </td>
            <td>
                <form:input path="rooms" required="required"/>
            </td>
            <td>
                <form:errors path="rooms" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="area">
                    <spring:message text="Area"/>
                </form:label>
            </td>
            <td>
                <form:input path="area" required="required"/>
            </td>
            <td>
                <form:errors path="area" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="floor">
                    <spring:message text="Floor"/>
                </form:label>
            </td>
            <td>
                <form:input path="floor"/>
            </td>
            <td>
                <form:errors path="floor" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="district">
                    <spring:message text="District"/>
                </form:label>
            </td>
            <td>
                <form:input path="district" required="required"/>
            </td>
            <td>
                <form:errors path="district" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="price">
                    <spring:message text="Price"/>
                </form:label>
            </td>
            <td>
                <form:input path="price" required="required"/>
            </td>
            <td>
                <form:errors path="price" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="address">
                    <spring:message text="Address"/>
                </form:label>
            </td>
            <td>
                <form:input path="address" required="required"/>
            </td>
            <td>
                <form:errors path="address" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${flat.id !=0}">
                    <input type="submit"
                           value="<spring:message text="Edit"/>"/>
                </c:if>
                <c:if test="${flat.id == 0}">
                    <input type="submit"
                           value="<spring:message text="Add"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
