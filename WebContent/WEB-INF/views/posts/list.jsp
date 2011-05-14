<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<style type="text/css" media="screen">
		@IMPORT url("<c:url value="/static/styles/styles.css"/>");
	</style>
	<title>Listar</title>
	</head>
	<body>
		<div id="body">
			<h2>Listing Post</h2>
			<c:if test="${not empty posts}">
				<table width="600px">
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Body</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
					<c:forEach items="${posts}" var="post">
						<c:url var="url" value="/posts/${post.id}"/>
						<tr>
							<td>${post.id}</td>
							<td>${post.title}</td>
							<td>${post.body}</td>
							<td align="center">
								<form:form action="${url}" method="GET">
									<input alt="Exibir Post" 
											src='<c:url value="/static/images/show.png"/>' 
											title="Exibir Post" 
											type="image" 
											value="Exibir Post"/>
								</form:form>
							</td>
							<td align="center">
								<form:form action="${url}/form" method="GET">
									<input alt="Atualizar Post" 
											src='<c:url value="/static/images/update.png"/>' 
											title="Atualizar Post" 
											type="image" 
											value="Atualizar Post"/>
								</form:form>
							</td>
							<td align="center">
								<form:form action="${url}" method="DELETE">
									<input alt="Excluir Post" 
											src='<c:url value="/static/images/delete.png"/>' 
											title="Excluir Post" 
											type="image" 
											value="Excluir Post"/>
								</form:form>
							</td>	 
						</tr>
					</c:forEach>
				</table>
			</c:if>
			<c:if test="${empty posts}">Não há posts no momento</c:if>
			<div>
				<a href='<c:url value="/posts/form"/>'>Novo</a>
			</div>
		</div>
	</body>
</html>