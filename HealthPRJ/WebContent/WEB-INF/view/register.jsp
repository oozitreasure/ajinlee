<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>회원가입</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/img/tree.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/login/css/main.css">
<!--===============================================================================================-->
</head>



<script>
   
var idCheck = false;

function checkId() {

    
    if (idCheck == true){
       alert("이미 중복체크가 되었습니다.");
       return false;
    }
    
    
    var user_id = $('#user_id').val();
     
    $.ajax({
       url : '/user_info/idCheck.do',
       method : 'post',
       data : {
          'user_id' : user_id
       },
       success : function(data) {
          if ($.trim(data) != 0) {
             alert("이미 존재하는 아이디 입니다.");
             $('#user_id').focus();
             idCheck = false;
          } else if (!$('#user_id').val()) {
             alert("아이디를 입력 해주세요.");
             $('#user_id').focus();
             idCheck = false;
          } else {
             alert("가능한 아이디 입니다.");
             idCheck = true;
          }
       }
    })
}


function doSubmit(f) { //전송시 유효성 체크
    
    if (idCheck == false) {
       alert("아이디 중복체크를 해주시기 바랍니다.");
       f.user_id.focus();
       return false;
    }


     if (f.password.value != f.passwordcheck.value) {

        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        f.password.focus();
        return false;

     }

  }
  
  




 </script>
 
 
 <script>

 function eng(event) { //한글no

     event = event || window.event;

     var keyID = (event.which) ? event.which : event.keyCode;

     //48~57: 숫자키 / 96~105: 숫자 키패드
     if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
           || (keyID == 8) || (keyID == 46) || (keyID == 110) || (keyID == 190) //8->backspace, 46->delete, 110,190->.
           || (keyID >= 65 && keyID <= 90) && //65~90 영소문자, 
           (keyID != 16) && (keyID != 20) && (keyID != 21)) { //16->shift, 20->capslock, 21->한/영
           
        return true;
     } else {
        return false;
     }

  }

function ko(event) {
  event = event || window.event;
  
  var keyID = (event.which) ? event.which : event.keyCode;
  
  if((keyID >= 65 && keyID <= 90) && //65~90 영소문자, 
           (keyID != 16) && (keyID != 20) && (keyID != 21)) {
     return false;
  }else {
     return true;
  }
}
</script>
 
 
 





<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form class="login100-form validate-form flex-sb flex-w"
				method="post" action="/join.do">
					<span class="login100-form-title p-b-51">
						회원가입
					</span>
										
					<div class="wrap-input100 validate-input m-b-16" data-validate = "아이디을 입력해주세요">
						<input class="input100" type="text" id = "user_id" name="user_id" placeholder="아이디" onKeyUp="return eng(event);">
						<span class="focus-input100"></span>
						
						<input class="login100-form-btn" type="button" id="idCheck" onclick="checkId();" value="아이디중복체크" />
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "이름을 입력해주세요">
						<input class="input100" type="text" name="user_name" placeholder="이름" onKeyDown="ko(event);">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "비밀번호를 입력해주세요">
						<input class="input100" type="password" name="password" placeholder="비밀번호">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "이메일을 입력해주세요" onKeyDown="return eng(event);">
						<input class="input100" type="email" name="email" placeholder="이메일">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" data-validate = "주소를 선택해주세요">
						<select class="input100" name="addr">
  						<option value="서울특별시" selected="selected">서울특별시</option>
 						<option value="경기도">경기도</option>
  						<option value="인천광역시">인천광역시</option>
  						<option value="강원도">강원도</option>
  						<option value="충청북도">충청북도</option>
  						<option value="충청남도">충청남도</option>
  						<option value="대전광역시">대전광역시</option>
  						<option value="세종특별자차시">세종특별자치시</option>
  						<option value="광주광역시">광주광역시</option>
  						<option value="전라북도">전라북도</option>
  						<option value="전라남도">전라남도</option>
  						<option value="경상북도">경상북도</option>
  						<option value="경상남도">경상남도</option>
  						<option value="대구광역시">대구광역시</option>
  						<option value="부산광역시">부산광역시</option>
  						<option value="울산광역시">울산광역시</option>
  						<option value="제주특별자치도">제주특별자치도</option>
					</select>
						<span class="focus-input100"></span>
					</div>
					
					
<!-- 					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<a href="IDs.do" class="txt1">
								아이디찾기
							</a>
						</div>

						<div>
							<a href="PWDs.do" class="txt1">
								비밀번호 찾기
							</a>
						</div>
						
					</div> -->

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" style="width:190px;" id="sendMessageButton">회원가입</button>&nbsp;
						<button type="reset" class="login100-form-btn" style="width:190px;">초기화</button>
					</div>
						

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/resources/login/js/main.js"></script>

</body>
</html>
