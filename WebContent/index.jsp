<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Study</title>

<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist\css\bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Materialize -->
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

<div id="header">
<h3>Herzlich Willkommen!</h3>
</div>
<div style="width:80%; margin: 0 auto; ">

<p>
<center>
<br> 
<br> 
<p>Vielen Dank für Ihr Interesse an unserer Studie.

<p>Bitte sehen Sie sich die beiden Videos auf der nächsten Seite an und wählen Sie die Werbung aus, das Ihnen besser gefällt.
</p>
<p>Im Anschluss können Sie Fragen zu dem gewählten Video beantworten. Alle Angaben werden nur anonym gespeichert.
</p>
<br> 

<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="Teilnehmen">
	<div style="width:400px;">
	<table>
	<tr>
	<td style="width:150px;"><b>Geschlecht: </b><p>
	<input type="radio" name="geschlecht" value="a" checked />  N/A<br></option>
	<input type="radio" name="geschlecht" value="w"/> weiblich<br></option>
	<input type="radio" name="geschlecht" value="m"/> männlich</option>
	<td style="width:25px;"></td>
	<td style="width:125px;"><b>Alter: </b><br>
	<input type="text" name="alter" value="0"/> <p></td>
	</tr>
	</table></div>
	<br>
	<input class="btn btn-default" type="submit" style="background-color: #4db6ac; color: #fff; padding: 3px;" value="Teilnehmen!" ></center>
</form>
</div>
<body onload="doubleurl();">

</body>
</html>

