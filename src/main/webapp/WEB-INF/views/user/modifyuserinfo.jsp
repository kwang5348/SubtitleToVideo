<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>SSAFY-회원정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#modifybtn").click(function() {
		
		if($("#user_id").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#user_pw").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else {
			$("#memberform").attr("action", "${root}/MainController?act=modify").submit();
		}
	});
	 
	$('#zipcode').focusin(function() {
		$('#zipModal').modal();
	});
});
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div id = "div_menu"></div>
<br>
<br>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
		<form id="memberform" method="post" action="">
		<input type="hidden" name="act" id="act" value="modify">
			<div class="container" align="center">
				<div class="col-lg-8" align="center">
				<strong> ${userinfo.user_id} </strong>님 환영합니다.
			</div>
			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="user_id" name="user_id" value= "${userinfo.user_id}" placeholder="" readonly/>
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="영문포함 6자리 이상">
			</div>

			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="user_name" name="user_name" placeholder="">
			</div>
			
			<div class="form-group" align="left">
				<label for="name">주소</label>
				<input type="text" class="form-control" id="user_address" name="user_address" placeholder="">
			</div>			
			
			<div class="form-group" align="left">
				<label for="name">전화번호</label>
				<input type="text" class="form-control" id="user_phoneNumber" name="user_phoneNumber" placeholder="">
			</div>
			
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="modifybtn">회원정보 수정</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
			
		</form>
	</div>
</div>
<footer>
	<p>HappyHouse_Web_Back_End_서울_11반_김광남_방승환</p>
</footer>
</body>
</html>