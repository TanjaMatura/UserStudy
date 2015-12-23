
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Study</title>

<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist\css\bootstrap.min.css" rel="stylesheet" type="text/css" />


<style>
body {
	background-color: #fafafa; 
}
table {
	border: 0px; 
}
th {
	background-color: #4db6ac; 
	color: #fff;
	font-size: 15px;
	border-top-right-radius: 15px; 
	border-top-left-radius: 15px; 
}
#wrapper {
	background-color: #fff; 
	padding: 5px; 
	margin-top: 15px; 
	border: 3px solid #eee; 
	border-radius: 25px; 
}
#header {
	width: 100%;
	color: #fff;
	padding: 10px;
	background-color: #4db6ac;
	text-align: right; 
}
.ten {
	text-align: center; 
}
.ten input {
	margin-right: 2px; 
	margin-left: 10px; 
}
.gruppen input {
	margin-right: 2px; 
	margin-left: 2px; 
}
</style>
</head>
<body>

<div id="header"><h3>Bewertung</h3></div>
<div style="width:80%; margin: 0 auto; ">

<p>
<center><iframe id="videoo" width="560" height="315" src=https://www.youtube.com/embed/<%= request.getSession().getAttribute("VideoURL") %> frameborder="0" allowfullscreen></iframe></center>
<p>


	<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="bewertung">
	<input type="hidden" name="videoURL" value=<%= request.getSession().getAttribute("VideoURL") %>>
	
	<div id="wrapper">
	<table class="table">
	<tr><th colspan="3">Bitte beantworte die folgenden Fragen wahrheitsgemäß: </th></tr>
	<tr> <td colspan="2"> Ich habe die Werbung schon einmal gesehen</td>
	     <td> <input type="radio" name="janein1" value="ja" />	Ja 
	          <input type="radio" name="janein1" value="nein" /> Nein 
	          <input type="radio" name="janein1" value="NA" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Ich kenne die beworbene Marke </td>
	     <td> <input type="radio" name="janein2" value="ja" />	Ja 
	          <input type="radio" name="janein2" value="nein" /> Nein 
	          <input type="radio" name="janein2" value="NA" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Die Werbung hat mich überrascht </td>
	     <td> <input type="radio" name="janein3" value="ja" />	Ja 
	          <input type="radio" name="janein3" value="nein" /> Nein 
	          <input type="radio" name="janein3" value="NA" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Die Werbung hat eine gute Catch Phrase </td>
	     <td> <input type="radio" name="janein4" value="ja" />	Ja 
	          <input type="radio" name="janein4" value="nein" /> Nein 
	          <input type="radio" name="janein4" value="NA" checked/> N/A </td></tr>
	          </table>
	</div>
	         
	<div id="wrapper">
	<table class="table">
	<tr> <th colspan="3">Ist die folgende Aussage nicht zutreffend (1), wenig zutreffend (2), neutral (3), etwas zutreffend (4) oder zutreffend (5)? </th></tr>
	<tr> <td colspan="2"> In der Werbung geht es hauptsächlich um das beworbene Produkt </td>
	     <td> 1 <input type="radio" name="zutreffend1" value="1" />
	          <input type="radio" name="zutreffend1" value="2" />
	          <input type="radio" name="zutreffend1" value="3" checked/> 
	          <input type="radio" name="zutreffend1" value="4" /> 
	          <input type="radio" name="zutreffend1" value="5" /> 5</td></tr>
	<tr> <td colspan="2"> Ich sehe diese Werbung gerne im Fernsehen  </td>
	     <td> 1 <input type="radio" name="zutreffend2" value="1" /> 
	          <input type="radio" name="zutreffend2" value="2" /> 
	          <input type="radio" name="zutreffend2" value="3" checked/> 
	          <input type="radio" name="zutreffend2" value="4" />
	          <input type="radio" name="zutreffend2" value="5" /> 5</td></tr>
	<tr> <td colspan="2"> Die Werbung überzeugt mich von der Qualität des Produkts  </td>
	     <td> 1 <input type="radio" name="zutreffend3" value="1" /> 
	          <input type="radio" name="zutreffend3" value="2" /> 
	          <input type="radio" name="zutreffend3" value="3" checked/> 
	          <input type="radio" name="zutreffend3" value="4" /> 
	          <input type="radio" name="zutreffend3" value="5" /> 5</td></tr>
	<tr> <td colspan="2"> Wenn ich das nächste Mal einkaufen gehe, werde ich nach dem beworbenen Produkt Ausschau halten</td>
	     <td> 1 <input type="radio" name="zutreffend4" value="1" />
	          <input type="radio" name="zutreffend4" value="2" /> 
	          <input type="radio" name="zutreffend4" value="3" checked/> 
	          <input type="radio" name="zutreffend4" value="4" />
	          <input type="radio" name="zutreffend4" value="5" /> 5</td></tr></table>
	          </div>
	          
	<div id="wrapper">
	<table class="table">
	<tr> <th colspan="3">Ich empfinde diese Werbung als </th></tr>
	<tr> <td style="text-align: right;" > fröhlich </td> <td style="text-align: center" >
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
	          
	<div id="wrapper">
	<div id="gruppen">
	<table class="table">
	<tr> <th colspan="4"><b>Zielt die Werbung deiner Meinung nach auf eine bestimmte Zielgruppe ab? (Antwort optional)</b></th></tr>
	<tr><td>
	<input type="checkbox" name="zielgruppe" value="frauen" />   Frauen<br>
	<input type="checkbox" name="zielgruppe" value="familien" />   Familien<br>
	</td>
	<td>
	<input type="checkbox" name="zielgruppe" value="maenner" />   Männer<br>
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
	
	<div id="wrapper">
	<table class="table">
	<tr><th colspan="3">Wie hoch würdest du die Werbung insgesamt bewerten?</th></tr>
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
	
	<div id="wrapper">
	<table class="table">
	<tr><th colspan="3">Hast du noch eine persönliche Anmerkung zu dieser Werbung? </th></tr>
	<tr><td colspand="3"><textarea type="text" name="kommentar" value=" " class="form-control" rows="3"></textarea></td>
	</tr>
	</table>
	</div>
	
	<input class="btn btn-default" type="submit" value="Submit">
	</form>
	
</div>

</body>
</html>
