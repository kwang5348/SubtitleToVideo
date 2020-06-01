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
	height: 800px;
	margin: 0 auto;
	padding: 10px;
	text-align: center;
	vertical-align: middle;
}

table {
	width: 60%;
	margin: 0 auto;
}

input {
	width: 100%;
	height: 40px;
	margin: 10px auto;
	padding: 10px;
	border: solid 1px #000000;
}

textarea {
	width: 100%;
	margin: 0 auto;
	padding: 10px;
	border: solid 1px #000000;
}

input[type="button"] {
	width: 10%;
	margin: 0 auto;
	background-color: #333;
	color: #ffffff;
}

a {
	text-decoration: none;
	color: #3b6978;
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
<title>${notice.title} 상세 페이지</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="div_top">
	</div>
	<div id="div_main">
		<table>
			<tr>
				<th colspan="2">번호</th>
				<td colspan="8"><input type="text" name="no" id="no" value="${notice.no}" readonly></td>
			</tr>
			<tr>
				<th colspan="2">제목</th>
				<td colspan="8"><input type="text" name="title" id="title" value="${notice.title}" maxlength="50" readonly></td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
				<td colspan="8"><textarea name="content" id="content" cols="100" rows="20" readonly>${notice.content}</textarea></td>
			</tr>
			<tr>
				<th colspan="2">작성일</th>
				<td colspan="8"><input type="text" name="date" id="date" value="${notice.date}" readonly></td>
			</tr>
			<tr>
				<th colspan="2">작성자</th>
				<td colspan="8"><input type="text" name="writer" id="writer" value="${notice.writer}" readonly></td>
			</tr>
		</table>
		<input type="button" onclick="location.href='${root}/notice.do?command=noticeList'" value="목록">
		<input type="button" onclick="location.href='${root}/notice.do?command=noticemvup&no=${notice.no}'" value="수정">
		<input type="button" onclick="location.href='${root}/notice.do?command=noticeDelete&no=${notice.no}'" value="삭제">
	</div>
	<footer>
		<p>HappyHouse_Web_Back_End_서울_11반_김광남_최현수</p>
	</footer>
</body>
</html>