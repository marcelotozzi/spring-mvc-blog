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
	<title>Exibir</title>
	</head>
	<body>
		<div id="body">
			<c:if test="${not empty post}">
				<h2>${post.title}</h2>
				<p>
					${post.body}
				</p>
				<div id="menu">
					<a href='<c:url value="/posts" />'>Ver Todos</a> |
					<a href='<c:url value="/posts/form" />'>Novo</a> |
					<a href="<c:url value="/posts/${post.id}/form" />">Atualizar</a>
				</div>
				<h2>Comentários</h2>
				<c:if test="${not empty comments}">
					<c:forEach items="${comments}" var="comment">
						<c:url value="/posts/${post.id}" var="url"/>
						<ul>
							<li>${comment.comment}</li>
						</ul>
					</c:forEach>
				</c:if>
				<c:url var="url" value="/posts/${post.id}"/>
				<form:form action="${url}" method="POST" modelAttribute="comment">
					<form:errors path="*" cssClass="errors" />
					<p>
						<label for="comment" >New Comment:</label><br/>
						<form:textarea path="comment" rows="10" cols="20" cssStyle="width:250px"/>
					</p>
					<p>
						<input id="criar" type="submit" value="Add Comment"/>
					</p>
				</form:form>
			</c:if>
			<c:if test="${empty post}">Nao ha Posts neste ID.</c:if>
		</div>
	</body>
</html>