<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flats</title>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="flats">

    <h2>Flats</h2>

    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" <c:if test="${flat.id == 0}">class="active"</c:if>>
            <a href="#flats-list" aria-controls="flats-list" role="tab" data-toggle="tab">Flats list</a>
        </li>
        <li role="presentation" <c:if test="${flat.id != 0}">class="active"</c:if>>
            <a href="#flats-add" aria-controls="flats-add" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-plus"></span>
            </a>
        </li>
    </ul>

    <div class="tab-content">
        
        <div role="tabpanel" class="tab-pane <c:if test="${flat.id == 0}">active</c:if>" id="flats-list">
            <c:if test="${!empty listFlats}">
                <table class="table table-hover">
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-md-1">Rooms</th>
                        <th class="col-md-1">Area</th>
                        <th class="col-md-1">Floor</th>
                        <th class="col-md-2">District</th>
                        <th class="col-md-2">Price</th>
                        <th class="col-md-3">Address</th>
                        <th class="col-md-1">Purchased</th>
                        <th class="col-md-1" colspan="2">&nbsp;</th>
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
                            <td>
                                <a href="<c:url value='/flat/${flat.id}/edit'/>" class="btn btn-success">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value='/flat/${flat.id}/remove'/>" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
        
        <div role="tabpanel" class="tab-pane <c:if test="${flat.id != 0}">active</c:if>" id="flats-add">
            <c:url var="addAction" value="/flats/add"/>

            <form:form action="${addAction}" commandName="flat">

                <c:if test="${flat.id != 0}">
                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="id"><spring:message text="ID"/></form:label>
                        <div class="controls col-md-10">
                            <form:input cssClass="form-control" path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </div>
                    </div>
                </c:if>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="rooms"><spring:message text="Rooms"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="rooms" required="required"/>
                        <form:errors path="rooms" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="area"><spring:message text="Area"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="area" required="required"/>
                        <form:errors path="area" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="floor"><spring:message text="Floor"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="floor"/>
                        <form:errors path="floor" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="district"><spring:message text="District"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="district" required="required"/>
                        <form:errors path="district" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="price"><spring:message text="Price"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="price" required="required"/>
                        <form:errors path="price" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="address"><spring:message text="Address"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="address" required="required"/>
                        <form:errors path="address" cssClass="error"/>
                    </div>
                </div>

                <div class="control-group col-md-offset-2">
                    <c:if test="${flat.id !=0}">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Edit"/>"/>
                    </c:if>
                    <c:if test="${flat.id == 0}">
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
