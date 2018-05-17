<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Join</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/img/tree.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/register/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/register/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/register/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/register/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/register/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/register/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/register/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/register/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/register/css/util.css">
	<link rel="stylesheet" type="text/css" href="/resources/register/css/main.css">
<!--===============================================================================================-->
</head>

<jsp:include page="top.jsp" flush="false"></jsp:include>
<style>
.container-login100-form-btn{
display: inline-block;
}
</style>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w"
					method="post" action="/join.do">
					<div class="login100-form-title p-b-45">
					 회원가입
					</div>
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Userid is required">
						<input class="input100" type="text" name="user_id" placeholder="아이디">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
						<input class="input100" type="text" name="user_name" placeholder="이름">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="password" placeholder="비밀번호">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "repeatPassword is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" name="repassword" placeholder="비밀번호확인">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "email is required">
						<input class="input100" type="email" name="email" placeholder="이메일">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-45" data-validate = "addr is required">
						<select class="input100" name="addr" name="지역">
  						<option value="seoul" selected="selected">서울특별시</option>
 						<option value="gygg">경기도</option>
  						<option value="incheon">인천광역시</option>
  						<option value="gangwon">강원도</option>
  						<option value="chungbuk">충청북도</option>
  						<option value="chungnam">충청남도</option>
  						<option value="daejeon">대전광역시</option>
  						<option value="sejong">세종특별자치시</option>
  						<option value="gwangju">광주광역시</option>
  						<option value="jeonbuk">전라북도</option>
  						<option value="jeonnam">전라남도</option>
  						<option value="gyeongbuk">경상북도</option>
  						<option value="gyeongnam">경상남도</option>
  						<option value="daegu">대구광역시</option>
  						<option value="busan">부산광역시</option>
  						<option value="ulsan">울산광역시</option>
  						<option value="jeju">제주특별자치도</option>
					</select>
						
						<span class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="회원가입">
					</div>
						
						
					<div class="container-login100-form-btn">
						<input type="reset" class="login100-form-btn" value="초기화">
					</div>
					

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/resources/register/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/register/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/register/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/register/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/register/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/register/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/register/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/register/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/resources/register/js/main.js"></script>

</body>

<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>