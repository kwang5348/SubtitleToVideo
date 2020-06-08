<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="div_search">
	<form id="searchform" method="get" class="form-inline" action="./search">
		<select class="form-control" name="key" id="key">
		    <option value="all" selected="selected">모두보기</option>
		    <option value="dong">동 이름</option>
		    <option value="AptName">아파트 이름</option>
	 	</select>
	
		<input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word" value="${result}">
		<input type="submit" value="검색">
	</form>
	</div>

</body>
</html>