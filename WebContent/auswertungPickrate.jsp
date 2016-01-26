<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap -->
<link href="bootstrap-3.3.6-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- Materialize -->
<link href="materialize-v0.97.3/materialize/css/materialize.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
        <div class="breadcrumb"> Pickrate</div>
        <div class="breadcrumb active"> Auswertung</div>
      </div>
      </div>
    </div>
    </div>
  </nav>
  
<center>
<table style="width:25%;">
<tr>
<td>
<form action="MainServlet" method="post">
<input type="hidden" name="action" value="AuswertungPickrate">
<input class="btn btn-default" type="submit"  value="Pickrate" ></center>
</form></td>
<td>
<form action="MainServlet" method="post">
<input type="hidden" name="action" value="AuswertungPickrate">
<input class="btn btn-default" type="submit"  value="Pickrate" ></center>
</form>
</td></tr>
</table>
</center>

<form action="MainServlet" method="post">
<input type="hidden" name="action" value="EinzelAuswertung">

<ul class="collection">
 <!-- 1-10  -->
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate0")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate0") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate0") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate0")%>><img src="statistics.png" border="0"></button>
    </li>
	<li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate1")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate1") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate1") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate1")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate2")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate2") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate2") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate2")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate3")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate3") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate3") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate3")%>><img src="statistics.png" border="0"></button>
    </li>
<li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate4")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate4") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate4") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate4")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate5")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate5") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate5") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate5")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate6")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate6") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate6") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate6")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate7")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate7") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate7") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate7")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate8")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate8") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate8") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate8")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate9")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate9") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate9") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate9")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate10")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate10") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate10") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate10")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate11")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate11") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate11") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate11")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate12")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate12") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate12") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate12")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate13")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate13") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate13") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate13")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate14")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate14") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate14") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate14")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate15")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate15") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate15") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate15")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate16")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate16") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate16") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate16")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate17")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate17") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate17") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate17")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate18")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate18") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate18") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate18")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate19")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate19") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate19") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate19")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate20")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate20") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate20") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate20")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate21")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate21") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate21") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate21")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate22")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate22") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate22") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate22")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate23")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate23") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate23") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate23")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate24")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate24") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate24") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate24")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate25")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate25") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate25") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate25")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate26")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate26") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate26") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate26")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate27")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate27") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate27") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate27")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate28")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate28") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate28") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate28")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate29")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate29") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate29") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate29")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate30")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate30") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate30") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate30")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate31")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate31") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate31") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate31")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate32")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate32") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate32") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate32")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate33")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate33") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate33") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate33")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate34")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate34") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate34") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate34")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate35")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate35") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate35") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate35")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate36")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate36") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate36") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate36")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate37")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate37") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate37") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate37")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate38")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate38") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate38") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate38")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate39")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate39") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate39") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate39")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate40")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate40") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate40") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate40")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate41")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate41") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate41") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate41")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate42")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate42") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate42") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate42")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate43")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate43") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate43") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate43")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate44")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate44") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate44") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate44")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate45")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate45") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate45") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate45")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate46")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate46") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate46") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate46")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate47")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate47") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate47") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate47")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate48")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate48") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate48") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate48")%>><img src="statistics.png" border="0"></button>
    </li>
    <li class="collection-item avatar">
      <img src=http://img.youtube.com/vi/<%=request.getSession().getAttribute("urlPickrate49")%>/1.jpg alt="" class="circle">
      <span class="title"><%= request.getSession().getAttribute("markePickrate49") %></span>
      <p>Pickrate: <%= request.getSession().getAttribute("Pickrate49") %>%<br>
      </p>
      <button class="secondary-content" type="submit" name="link" style="border: 0px;" value=<%=request.getSession().getAttribute("urlPickrate49")%>><img src="statistics.png" border="0"></button>
    </li>
    </ul>

   </form>
</body>

</body>
</html>
