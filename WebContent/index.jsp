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

<div style="width:80%; margin: 0 auto; ">

<p>
<center>
<h1>User Studie - Werbung</h1>
<br> 
<br> 
<p>Bitte sehen Sie sich die beiden Videos an. Wählen Sie das Video aus, das Ihnen besser gefällt.
</p>
<p>Im Anschluss können Sie Fragen zu dem gewählten Video beantworten.
</p>
<br> 
<br> 
</center>
<table class="table">
<tr> <td colspan="2"> <center><iframe width="280" height="162" src="https://www.youtube.com/embed/V6-0kYhqoRo?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe> </center></td>
	<td colspan="2"> <center><iframe width="280" height="162" src="https://www.youtube.com/embed/VHbjTiZ1C_U?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe></center> </td>
<tr> 
	<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="VideoWaehlen">
	<td colspan="2"><center><input type="Button" name="Videos" value="1">Video wählen</center> </td>
	<td colspan="2"><center><input type="Button" name="Videos" value="2">Video wählen</center> </td>
	<!-- Kommentar: wenn ein Button geklickt wird muss auf die Bewertungsseite verlinkt werden außerdem muss die Videtabelle in der DB
		 mit der auswahl und pickrate upgedated werden -->
<center></center>
<p>
	
</p>
	
	
	</form>
</div>

</body>
</html>
