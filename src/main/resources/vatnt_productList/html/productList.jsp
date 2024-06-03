<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<c:if test="${renderContext.editMode}">
    <legend>${fn:escapeXml(jcr:label(currentNode.primaryNodeType, currentResource.locale))}</legend>
</c:if>


<c:set var="teaser" value="${currentNode.properties['teaser'].string}"/>
<c:set var="maxItems" value="${currentNode.properties['maxItems'].long}"/>
<c:set var="folder" value="${currentNode.properties['folder'].node}"/>
<c:set var="filter" value="${currentNode.properties['filter'].node}"/>
<c:set var="subNodesView" value="${currentNode.properties['j:subNodesView'].string}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['jcr:description'].string}"/>
<c:if test="${empty subNodesView}">
    <c:set var="subNodeView" value="teaser"/>
</c:if>

<template:include view="hidden.load"/>
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