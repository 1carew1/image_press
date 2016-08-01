<%@ page import="image.ImageUtils; configurations.SpecialEvent; configurations.Image" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'images.css')}" type="text/css">
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/admin')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="edit-image" class="content scaffold-edit" role="main">
    <h1><g:message code="default.edit.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${imageInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${imageInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form url="[resource: imageInstance, action: 'update']" method="PUT">

        <img src="data:image/jpeg;base64,${ImageUtils.imageToString(imageInstance?.fileLocation)}" class="thumbNail"/><br>
        <g:select name="eventList"
                  multiple="multiple"
                  optionKey="name"
                  value="${imageInstance?.events?.name}"
                  from="${SpecialEvent.findAll()}"/>

        <fieldset class="buttons">
            <g:actionSubmit class="save" action="update"
                            value="${message(code: 'default.button.update.label', default: 'Update')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
