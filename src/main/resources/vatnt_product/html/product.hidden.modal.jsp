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

<c:set var="modalId" value="${currentNode.identifier}"/>

<c:set var="name" value="${currentNode.properties['name'].string}"/>
<c:set var="description" value="${currentNode.properties['description'].string}"/>
<c:set var="image" value="${currentNode.properties['image'].node}"/>
<c:set var="feature" value="${currentNode.properties['feature']}"/>
<c:set var="benefit" value="${currentNode.properties['benefit']}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:set var="description" value="${currentNode.properties['jcr:description'].string}"/>
<c:set var="sizes" value="${currentNode.properties['sizes']}"/>
<c:set var="actuator" value="${currentNode.properties['actuator'].node}"/>
<c:set var="body_material" value="${currentNode.properties['body_material']}"/>
<c:set var="standard_flanges" value="${currentNode.properties['standard_flanges']}"/>
<c:set var="leak_rate" value="${currentNode.properties['leak_rate'].string}"/>
<c:set var="pressure_range" value="${currentNode.properties['pressure_range'].string}"/>
<c:set var="cycles_until_first_service" value="${currentNode.properties['cycles_until_first_service'].string}"/>
<c:set var="temperature" value="${currentNode.properties['temperature']}"/>
<c:set var="mounting_position" value="${currentNode.properties['mounting_position'].string}"/>


<div class="modal fade" id="modal-${modalId}" tabindex="-1" role="dialog" aria-labelledby="objectiveModal"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">
                    <fmt:message key='vatmix_technical_data'/><br/>
                    <em class="text-primary">${name}</em>

                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p><strong><fmt:message key='vatmix_technical_data.sizes'/></strong>
                    <c:forEach items="${sizes}" var="item">
                <li>${item.node.displayableName}
                    </c:forEach>
                </p>
                <p><strong><fmt:message key='vatmix_technical_data.actuator'/></strong>
                <li>${actuator.name}
                </p>
                <p>
                    <strong><fmt:message key='vatmix_technical_data.body_material'/></strong>

                    <c:forEach items="${body_material}" var="item">
                <li>${item.string}
                    </c:forEach>
                </p>
                <p>
                    <strong><fmt:message key='vatmix_technical_data.standard_flanges'/></strong>
                    <c:forEach items="${standard_flanges}" var="item">
                <li>${item.node.displayableName}
                    </c:forEach>
                </p>
                <p><strong><fmt:message key='vatmix_technical_data.leak_rate'/></strong>
                <li>${leak_rate}
                </p>
                <p><strong><fmt:message key='vatmix_technical_data.pressure_range'/></strong>
                <li>${pressure_range}
                </p>
                <p><strong><fmt:message key='vatmix_technical_data.cycles_until_first_service'/></strong>
                <li>${cycles_until_first_service}
                </p>
                <p>
                    <strong><fmt:message key='vatmix_technical_data.temperature'/></strong>
                    <c:forEach items="${temperature}" var="item">
                <li>${item.string}
                    </c:forEach>
                </p>
            </div>
            <%--            <div class="modal-footer">--%>
            <%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
            <%--            </div>--%>
        </div>
    </div>
</div>