<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${cookie.ssafy_id.value ne null}">
	<c:set var="saveid" value="${cookie.ssafy_id.value}"/>
	<c:set var="idck" value=" checked=\"checked\""/>
</c:if>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<head>
<%@ include file="../header.jsp" %>
<div id = "div_menu"></div>
<br>
<br>
<script type="text/javascript">
function moveModify() {
	document.location.href = "${root}/MainController?act=mvmodify&user_id=${userinfo.user_id}";
}
function deleteUser() {
	document.location.href = "${root}/MainController?act=deleteuser&user_id=${userinfo.user_id}";
}
</script>
</head>
<body>
	<div class="container" align="center">
		<div class="col-lg-8" align="center">
		<strong>${userinfo.user_id}</strong>님 환영합니다.
	</div>
	<br><br>
	<div class="col-lg-6" align="center">
	 <table class="table table-striped">
	    <tbody>
   	      <tr>
	        <td>아이디</td>
	        <td align="left">${userinfo.user_id}</td>
	      </tr>
   	      <tr>
	        <td>패스워드</td>
	        <td align="left">${userinfo.user_pw}</td>
	      </tr>
	      <tr>
	        <td>이름</td>
	        <td align="left">${userinfo.user_name}</td>
	      </tr>
	      <tr>
	        <td>주소</td>
	        <td align="left">${userinfo.user_address}</td>
	      </tr>
	      <tr>
	        <td>전화번호</td>
	        <td align="left">${userinfo.user_phoneNumber}</td>

	    </tbody>
	    
	    	
	  </table>
			<div class="form-group" align="center">
				<button type="button" class="btn btn-primary" onclick="javascript:moveModify();">회원정보 수정</button>
				<button type="button" class="btn btn-warning" onclick="javascript:deleteUser();">회원정보 삭제</button>
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
	
