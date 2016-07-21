<%--
  Created by IntelliJ IDEA.
  User: colmcarew
  Date: 21/07/16
  Time: 19:07
--%>

<%@ page import="org.apache.commons.lang.RandomStringUtils; configurations.Configuration" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <asset:javascript src="uploadr.manifest.js"/>
    <asset:stylesheet href="uploadr.manifest.css"/>
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <g:set var="activeConfig" value="${Configuration.findByActive(true)}"/>
    <title>
        <g:if test="${activeConfig}">
            ${activeConfig.titleOfPage}
        </g:if>
        <g:else>
            Colm's Image Press
        </g:else>
    </title>
</head>

<body>
<g:set var="path" value="${new File("${Configuration.findByActive(true).imageDirectory}")}"/>
<g:set var="imageContainingList" value="${path.listFiles()}"/>
<g:each in="${imageContainingList}" var="oneRowObject">
    <img class="" src='${resource(file: "${oneRowObject}")}'/>

</g:each>

<uploadr:add name="mySecondUploadr" path="${path}"
             allowedExtensions="jpg,png,gif" direction="up" maxVisible="5" maxSize="204800000"
             noSound="true" unsupported="${createLink(plugin: 'uploadr', controller: 'upload', action: 'warning')}">
</uploadr:add>

</body>
</html>