<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>Name</td>
			<td>Age</td>
		</tr>
		
		<c:forEach var="h" items="${humans}">
		<tr>
			<td>${h.name}</td>
			<td>${h.age}</td>
		</tr>
		</c:forEach>
	</table>
	<button onclick="location.href='NewFile.html'">Go Back</button>
</body>
</html>