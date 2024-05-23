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

<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="pageDesc" value="${currentNode.properties['pageDesc'].string}"/>
<c:set var="pageUrl" value="${currentNode.url}"/>

<c:set var="imageUrl" value="${currentResource.moduleParams.imageUrl}" />
<c:set var="imageAlt" value="${currentResource.moduleParams.imageAlt}" />



<div class="col-md-4 mb-4">
    <div class="card menuCard position-relative">
        <img src="${imageUrl}" class="card-img-top" alt="${imageAlt}"> <!-- Replace with your image URL -->
        <div class="card-overlay menuCard-overlay">
            <h5 class="card-title"><a href="${pageUrl}">${title}</a></h5>
        </div>
    </div>
</div>