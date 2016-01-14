<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Materialize -->
<link href="materialize-v0.97.3/materialize/css/materialize.min.css" rel="stylesheet" type="text/css" />

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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daten</title>
</head>
<body>
<div id="header">
<h4>Mitmachen</h4>
</div>

<div style="width:80%; margin: 0 auto; ">

<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="Anmelden">
	<div style="width:400px;">
	<table>
	<tr>
	<td style="width:150px;"><b>Geschlecht: </b></td>
	<td style="width:150px;"><b>Alter: </b></td>
	</tr>
	<tr>
	<td>
	<input id="punkt1" type="radio" name="geschlecht" value="a" checked /><label for="punkt1"> N/A</label> <br></option>
	<input id="punkt2" type="radio" name="geschlecht" value="w"/><label for="punkt2"> weiblich</label> <br></option>
	<input id="punkt3" type="radio" name="geschlecht" value="m"/><label for="punkt3"> männlich</label> </option>
	</td>
	<td>
	<input type="text" name="alter" value="0"/> <p></td>
	</tr>
	</table></div>
	<br>
	<center>
	<input class="btn btn-default" type="submit" value="Ok"></center>
</form>
</div>
</body>
</html>