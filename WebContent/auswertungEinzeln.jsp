<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auswertung</title>
<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Materialize -->
<link href="materialize-v0.97.3/materialize/css/materialize.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script language="Javascript">
function refreshpage(){
document.forms.form1.submit();
}
</script>
</head>
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
<body>

<nav>
 <div class="brand-logo">Auswertung</div>
<div id="nav-mobile" class="right hide-on-med-and-down">
    <div class="nav-wrapper">
      <div class="col s12">
        <div style="width:100%; padding-right: 15px;">
        <div class="breadcrumb"> Willkommmen </div>
        <div class="breadcrumb"> Über dich </div>
        <div class="breadcrumb"> Auswahl </div>
        <div class="breadcrumb"> Bewertung</div>
        <div class="breadcrumb active"> <a href="auswertung.jsp" style="font-style: italic;">Auswertung</a></div>
      </div>
      </div>
    </div>
    </div>
  </nav>

<p>
<div class="row">
    <div class="col s12 m7">
      <div class="card">
        <div class="card-image">
         <iframe id="video" width="560" height="315" src=https://www.youtube.com/embed/<%= request.getSession().getAttribute("URL") %> frameborder="0" allowfullscreen></iframe>
          <span class="card-title"><%= request.getSession().getAttribute("marke") %></span>
        </div>
        <div class="card-content">
          <p>Text</p>
        </div>
      </div>
    </div>
  </div>

<%response.setIntHeader("Refresh",5);%>
<form id="form1">
  <img src="chart" width="600" height="400" border="0"/>
  <input type="button" onclick="refreshpage()" value="Refresh"/>
</form>

</body>
</html>