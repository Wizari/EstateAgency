<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Realtors</title>

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

<h1>Realtors list</h1>

<c:if test="${!empty listRealtors}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="300">fio</th>
            <th width="120">Phone</th>
        </tr>
        <c:forEach items="${listRealtors}" var="realtor">
            <tr>
                <td>${realtor.id}</td>
                <td><a href="/realtor/${realtor.id}" target="_blank">${realtor.fio}</a></td>
                <td>${realtor.phone}</td>
                <td><a href="<c:url value='/realtor/${realtor.id}/edit'/>">Edit</a></td>
                <td><a href="<c:url value='/realtor/${realtor.id}/remove'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add a realtor</h1>

<c:url var="addAction" value="/realtors/add"/>

<form:form action="${addAction}" commandName="realtor">
    <table>
        <c:if test="${realtor.id != 0}">
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
                <form:label path="fio">
                    <spring:message text="fio"/>
                </form:label>
            </td>
            <td>
                <form:input path="fio" required="required"/>
            </td>
            <td>
                <form:errors path="fio" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="phone">
                    <spring:message text="Phone"/>
                </form:label>
            </td>
            <td>
                <form:input path="phone" required="required"/>
            </td>
            <td>
                <form:errors path="phone" cssClass="error" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${realtor.id != 0}">
                    <input type="submit"
                           value="<spring:message text="Edit"/>"/>
                </c:if>
                <c:if test="${realtor.id == 0}">
                    <input type="submit"
                           value="<spring:message text="Add"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
