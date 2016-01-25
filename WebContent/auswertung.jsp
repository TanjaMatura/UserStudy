<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Danke</title>
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
</style>
</head>
<body>

 <nav>
 <div class="brand-logo">User Study</div>
<div id="nav-mobile" class="right hide-on-med-and-down">
    <div class="nav-wrapper">
      <div class="col s12">
        <div style="width:100%; padding-right: 15px;"">
        <div class="breadcrumb"> Willkommmen </div>
        <div class="breadcrumb"> Über dich </div>
        <div class="breadcrumb"> Auswahl </div>
        <div class="breadcrumb"> Bewertung</div>
        <div class="breadcrumb active"> Auswertung</div>
      </div>
      </div>
    </div>
    </div>
  </nav>
  
<div style="width:80%; margin: 10px auto; ">

<center><br><br>
Vielen Dank, dass du dir die Zeit genommen hast, an unserer Studie mitzumachen. <p>
Leider steht momentan keine Auswertung zur Verfügung. <p>
Schau doch später noch einmal vorbei!

<form action="MainServlet" method="post">
<input type="hidden" name="action" value="AuswertungBewertung">
<input class="btn btn-default" type="submit"  value="Anzeigen" ></center>
</form>
</center>
</div>
</body>
</html>