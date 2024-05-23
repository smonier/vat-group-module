<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>

<c:if test="${renderContext.editMode}">
    <legend>${fn:escapeXml(jcr:label(currentNode.primaryNodeType, currentResource.locale))}</legend>
</c:if>
<c:set var="bindedComponent" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:if test="${not empty bindedComponent && jcr:isNodeType(bindedComponent, 'jnt:page, vatnt:productList')}">
    <c:set var="targetProps" value="${bindedComponent.properties}"/>
</c:if>

<c:set var="teaser" value="${currentNode.properties['teaser'].string}"/>
<c:set var="maxItems" value="${currentNode.properties['maxItems'].long}"/>
<c:set var="folder" value="${currentNode.properties['folder'].node}"/>
<c:set var="subNodesView" value="${currentNode.properties['j:subNodesView'].string}"/>
<c:set var="description" value="${currentNode.properties['jcr:description'].string}"/>
<c:if test="${empty subNodesView}">
    <c:set var="subNodeView" value="teaser"/>
</c:if>
<c:set var="categories" value="${targetProps['j:defaultCategory']}"/>
<c:if test="${not empty categories}">
    <c:forEach items="${categories}" var="category">
        <c:set var="pageFilter" value="${category.string}"/>
        <c:set var="title" value="${category.node.displayableName}"/>
    </c:forEach>
</c:if>
<utility:logger level="INFO" value="pageFilter : ${pageFilter}"/>

<template:include view="hidden.load">
    <template:param name="pageFilter" value="${pageFilter}"/>
</template:include>
<c:set var="listQuery" value="${moduleMap.listQuery}"/>
<jcr:jqom var="result" qomBeanName="listQuery" />

<c:choose>
    <c:when test="${empty result}">
        <p>${moduleMap.emptyListMessage}</p>
    </c:when>
    <c:otherwise>
        <div class="container">
            <div class="col-12">
                <div class="row">
                    <h2>${title}</h2>
                    <c:out value="${not empty teaser ? teaser : ''}" escapeXml="false"/>
                </div>
                <div class="row lastEvent d-flex align-items-stretch mb-3">
                    <c:forEach items="${result.nodes}" var="node">
                        <template:module view="${subNodesView}" node="${node}" />
                    </c:forEach>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>