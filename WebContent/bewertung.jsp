<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <div class="breadcrumb"> �ber dich </div>
        <div class="breadcrumb"> Auswahl </div>
        <div class="breadcrumb active"> Bewertung</div>
        <div class="breadcrumb"> <a href="auswertung.jsp" style="font-style: italic;">Auswertung</a></div>
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
	<tr><th colspan="3">Bitte beantworte die folgenden Fragen wahrheitsgem��: </th></tr>
	<tr> <td colspan="2"> Ich habe die Werbung schon einmal gesehen</td>
	     <td> <input type="radio" id="punkt1" name="janein1" value="ja" /> Ja
	          <input type="radio" id="punkt2" name="janein1" value="nein" /> Nein
	          <input type="radio" id="punkt3" name="janein1" value="NA" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Ich kenne die beworbene Marke </td>
	     <td> <input type="radio" id="punkt4" name="janein2" value="ja" /> Ja 
	          <input type="radio" id="punkt5" name="janein2" value="nein" /> Nein 
	          <input type="radio" id="punkt6" name="janein2" value="NA" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Die Werbung hat mich �berrascht   <a href="#" data-toggle="tooltip" title="Beispiel: Bei einem Rockkonzert wird stattdessen ruhige Musik gepsielt."><img src="tooltip.jpg"></a></td>
	     <td> <input type="radio" id="punkt7" name="janein3" value="ja" /> Ja 
	          <input type="radio" id="punkt8" name="janein3" value="nein" /> Nein 
	          <input type="radio" id="punkt9" name="janein3" value="NA" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Die Werbung hat eine gute Catch Phrase   <a href="#" data-toggle="tooltip" title="Werbespruch, der im Ohr bleiben und mit dem Produkt in Verbindung gebracht werden soll. Bespiele: McDonalds - I'm lovin' it"><img src="tooltip.jpg"></a></td>
	     <td> <input type="radio" id="punkt10" name="janein4" value="ja" /> Ja
	          <input type="radio" id="punkt11" name="janein4" value="nein" /> Nein
	          <input type="radio" id="punkt12" name="janein4" value="NA" checked/> N/A </td></tr>
	          </table>
	</div>
</div>

<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr> <th colspan="3">Ist die folgende Aussage nicht zutreffend (1), wenig zutreffend (2), neutral (3), etwas zutreffend (4) oder zutreffend (5)? </th></tr>
	<tr> <td colspan="2"> In der Werbung geht es haupts�chlich um das beworbene Produkt </td>
	     <td> <font color="#D6431A">1</font> <input type="radio" id="zutr1" name="zutreffend1" value="1" /> 
	          <input type="radio" id="zutr2" name="zutreffend1" value="2" />
	          <input type="radio" id="zutr3" name="zutreffend1" value="3" checked/> 
	          <input type="radio" id="zutr4" name="zutreffend1" value="4" /> 
	          <input type="radio" id="zutr5" name="zutreffend1" value="5" /> <font color="#43AD28">5</font></td></tr>
	<tr> <td colspan="2"> Ich sehe diese Werbung gerne im Fernsehen  </td>
	     <td>  <font color="#D6431A">1</font>  <input type="radio" name="zutreffend2" value="1" /> 
	          <input type="radio" name="zutreffend2" value="2" /> 
	          <input type="radio" name="zutreffend2" value="3" checked/> 
	          <input type="radio" name="zutreffend2" value="4" />
	          <input type="radio" name="zutreffend2" value="5" /> <font color="#43AD28">5</font></td></tr>
	<tr> <td colspan="2"> Die Werbung �berzeugt mich von der Qualit�t des Produkts  </td>
	     <td> <font color="#D6431A">1</font>  <input type="radio" name="zutreffend3" value="1" /> 
	          <input type="radio" name="zutreffend3" value="2" /> 
	          <input type="radio" name="zutreffend3" value="3" checked/> 
	          <input type="radio" name="zutreffend3" value="4" /> 
	          <input type="radio" name="zutreffend3" value="5" /> <font color="#43AD28">5</font></td></tr>
	<tr> <td colspan="2"> Wenn ich das n�chste Mal einkaufen gehe, werde ich nach dem beworbenen Produkt Ausschau halten<a href="#" data-toggle="tooltip" title="Beispiel: Bei Websites und L�den (Saturn), werde ich f�r beworbene Ware dort hin gehen."><img src="tooltip.jpg"></a></td>
	     <td> <font color="#D6431A">1</font>  <input type="radio" name="zutreffend4" value="1" />
	          <input type="radio" name="zutreffend4" value="2" /> 
	          <input type="radio" name="zutreffend4" value="3" checked/> 
	          <input type="radio" name="zutreffend4" value="4" />
	          <input type="radio" name="zutreffend4" value="5" /> <font color="#43AD28">5</font></td></tr>
	<tr> <td colspan="2"> Die Werbung spricht mich visuell an.<a href="#" data-toggle="tooltip" title="Hierbei geht es ausschlie�lich um Sichtbares, Farbgestaltung, Szenenaufbau, Kameraf�hrung..."><img src="tooltip.jpg"></a></td>
	     <td> <font color="#D6431A">1</font>  <input type="radio" name="ansprech1" value="1" />
	          <input type="radio" name="ansprech1" value="2" /> 
	          <input type="radio" name="ansprech1" value="3" checked/> 
	          <input type="radio" name="ansprech1" value="4" />
	          <input type="radio" name="ansprech1" value="5" /> <font color="#43AD28">5</font></td></tr>
	<tr> <td colspan="2"> Die Werbung spricht mich inhaltlich an.</td>
	     <td> <font color="#D6431A">1</font>  <input type="radio" name="ansprech2" value="1" />
	          <input type="radio" name="ansprech2" value="2" /> 
	          <input type="radio" name="ansprech2" value="3" checked/> 
	          <input type="radio" name="ansprech2" value="4" />
	          <input type="radio" name="ansprech2" value="5" /> <font color="#43AD28">5</font></td></tr>
	<tr> <td colspan="2"> Die Werbung spricht mich auditiv an.<a href="#" data-toggle="tooltip" title="Hierbei geht es um Ger�usche, Kl�nge und Musik."><img src="tooltip.jpg"></a></td>
	     <td> <font color="#D6431A">1</font>  <input type="radio" name="ansprech3" value="1" />
	          <input type="radio" name="ansprech3" value="2" /> 
	          <input type="radio" name="ansprech3" value="3" checked/> 
	          <input type="radio" name="ansprech3" value="4" />
	          <input type="radio" name="ansprech3" value="5" /> <font color="#43AD28">5</font></td></tr>
	<tr> <td colspan="2"> Die in der Werbung erz�hlte Geschichte spricht mich an.<a href="#" data-toggle="tooltip" title="Hierbei geht es weniger um den Inhalt, sondern um die Rahmenhandlung der Werbung."></a></td>
	     <td> <font color="#D6431A">1</font>  <input type="radio" name="ansprech4" value="1" />
	          <input type="radio" name="ansprech4" value="2" /> 
	          <input type="radio" name="ansprech4" value="3" checked/> 
	          <input type="radio" name="ansprech4" value="4" />
	          <input type="radio" name="ansprech4" value="5" /> <font color="#43AD28">5</font></td></tr>
	          </table>
	          </div>
</div>

<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr> <th colspan="3">Ich empfinde diese Werbung als </th></tr>
	<tr> <td style="text-align: right;" > fr�hlich </td> <td style="text-align: center" >
			  <input type="radio" name="empfinden1" value="1" />
	          <input type="radio" name="empfinden1" value="2" /> 
	          <input type="radio" name="empfinden1" value="3" checked/> 
	          <input type="radio" name="empfinden1" value="4" /> 
	          <input type="radio" name="empfinden1" value="5" /> </td> <td> traurig </td></tr>
	<tr> <td style="text-align: right;"> lustig </td> <td style="text-align: center">
	   		  <input type="radio" name="empfinden2" value="1" />
	          <input type="radio" name="empfinden2" value="2" /> 
	          <input type="radio" name="empfinden2" value="3" checked/> 
	          <input type="radio" name="empfinden2" value="4" /> 
	          <input type="radio" name="empfinden2" value="5" /> </td> <td> ernst </td></tr>
	<tr> <td style="text-align: right;"> altmodisch </td> <td style="text-align: center">
	          <input type="radio" name="empfinden3" value="1" /> 
	          <input type="radio" name="empfinden3" value="2" />
	          <input type="radio" name="empfinden3" value="3" checked/>
	          <input type="radio" name="empfinden3" value="4" /> 
	          <input type="radio" name="empfinden3" value="5" /> </td> <td> modern </td></tr>
	<tr> <td style="text-align: right; "> originell </td> <td style="text-align: center">
			  <input type="radio" name="empfinden4" value="1" /> 
	          <input type="radio" name="empfinden4" value="2" /> 
	          <input type="radio" name="empfinden4" value="3" checked/> 
	          <input type="radio" name="empfinden4" value="4" />
	          <input type="radio" name="empfinden4" value="5" /> </td> <td> unoriginell  </td></tr>
	<tr> <td style="text-align: right; "> liebenswert </td> <td style="text-align: center">
			  <input type="radio" name="empfinden5" value="1" />
	          <input type="radio" name="empfinden5" value="2" /> 
	          <input type="radio" name="empfinden5" value="3" checked/>
	          <input type="radio" name="empfinden5" value="4" />
	          <input type="radio" name="empfinden5" value="5" /> </td> <td> unliebsam </td></tr>
	<tr> <td style="text-align: right; "> sympathisch </td> <td style="text-align: center">
	 		  <input type="radio" name="empfinden6" value="1" /> 
	          <input type="radio" name="empfinden6" value="2" /> 
	          <input type="radio" name="empfinden6" value="3" checked/> 
	          <input type="radio" name="empfinden6" value="4" />
	          <input type="radio" name="empfinden6" value="5" /> </td> <td> unsympathisch </td></tr></table>
	</div>
</div>
	
<div class="table-responsive"> 
	<div id="wrapper">
	<div id="gruppen">
	<table class="table" width="100%">
	<tr> <th colspan="4"><b>Zielt die Werbung deiner Meinung nach auf eine bestimmte Zielgruppe ab? (Antwort optional)</b></th></tr>
	<tr><td>
	<input type="checkbox" name="zielgruppe" value="frauen" />   Frauen<br>
	<input type="checkbox" name="zielgruppe" value="familien" />   Familien<br>
	</td>
	<td>
	<input type="checkbox" name="zielgruppe" value="maenner" />   M�nner<br>
	<input type="checkbox" name="zielgruppe" value="pensionisten" />   Pensionisten<br>
	</td>
	<td>
	<input type="checkbox" name="zielgruppe" value="kinder" />   Kinder oder Jugendliche<br>
	<input type="checkbox" name="zielgruppe" value="singles" />   Singles<br>
	</td>
	<td>
	<input type="checkbox" name="zielgruppe" value="tiere" />   Tierliebhaber<br>
	</td>
	</tr>
	</table>
	</div>
	</div>
</div>

<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr><th colspan="3">Wie hoch w�rdest du die Werbung insgesamt bewerten?<a href="#" data-toggle="tooltip" title="10 ist die Bestnote, 0 ist eine sehr schlechte Bewertung."><img src="tooltip.jpg"></a></th></tr>
	<tr><td colspand="3"><div class="ten">
	<input type="radio" name="gesamtbewertung" value="0" />0
	<input type="radio" name="gesamtbewertung" value="1" />1
	<input type="radio" name="gesamtbewertung" value="2" />2
	<input type="radio" name="gesamtbewertung" value="3" />3
	<input type="radio" name="gesamtbewertung" value="4" />4
	<input type="radio" name="gesamtbewertung" value="5" checked/>5
	<input type="radio" name="gesamtbewertung" value="6" />6
	<input type="radio" name="gesamtbewertung" value="7" />7
	<input type="radio" name="gesamtbewertung" value="8" />8
	<input type="radio" name="gesamtbewertung" value="9" />9
	<input type="radio" name="gesamtbewertung" value="10" />10</td>
	</div>
	</tr>
	</table></div>
</div>

<div class="table-responsive">
	<div id="wrapper">
	<table class="table" width="100%">
	<tr><th colspan="3">Hast du noch eine pers�nliche Anmerkung zu dieser Werbung? </th></tr>
	<tr><td colspand="3"><textarea width="100%" type="text" name="kommentar" value=" " class="form-control" rows="3"></textarea></td>
	</tr>
	</table>
	</div>
</div>

	<p><br>
	<center><input class="btn btn-default" type="submit" value="Submit" style="background-color: #4db6ac; color: #fff; font-weight: bold;"><p><br></center>
	</form>

</div>

</body>
</html>
