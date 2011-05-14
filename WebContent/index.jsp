<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link href="<c:url value="/static/styles/style.css"/>" rel="stylesheet" type="text/css" />
		<title>Principal</title>
	</head>
	<body>
	  <div id="wrap"> 
	  	<div id="menu">
	    	<%@ include file="/menu.jsp" %>
	    </div>
	    <div id="main">
	    	<div id="body">
	   			Aplicação CRUD criada utilizando o Spring MVC 3.0 com suporte a REST.
			</div>
		</div>
	  </div>
	</body>
</html>