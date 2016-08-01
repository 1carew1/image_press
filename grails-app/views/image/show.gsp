<%@ page import="image.ImageUtils; configurations.Image" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'images.css')}" type="text/css">
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-image" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list image">

        <g:if test="${imageInstance?.fileLocation}">
            <li class="fieldcontain"><img
                    src="data:image/jpeg;base64,${image.ImageUtils.imageToString(imageInstance?.fileLocation)}"
                    class="thumbNail"/></li>
            <li class="fieldcontain">
                <span id="fileLocation-label" class="property-label"><g:message code="image.fileLocation.label"
                                                                                default="File Location"/></span>

                <span class="property-value" aria-labelledby="fileLocation-label"><g:fieldValue bean="${imageInstance}"
                                                                                                field="fileLocation"/></span>

            </li>
        </g:if>

        <g:if test="${imageInstance?.events}">
            <li class="fieldcontain">
               Events :  ${imageInstance.events}
            </li>
        </g:if>

    </ol>
    <g:form url="[resource: imageInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${imageInstance}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
