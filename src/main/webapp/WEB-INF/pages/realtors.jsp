<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Realtors</title>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="realtors">

    <h2>Realtors</h2>

    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" <c:if test="${realtor.id == 0}">class="active"</c:if>>
            <a href="#realtors-list" aria-controls="realtors-list" role="tab" data-toggle="tab">Realtors list</a>
        </li>
        <li role="presentation" <c:if test="${realtor.id != 0}">class="active"</c:if>>
            <a href="#realtors-add" aria-controls="realtors-add" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-plus"></span>
            </a>
        </li>
    </ul>

    <div class="tab-content">

        <div role="tabpanel" class="tab-pane <c:if test="${realtor.id == 0}">active</c:if>" id="realtors-list">

            <c:if test="${!empty listRealtors}">
                <table class="table table-hover">
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-md-6">FIO</th>
                        <th class="col-md-4">Phone</th>
                        <th class="col-md-1" colspan="2">&nbsp;</th>
                    </tr>
                    <c:forEach items="${listRealtors}" var="realtor">
                        <tr>
                            <td>${realtor.id}</td>
                            <td><a href="/realtor/${realtor.id}" target="_blank">${realtor.fio}</a></td>
                            <td>${realtor.phone}</td>
                            <td>
                                <a href="<c:url value='/realtor/${realtor.id}/edit'/>" class="btn btn-success">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value='/realtor/${realtor.id}/remove'/>" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            
        </div>
        
        <div role="tabpanel" class="tab-pane <c:if test="${realtor.id != 0}">active</c:if>" id="realtors-add">
            <c:url var="addAction" value="/realtors/add"/>

            <form:form action="${addAction}" commandName="realtor">

                <c:if test="${realtor.id != 0}">
                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="id"><spring:message text="ID"/></form:label>
                        <div class="controls col-md-10">
                            <form:input cssClass="form-control" path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </div>
                    </div>
                </c:if>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="fio"><spring:message text="fio"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="fio" required="required"/>
                        <form:errors path="fio" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="phone"><spring:message text="Phone"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="phone" required="required"/>
                        <form:errors path="phone" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group col-md-offset-2">
                    <c:if test="${realtor.id != 0}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Edit"/>"/>
                    </c:if>
                    <c:if test="${realtor.id == 0}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Add"/>"/>
                    </c:if>
                </div>

            </form:form>
        </div>

    </div>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>
</html>
