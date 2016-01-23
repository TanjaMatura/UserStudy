<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auswertung eines einzelnen Videos</title>
<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Materialize -->
<link href="materialize-v0.97.3/materialize/css/materialize.css" rel="stylesheet" type="text/css" />
<script>
function listeErzeugen(){
	// Liste erzeugen
	var list = document.createElement('ul');
	var neuerLink = document.createElement("a");
    neuerLink.href = www.google.at;
    neuerLink.innerHTML = "text";
	for(var i = 0; i < 50; i++) {
        // Create the list item:
        var item = document.createElement('li');
        // Set its contents:
        item.innerHTML(neuerLink);
        // Add it to the list:
        list.appendChild(item);
  }

	// Liste an Div anhängen
	document.getElementById('listeDIV').appendChild(list);
	

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
<body onload="listeErzeugen()">


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
        <div class="breadcrumb active"> Auswertung</div>
      </div>
      </div>
    </div>
    </div>
  </nav>
  

<div id="listeDIV">
</div>

<ul class="collection">
 <!-- 1-10  -->
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url0")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke0") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung0") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
	<li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url1")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke1") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung1") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url2")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke2") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung2") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url3")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke3") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung3") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
<li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url4")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke4") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung4") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url5")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke5") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung5") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url6")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke6") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung6") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url7")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke7") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung7") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url8")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke8") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung8") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url9")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke9") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung9") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
    </li>
</body>

</html>