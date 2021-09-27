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
</head>
<body>
<div id="signup_form">
	<header-component :cpath="cpath" :id="id"></header-component>
	<div class="user-wrap">
		<div class="user-form">
			<div class="tab-btn">
		     	<button v-for="(tab, index) in tabs" 
                  :key="index"
                  :class="{active: currentTab == index}"
                  @click="currentTab = index">{{tab}}</button>
			  </div>
		      <div class="tab-content">
		        	<form v-show="currentTab == 0" class="content" action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm">
						<div>
							<label class="control-label" for="id">아이디</label>
							<input class="form-control id" type="text" name="id" id="users_id"/>
							<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
							<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
						</div>
						<div>
							<label class="control-label" for="pwd">비밀번호</label>
							<input class="form-control" type="password" name="pwd" id="users_pwd"/>
							<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
							<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
						</div>
						<div>
							<label class="control-label" for="pwd">비밀번호 확인</label>
							<input class="form-control" type="password" name="pwd2" id="users_pwd2"/>
						</div>
						<div>
							<label for="name">이름</label>
							<input class="form-control" type="text" name="name" id="users_name" />
						</div>
						<div>
							<label class="control-label" for="phoneNumber">연락처</label>		
							<input class="form-control" type="tel" name="phoneNumber" id="users_phoneNumber"/>
						</div>
						<div>
							<label for="birth">생년월일</label>
							<input class="form-control" type="date" name="birth" value="1998-08-20" />
						</div>
						<div>
							<label class="control-label" for="email">이메일</label>
							<input class="form-control email" type="text" name="email" id="users_email"/>
							<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
						</div>
						<div>
							<label class="control-label" for="address">주소</label>
							<input class="form-control" type="text" name="address" id="users_address" />
							<a class="addr-btn btn btn-m btn-black" href="javascript:openAddrPop('${pageContext.request.contextPath}/users/addr.do', 'popup');">주소 검색</a>
						</div>
						<div>
							<label class="control-label" for="household">가구원</label>
							<select class="form-select" name="household" id="household">
								<option value="one">1명</option>
								<option value="two">2명</option>
								<option value="three">3명이상</option>
							</select>
						</div>
						<input type="hidden" name="groupNum" value="0" />
						 <button class="btn btn-m btn-black" type="submit">가입</button>
					</form>
					<form v-show="currentTab == 1" class="content" action="${pageContext.request.contextPath}/users/signup.do" method="post" id="myForm2">
						<div>
							<label class="control-label" for="id">아이디</label>
							<input class="form-control id" type="text" name="id" id="shelter_id"/>
							<small class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
							<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
						</div>
						<div>
							<label class="control-label" for="pwd">비밀번호</label>
							<input class="form-control" type="password" name="pwd" id="shelter_pwd"/>
							<small class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
							<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
						</div>
						<div>
							<label class="control-label" for="pwd">비밀번호 확인</label>
							<input class="form-control" type="password" name="pwd2" id="shelter_pwd2"/>
						</div>
						<div>
							<label class="control-label" for="name">보호소 이름</label>
							<input class="form-control" type="text" name="name" id="shelter_name"/>
						</div>
						<div>
							<label class="control-label" for="serialNum">고유번호</label>
							<input class="form-control" type="text" name="serialNum" id="serialNum"/>
							<small class="form-text text-muted">000-00-00000 형식으로 입력하세요</small>
							<div class="invalid-feedback">고유번호를 확인하세요.</div>
						</div>
						<div>
							<label class="control-label" for="address">보호소 위치</label>
							<input class="form-control" type="text" name="address" id="shelter_address" />
							<a class="addr-btn btn btn-m btn-black" href="javascript:openAddrPop('${pageContext.request.contextPath}/users/addr.do', 'popup');">주소 검색</a>
							<input type="hidden" name="longitude" id="longitude"/> <!-- 위도 / 경도 -->
							<input type="hidden" name="latitude" id="latitude"/> 
						</div>
						<div>
							<label class="control-label" for="phoneNumber">연락처</label>
							<input class="form-control" type="tel" name="phoneNumber" id="shelter_phoneNumber"/>
						</div>
						<div>
							<label class="control-label" for="email">이메일</label>
							<input class="form-control email" type="text" name="email" id="shelter_email"/>
							<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
						</div>
						<input type="hidden" name="groupNum" value="1" />
						<button class="btn btn-m btn-black" type="submit">가입</button>
					</form>
		      </div>
		</div>
	</div>
	<footer-component></footer-component>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.7.2/proj4.js" type="text/javascript"></script>
<script>
	//주소 팝업
	function openAddrPop(url, name){
	    let options = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no, scrollbars=yes';
	    window.open(url, name, options);
	}
	
	function jusoCallBack(roadFullAddr,entX,entY){
			console.log(roadFullAddr,entX,entY);
			 document.querySelector("#users_address").value = roadFullAddr;
			 document.querySelector("#shelter_address").value = roadFullAddr;
			 
			 console.log(entX,entY);
			 
			 let coord_X = Math.round(entX * 1000000) / 1000000;
			 let coord_Y = Math.round(entY * 1000000) / 1000000;
			 let point = [coord_X, coord_Y];

			 proj4.defs["EPSG:5179"] = "+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +units=m +no_defs";//제공되는 좌표

			 let grs80 = proj4.Proj(proj4.defs["EPSG:5179"])
			 let wgs84 = proj4.Proj(proj4.defs["EPSG:4326"]); //경위도

			 let p = proj4.toPoint(point);
			 p = proj4.transform(grs80, wgs84, p);
			   
			 document.querySelector("#longitude").value = p.y;
			 document.querySelector("#latitude").value = p.x;
	}
	
	let isIdValid=false;
	let isUsersPwdValid=false;
	let isShelterPwsValid=false;
	let isEmailValid=false;
	let isSerialValid=false;
	
	let ids=document.querySelectorAll(".id")
	
	for(let i=0; i<ids.length; i++){
		ids[i].addEventListener("input", function(){
			
			this.classList.remove("is-invalid");
			this.classList.remove("is-valid");
			
			let inputId=this.value;
			const reg_id=/^[a-z].{4,9}$/;
			if(!reg_id.test(inputId)){
				isIdValid=false; 
				this.classList.add("is-invalid");
				return; 
			}
			
			const self=this;
			
			//중복확인
			ajaxPromise("${pageContext.request.contextPath}/users/checkid.do","get","inputId="+inputId)
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				
				if(data.isExist){
					isIdValid=false;
					self.classList.add("is-invalid");
				}else{
					isIdValid=true;
					self.classList.add("is-valid");
				}
			});
		});
	}
	
	function checkUsersPwd(){
		document.querySelector("#users_pwd").classList.remove("is-valid");
		document.querySelector("#users_pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#users_pwd").value;
		const pwd2=document.querySelector("#users_pwd2").value;
		const reg_pwd=/^.{5,10}$/;
		if(!reg_pwd.test(pwd)){
			isUsersPwdValid=false;
			document.querySelector("#users_pwd").classList.add("is-invalid");
			return;
		}
		if(pwd!=pwd2){
			isUsersPwdValid=false;
			document.querySelector("#users_pwd").classList.add("is-invalid");
		}else{
			isUsersPwdValid=true;
			document.querySelector("#users_pwd").classList.add("is-valid");
		}
		
		
	}
	
	document.querySelector("#users_pwd").addEventListener("input",checkUsersPwd);
	document.querySelector("#users_pwd2").addEventListener("input",checkUsersPwd);
	
	
	function checkShelterPwd(){
		document.querySelector("#shelter_pwd").classList.remove("is-valid");
		document.querySelector("#shelter_pwd").classList.remove("is-invalid");
		
		const pwd=document.querySelector("#shelter_pwd").value;
		const pwd2=document.querySelector("#shelter_pwd2").value;
		const reg_pwd=/^.{5,10}$/;
		if(!reg_pwd.test(pwd)){
			isShelterPwdValid=false;
			document.querySelector("#shelter_pwd").classList.add("is-invalid");
			return;
		}
		if(pwd!=pwd2){
			isShelterPwdValid=false;
			document.querySelector("#shelter_pwd").classList.add("is-invalid");
		}else{
			isShelterPwdValid=true;
			document.querySelector("#shelter_pwd").classList.add("is-valid");
		}
		
		
	}
	
	document.querySelector("#shelter_pwd").addEventListener("input",checkShelterPwd);
	document.querySelector("#shelter_pwd2").addEventListener("input",checkShelterPwd);
	
	
	let emails=document.querySelectorAll(".email")
	
	for(let i=0; i<emails.length; i++){
		emails[i].addEventListener("input",function(){
			this.classList.remove("is-invalid");
			this.classList.remove("is-valid");
			const inputEmail=this.value;
			const reg_email=/@/;
			if(reg_email.test(inputEmail)){
				isEmailValid=true;
				this.classList.add("is-valid");
			}else{
				isEmailValid=false;
				this.classList.add("is-invalid");
			}
		});
	}
	
	document.querySelector("#serialNum").addEventListener("input",function(){
		this.classList.remove("is-invalid");
		this.classList.remove("is-valid");
		
		let inputNum=this.value;
		const reg_id=/^[0-9]+\-[0-9]+\-[0-9]+$/;
		if(!reg_id.test(inputNum)){
			isSerialValid=false; 
			this.classList.add("is-invalid");
			return; 
		}
		
		const self=this;
		
		//중복확인
		ajaxPromise("${pageContext.request.contextPath}/users/checkSerialNum.do","get","inputNum="+inputNum)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			console.log(data);
			
			if(data.isExist){
				isSerialValid=false;
				self.classList.add("is-invalid");
			}else{
				isSerialValid=true;
				self.classList.add("is-valid");
			}
		});
	});
	
	document.querySelector("#myForm").addEventListener("submit",function(e){
		let isFormValid=isIdValid && isUsersPwdValid && isEmailValid;
		if(!isFormValid){ 
			e.preventDefault();
			alert("폼을 확인해주세요");
		}
		
	});
	
	document.querySelector("#myForm2").addEventListener("submit",function(e){
		let isFormValid=isIdValid && isShelterPwdValid && isEmailValid && isSerialValid;
		if(!isFormValid){ 
			e.preventDefault();
			alert("폼을 확인해주세요");
		}
		
	});
	
	new Vue({
	      el: "#signup_form",
	      data() {
	    	  return{
	    		currentTab:0,
    		    tabs:["일반회원", "보호소"],
    		 	cpath: "${pageContext.request.contextPath}",
    		 	id: "${sessionScope.id}",
	    	  }
	      }
	   });
</script>
</body>
</html> 