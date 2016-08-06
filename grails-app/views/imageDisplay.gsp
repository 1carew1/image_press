<%--
  Created by IntelliJ IDEA.
  User: colmcarew
  Date: 20/07/16
  Time: 21:48
--%>

<%@ page import="configurations.SpecialEvent; image.ImageUtils; configurations.Configuration" contentType="text/html;charset=UTF-8" %>
<g:set var="todaysEvent" value="${SpecialEvent.findTodaysEvent()}"/>
<html>
<head>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'images.css')}" type="text/css">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        ${todaysEvent.title}
    </title>
</head>

<body background="${assetPath(src: 'background.jpg')}" onload="location.href = '#loginScreen'">
<g:set var="imageContainingList" value="${ImageUtils.todaysPhotos()}"/>
<header class="main-header" role="banner">
    <div class="box">
        ${todaysEvent.title}
    </div>
</header>

<div id="loginScreen"><a href="#" class="cancel">&times;</a>
    <br><br>
    ${todaysEvent.specialMessage}
    <br><br>
    Click the X to see the rest ---->
</div>

<div class="photobanner">
    <g:each in="${imageContainingList}" var="oneRowObject">
        <img src="data:image/jpeg;base64,${ImageUtils.imageToString(oneRowObject)}"/>
    </g:each>
</div>
<br><br>

<div class="center">
    <p>
        Well this is the best I could come up with I hope you like it! --- Sorry about the colour choices
        I'm sure you'd have picked nicer ones...maybe some pin...rose gold ;)
    </p>
</div>

</body>
</html>