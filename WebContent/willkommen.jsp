
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Study</title>

<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist\css\bootstrap.min.css" rel="stylesheet" type="text/css" />
<style></style>
</head>
<body>
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

<div style="width:80%; margin: 0 auto; ">

<p>
<center>
<h1>Herzlich Willkommen!</h1>
<br> 
<br> 
<p>Vielen Dank für Ihr Interesse an unserer Studie.
</p>
<p>Im Anschluss können Sie Fragen zu dem gewählten Video beantworten. Alle Angaben werden nur anonym gespeichert.
</p>
<br> 
<br> 

<form action="MainServlet" method="post">
<input type="hidden" name="action" value="Teilnehmen">
<b>Geschlecht:  </b><br>
<input type="radio" name="geschlecht" value="w" />	weiblich
<input type="radio" name="geschlecht" value="m" />	männlich
<input type="radio" name="geschlecht" value="a" checked/>	N/A<p><br>

<b>Alter: </b> <input type="text" name="alter" value="0"/> Jahre<p>

<input class="btn btn-default" type="submit" value="Teilnehmen"></center>
</form>
</div>
<body onload="doubleurl();">

</body>
</html>

