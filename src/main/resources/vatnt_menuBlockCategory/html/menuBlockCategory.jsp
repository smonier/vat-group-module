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

<template:addResources type="css" resources="menuCard.css"/>

<c:if test="${renderContext.editMode}">
    <legend>${fn:escapeXml(jcr:label(currentNode.primaryNodeType, currentResource.locale))}</legend>
</c:if>


<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['jcr:description'].string}"/>

<c:set var="bindedComponent" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:if test="${not empty bindedComponent && jcr:isNodeType(bindedComponent, 'jnt:page, vatnt:enteteBlockCategory')}">
    <c:set var="targetProps" value="${bindedComponent.properties}"/>
</c:if>

<div class="container mt-5">
    <div class="row">

    <c:set var="subPages" value="${jcr:getChildrenOfType(bindedComponent, 'jnt:page')}"/>
    <c:forEach items="${subPages}" var="subPage" varStatus="status">


        <c:if test="${not empty subPage.properties['image'].node}">
            <c:set var="imageNode" value="${subPage.properties['image'].node}"/>
            <c:set var="imageUrl" value="${imageNode.getUrl()}"/>
            <c:set var="imageAlt" value="${subPage.properties['alt'].string}"/>
        </c:if>
        <template:module node="${subPage}" view="hidden.menuCard">
            <template:param name="imageUrl" value="${imageUrl}"/>
            <template:param name="imageAlt" value="${imageAlt}"/>
        </template:module>

    </c:forEach>
</div>
</div>