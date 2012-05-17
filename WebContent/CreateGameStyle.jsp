<%@page import="org.owasp.esapi.*"%>
<%@page import="java.util.ArrayList" %>

<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.hoyb.Finger.GameSetup"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script type="text/javascript" src="jquery/js/jquery-1.3.2.min.js"></script>
<title>Game Selection</title>
<script type="text/javascript">

function getXMLHttpObject(){
		if(window.XMLHttpRequest){ //ie7+, ff, chrome, opera, safari
			xmlhttp = new XMLHttpRequest();
		}else{ // ie5, ie6
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
/*
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readystate==4)
		(document.getElementById('test').innerHTML=xmlhttp.responseText);
	xmlhttp.open("GET", url, true);
	xmlhttp.send(null);
	// 4 = complete
	// 3 = in process
	// 2 = been sent
	// 1 = set up
	// 0 not initialized
xmlhttp.onreadystatechange=state_Change
*/

	function sendAjaxRequest(url){
		xmlhttp.open("GET", url, false);
		xmlhttp.send(null);
	}

	$(document).ready(function(){
		$("#gameSelect").change(function(){
			getXMLHttpObject();
			sendAjaxRequest("ChangeOptionsAjax?game=" + $("#gameSelect :selected").text());
			//if(xmlhttp.readystate==4)
				//$("#testing").append("hi");
					$("#testing").html(xmlhttp.responseText);
		});
		
	});

</script>
</head>
<body>
<%
	ArrayList<String> allGames = GameSetup.getGames();
	//GameSetup.printArrayList(allGames);
%>
<form id="gameSelect" name="gameSelect" action="" method="get">
<span class="inline">Choose game:</span>
	<select name="game">
		<%
		for(int i = 0; i < allGames.size(); i++)
			out.println("<option value=\"" + allGames.get(i) + "\">" + allGames.get(i) + "</option>");
		%>
	</select>
	<!--  <input type="submit" value="Choose" /> -->
</form>
<%
	String game = "";
	if(request.getParameter("game") != null && !request.getParameter("game").trim().equals("")){
		game = request.getParameter("game");
		game = ESAPI.encoder().encodeForHTML(game);
	}
%>
<% if(game != ""){ %>
	<h3>You've chosen <%=game %></h3>
<%} %>
	<div id="testing" />
	
</body>
</html>