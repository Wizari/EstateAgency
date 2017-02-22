<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sellers</title>

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

<h1>Sellers list</h1>

<c:if test="${!empty listSellers}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Surname</th>
            <th width="120">Firstname</th>
            <th width="120">Lastname</th>
            <th width="120">Phone</th>
            <th width="120">Passport</th>
        </tr>
        <c:forEach items="${listSellers}" var="seller">
            <tr>
                <td>${seller.id}</td>
                <td><a href="/seller/${seller.id}" target="_blank">${seller.surname}</a></td>
                <td>${seller.firstname}</td>
                <td>${seller.lastname}</td>
                <td>${seller.phone}</td>
                <td>${seller.passport}</td>
                <td><a href="<c:url value='/seller/${seller.id}/edit'/>">Edit</a></td>
                <td><a href="<c:url value='/seller/${seller.id}/remove'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add a seller</h1>

<c:url var="addAction" value="/sellers/add"/>

<form:form action="${addAction}" commandName="seller">
    <table>
        <c:if test="${seller.id != 0}">
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
                <form:label path="surname">
                    <spring:message text="Surname"/>
                </form:label>
            </td>
            <td>
                <form:input path="surname" required="required"/>
            </td>
            <td><form:errors path="surname" cssClass="error"/></td>
        </tr>
        <tr>
            <td>
                <form:label path="firstname">
                    <spring:message text="First name"/>
                </form:label>
            </td>
            <td>
                <form:input path="firstname" required="required"/>
            </td>
            <td><form:errors path="firstname" cssClass="error"/></td>
        </tr>
        <tr>
            <td>
                <form:label path="lastname">
                    <spring:message text="Last name"/>
                </form:label>
            </td>
            <td>
                <form:input path="lastname" required="required"/>
            </td>
            <td><form:errors path="lastname" cssClass="error"/></td>
        </tr>
        <tr>
            <td>
                <form:label path="phone">
                    <spring:message text="Phone"/>
                </form:label>
            </td>
            <td>
                <form:input path="phone" required = "required"/>
            </td>
            <td><form:errors path="phone" cssClass="error"/></td>


        </tr>
        <tr>
            <td>
                <form:label path="passport">
                    <spring:message text="Passport"/>
                </form:label>
            </td>
            <td>
                <form:input path="passport" required="required"/>
            </td>
            <td><form:errors path="passport" cssClass="error"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${seller.id != 0}">
                    <input type="submit"
                           value="<spring:message text="Edit"/>"/>
                </c:if>
                <c:if test="${seller.id == 0}">
                    <input type="submit"
                           value="<spring:message text="Add"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
