<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
</head>
<body>
<div id="info">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="user-wrap">
		<div class="user-form" v-if="${dto.groupNum eq 0}">
		 	<svg v-if="${empty dto.profile}" id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="profile bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
 			<img v-else id="profileImage" src="${pageContext.request.contextPath}${dto.profile}" alt="" />
		 	<table>
		 		<tbody>
		 			<tr>
		 				<th>닉네임</th>
		 				<td>${id }</td>
		 			</tr>
		 			<tr>
		 				<th>비밀번호</th>
		 				<td><a id="btn-pwd-left" :href="pwd_updateform">수정하기</a></td>
		 			</tr>
		 			<tr>
		 				<th>회원</th>
		 				<td>일반 회원</td>
		 			</tr>
		 			<tr>
		 				<th>이름</th>
		 				<td>${dto.name }</td>
		 			</tr>
		 			<tr>
		 				<th>폰번호</th>
		 				<td>${dto.phoneNumber }</td>
		 			</tr>
		 			<tr>
		 				<th>주소</th>
		 				<td>${dto.address }</td>
		 			</tr>
		 			<tr>
		 				<th>가구수</th>
		 				<td>${dto.household }</td>
		 			</tr>
		 			<tr>
		 				<th>이메일</th>
		 				<td>${dto.email }</td>
		 			</tr>
		 			<tr>
		 				<th>가입일</th>
		 				<td>${dto.regdate }</td>
		 			</tr>
		 		</tbody>
		 	</table>
 			<a :href="updateform" class="btn btn-s btn-black">개인 정보 수정</a>
   			<a href="javascript:deleteConfirm()" class="btn btn-s btn-black">탈퇴</a>
		</div>
		<div v-else class="user-form">
		 	<svg v-if="${empty dto.profile}" id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="profile bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
 			<img v-else id="profileImage" src="${pageContext.request.contextPath}${dto.profile}" alt="" />
		 	<table>
		 		<tbody>
		 			<tr>
		 				<th>닉네임</th>
		 				<td>${id }</td>
		 			</tr>
		 			<tr>
		 				<th>비밀번호</th>
		 				<td><a :href="pwd_updateform">수정하기</a></td>
		 			</tr>
		 			<tr>
		 				<th>회원</th>
		 				<td>보호소 회원</td>
		 			</tr>
		 			<tr>
		 				<th>고유번호</th>
		 				<td>${sDto.serialNum}</td>
		 			</tr>
		 			<tr>
		 				<th>보호소 이름</th>
		 				<td>${sDto.name }</td>
		 			</tr>
		 			<tr>
		 				<th>폰번호</th>
		 				<td>${sDto.phoneNumber }</td>
		 			</tr>
		 			<tr>
		 				<th>주소</th>
		 				<td>${sDto.address }</td>
		 			</tr>
		 			<tr>
		 				<th>이메일</th>
		 				<td>${dto.email }</td>
		 			</tr>
		 			<tr>
		 				<th>가입일</th>
		 				<td>${dto.regdate }</td>
		 			</tr>
		 		</tbody>
		 	</table>
 			<a :href="updateform" class="btn btn-s btn-black">개인 정보 수정</a>
   			<a href="javascript:deleteConfirm()" class="btn btn-s btn-black">탈퇴</a>
		</div>
	</div>
	<footer-component></footer-component>
</div>	
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>
	//탈퇴확인
	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}
	
	let info =new Vue({
		el:"#info",
		data(){
			return{
				cpath: "${pageContext.request.contextPath}",
    		 	id: "${sessionScope.id}",
				updateform:"${pageContext.request.contextPath}/users/updateform.do",
				pwd_updateform:"${pageContext.request.contextPath}/users/pwd_updateform.do"
			}
		}
	});
	
</script>
</body>
</html>




