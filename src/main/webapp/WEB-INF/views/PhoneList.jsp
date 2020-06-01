<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
	<c:if test="${userid != null && userid != ''}">
		${userid}님 반갑습니다.
	</c:if>
	<h1>관리 - 리스트</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>가격</th>
				<th>제조사</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${hpList}" var="dto" varStatus="status">
				<tr>
					<td><a href="./detail?num=${dto.num}">${dto.num}</a></td>
					<td>${dto.model}</td>
					<td>${dto.price}</td>
					<td>${dto.vendor}</td>
					<td><input type="checkbox" name="delChk" value="${dto.num}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br><br>
	<form action="./deleteArr" method="post" id="hid_form" name="hid_form">
		<input type="hidden" id="hid_chk" name="hid_chk">
	</form>
	<a href="./mvRegist">추가 등록</a>
	<a href="javascript:delCheck();">선택 항목 삭제</a>
	<script type="text/javascript">
	function delCheck(){
		let checkBoxes = document.getElementsByName("delChk");
		let chkArr = [];
		for(let i=0; i<checkBoxes.length; i++){
			if (checkBoxes[i].checked){
				chkArr.push(checkBoxes[i].value);
			}
		}//for
		hid_form.hid_chk.value = chkArr;
		hid_form.submit();
	}
	</script>
</body>
</html>
