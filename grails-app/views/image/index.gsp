<%@ page import="image.ImageUtils; configurations.Image" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'image.label', default: 'Image')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'images.css')}" type="text/css">
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-image" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/admin')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="sync">Sync Images</g:link></li>
        <li><a class="home" href="${createLink(uri: '/upload')}">Upload</a></li>
    </ul>
</div>

<div id="list-image" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="fileLocation"
                              title="${message(code: 'image.fileLocation.label', default: 'File Location')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${imageInstanceList}" status="i" var="imageInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${imageInstance.id}"><img
                            src="data:image/jpeg;base64,${image.ImageUtils.imageToString(imageInstance?.fileLocation)}"
                            class="thumbNail"/></g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${imageInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
