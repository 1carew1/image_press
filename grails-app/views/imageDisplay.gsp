<%--
  Created by IntelliJ IDEA.
  User: colmcarew
  Date: 20/07/16
  Time: 21:48
--%>

<%@ page import="image.ImageUtils; java.nio.file.Paths; java.nio.file.Files; org.apache.catalina.util.Base64; configurations.Configuration" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'images.css')}" type="text/css">
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
<g:set var="imageContainingList" value="${image.ImageUtils.todaysPhotos()}"/>
<div class="photobanner">
    <g:each in="${imageContainingList}" var="oneRowObject">
        <img src="data:image/jpeg;base64,${image.ImageUtils.imageToString(oneRowObject)}"/>
    </g:each>
</div>
</body>
</html>