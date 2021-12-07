<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정 페이지</h1>
${r}
	<form action="MovieUpdateC">
		<table id="mTbl2">
			 <tr>
				<td id="m_td2" rowspan="4">
				<img src="img/${m.img}" id="movieImg">
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td class="m_td1"><input name="title" value="${movie.title }"></td>
			</tr>
			<tr>
				<td>배우</td>
				<td class="m_td1"><input name="actor" value="${movie.actor }"></td>

			</tr>
			<tr>
				<td>시나리오</td>
				<td class="m_td1"><textarea name="story" value="${movie.story }"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button name="no" value="${param.num}">수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>