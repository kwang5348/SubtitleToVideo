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

	<%@ include file="./footer.jsp" %>


</body>
</html>
