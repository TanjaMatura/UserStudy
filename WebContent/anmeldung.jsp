<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daten</title>
</head>
<body>
<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="Anmelden">
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
	<input class="btn btn-default" type="submit" style="background-color: #4db6ac; color: #fff; padding: 3px;" value="Ok"></center>
</form>
</body>
</html>