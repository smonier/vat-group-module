<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="titleEscaped" value="${not empty title ? fn:escapeXml(title) : fn:escapeXml(currentNode.name)}"/>

<c:set var="maxItems" value="${currentNode.properties['maxItems'].long}"/>

<c:set var="folderPath" value="${currentNode.properties['folder'].node.path}"/>
<c:if test="${empty folderPath}">
    <c:set var="folderPath" value="${currentNode.resolveSite.path}"/>
</c:if>
<utility:logger level="INFO" value="pageFilter2 : ${pageFilter}"/>

<c:set var="queryConstraint" value=""/>
<c:choose>
    <c:when test="${empty pageFilter}">
        <c:set var="filterId" value="${currentNode.properties['filter'].string}"/>
        <c:if test="${not empty filterId}">
            <c:set var="queryConstraint" value="and products.[valveType]='${filterId}'"/>
        </c:if>
    </c:when>
    <c:otherwise>
        <c:set var="queryConstraint" value="and products.[valveType]='${pageFilter}'"/>
    </c:otherwise>
</c:choose>


<c:set var="productsStatementAll" value="select * from [shopnt:fackProduct] as products where ISDESCENDANTNODE(products,'${folderPath}') ${queryConstraint} order by products.[name] asc"/>

<utility:logger level="INFO" value="productsStatementAll : ${productsStatementAll}"/>
<utility:logger level="INFO" value="maxItems : ${maxItems}"/>

<query:definition var="listQuery" statement="${productsStatementAll}" limit="${maxItems}"  />

<c:set target="${moduleMap}" property="editable" value="false" />
<c:set target="${moduleMap}" property="emptyListMessage"><fmt:message key="label.content.notFound"/></c:set>
<c:set target="${moduleMap}" property="listQuery" value="${listQuery}" />
<c:set target="${moduleMap}" property="subNodesView" value="${currentNode.properties['j:subNodesView'].string}" />