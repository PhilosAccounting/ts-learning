<!DOCTYPE html>

<%@ page session="false" %>
<%@ taglib prefix="spring" uri="https://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="https://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="https://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="https://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="datatables" uri="https://github.com/dandelion/datatables" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<html lang="en">

<jsp:include page="../fragments/htmlHeader.jsp"/>

<body>
<petclinic:bodyHeader menuName="owners"/>
<div class="container-fluid">
    <div class="container xd-container">
        <h2>Owners</h2>

        <datatables:table id="owners" data="${selections}" row="owner"
                          cssClass="table table-striped" pageable="false" info="false" export="pdf">
            <datatables:column title="Name" cssStyle="width: 150px;" display="html">
                <spring:url value="/owners/{ownerId}.html" var="ownerUrl">
                    <spring:param name="ownerId" value="${owner.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(ownerUrl)}"><c:out value="${owner.firstName} ${owner.lastName}"/></a>
            </datatables:column>
            <datatables:column title="Name" display="pdf">
                <c:out value="${owner.firstName} ${owner.lastName}"/>
            </datatables:column>
            <datatables:column title="Address" property="address" cssStyle="width: 200px;"/>
            <datatables:column title="City" property="city"/>
            <datatables:column title="Telephone" property="telephone"/>
            <datatables:column title="Pets" cssStyle="width: 100px;">
                <c:forEach var="pet" items="${owner.pets}">
                    <c:out value="${pet.name}"/>
                </c:forEach>
            </datatables:column>
            <datatables:export type="pdf" cssClass="btn" cssStyle="height: 25px;"/>
        </datatables:table>

        <petclinic:pivotal/>
    </div>
</div>

<jsp:include page="../fragments/footer.jsp"/>
</body>

</html>
