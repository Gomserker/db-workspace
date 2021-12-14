<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="LoginController" method="post">
		<table id="loginAreaTbl">
			<tr>
				<td>ID</td>
				<td><input name="id" id="id"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input name="pw" id="pw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button class="loginBtn">로그인</button>
					<button class="loginBtn" onclick="location.href='RegAccountC'">회원가입</button>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>