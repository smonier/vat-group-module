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
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper" --%>
<%--@elvariable id="out" type="java.io.PrintWriter" --%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script" --%>
<%--@elvariable id="scriptInfo" type="java.lang.String" --%>
<%--@elvariable id="workspace" type="java.lang.String" --%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext" --%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource" --%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator" --%>

<template:addResources type="css" resources="productCard.css"/>

<c:set var="modalId" value="${currentNode.identifier}"/>

<c:if test="${renderContext.editMode}">
    <legend>${fn:escapeXml(jcr:label(currentNode.primaryNodeType, currentResource.locale))}</legend>
</c:if>


<c:set var="name" value="${currentNode.properties['name'].string}"/>
<c:set var="description" value="${currentNode.properties['shop:description'].string}"/>
<c:set var="image" value="${currentNode.properties['shop:image'].node}"/>
<c:set var="feature" value="${currentNode.properties['feature']}"/>
<c:set var="benefit" value="${currentNode.properties['benefit']}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="sizes" value="${currentNode.properties['sizes']}"/>
<c:set var="actuator" value="${currentNode.properties['actuator'].node}"/>
<c:set var="valveType" value="${currentNode.properties['valveType']}"/>
<c:set var="valveFunction" value="${currentNode.properties['valveFunction']}"/>
<c:set var="body_material" value="${currentNode.properties['body_material']}"/>
<c:set var="standard_flanges" value="${currentNode.properties['standard_flanges']}"/>
<c:set var="leak_rate" value="${currentNode.properties['leak_rate'].string}"/>
<c:set var="pressure_range" value="${currentNode.properties['pressure_range'].string}"/>
<c:set var="cycles_until_first_service" value="${currentNode.properties['cycles_until_first_service'].string}"/>
<c:set var="temperature" value="${currentNode.properties['temperature']}"/>
<c:set var="mounting_position" value="${currentNode.properties['mounting_position'].string}"/>
<c:url value="${currentNode.url}" var="contentURL"/>
<jcr:nodeProperty node="${currentNode}" name="shop:pimid" var="pimid"/>
<jcr:nodeProperty node="${currentNode}" name="jcr:uuid" var="uuid"/>
<c:set var="productID" value="${fn:replace(uuid,'-','_')}"/>


<script>
    const product_${productID} = {
        uuid: "${uuid}",
        pimid: "${pimid}",
        qty: 1
    }
</script>

<template:include
        view="hidden.modal"/>

<div class="product-card  d-flex flex-column">
    <div class="d-flex justify-content-center">
        <img src="${image.url}" class="card-img-top" alt="Card image">
    </div>
    <div class="card-body">
        <c:forEach items="${valveType}" var="item">
            <span class="badge badge-secondary">${item.node.displayableName}</span>
        </c:forEach>
        <c:forEach items="${valveFunction}" var="item">
            <span class="badge badge-info">${item.node.displayableName}</span>
        </c:forEach>

        <h3 class="card-title"><a href="${contentURL}" title="${title}">${title}</a></h3>
        <div class="card-text"><p>${description}</p>
            <p><strong><fmt:message key='vatnt_product.benefit'/></strong>
            <ul>
                <c:forEach items="${benefit}" var="item">
                    <li>${item.string}</li>
                </c:forEach>
            </ul>
            </p>
            <p><strong><fmt:message key='vatnt_product.feature'/></strong>
            <ul>
                <c:forEach items="${feature}" var="item">
                    <li>${item.string}</li>
                </c:forEach>
            </ul>
            </p>

            <div class="text-center">
                <hr class="mt-2"/>
                <button type="button"
                        class="btn btn-outline-dark btn-sm"
                        data-toggle="modal"
                        data-target="#modal-${modalId}">
                    <fmt:message key='vatmix_technical_data'/>
                </button>
            </div>
        </div>
    </div>
</div>