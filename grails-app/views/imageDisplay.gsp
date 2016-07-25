<%--
  Created by IntelliJ IDEA.
  User: colmcarew
  Date: 20/07/16
  Time: 21:48
--%>

<%@ page import="java.nio.file.Paths; java.nio.file.Files; org.apache.catalina.util.Base64; configurations.Configuration" contentType="text/html;charset=UTF-8" %>
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

<%
    def obtainImage = { path ->
        String imageString = null
        try {
            imageString = new String(Base64.encode(Files.readAllBytes(Paths.get(path))))
        } catch (IOException e) {
            e.printStackTrace()
        }
        if (imageString == null) {
            imageString = ''
        }
        return imageString;
    }
%>

<body>
<g:set var="path" value="${new File("${Configuration.findByActive(true).imageDirectory}")}"/>
<g:set var="imageContainingList" value="${path?.listFiles()}"/>
<div class="photobanner">
    <g:each in="${imageContainingList}" var="oneRowObject">
        <img src="data:image/jpeg;base64,${obtainImage(oneRowObject?.absolutePath)}"/>
    </g:each>
</div>
</body>
</html>