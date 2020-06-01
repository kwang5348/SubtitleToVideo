<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<title>SSAFY-회원가입</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="${root}/css/main.css?ver1" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("#registerBtn").click(function() {
		var check = 0;
		var str = $("#user_pw").val();
		var len = str.length;
 		if(str.length < 6){
			check = 1;
		}
 		else {
			var num = 0;
			var Char = 0;
			var speChar = 0;

			for(i = 0; i < len; i++){
				var temp = str.charAt(i);
				if(temp >= '0' && temp <= '9'){
					num++;
				} else if ((temp >= 'a' && temp <= 'z') || (temp >= 'A' && temp <= 'Z')){
					Char++;
				} else {
					speChar++;
				}
			}
			if(num < 2){
				check = 2;
			}
			if (Char < 2){
				check = 3;
			} 
			if (speChar < 2){
				check = 4;
			}
		}
		
		if($("#user_id").val() == "") {
			alert("아이디 입력!!!");
			return;
		} else if($("#user_pw").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else if (check == 1) {
			alert("비밀번호를 6자리 이상으로 설정해주세요");
			return;
		} else if (check == 2) {
			alert("숫자를 2개 이상 사용해야 합니다");
			return;
		} else if (check == 3) {
			alert("문자를 2개 이상 사용해야 합니다");
			return;
		} else if (check == 4){
			alert("특수문자를 2개 이상 사용해야합니다")
			return;
		} else {
			
			$("#memberform").attr("action", "${root}/MainController").submit();
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
		<input type="hidden" name="act" id="act" value="join">

			<div class="form-group" align="left">
				<label for="">아이디</label>
				<input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력">
			</div>
			<div class="form-group" align="left">
				<label for="">비밀번호</label>
				<input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="영문포함 6자리 이상">
			</div>

			<div class="form-group" align="left">
				<label for="name">이름</label>
				<input type="text" class="form-control" id="user_name" name="user_name" placeholder="이름 입력">
			</div>
			
			<div class="form-group" align="left">
				<label for="name">주소</label>
				<input type="text" class="form-control" id="user_address" name="user_address" placeholder="주소 입력">
			</div>			
			
			<div class="form-group" align="left">
				<label for="name">전화번호</label>
				<input type="text" class="form-control" id="user_phoneNumber" name="user_phoneNumber" placeholder="전화번호 입력">
			</div>
			
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</div>
			
		</form>
	</div>
</div>
<br>
<br>
<br>
<br>

	<footer>
		<p>HappyHouse_Web_Back_End_서울_11반_김광남_방승환</p>
	</footer>
</body>
</html>