<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회</title>
</head>
<body>
	<c:if test="${userid != null && userid != ''}">
		${userid}님 반갑습니다.
	</c:if>
	<h1>관리 - 조회</h1>
	<table border="1">
		<tbody>
			<tr>
				<th>번호</th><td>${hpDTO.num}</td>
			</tr>
			<tr>
				<th>이름</th><td>${hpDTO.model}</td>
			</tr>
			<tr>
				<th>가격</th><td>${hpDTO.price}</td>
			</tr>
			<tr>
				<th>제조사</th><td>${hpDTO.vendor}</td>
			</tr>
		</tbody>
	</table>
	<br><br>
	<a href="./main"><button> 메인 페이지로 </button></a>
</body>
</html>