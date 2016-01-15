<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Materialize -->
<link href="materialize-v0.97.3/materialize/css/materialize.css" rel="stylesheet" type="text/css" />

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
/* Remove default Radio Buttons */
[type="radio"]:not(:checked), [type="radio"]:checked {
  position: absolute;
  left: -9999px;
  visibility: hidden; }
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daten</title>
</head>
<body>

 <nav>
 <div class="brand-logo">User Study</div>
<div id="nav-mobile" class="right hide-on-med-and-down">
    <div class="nav-wrapper">
      <div class="col s12">
        <div style="width:100%; padding-right: 15px;"">
        <div class="breadcrumb"> Willkommmen </div>
        <div class="breadcrumb active"> Über dich </div>
        <div class="breadcrumb"> Auswahl </div>
        <div class="breadcrumb"> Bewertung</div>
        <div class="breadcrumb"> Auswertung</div>
      </div>
      </div>
    </div>
    </div>
  </nav>
  
<div style="width:80%; margin: 0 auto; ">

<div style="width:50%; margin: 10 auto; text-align: center;">
<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="Anmelden">
	<center>
	<table>
	<tr>
	<td style="width:150px;"><b>Geschlecht: </b></td>
	<td style="width:150px;"><b>Alter: </b></td>
	</tr>
	<tr>
	<td>
	<input id="punkt1" type="radio" name="geschlecht" value="a" checked /><label for="punkt1">  N/A</label> <br></option>
	<input id="punkt2" type="radio" name="geschlecht" value="w"/><label for="punkt2">  weiblich</label> <br></option>
	<input id="punkt3" type="radio" name="geschlecht" value="m"/><label for="punkt3">  männlich</label> </option>
	</td>
	<td>
	<input type="text" name="alter" value="0"/> <p></td>
	</tr>
	</table>
	<br>
	
	<input class="btn btn-default" type="submit" value="Ok"></center>
</form>
</div>
</div>
</body>
</html>