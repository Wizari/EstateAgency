<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buyers</title>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="buyers">

    <h2>Buyers</h2>

    <ul class="nav nav-tabs" role="tablist">

        <li role="presentation" <c:if test="${buyer.id == 0 && error != true}">class="active"</c:if>>
            <a href="#buyers-list" aria-controls="buyers-list" role="tab" data-toggle="tab">Buyers list</a>
        </li>
        <li role="presentation" <c:if test="${buyer.id != 0 || error}">class="active"</c:if>>
            <a href="#buyers-add" aria-controls="buyers-add" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-plus"></span>
            </a>
        </li>
    </ul>

    <div class="tab-content">

        <div role="tabpanel" class="tab-pane <c:if test="${buyer.id == 0 && error != true}">active</c:if>" id="buyers-list">
            <c:if test="${!empty listBuyers}">
                <table class="table table-hover">
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-md-2">Surname</th>
                        <th class="col-md-2">Firstname</th>
                        <th class="col-md-2">Lastname</th>
                        <th class="col-md-2">Phone</th>
                        <th class="col-md-2">Passport</th>
                        <th colspan="2" class="col-md-1">&nbsp;</th>
                    </tr>
                    <c:forEach items="${listBuyers}" var="buyer">
                        <tr>
                            <td>${buyer.id}</td>
                            <td><a href="/buyer/${buyer.id}" target="_blank">${buyer.surname}</a></td>
                            <td>${buyer.firstname}</td>
                            <td>${buyer.lastname}</td>
                            <td>${buyer.phone}</td>
                            <td>${buyer.passport}</td>
                            <td>
                                <a href="<c:url value='/buyer/${buyer.id}/edit'/>" class="btn btn-success">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value='/buyer/${buyer.id}/remove'/>" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>

        <div role="tabpanel" class="tab-pane <c:if test="${buyer.id != 0 || error}">active</c:if>" id="buyers-add">

            <c:url var="addAction" value="/buyers/add"/>

            <form:form action="${addAction}" commandName="buyer">
                
                <c:if test="${buyer.id != 0}">
                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="id"><spring:message text="ID"/></form:label>
                        <div class="controls col-md-10">
                            <form:input cssClass="form-control"  path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </div>
                    </div>
                </c:if>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="surname"><spring:message text="Surname"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control"  path="surname" required="required"/>
                        <form:errors path="surname" cssClass="error" />
                    </div>
                </div>
                
                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="firstname"><spring:message text="First name"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control"  path="firstname" required="required"/>
                        <form:errors path="firstname" cssClass="error" />
                    </div>
                </div>
                
                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="lastname"><spring:message text="Last name"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control"  path="lastname" required="required"/>
                        <form:errors path="lastname" cssClass="error" />
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="phone"><spring:message text="Phone"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control"  path="phone" required="required"/>
                        <form:errors path="phone" cssClass="error" />
                    </div>
                </div>
                
                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="passport"><spring:message text="Passport"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control"  path="passport" required="required"/>
                        <form:errors path="passport" cssClass="error" />
                    </div>
                </div>
                
                <div class="control-group col-md-offset-2">
                    <c:if test="${buyer.id != 0}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Edit"/>"/>
                    </c:if>
                    <c:if test="${buyer.id == 0}">
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
