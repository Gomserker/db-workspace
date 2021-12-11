<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/NewFile.css">
</head>
<body>
	
	
	
	<table id="${danwi.cn}">
		<tr>
			<td id="td1">변환결과</td>
		</tr>
		<tr>
			<td>${danwi.num}<span class="${danwi.cn}2">${danwi.unit}</span></td>
		</tr>
		<tr>
			<td>↓</td>
		</tr>
		<tr>
			<td>${danwi.result2} <span class="${danwi.cn}2">${danwi.danwi2}</span></td>
		</tr>
		<tr>
		<td><button>돌아가기</button></td>
		</tr>
	</table>
	
</body>
</html>