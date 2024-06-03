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
<template:addResources type="css" resources="productBanner.css"/>

<c:set var="modalId" value="${currentNode.identifier}"/>

<c:if test="${renderContext.editMode}">
    <legend>${fn:escapeXml(jcr:label(currentNode.primaryNodeType, currentResource.locale))}</legend>
</c:if>


<c:set var="uuid" value="${currentNode.properties['jcr:uuid'].string}"/>
<c:set var="pimid" value="${currentNode.properties['shop:pimid'].string}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['shop:description'].string}"/>
<c:set var="categories" value="${currentNode.properties['j:defaultCategory']}"/>
<c:set var="price" value="${currentNode.properties['shop:price'].string}"/>
<c:set var="devise" value="${currentNode.properties['shop:devise'].string}"/>
<c:set var="imageNode" value="${currentNode.properties['shop:image'].node}"/>
<c:if test="${not empty imageNode}">
    <c:url var="imageURL" value="${imageNode.url}" context="/"/>
</c:if>
<c:url var="productURL" value="${currentNode.url}" context="/"/>
<c:set var="productID" value="${fn:replace(uuid,'-','_')}"/>
<c:set var="feature" value="${currentNode.properties['feature']}"/>
<c:set var="benefit" value="${currentNode.properties['benefit']}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="sizes" value="${currentNode.properties['sizes']}"/>
<c:set var="actuator" value="${currentNode.properties['actuator']}"/>
<c:set var="valveType" value="${currentNode.properties['valveType']}"/>
<c:set var="valveFunction" value="${currentNode.properties['valveFunction']}"/>
<c:set var="body_material" value="${currentNode.properties['body_material']}"/>
<c:set var="standard_flanges" value="${currentNode.properties['standard_flanges']}"/>
<c:set var="leak_rate" value="${currentNode.properties['leak_rate'].string}"/>
<c:set var="pressure_range" value="${currentNode.properties['pressure_range'].string}"/>
<c:set var="cycles_until_first_service" value="${currentNode.properties['cycles_until_first_service'].string}"/>
<c:set var="temperature" value="${currentNode.properties['temperature']}"/>
<c:set var="mounting_position" value="${currentNode.properties['mounting_position'].string}"/>



<script>
    const product_${productID} = {
        uuid: "${uuid}",
        pimid: "${pimid}",
        qty: 1
    }
</script>
<template:addCacheDependency node="${imageNode}"/>
<c:set var="width"
       value="${not empty currentResource.moduleParams.mediaWidth ? currentResource.moduleParams.mediaWidth : '1920'}"/>
<c:set var="height" value="${currentResource.moduleParams.mediaHeight}"/>
<c:set var="scale" value="${currentResource.moduleParams.mediaScale}"/>
<c:set var="quality" value="${currentResource.moduleParams.mediaQuality}"/>

<c:catch var="getUrlException">
    <c:set var="imageURL"
           value="${imageNode.getUrl(['width:'.concat(width),'height:'.concat(height),'scale:'.concat(scale),'quality:'.concat(quality)])}"/>
</c:catch>
<c:if test="${getUrlException != null}">
    <c:set var="imageURL" value="${imageNode.getUrl()}"/>
</c:if>
<style>
    .hero-banner {
        background-image: url('https://vatvalve.vatstatic.com/images/placeholders/bg-pattern@2x.jpg'); /* Replace with your background image URL */
    }
</style>

<div class="hero-banner">
    <div class="hero-content">
        <h1>${title}</h1>
    </div>
    <div class="hero-image">
        <img src="${imageURL}" alt="${pimid}" class="rounded shadow">
    </div>
</div>

<section class="pb-5">
    <div class="container container-content bg-white">
        <div class="row justify-content-center">
            <div class="col-md-10 mb-5">
                <h1>${title}</h1>
                <c:forEach items="${valveType}" var="item">
                    <span class="badge badge-secondary">${item.node.displayableName}</span>
                </c:forEach>
                <c:forEach items="${valveFunction}" var="item">
                    <span class="badge badge-info">${item.node.displayableName}</span>
                </c:forEach>

            </div>
            <img src="${imageURL}" alt="Smaller Image" class="right-aligned-image">

        </div>

        <div class="row row-teaser justify-content-center mb-5">
            <div class="col-md-10">
                <div class="lead">
                    ${description}
                </div>
            </div>
        </div>

        <div class="row row-article justify-content-center mt-5">
            <div class="col-md-6">
                <p><strong><fmt:message key='vatnt_product.benefit'/></strong>
                <ul>
                    <c:forEach items="${benefit}" var="item">
                        <li>${item.string}</li>
                    </c:forEach>
                </ul>
                </p>
            </div>
            <div class="col-md-6">
                <p><strong><fmt:message key='vatnt_product.feature'/></strong>
                <ul>
                    <c:forEach items="${feature}" var="item">
                        <li>${item.string}</li>
                    </c:forEach>
                </ul>
                </p>
            </div>
        </div>
        <div class="row row-article justify-content-center mt-5">
            <div class="col-6">
                <p><strong><fmt:message key='vatmix_technical_data.sizes'/></strong>
                <ul>
                    <c:forEach items="${sizes}" var="item">
                        <li>${item.node.displayableName}
                    </c:forEach>
                </ul>
                </p>
                <p><strong><fmt:message key='vatmix_technical_data.actuator'/></strong>
                <ul>
                    <c:forEach items="${actuator}" var="item">
                        <li>${item.node.displayableName}
                    </c:forEach>
                </ul>
                </p>
            </div>
            <div class="col-6">
                <p>
                    <strong><fmt:message key='vatmix_technical_data.body_material'/></strong>
                <ul>
                    <c:forEach items="${body_material}" var="item">
                        <li>${item.string}
                    </c:forEach>
                </ul>
                </p>
                <p>
                    <strong><fmt:message key='vatmix_technical_data.standard_flanges'/></strong>
                <ul>
                    <c:forEach items="${standard_flanges}" var="item">
                        <li>${item.node.displayableName}
                    </c:forEach>
                </ul>
                </p>
            </div>
        </div>
        <div class="row row-article justify-content-center mt-5">
            <div class="col-6">
                <p><strong><fmt:message key='vatmix_technical_data.leak_rate'/></strong>
                <ul>
                    <li>${leak_rate}
                </ul>
                </p>
                <p><strong><fmt:message key='vatmix_technical_data.pressure_range'/></strong>
                <ul>
                    <li>${pressure_range}
                </ul>
                </p>
            </div>
            <div class="col-6">
                <p><strong><fmt:message key='vatmix_technical_data.cycles_until_first_service'/></strong>
                <ul>
                    <li>${cycles_until_first_service}
                </ul>
                </p>
                <p>
                    <strong><fmt:message key='vatmix_technical_data.temperature'/></strong>
                <ul>
                    <c:forEach items="${temperature}" var="item">
                        <li>${item.string}
                    </c:forEach>
                </ul>
                </p>
            </div>
        </div>
    </div>
    <div class="row row-article justify-content-center mt-5">
        <div class="col-md-4">
            <div class="card-buttons">
                <button onclick="window._jsc_.addToCart(product_${productID})" class="btn btn-primary btn-block">Add to Cart</button>
                <button onclick="window._jsc_.openCartDetails()" class="btn btn-primary btn-block">See my Cart</button>
            </div>            </div>
    </div>

</section>
