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
<template:addResources type="css" resources="productCard.css"/>

<c:if test="${renderContext.editMode}">
    <legend>${fn:escapeXml(jcr:label(currentNode.primaryNodeType, currentResource.locale))}</legend>
</c:if>


<c:set var="articleId" value="${currentNode.properties['articleId'].string}"/>
<c:set var="name" value="${currentNode.properties['name'].string}"/>
<c:set var="description" value="${currentNode.properties['description'].string}"/>
<c:set var="image" value="${currentNode.properties['image'].node}"/>
<c:set var="valveType" value="${currentNode.properties['valveType'].node.displayableName}"/>
<c:set var="valveFunction" value="${currentNode.properties['valveFunction'].node.displayableName}"/>
<c:set var="feature" value="${currentNode.properties['feature']}"/>
<c:set var="benefit" value="${currentNode.properties['benefit']}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="sizes" value="${currentNode.properties['sizes']}"/>
<c:set var="actuator" value="${currentNode.properties['actuator'].node.displayableName}"/>
<c:set var="body_material" value="${currentNode.properties['body_material']}"/>
<c:set var="standard_flanges" value="${currentNode.properties['standard_flanges']}"/>
<c:set var="leak_rate" value="${currentNode.properties['leak_rate'].string}"/>
<c:set var="pressure_range" value="${currentNode.properties['pressure_range'].string}"/>
<c:set var="cycles_until_first_service" value="${currentNode.properties['cycles_until_first_service'].string}"/>
<c:set var="temperature" value="${currentNode.properties['temperature']}"/>
<c:set var="mounting_position" value="${currentNode.properties['mounting_position'].string}"/>


<div class="col-md-4 mb-4 d-flex align-items-stretch">
	<div class="card shadow">
		<img src="${image.url}" class="card-img-top teaserImg" alt="Card Image">
		<div class="card-body">
			<h3 class="card-title"><a href="${contentURL}" title="${name}">${name}</a></h3>

			<span class="badge badge-secondary">${valveType}</span>
			<span class="badge badge-info">${valveFunction}</span>
			<div class="card-text">${description}</div>
			<a href="${contentURL}" class="btn btn-primary btn-bottom">Read more</a>

		</div>
	</div>
</div>