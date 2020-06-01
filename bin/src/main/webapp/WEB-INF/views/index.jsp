<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/main.css?ver1" />
<script type="text/javascript">
function searchAll(){
	document.getElementById("searchform").action = "${root}/apt.do";
	document.getElementById("searchform").submit();
}
</script>
<title>메인 페이지</title>
</head>
<body>
	<%@ include file="./header.jsp" %>
	<div id="div_search">
		<form id="searchform" method="post" action="">
			<input type="hidden" name="command" value="searchAll">
			<input type="hidden" name="pg" value="1">
			<input type="text" name="searchDong" placeholder="동을 입력해주세요." value="">
			<input type="text" name="searchAptName" placeholder="아파트 명을 입력해주세요." value="">
			<button type="button" id="searchButton" onclick="javascript:searchAll();">검색</button>
		</form>
	</div>
	<div>
		<div id="map"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6b750a756f2b43d52168116509001b3c"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.501311, 127.037471), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		</script>
	</div>

	<footer>
		<p>HappyHouse_Web_Back_End_서울_11반_김광남_방승환</p>
	</footer>

</body>
</html>
