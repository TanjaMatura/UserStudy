
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
	
	function progressBar() {
		var progress = request.getSession().getAttribute("bewerteteVideos"); 
		var prozent = progress*2; 
		docment.write(prozent);
	}
</script>
</head>


<body onload="doubleurl();">

 <nav>
 <div class="brand-logo">User Study</div>
<div id="nav-mobile" class="right hide-on-med-and-down">
    <div class="nav-wrapper">
      <div class="col s12">
        <div style="width:100%; padding-right: 15px;"">
        <div class="breadcrumb"> Willkommmen </div>
        <div class="breadcrumb"> Über dich </div>
        <div class="breadcrumb active"> Auswahl </div>
        <div class="breadcrumb"> Bewertung</div>
        <div class="breadcrumb"> Auswertung</div>
      </div>
      </div>
    </div>
    </div>
  </nav>
  
 
<div style="width:80%; margin: 0 auto; ">

 <font color=#000">User ID: <%= request.getSession().getAttribute("userID") %> </font><p>
 <center>
 <div class="progress" width="80%">
  <div class="progress-bar" role="progressbar" aria-valuenow=<%= request.getSession().getAttribute("bewerteteVideos") %> 
  aria-valuemin="0" aria-valuemax="50" style="width:<%= request.getSession().getAttribute("Prozent") %>%">
    <%= request.getSession().getAttribute("bewerteteVideos") %>/50
  </div>
 </div>
</center>

<form action="MainServlet" method="post">
<input type="hidden" name="action" value="VideoWaehlen">

<table class="table"><tr> 
	<td colspan="2"> <center><iframe width="425" height="250" src=https://www.youtube.com/embed/<%= request.getSession().getAttribute("VideoURL1") %> frameborder="0" allowfullscreen></iframe> </center></td>
	<td colspan="2"> <center><iframe width="425" height="250" src=https://www.youtube.com/embed/<%= request.getSession().getAttribute("VideoURL2") %> frameborder="0" allowfullscreen></iframe></center> </td>
	<tr> 
	<td colspan="2"><center><input id="test1"  type="radio" checked name="videos" value=<%= request.getSession().getAttribute("VideoURL1") %> /><label for="test1"></label></center> </td>
	<td colspan="2"><center><input id="test2" type="radio" name="videos" value=<%= request.getSession().getAttribute("VideoURL2") %> /><label for="test2"></label> </center></td>
	<!-- Kommentar: wenn ein Button geklickt wird muss auf die Bewertungsseite verlinkt werden außerdem muss die Videtabelle in der DB
		 mit der auswahl und pickrate upgedated werden -->

</table> 
<center><input class="btn btn-default" type="submit" value="Wählen"></center>
</form>
</div>


</body>
</html>
