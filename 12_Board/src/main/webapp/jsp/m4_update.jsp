<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="ReviewUpdateC" method="post">
		<table border="1" id="tbl_detail">
			<tr>
				<td colspan="2" align="center" class="d_td1"><h3>수정 페이지</h3></td>
			</tr>
			<tr>
				<td class="d_td1">글 번호</td>
				<td class="d_td2">${review.no}</td>
			</tr>
			<tr>
				<td class="d_td1">글 제목</td>
				<td class="d_td2"><input name="title" value="${review.title}"></td>
			</tr>
			<tr>
				<td class="d_td1">내용</td>
				<td class="d_td2"><input name="txt" value="${review.txt}"></td>
			</tr>
			<tr>
				<td class="d_td1">등록일</td>
				<td class="d_td2">${review.date }</td>
			</tr>
			<tr>
				<td><span onclick="history.go(-2)">목록으로(JS)</span>
					<button name="no" value="${param.no}">수정</button></td>
			</tr>
		</table>
	</form>
</body>
</html>