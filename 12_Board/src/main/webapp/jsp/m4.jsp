<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table id="tbl_review" border="1px solid black">
		<tr class="r_tr1">
			<td class="r_td_title" >후기 페이지 &nbsp;&nbsp;&nbsp; ${r}</td>
			<td class="r_td_title"><a href="ReviewRegC">글쓰기</a></td>
		</tr>
	</table>
	<table id="tbl_review2" border="1px solid black">
		<c:forEach var="r" items="${reviews}">
			<tr>
				<td class="r_td1" onclick="location.href='ReviewDetailC?no=${r.no}'" >${r.title}</td>
				<td class="r_td1"><fmt:formatDate value="${r.date}" type="both" dateStyle="short" timeStyle="short" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>