<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Study</title>

<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!--  JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Materialize -->
<link href="materialize-v0.97.3/materialize/css/materialize.css" rel="stylesheet" type="text/css" />

<script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();   
});
</script>
<style>
@-moz-document url-prefix() {
  fieldset { display: table-cell; }
}
body {
	background-color: #fafafa; 
}
table {
	border: 0px; 
}
tr {
	padding: 2px; 
	}
th {
	background-color: #8fccc6; 
	background: -moz-linear-gradient(top, #eee, #FFF);    
	background: -webkit-linear-gradient(top, #eee, #fff);
	background: -ms-linear-gradient(top, #eee, #fff);
	background: -o-linear-gradient(top, #eee, #fff);
	font-size: 15px;
}
#wrapper {
	background-color: #fff; 
	box-shadow: 1px 2px 4px rgba(0,0,0, .2);
	margin: 15px auto; 
	border-left: 2px solid #eee; 
	box-shadow: 1px 2px 4px rgba(0,0,0, .2);
	width: 850px;
}
#header {
	width: 100%;
	color: #fff;
	padding: 10px;
	background-color: #4db6ac;
}
.ten {
	text-align: center; 
	padding-top: 10px;
}
.ten input {
	margin-right: 2px; 
	margin-left: 10px; 
	color: #eee; 
}
.gruppen input {
	margin-right: 2px; 
	margin-left: 2px; 
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
        <div class="breadcrumb active"> Bewertung</div>
        <div class="breadcrumb"> Auswertung</div>
      </div>
      </div>
    </div>
    </div>
  </nav>
  
<div style="width:80%; margin: 0 auto; ">

<p>
<center><iframe id="videoo" width="560" height="315" src=https://www.youtube.com/embed/<%= request.getSession().getAttribute("VideoURL") %> frameborder="0" allowfullscreen></iframe></center>
<p>


	<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="bewertung">
	<input type="hidden" name="videoURL" value=<%= request.getSession().getAttribute("VideoURL") %>>
	
<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr><th colspan="3">Allgemeine Daten: </th></tr>
	<tr> <td colspan="2"> <%= request.getSession().getAttribute("gesehenProz") %> % der Teilnehmer kannten diese Werbung bereits.</td>

	<tr> <td colspan="2"> <%= request.getSession().getAttribute("markeProz") %> % der Teilnehmer kannten diese Marke bereits. </td>

	<tr> <td colspan="2"> <%= request.getSession().getAttribute("plottwistProz") %> % der Teilnehmer geben an, durch diese Werbung überrascht geworden zu sein.   <a href="#" data-toggle="tooltip" title="Beispiel: Bei einem Rockkonzert wird stattdessen ruhige Musik gepsielt."><img src="tooltip.jpg"></a></td>

	<tr> <td colspan="2"> <%= request.getSession().getAttribute("catchPhraseProz") %> % der Teilnehmer fanden die Catch Phrase gut.   <a href="#" data-toggle="tooltip" title="Werbespruch, der im Ohr bleiben und mit dem Produkt in Verbindung gebracht werden soll. Bespiele: McDonalds - I'm lovin' it"><img src="tooltip.jpg"></a></td>

    </table>
	</div>
</div>

<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr> <th colspan="3">Die folgenden Aussagen wurden durchschnittlich für nicht zutreffend (1), wenig zutreffend (2), neutral (3), etwas zutreffend (4) oder zutreffend (5) befunden. </th></tr>
	<tr> <td colspan="2"> In der Werbung geht es hauptsächlich um das beworbene Produkt:  <%= request.getSession().getAttribute("zutreffend1Mw") %></td>

	<tr> <td colspan="2"> Ich sehe diese Werbung gerne im Fernsehen: <%= request.getSession().getAttribute("zutreffend2Mw") %>  </td>

	<tr> <td colspan="2"> Die Werbung überzeugt mich von der Qualität des Produkts: <%= request.getSession().getAttribute("zutreffend3Mw") %>  </td>

	<tr> <td colspan="2"> Wenn ich das nächste Mal einkaufen gehe, werde ich nach dem beworbenen Produkt Ausschau halten: <%= request.getSession().getAttribute("zutreffend4Mw") %><a href="#" data-toggle="tooltip" title="Beispiel: Bei Websites und Läden (Saturn), werde ich für beworbene Ware dort hin gehen."><img src="tooltip.jpg"></a></td>

	<tr> <td colspan="2"> Die Werbung spricht mich visuell an: <%= request.getSession().getAttribute("ansprech1Mw") %> <a href="#" data-toggle="tooltip" title="Hierbei geht es ausschließlich um Sichtbares, Farbgestaltung, Szenenaufbau, Kameraführung..."><img src="tooltip.jpg"></a></td>

	<tr> <td colspan="2"> Die Werbung spricht mich inhaltlich an: <%= request.getSession().getAttribute("ansprech2Mw") %></td>

	<tr> <td colspan="2"> Die Werbung spricht mich auditiv an: <%= request.getSession().getAttribute("ansprech3Mw") %><a href="#" data-toggle="tooltip" title="Hierbei geht es um Geräusche, Klänge und Musik."><img src="tooltip.jpg"></a></td>

	<tr> <td colspan="2"> Die in der Werbung erzählte Geschichte spricht mich an: <%= request.getSession().getAttribute("ansprech4Mw") %><a href="#" data-toggle="tooltip" title="Hierbei geht es weniger um den Inhalt, sondern um die Rahmenhandlung der Werbung."></a></td>
</tr>
	          </table>
	          </div>
</div>

<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr> <th colspan="3">Die Werbung wurde durchschnittlich wie folgt empfunden: nicht zutreffend (1), wenig zutreffend (2), neutral (3), etwas zutreffend (4) oder zutreffend (5) </th></tr>
	<tr> <td style="text-align: right;" > traurig: <%= request.getSession().getAttribute("empfinden1Mw") %> </td> <td style="text-align: center" >
			  </tr>
	<tr> <td style="text-align: right;"> ernst: <%= request.getSession().getAttribute("empfinden2Mw") %> </td> <td style="text-align: center">
	   		  </tr>
	<tr> <td style="text-align: right;"> modern: <%= request.getSession().getAttribute("empfinden3Mw") %> </td> <td style="text-align: center">
	    </tr>
	<tr> <td style="text-align: right; "> unoriginell: <%= request.getSession().getAttribute("empfinden4Mw") %> </td> <td style="text-align: center">
	</tr>
	<tr> <td style="text-align: right; "> unliebsam: <%= request.getSession().getAttribute("empfinden5Mw") %> </td> <td style="text-align: center">
	</tr>
	<tr> <td style="text-align: right; "> unsympathisch: <%= request.getSession().getAttribute("empfinden6Mw") %> </td> <td style="text-align: center">
	</tr></table>
	</div>
</div>
	
<div class="table-responsive"> 
	<div id="wrapper">
	<div id="gruppen">
	<table class="table" width="100%">
	<tr> <th colspan="4"><b>Die Werbung richtet sich laut den Teilnehmern auf folgende Zielgruppen:</b></th></tr>
	<tr><td>
	<%= request.getSession().getAttribute("zielgruppenString") %><br>
	
	</td>
	</tr>
	</table>
	</div>
	</div>
</div>

<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr><th colspan="3">Durchschnittliche Gesamtbewertung: <%= request.getSession().getAttribute("gesamtBewMw") %><a href="#" data-toggle="tooltip" title="10 ist die Bestnote, 0 ist eine sehr schlechte Bewertung."><img src="tooltip.jpg"></a></th></tr>
	
	</div>
	</tr>
	</table></div>
</div>



	<p><br>
	
	</form>

</div>

</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/lose.dtd">
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
>>>>>>> origin/master
