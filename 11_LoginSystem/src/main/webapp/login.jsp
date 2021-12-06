<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${r}
	<form action="LoginController" method="post">
		ID <input name="id"><p>
		PW <input name="pw"><p>
		
		<button>Login</button>
	</form>
	<form action="RegController">
		<button>Register</button>
	</form>
</body>
</html>