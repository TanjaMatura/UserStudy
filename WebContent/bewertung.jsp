
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Study</title>

<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist\css\bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Url auslesen -->
<script type="text/javascript">
var url = request.getSession().getAttribute("VideoURL");
</script>

</head>
<body>

<div style="width:80%; margin: 0 auto; ">

<p>
<center><iframe id="videoo" width="560" height="315" src=<%= request.getSession().getAttribute("VideoURL") %> frameborder="0" allowfullscreen></iframe></center>
<p>
	<form action="MainServlet" method="post">
	<input type="hidden" name="action" value="bewertung">
	<input type="hidden" name="videoURL" value=<%= request.getSession().getAttribute("VideoURL") %>>
	<table class="table">
	<tr> <td colspan="2">  <script type="text/javascript">document.write(url)</script> Ich habe die Werbung schon einmal gesehen </td>
	     <td> <input type="radio" name="janein1" value="j" />	Ja 
	          <input type="radio" name="janein1" value="n" /> Nein 
	          <input type="radio" name="janein1" value="k" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Ich kenne die beworbene Marke </td>
	     <td> <input type="radio" name="janein2" value="j" />	Ja 
	          <input type="radio" name="janein2" value="n" /> Nein 
	          <input type="radio" name="janein2" value="k" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Die Werbung hat mich überrascht </td>
	     <td> <input type="radio" name="janein3" value="j" />	Ja 
	          <input type="radio" name="janein3" value="n" /> Nein 
	          <input type="radio" name="janein3" value="k" checked/> N/A </td></tr>
	<tr> <td colspan="2"> Die Werbung hat eine gute Catch Phrase </td>
	     <td> <input type="radio" name="janein4" value="j" />	Ja 
	          <input type="radio" name="janein4" value="n" /> Nein 
	          <input type="radio" name="janein4" value="k" checked/> N/A </td></tr>
	          </table>
	          
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
	          
	<table class="table">
	<tr> <th colspan="3"><b>Zielt die Werbung Ihrer Meinung nach auf eine bestimmte Zielgruppe ab? (Antwort optional)</b></th></tr>
	<tr><td>
	<input type="checkbox" name="zielgruppe" value="tiere" />Tierliebhaber<br>
	<input type="checkbox" name="zielgruppe" value="frauen" />Frauen<br>
	<input type="checkbox" name="zielgruppe" value="maenner" />Männer<br>
	<input type="checkbox" name="zielgruppe" value="kinder" />Kinder oder Jugendliche<br>
	<input type="checkbox" name="zielgruppe" value="familien" />Familien<br>
	<input type="checkbox" name="zielgruppe" value="pensionisten" />Pensionisten<br>
	<input type="checkbox" name="zielgruppe" value="singles" />Singles<br>
	</td></tr>
	</table>
	
	<table class="table">
	<tr><th colspan="3">Wie hoch würdest du die Werbung insgesamt bewerten?</th></tr>
	<tr><td colspand="3"><input type="radio" name="gesamtbewertung" value="0" />0
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
	</tr>
	</table>
	
	<table class="table">
	<tr><th colspan="3">Hast du noch eine persönliche Anmerkung zu dieser Werbung? </th></tr>
	<tr><td colspand="3"><input type="text" name="kommentar"/></td>
	</tr>
	</table>
	<a href="danke.html"><input class="btn btn-default" type="submit" value="Submit"></a>
	</form>
</div>

</body>
</html>
