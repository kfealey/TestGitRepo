<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link rel="stylesheet" href="master.css" type="text/css"/>
<script type="text/javascript" src="jquery/js/jquery-1.3.2.min.js"></script>
<title>Game Rules</title>

<script type="text/javascript">
	var ruleNumber = 0;
	$(document).ready(function(){
		//addRuleToArray("test1", "test2");
	});

	function addRule(){
		ruleNumber++;
		var keyDown = "addRuleToArray('ruleName"+ ruleNumber + "','testing'); return false;";
		$("#ruleList").append('<span class="rule"><input type="text" name="ruleName' + ruleNumber + '" value="Rule Name" length="32" size="32" onKeyDown="' + keyDown + '"/> <input type="text" name="ruleValue' + ruleNumber + '" value="Rule" length="32" size"32"/></span>\n');
	}

	function addRuleToArray(ruleName, ruleVal){
		ruleNumber++;
		var assArray = [];
		assArray["ruleName" + ruleNumber] = ruleName;
		assArray["ruleValue" + ruleNumber] = ruleVal;
		alert("Rule Name: " + assArray["ruleName" + ruleNumber]);
		alert("Rule Value: " + assArray["ruleValue" + ruleNumber]);
		//$("ruleList").append(assArray["ruleName1"]);
	}

</script>
</head>
<body>

<div id="ruleList">
<form name="rules" method="post" action="">

</form>
<input type="submit" value="Add Rule" onclick="addRule()" />
<input type="submit" value="Save"/>
</div>
</body>
</html>