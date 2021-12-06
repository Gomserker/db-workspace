<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${r }
	<!-- 
 1.영화 내용 출력(db에 있는거)
 
 
  -->
	<form action="MovieRegController" method="post"
		enctype="multipart/form-data">
		<table id="mTbl">
			<tr>
				<td>Movie Title</td>
				<td><input name="title"></td>
			</tr>
			<tr>
				<td>Actor</td>
				<td><input name="actor"></td>
			</tr>
			<tr>
				<td>Movie Image</td>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td>Movie Scenario</td>
				<td><textarea name="story"></textarea></td>
			</tr>
			<tr>
				<td><button>Register</button></td>
			</tr>
		</table>

	</form>



	<c:forEach var="m" items="${movies}">
		<table id="mTbl2">
			<tr>
				<td id="m_td2" rowspan="4"><img src="${m.img}" id="movieImg"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td class="m_td1">${m.title}</td>
			</tr>
			<tr>
				<td>배우</td>
				<td class="m_td1">${m.actor}</td>

			</tr>
			<tr>
				<td>시나리오</td>
				<td class="m_td1">${m.story}</td>
			</tr>
			<tr>
				<td>
					<button>수정</button>
					<button>수정</button>
					<button onclick="deleteMovie(${m.no})">삭제</button>
				</td>
			</tr>
		</table>
	</c:forEach>
</body>
</html>