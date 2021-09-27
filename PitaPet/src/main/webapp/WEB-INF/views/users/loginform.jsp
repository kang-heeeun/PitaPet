<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핏어펫(Pit a Pet) - 사지않고 유기동물을 입양하는 문화를 만듭니다</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/user.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div id="loginform">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="user-wrap">
		<div class="login-card user-form" v-if="!registerActive" v-bind:class="{ error: emptyFields }">
			<form id="login-form" action="${pageContext.request.contextPath}/users/login.do" method="post">
				<div>
					<input v-if="${ empty param.url }" type="hidden" name="url" value="${pageContext.request.contextPath}/"/>
					<input v-else type="hidden" name="url" value="${param.url }"/>
				</div>
				<div class="group">
					<div class="idForm">
						<input required class="span-input" v-model="idLogin" type="text" name="id" id="id"/>
						<span class="highlight"></span>
	           			<span class="bar"></span>
						<label for="id"><i class="material-icons input-ikon"></i><span class="span-input">아이디를 입력하세요.</span></label>
					</div>
				</div>
	   			<div class="group">
	   				<div class="pwdForm">
			            <input required type="password" class="span-input" name="pwd" id="pwd" />
			            <span class="highlight"></span>
			            <span class="bar"></span>
			            <label for="pwd"><i class="material-icons input-sifre-ikon"></i><span class="span-input">비밀번호를 입력하세요.</span></label>
	      			</div>
	      		</div>
				<button class="giris-yap-buton" @click="doLogin" type="submit">로그인</button>
			</form>
			<ul class="forgot-and-create">
				<li class="naver">
					<a href="${Nurl}">
						<img :src="cpath + '/resources/images/naver_icon.png'" alt="" />
						<span>네이버 아이디로 로그인</span>
					</a> 
				</li>
				<li class="kakao">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=f925a85d9447bd400ba51c4ff5efdbd7&redirect_uri=http://localhost:8888/spring/users/kakao.do&response_type=code">
					 	<img :src="cpath + '/resources/images/kakao_icon.png'" alt="" />
					 	<span>카카오 아이디로 로그인</span>
					 </a>
				</li>
		 	</ul>
		</div>
	</div>
	<footer-component></footer-component>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script>
let loginform = new Vue({
	el:"#loginform",
	data(){
		return{
			cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}",
			idLogin: "",
		    pwdLogin: "",
		    emptyFields: false
		}
	},
	methods:{
		doLogin() {
	         if (this.emailLogin === "" || this.passwordLogin === "") {
	            this.emptyFields = true;
	         } else {
	            alert("You are now logged in");
	         }
	    }
	}
});


$(document).ready(function(){
	$("#kayit-form").hide();
	$("#sifre-hatirlat-form").hide();	
	
	$(".hesap-olustur-link").click(function(e){
		$("#login-form").slideUp(0);	
		$("#kayit-form").fadeIn(300);	
	});

	$(".zaten-hesap-var-link").click(function(e){
		$("#kayit-form").slideUp(0);
		$("#sifre-hatirlat-form").slideUp(0);	
		$("#login-form").fadeIn(300);	
	});

	$(".sifre-hatirlat-link").click(function(e){
		$("#login-form").slideUp(0);	
		$("#sifre-hatirlat-form").fadeIn(300);	
	});
});
</script>
</body>
</html>