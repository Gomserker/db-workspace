<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" id="tbl_detail">
		<tr>
			<td colspan="2" align="center" class="d_td1"><h3>상세 페이지</h3></td>
		</tr>
		<tr>
			<td class="d_td1">글 번호</td>
			<td class="d_td2">${param.no}</td>
		</tr>
		<tr>
			<td class="d_td1">글 제목</td>
			<td class="d_td2">${review.title }</td>
		</tr>
		<tr>
			<td class="d_td1">내용</td>
			<td class="d_td2">${review.txt }</td>
		</tr>
		<tr>
			<td class="d_td1">등록일</td>
			<td class="d_td2">${review.date }</td>
		</tr>
		<tr>
			<td class="d_td3" colspan="2"> <a href="Menu4">목록으로</a> <span onclick="history.back()">목록으로(JS)</span> 
			<button onclick="location.href='ReviewUpdateC?no=${review.no}'">수정</button>
			<button>삭제</button></td>
			
		</tr>
	</table>
</body>
</html>