<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

#div_search {
	width: 100%;
	margin: 0 auto;
	padding: 0;
	text-align: center;
	background-color: #333;
}

input {
	height: 30px;
	margin: 10px auto;
	padding: 0;
}

#searchButton {
	height: 30px;
	border: white solid 1px;
	box-sizing: border-box;
	background-color: #333;
	color: white;
}

#div_houseDetail {
	width: 80%;
	height: 500px;
	margin: 0 auto;
	padding-top: 20px;
}

#div_houseImg {
	width: 45%;
	height: 100%;
	margin: 0 auto;
	padding : 0;
	text-align: center;
	float: left;
}

#div_houseInfo {
	width: 45%;
	height: 100%;
	margin: 0 auto;
	padding : 0;
}

tr {
	height: 35px;
}

th {
	width: 100px;
	align: left;
}

footer {
	background-color: #777;
	padding: 10px;
	text-align: center;
	color: white;
}
/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}
</style>
<script type="text/javascript">
function searchAll(){
	document.getElementById("searchform").action = "${root}/apt.do";
	document.getElementById("searchform").submit();
}
</script>
<title>${house.aptName} 상세 페이지</title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div id="div_search">
		<form id="searchform" method="post" action="">
			<input type="hidden" name="command" value="searchAll">
			<input type="text" name="searchDong" placeholder="동을 입력해주세요." value="${resultDong}">
			<input type="text" name="searchAptName" placeholder="아파트 명을 입력해주세요." value="${resultAptName}">
			<button type="button" id="searchButton" onclick="javascript:searchAll();">검색</button>
		</form>
	</div>
	<div id="div_houseDetail">
		<div id="div_houseImg">
			<img src="${root}/${house.img}" width="90%" height="auto">	
		</div>
		<div id="div_houseInfo">
			<table>
				<tr>
					<th>번호</th>
					<td>${house.no}</td>
				</tr>
				<tr>
					<th>주택명</th>
					<td>${house.aptName}</td>
				</tr>
				<tr>
					<th>법정동코드</th>
					<td>${house.code}</td>
				</tr>
				<tr>
					<th>거래금액</th>
					<td>${house.dealAmount}</td>
				</tr>
				<tr>
					<th>건축연도</th>
					<td>${house.buildYear}</td>
				</tr>
				<tr>
					<th>거래연도</th>
					<td>${house.dealYear}</td>
				</tr>
				<tr>
					<th>거래월</th>
					<td>${house.dealMonth}</td>
				</tr>
				<tr>
					<th>거래일</th>
					<td>${house.dealDay}</td>
				</tr>
				<tr>
					<th>전용면적</th>
					<td>${house.area}</td>
				</tr>
				<tr>
					<th>층</th>
					<td>${house.floor}</td>
				</tr>
				<tr>
					<th>지번</th>
					<td>${house.jibun}</td>
				</tr>
				<tr>
					<th>타입</th>
					<td>${house.type}</td>
				</tr>
				<tr>
					<th>전세금액</th>
					<td>${house.rentMoney}</td>
				</tr>
			</table>
		</div>
	</div>

	<footer>
		<p>HappyHouse_Web_Back_End_서울_11반_김광남_최현수</p>
	</footer>

</body>
</html>