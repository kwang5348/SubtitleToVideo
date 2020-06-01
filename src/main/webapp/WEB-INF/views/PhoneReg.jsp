<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록</title>
</head>
<body>
	<c:if test="${userid != null && userid != ''}">
		${userid}님 반갑습니다.
	</c:if>
	<h1>관리 - 등록</h1>
	<form action="./regist" method="post">
		<table>
			<tr>
				<td>번 호</td>
				<td><input type="text" name="num"></td>
			</tr>
			<tr>
				<td>이 름</td>
				<td><input type="text" name="model"></td>
			</tr>
			<tr>
				<td>가 격</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td>제 조 사</td>
				<td><select name="vcode">
						<option value="10"> 삼 성 </option>
						<option value="20"> 엘 지 </option>
						<option value="30"> 애 플 </option>
					</select>
				</td>
			</tr>
		</table>
		<input type="submit" value=" 전 송 ">
		<input type="reset" value=" 취 소 ">
	</form>
</body>
</html>
