<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel=stylesheet href="css/index.css">
<link rel=stylesheet href="css/NewFile.css">
<link rel=stylesheet href="css/style.css">
</head>
<body>
	<div id="loginArea">
		<jsp:include page="${loginPage}"></jsp:include>
	</div>

	<table id="site">
		<tr>
			<td id="title"><a href="HC">Our Website</a></td>
		</tr>
		<tr>
			<td id="menu" colspan="2"><a href="AController">A</a> <a
				href="BController">B</a> <a href="UnitController">Unit
					Calculator</a> <a href="BmiController">BMI</a></td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="${contentPage}"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>