<%@page import="org.owasp.esapi.*"%>

<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="master.css" type="text/css"/>
<script type="text/javascript" src="jquery/js/jquery-1.3.2.min.js"></script>
<title>Drinking Game Winners</title>

<script type-"text/javascript">
	var hits = 0;
	var misses = 0;
	var total = hits + misses;
	
	$(document).ready(function(){
		$("#hits").html(hits);
		$("#misses").html(misses);
		$("#total").html(total);
	});

	function addHit(){
		hits++;
		total++;
		updateTable();
	}

	function addMiss(){
		misses++;
		total++;
		updateTable();
	}

	function updateTable(){
		$("#hits").html(hits);
		$("#misses").html(misses);
		$("#total").html(total);
	}
</script>
</head>
<body>
<!--  <h2>Drinking Game Winners - We'll help you remember.</h2> -->
<span class="inline">Choose game:</span>
<form name="gameSelect" action="" method="get">
	<select name="game">
		<option value="Beer Pong">Beer Pong</option>
		<option value="Kings">Kings</option>
		<option value="The Finger Game">Finger Game</option>
		<option value="Flip Cup">Flip Cup</option>
	</select>
	<input type="submit" value="Choose" />
</form>
<%
	String game = "";
	if(request.getParameter("game") != null) game = request.getParameter("game");
		game = ESAPI.encoder().encodeForHTML(game);
%>
<h3><%=game%></h3>
	<input type="submit" value="Hit" onclick="addHit()"/>
	<input type="submit" value="Miss" onclick="addMiss()"/>

<div id="stats">
	<table>
		<tr><th>Hits</th><th>Misses</th><th>Total</th></tr>
		<tr><td><span id="hits"></span></td><td><span id="misses"></span></td><td><span id="total"></span></td></tr>
	</table>
</div>
</body>
</html>