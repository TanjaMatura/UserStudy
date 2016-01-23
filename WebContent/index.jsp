<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Study</title>

<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Materialize -->
<link href="materialize-v0.97.3/materialize/css/materialize.css" rel="stylesheet" type="text/css" />

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

<nav>
 <div class="brand-logo">User Study</div>
<div id="nav-mobile" class="right hide-on-med-and-down">
    <div class="nav-wrapper">
      <div class="col s12">
        <div style="width:100%; padding-right: 15px;"">
        <div class="breadcrumb active"> Willkommmen </div>
        <div class="breadcrumb"> Über dich </div>
        <div class="breadcrumb"> Auswahl </div>
        <div class="breadcrumb"> Bewertung</div>
        <div class="breadcrumb"> Auswertung</div>
      </div>
      </div>
    </div>
    </div>
  </nav>

<div style="width:80%; margin: 10px auto;  ">

<p>
<br> 
<p><b><center>Vielen Dank für dein Interesse an unserer Studie!</b><p><br>

Bitte sieh dir die beiden Videos auf der nächsten Seite an und wähle die Werbung aus, die dir besser gefällt.
<p>
Im Anschluss kannst du Fragen zu dem gewählten Video beantworten.
Insgesamt stehen <b>50</b> Videos zur Auswahl. <br>
Falls du sie alle bewertest, kannst du die zwischenzeitlichen Ergebnisse schon 
vor Ende der Studie einsehen. <p>
</p>
<br> <br>

<form action="MainServlet" method="post">
<input type="hidden" name="action" value="Teilnehmen">
<input class="btn btn-default" type="submit"  value="Teilnehmen!" ></center>
</form>
</div>
</html>

