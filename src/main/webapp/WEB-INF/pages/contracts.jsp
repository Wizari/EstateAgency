<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contracts</title>
    
    <script type="text/javascript">
        function flateCnange() {

            var statusSelected = document.getElementById("flat");
            var option = statusSelected.options[statusSelected.selectedIndex];
            var price = option.getAttribute('data-price');
            var comission = price * 0.10;
            var total = parseInt(price) + comission;
            document.getElementById('comission').value = comission;
            document.getElementById('totalPrice').value = total;
        }
    </script>

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

    <link rel="stylesheet" href="/css/main.css">
</head>
<body>

<jsp:include page="includes/header.jsp"/>

<div class="container" id="contracts">

    <h2>Contracts</h2>

    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" <c:if test="${contract.id == 0}">class="active"</c:if>>
            <a href="#contracts-list" aria-controls="contracts-list" role="tab" data-toggle="tab">Contracts list</a>
        </li>
        <li role="presentation" <c:if test="${contract.id != 0}">class="active"</c:if>>
            <a href="#contracts-add" aria-controls="contracts-add" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-plus"></span>
            </a>
        </li>
    </ul>

    <div class="tab-content">

        <div role="tabpanel" class="tab-pane <c:if test="${contract.id == 0}">active</c:if>" id="contracts-list">
            <c:if test="${!empty listContracts}">
                <table class="table table-hover">
                    <tr>
                        <th class="col-md-1">ID</th>
                        <th class="col-md-2">Seller</th>
                        <th class="col-md-2">Buyer</th>
                        <th class="col-md-2">Realtor</th>
                        <th class="col-md-1">Flat</th>
                        <th class="col-md-1">Comission</th>
                        <th class="col-md-1">Total price</th>
                        <th class="col-md-1">Purchase date</th>
                        <th class="col-md-1" colspan="2"></th>
                    </tr>
                    <c:forEach items="${listContracts}" var="contract">
                        <tr>
                            <td><a href="/contract/${contract.id}" target="_blank">${contract.id}</a></td>
                            <td><a href="/seller/${contract.seller.id}">${contract.seller.FIO}</a></td>
                            <td><a href="/buyer/${contract.buyer.id}">${contract.buyer.FIO}</a></td>
                            <td><a href="/realtor/${contract.realtor.id}">${contract.realtor.FIO}</a></td>
                            <td><a href="/flat/${contract.flat.id}">${contract.flat.fullAddress}</a></td>
                            <td>${contract.comission}</td>
                            <td>${contract.totalPrice}</td>
                            <td>${contract.purchaseDate}</td>
                            <td>
                                <a href="<c:url value='/contract/${contract.id}/edit'/>" class="btn btn-success">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </a>
                            </td>
                            <td>
                                <a href="<c:url value='/contract/${contract.id}/remove'/>" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-remove"></span>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
        
        <div role="tabpanel" class="tab-pane <c:if test="${contract.id != 0}">active</c:if>" id="contracts-add">
            <c:url var="addAction" value="/contracts/add"/>

            <form:form action="${addAction}" commandName="contract">

                <c:if test="${contract.id != 0}">

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="id"><spring:message text="ID"/></form:label>
                        <div class="controls col-md-10">
                            <form:input cssClass="form-control" path="id" readonly="true" size="8" disabled="true"/>
                            <form:hidden path="id"/>
                        </div>
                    </div>

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="buyer"><spring:message text="Buyer"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="buyer" required="required">
                                <form:option value="${contract.buyer.id}" label="${contract.buyer.FIO}"/>
                                <form:options itemValue="id" itemLabel="FIO" items="${listBuyers}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="seller"><spring:message text="Seller"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="seller" required="required">
                                <form:option value="${contract.seller.id}" label="${contract.seller.FIO}"/>
                                <form:options itemValue="id" itemLabel="FIO" items="${listSellers}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="realtor"><spring:message text="Realtor"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="realtor" required="required">
                                <form:option value="${contract.realtor.id}" label="${contract.realtor.FIO}"/>
                                <form:options itemValue="id" itemLabel="fio" items="${listRealtors}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="flat"><spring:message text="Flat"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="flat" required="required" onchange="flateCnange()">
                                <form:option value="${contract.flat.id}" label="${contract.flat.fullAddress}"/>
                                <c:forEach items="${listFlats}" var="objectListFlats">
                                    <c:if test="${objectListFlats.purchased != true}">
                                        <form:option value="${objectListFlats.id}"
                                                     data-price="${objectListFlats.price}">${objectListFlats.fullAddress}</form:option>
                                    </c:if>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>

                </c:if>

                <c:if test="${contract.id == 0}">

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="buyer"><spring:message text="Buyer"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="buyer" required="required">
                                <form:option value="" label="Choose a buyer"/>
                                <form:options itemValue="id" itemLabel="FIO" items="${listBuyers}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="seller"><spring:message text="Seller"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="seller" required="required">
                                <form:option value="" label="Choose a seller"/>
                                <form:options itemValue="id" itemLabel="FIO" items="${listSellers}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="realtor"><spring:message text="Realtor"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="realtor" required="required">
                                <form:option value="" label="Choose a realtor"/>
                                <form:options itemValue="id" itemLabel="fio" items="${listRealtors}"/>
                            </form:select>
                        </div>
                    </div>

                    <div class="control-group row">
                        <form:label cssClass="control-label col-md-2" path="flat"><spring:message text="Flat"/></form:label>
                        <div class="controls col-md-10">
                            <form:select cssClass="selectpicker" path="flat" required="required" onchange="flateCnange()">
                                <form:option value="" label="Choose a flat"/>
                                <c:forEach items="${listFlats}" var="objectListFlats">
                                    <c:if test="${objectListFlats.purchased != true}">
                                        <form:option value="${objectListFlats.id}"
                                                     data-price="${objectListFlats.price}">${objectListFlats.fullAddress}</form:option>
                                    </c:if>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>

                </c:if>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="comission"><spring:message text="Comission"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" id="comission" path="comission" required="required"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="totalPrice"><spring:message text="Total price"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" path="totalPrice" required="required"/>
                    </div>
                </div>

                <div class="control-group row">
                    <form:label cssClass="control-label col-md-2" path="purchaseDate"><spring:message text="Purchase date"/></form:label>
                    <div class="controls col-md-10">
                        <form:input cssClass="form-control" type="date" path="purchaseDate" required="required"/>
                    </div>
                </div>

                <div class="control-group col-md-offset-2">
                    <c:if test="${contract.id != 0 }">
                        <input type="submit" class="btn btn-primary" value="<spring:message text="Edit"/>"/>
                    </c:if>
                    <c:if test="${contract.id == 0}">
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
