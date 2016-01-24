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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

<form action="MainServlet" method="post">
<input type="hidden" name="action" value="EinzelAuswertung">

<ul class="collection">
 <!-- 1-10  -->
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url0")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke0") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung0") %> <br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("url0")%>><img src="statistics.png" border="0"></button>
    </li>
	<li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url1")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke1") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung1") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url2")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke2") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung2") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url3")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke3") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung3") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
<li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url4")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke4") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung4") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url5")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke5") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung5") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url6")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke6") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung6") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url7")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke7") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung7") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url8")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke8") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung8") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url9")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke9") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung9") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url10")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke10") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung10") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url11")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke11") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung11") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url12")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke12") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung12") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url13")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke13") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung13") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url14")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke14") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung14") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url15")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke15") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung15") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url16")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke16") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung16") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url17")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke17") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung17") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url18")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke18") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung18") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url19")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke19") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung19") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url20")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke20") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung20") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url21")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke21") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung21") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url22")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke22") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung22") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url23")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke23") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung23") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url24")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke24") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung24") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url25")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke25") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung25") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url26")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke26") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung26") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url27")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke27") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung27") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url28")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke28") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung28") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url29")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke29") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung29") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url30")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke30") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung30") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url31")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke31") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung31") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url32")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke32") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung32") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url33")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke33") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung33") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url34")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke34") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung34") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url35")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke35") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung35") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url36")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke36") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung36") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url37")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke37") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung37") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url38")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke38") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung38") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url39")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke39") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung39") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url40")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke40") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung40") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url41")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke41") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung41") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url42")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke42") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung42") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url43")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke43") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung43") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url44")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke44") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung44") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url45")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke45") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung45") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url46")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke46") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung46") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url47")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke47") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung47") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url48")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke48") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung48") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("url49")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("marke49") %></span>
      <p>Bewertung: <%= request.getSession().getAttribute("bewertung49") %> <br>
      </p>
      <a href="#!" class="secondary-content"><i class="material-icons">equalizer</i></a>
    </li>
    </ul>
   </form>
</body>

</html>