<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="UnitController" onsubmit="return call();" method="post">
		<table>
		<tr>
			<td>단위변환</td>
		</tr>
		<tr>
			<td>변환할 값<br>
			<input name="num" id="i1"></td>
		</tr>
		<tr>
			<td>단위<br>
			<select name="unit">
					<option value="cm">cm -> inch</option>
					<option value="㎡">㎡ → 평</option>
					<option value="℃">℃ → ℉</option>
					<option value="km/h">km/h → mi/h</option>
			</select></td>
		</tr>
		<tr>
			<td><button>변환</button></td>
		</tr>
	</table>
	</form>
	
</body>
</html>