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
<template:addResources type="css" resources="heroBanner.css"/>


<c:set var="bindedComponent" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<c:if test="${not empty bindedComponent && jcr:isNodeType(bindedComponent, 'jnt:page, vatnt:entetePageRubrique')}">
    <c:set var="targetProps" value="${bindedComponent.properties}"/>
</c:if>

<c:set var="title" value="${targetProps['jcr:title'].string}"/>
<c:set var="pageDesc" value="${targetProps['pageDesc'].string}"/>
<c:set var="imageNode" value="${targetProps['image'].node}"/>
<c:set var="imageUrl" value="${imageNode.getUrl()}"/>
<c:set var="imageAlt" value="${targetProps['alt'].string}"/>



<style>
    .hero-banner {
        background-image: url('https://vatvalve.vatstatic.com/images/placeholders/bg-pattern@2x.jpg'); /* Replace with your background image URL */
    }
</style>

<div class="hero-banner">
    <div class="hero-content">
        <h1>${title}</h1>
        <p>${pageDesc}</p>
    </div>
    <div class="hero-image">
        <img src="${imageUrl}" alt="${imageAlt}" class="rounded shadow">
    </div>
</div>
