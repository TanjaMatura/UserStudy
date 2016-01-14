<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Study</title>

<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function getRandomInt(min, max) { 
		return Math.floor(Math.random() * (max - min +1)) + min; 
	}
	var first;
	var second;
	function doubleurl(){
	var first =getRandomInt(1, 37);
	//document.getElementId('urlId1').value = getRandomInt(1,37);
	 second = getRandomInt(1, 37);
	while (second == document.getElementId('urlId1')){
		second = getRandomInt(1, 37);
	}
	//document.getElementId('urlId2').value = getRandomInt(1,37);
	}
</script>
<style>
body {
	background-color: #fafafa; 
}
#header {
	width: 100%;
	color: #fff;
	padding: 10px;
	background-color: #4db6ac;
}
</style>
</head>

<body onload="doubleurl();">
<div id="header">
<h3>Herzlich Willkommen!</h3>
</div>
<div style="width:80%; margin: 0 auto; ">

<p>
<center>
<br> 
<br> 
<p>Vielen Dank für dein Interesse an unserer Studie. 

<p>Bitte sieh dir die beiden Videos auf der nächsten Seite an und wähle die Werbung aus, die dir besser gefällt.
</p>
<p>Im Anschluss kannst du Fragen zu dem gewählten Video beantworten. Alle Angaben werden anonym gespeichert.
</p>
<br> 
<form action="MainServlet" method="post">
<input type="hidden" name="action" value="Teilnehmen">
<input class="btn btn-default" type="submit" style="background-color: #4db6ac; color: #fff; padding: 3px;" value="Teilnehmen!" ></center>
</form>
</div>
</html>

