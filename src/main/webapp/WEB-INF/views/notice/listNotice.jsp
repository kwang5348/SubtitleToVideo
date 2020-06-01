<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

#div_top {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	padding: 0;
	text-align: center;
	background-color: #333;
}

#div_main {
	width: 80%;
	height: 550px;
	margin: 0 auto;
	padding: 10px;
}

table {
	width: 100%;
	height: auto;
	margin: 0 auto;
	paddign: 0;
	text-align: center;
}

#tr_th {
	background-color: #f1f3f4;
}

td {
	border-bottom: 1px solid #000000;
	height: 40px;
}

a {
	text-decoration: none;
	color: #3b6978;
}

input[type="button"] {
	width: 5%;
	height: 40px;
	margin: 10px auto;
	padding: 10px;
	border: solid 1px #000000;
	margin: 0 auto;
	background-color: #333;
	color: #ffffff;
	float: right;
}

footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}

@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}
</style>
<title>공지사항 목록 페이지</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="div_top">
	</div>
	<div id="div_main">
		<table>
			<tr id="tr_th">
				<th colspan="1">번호</th>
				<th colspan="4">제목</th>
				<th colspan="2">작성일</th>
				<th colspan="1">작성자</th>
			</tr>
		<c:if test="${noticeList.size() > 0}">
			<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td colspan="1">${notice.no}</td>
						<td colspan="4"><a href="${root}/notice.do?command=noticeDetail&no=${notice.no}">${notice.title}</a></td>
						<td colspan="2">${notice.date}</td>
						<td colspan="1">${notice.writer}</td>
					</tr>
			</c:forEach>
		</c:if>
		<c:if test="${noticeList.size() == 0}">
			<p><h3>작성된 공지사항이 없습니다.</h3></p>
		</c:if>
		</table>
		<input type="button" onclick="location.href='${root}/notice/insertNotice.jsp'" value="등록">
	</div>
	<footer>
		<p>HappyHouse_Web_Back_End_서울_11반_김광남_최현수</p>
	</footer>
</body>
</html>