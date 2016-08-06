<%@ page import="configurations.Configuration" contentType="text/html;charset=UTF-8" %>
<g:set var="config" value="${Configuration.findByActive(true)}"/>
<html>
<head>
    <asset:javascript src="uploadr.manifest.js"/>
    <asset:stylesheet href="uploadr.manifest.css"/>
    <link rel="stylesheet" type="text/css" href="css/images.css">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        Upload
    </title>
</head>

<body>
<a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
<br>
Uploading files to ${config?.imageDirectory}
<br>
<uploadr:add name="mySecondUploadr" path="${config?.imageDirectory}" height="50px"
             allowedExtensions="jpg,jpeg,png,gif,tiff,bmp,img,jpe," direction="up" maxVisible="5" maxSize="204800000"
             noSound="true" unsupported="${createLink(plugin: 'uploadr', controller: 'upload', action: 'warning')}">
</uploadr:add>

</body>
</html>