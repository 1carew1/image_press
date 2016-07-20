<%--
  Created by IntelliJ IDEA.
  User: colmcarew
  Date: 20/07/16
  Time: 21:48
--%>

<%@ page import="configurations.Configuration" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="Semantic-UI/dist/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="css/mainPage.css">
    <script src="Semantic-UI/dist/semantic.min.js"></script>
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
<div class="pageCenter">
    <div class="ui pointing below label" style="width: 180px">
        So pet you're 20 now and we're together over a year.
        If you can guess my nickname we can share a few memories
    </div>
    <br>

    <div class="ui input">
        <input type="password" placeholder="Guess ;)">
    </div>
</div>
</body>
</html>