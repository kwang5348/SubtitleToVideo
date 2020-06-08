<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:if test="${userinfo == null}">
	<c:redirect url="/main"/>
</c:if>
<c:if test="${userinfo != null}">
<!DOCTYPE html>

<html lang="ko">
	<head>
		<%@ include file="../header.jsp" %>
		<div id = "div_menu"></div>
		<br>
		<br>
		<title>SSAFY-유저목록</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		function moveModify() {
			document.location.href = "$mvmodify&user_id=${input}";
		}
		function deleteUser() {
			document.location.href = "$deleteuser/${input}";
		}
		</script>
		
	</head>
	<body>	
	<div class="container" align="center">
		<div class="col-lg-8" align="right">
		<a href="logout">로그아웃</a>
		</div>
	  <div class="col-lg-8" align="center">
	  <h2>유저목록</h2> 
	  <form id="searchform" method="get" class="form-inline" action="">
	  <input type="hidden" name="act" id="act" value="list">
	  <table class="table table-borderless">
	  	<tr>
	  		<td align="right">
			  <input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
			  <button type="button" class="btn btn-primary" onclick="javascript:searchUser();">검색</button>
			</td>
	  	</tr>
	  </table>
	  </form>
	  <c:if test="${userlist.size() != 0}">
	  	<c:forEach var="user" items="${userlist}">
		  <table class="table table-striped">
		    <tbody>
      	      <tr>
		        <td>아이디</td>
		        <td align="right">${user.user_id}</td>
			      </tr>
		   	      <tr>
		        <td>패스워드</td>
		        <td align="right">${user.user_pw}</td>
		      <tr>
		        <td>이름</td>
		        <td align="right">${user.user_name}</td>
		      </tr>
		      <tr>
		        <td>주소</td>
		        <td align="right">${user.user_address}</td>
		      </tr>
		      <tr>
		        <td>전화번호</td>
		        <td align="right">${user.user_phoneNumber}</td>
		      </tr>
		      <tr>
			      <td></td>
				  <td align="right">
					<a href="deleteuser/${user.user_id}">회원정보 삭제</a>
				  </td>
			  </tr>
		    </tbody>
		  </table>
			
	  	</c:forEach>
	  </c:if>
	  <c:if test="${userlist.size() == 0}">
	  <table class="table table-active">
	    <tbody>
	      <tr class="table-info" align="center">
	        <td>유저 데이터가 없습니다</td>
	      </tr>
	    </tbody>
	  </table>
	  </c:if>
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
</c:if>