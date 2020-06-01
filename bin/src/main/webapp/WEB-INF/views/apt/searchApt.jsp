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

label {
	color: white;
	vertical-align: middle;
	padding: 0;
	padding-right: 5px;
	margin: 0 auto;
	position: relative;
	top: -3px;
}

.chtype {
	position: relative;
	top: 9px;
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

#div_houseList_th {
	width: 80%;
	margin: auto;
	margin-top : 20px;
	/* overflow: scroll; */
	height: 40px;
	background-color: #f1f3f4;
}

#div_houseList_td {
	width: 80%;
	margin: 0 auto;
	/* overflow: scroll; */
	height: 500px;
}

#div_paging {
	width: 35%;
	margin: 0 auto;
}

.pagination {
	width: 100%;
	margin: 0 auto;
	height: 100px;
}

.pagination li {
	list-style: none;
	float:left;
	border: 1px solid #dcd6f7;
	box-sizing: border-box;
}

.pagination li a {
	color: #424874;
}

.pagination li a:hover {
	background-color: #dcd6f7;
}

th, td, tr {
	width: 100px;
	height: 45px;
	text-align: center;
	vertical-align: middle;
}

.aptName {
	width: 350px;
}

.area {
	width: 200px;
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
<script type="text/javascript">
function searchAll(){
	document.getElementById("searchform").action = "${root}/apt.do";
	document.getElementById("searchform").submit();
}

function pageMove(pg) { 
	document.getElementById("pg").value=pg;
	document.getElementById("pageform").action = "${root}/apt.do";
	document.getElementById("pageform").submit();
}
</script>
<title>${resultDong} ${resultAptName} 검색 결과 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	
	<!-- 페이징 처리 -->
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="command" id="command" value="searchAll">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="searchDong" id="searchDong" value="${resultDong}">
		<input type="hidden" name="searchAptName" id="searchAptName" value="${resultAptName}">
	</form>
	<div id="div_search">
		<form id="searchform" method="post" action="">
			<!-- <input type="checkbox" class="chtype" name="type" value="1" checked><label>아파트 매매</label>
			<input type="checkbox" class="chtype" name="type" value="2" checked><label>아파트 전월세</label>
			<input type="checkbox" class="chtype" name="type" value="3" checked><label>연립/다세대 매매</label>
			<input type="checkbox" class="chtype" name="type" value="4" checked><label>연립/다세대 전월세</label> -->
			<input type="hidden" name="command" value="searchAll">
			<input type="hidden" name="pg" id="pg" value="1">
			<input type="text" name="searchDong" placeholder="동을 입력해주세요." value="${resultDong}">
			<input type="text" name="searchAptName" placeholder="아파트 명을 입력해주세요." value="${resultAptName}">
			<button type="button" id="searchButton" onclick="javascript:searchAll();">검색</button>
		</form>
	</div>
	
	<div id="div_houseList_th">
		<table class="table">
			<tr>
				<th>번호</th>
				<th>법정동</th>
				<th class="aptName">주택명</th>
				<th>법정동코드</th>
				<th>거래금액</th>
				<th>건축연도</th>
				<th>거래연도</th>
				<th>거래월</th>
				<th>거래일</th>
				<th class="area">전용면적</th>
				<th>층</th>
				<th>지번</th>
				<th>타입</th>
				<th>전세금액</th>
			<tr>
		</table>
	</div>
	<div id="div_houseList_td">
		<table id="table_houseList" class="table">
		<c:if test="${houseList.size() != 0}">
			<c:forEach var="house" items="${houseList}">
				<tr class="info">
					<td>${house.no}</td>
					<td>${house.dong}</td>
					<td class="aptName"><a href="${root}/apt.do?command=search&houseNo=${house.no}">${house.aptName}</a></td>
					<td>${house.code}</td>
					<td>${house.dealAmount}</td>
					<td>${house.buildYear}</td>
					<td>${house.dealYear}</td>
					<td>${house.dealMonth}</td>
					<td>${house.dealDay}</td>
					<td class="area">${house.area}</td>
					<td>${house.floor}</td>
					<td>${house.jibun}</td>
					<td>${house.type}</td>
					<td>${house.rentMoney}</td>
				</tr>
			</c:forEach>
		</c:if>
		</table>
		
	  	<c:if test="${houseList.size() == 0}">
	  		<p>등록된 주택 정보가 없습니다.</p>
	  	</c:if>
	</div>
	
	<div id="div_paging">
		${navigation.navigator}
	</div>


	<hr>
	<footer>
		<p>HappyHouse_Web_Back_End_서울_11반_김광남_최현수</p>
	</footer>
</body>
</html>