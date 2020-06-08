<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${root}/css/main.css?ver1" />
<style type="text/css">
header {
	/* background-color: #666; */
	background-image: url("${root}/img/main_banner3.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
	background-position: center 55%;
	padding: 30px;
	text-align: center;
	font-size: 35px;
	color: #333;
}
</style>
<title>header</title>
</head>
<body>
	<c:if test="${userinfo == null}">
		<div id="div_menu">
			<ul>
				<li><a href="main">메인</a></li>
				<li><a href="list">검색</a></li>
				<li><a href="${root}/apt/map.jsp">지도검색</a></li>
				<li><a href="${root}/notice.do?command=noticeList">공지사항</a></li>
				<li><a href="mvjoin">회원가입</a></li>
				<li><a href="mvlogin">로그인</a></li>
			</ul>
		</div>
	</c:if>
	<c:if test="${userinfo != null}">
		<c:if test="${userinfo.user_id == 'admin'}">
			<div id="div_menu">
				<ul>
					<li><a href="main">메인</a></li>
					<li><a href="${root}/apt/map.jsp">지도검색</a></li>
					<li><a href="${root}/notice.do?command=noticeList">공지사항</a></li>
					<li><a href="userlist">회원정보 조회</a></li>
					<li><a href="logout">로그아웃</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${userinfo.user_id != 'admin'}">
			<div id="div_menu">
				<ul>
					<li><a href="main">메인</a></li>
					<li><a href="${root}/apt/map.jsp">지도검색</a></li>
					<li><a href="${root}/notice.do?command=noticeList">공지사항</a></li>
					<li><a href="mvuserinfo">마이페이지</a></li>
					<li><a href="logout">로그아웃</a></li>
				</ul>
			</div>
		</c:if>
	</c:if>
	<header>
		<h2>Happy House</h2>
	</header>
</body>
</html>
