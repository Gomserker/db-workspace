<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="Reg" onsubmit="return check()" name="myForm">
		<table>
			<tr>
				<td colspan="2" id="title">회원 가입</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="name" required="required"></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input name="id" placeholder="한글x, 5글자 이상"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input name="pw" type="password" placeholder="3글자 이상, 대,소,숫 1포함"></td>
			</tr>
			<tr>
				<td>PW 확인</td>
				<td><input name="pw" type="password"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>남<input type="radio" name="gender" checked="checked" value="남">
				 여<input type="radio" name="gender" value="여"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><select name="addr">
						<option value="seoul">서울</option>
						<option value="kyeonggi">경기</option>
						<option value="busan">부산</option>
						<option value="etc">기타</option>
				</select></td>
			</tr>
			<!-- <tr>
				<td>주소</td>
				<td><select multiple="multiple" size="3">
						<option value="seoul">서울</option>
						<option value="kyeonggi">경기</option>
						<option value="busan">부산</option>
						<option value="etc">기타</option>
				</select></td>
			</tr> -->
			<tr>
				<td>관심사</td>
				
				<td>요리<input type="checkbox" name="interest" value="cook">
					운동<input type="checkbox" name="interest" value="excer">
					게임<input type="checkbox" name="interest" value="game">
					개발<input type="checkbox" name="interest" value="dev">
				</td>
			
			</tr>
			<tr>
				<td>자기소개</td>
				<td><textarea name="textArea"></textarea></td>
			</tr>
			<tr>
				<td>프사</td>
				<td><input type="file" placeholder="jpg, png" name="img"></td>
			</tr>
			<tr>
				<td colspan="2"><button>가입!</button></td>
			</tr>
		</table>
	</form>
</body>
</html>