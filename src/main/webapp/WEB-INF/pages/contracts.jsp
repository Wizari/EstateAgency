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
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Contracts list</h1>

<c:if test="${!empty listContracts}">
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
                <td><a href="<c:url value='/contract/${contract.id}/edit'/>">Edit</a></td>
                <td><a href="<c:url value='/contract/${contract.id}/remove'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<h1>Add a contract</h1>

<c:url var="addAction" value="/contracts/add"/>

<form:form action="${addAction}" commandName="contract">
    <table>


        <c:if test="${contract.id != 0}">
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

            <tr>
                <td>
                    <form:label path="buyer">
                        <spring:message text="Buyer"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="buyer" required="required">
                        <form:option value="${contract.buyer.id}" label="${contract.buyer.FIO}"/>
                        <form:options itemValue="id" itemLabel="FIO" items="${listBuyers}"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="seller">
                        <spring:message text="Seller"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="seller" required="required">
                        <form:option value="${contract.seller.id}" label="${contract.seller.FIO}"/>
                        <form:options itemValue="id" itemLabel="FIO" items="${listSellers}"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="realtor">
                        <spring:message text="Realtor"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="realtor" required="required">
                        <form:option value="${contract.realtor.id}" label="${contract.realtor.FIO}"/>
                        <form:options itemValue="id" itemLabel="fio" items="${listRealtors}"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="flat">
                        <spring:message text="Flat"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="flat" required="required" onchange="flateCnange()">
                        <form:option value="${contract.flat.id}" label="${contract.flat.fullAddress}"/>

                        <c:forEach items="${listFlats}" var="objectListFlats">
                            <c:if test="${objectListFlats.purchased != true}">

                                <form:option value="${objectListFlats.id}"
                                             data-price="${objectListFlats.price}">${objectListFlats.fullAddress}</form:option>
                            </c:if>
                        </c:forEach>

                    </form:select>
                </td>
            </tr>

        </c:if>


        <c:if test="${contract.id == 0}">
            <tr>
                <td>
                    <form:label path="buyer">
                        <spring:message text="Buyer"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="buyer" required="required">
                        <form:option value="" label="Choose a buyer"/>
                        <form:options itemValue="id" itemLabel="FIO" items="${listBuyers}"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="seller">
                        <spring:message text="Seller"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="seller" required="required">
                        <form:option value="" label="Choose a seller"/>
                        <form:options itemValue="id" itemLabel="FIO" items="${listSellers}"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="realtor">
                        <spring:message text="Realtor"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="realtor" required="required">
                        <form:option value="" label="Choose a realtor"/>
                        <form:options itemValue="id" itemLabel="fio" items="${listRealtors}"/>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="flat">
                        <spring:message text="Flat"/>
                    </form:label>
                </td>
                <td>
                    <form:select path="flat" required="required" onchange="flateCnange()">
                        <form:option value="" label="Choose a flat"/>

                        <c:forEach items="${listFlats}" var="objectListFlats">
                            <c:if test="${objectListFlats.purchased != true}">
                                <form:option value="${objectListFlats.id}"
                                             data-price="${objectListFlats.price}">${objectListFlats.fullAddress}</form:option>
                            </c:if>
                        </c:forEach>

                    </form:select>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="comission">
                    <spring:message text="Comission"/>
                </form:label>
            </td>
            <td>
                <form:input id="comission" path="comission" required="required"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="totalPrice">
                    <spring:message text="Total price"/>
                </form:label>
            </td>
            <td>
                <form:input path="totalPrice" required="required"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="purchaseDate">
                    <spring:message text="Purchase date"/>
                </form:label>
            </td>
            <td>
                <form:input type="date" path="purchaseDate" required="required"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${contract.id != 0 }">
                    <input type="submit"
                           value="<spring:message text="Edit"/>"/>
                </c:if>
                <c:if test="${contract.id == 0}">
                    <input type="submit"
                           value="<spring:message text="Add"/>"/>
                </c:if>
            </td>

        </tr>

    </table>
</form:form>
</body>
</html>
