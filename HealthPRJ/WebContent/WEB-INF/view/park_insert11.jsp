<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>park_insert</title>
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
				<form class="login100-form validate-form flex-sb flex-w" method="post" action="/park_insert_proc.do">
					<div class="login100-form-title p-b-45">
					 
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "공원이름을 입력해주세요.">
						<input class="input100" type="text" name="park_name" id="park_name" style="background-color:white; width:1000px" placeholder="공원이름">
						<span class="focus-input100"></span>
					</div>
					
					
<!-- 					<div class="wrap-input100 validate-input m-b-20" data-validate = "이미지 입력해주세요.">
						<textarea class="input100" name="img" style="background-color:white; width:1000px; height:500px" placeholder="이미지"></textarea>
						<span class="focus-input100"></span>
					</div> -->
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "공원구분을 입력해주세요.">
						<input class="input100" type="text" name="park_div" id="park_div" style="background-color:white; width:1000px" placeholder="공원구분을 입력해주세요.">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "주소를 입력해주세요.">
						<input class="input100" type="text" name="addr1" id="addr1" style="background-color:white; width:1000px" placeholder="주소를 입력해주세요.">
						<span class="focus-input100"></span>
					</div>
										<div class="wrap-input100 validate-input m-b-20" data-validate = "공원보유시설운동시설">
						<input class="input100" type="text" name="park_est1" id="park_est1" style="background-color:white; width:1000px" placeholder="공원보유시설운동시설">
						<span class="focus-input100"></span>
					</div>
										<div class="wrap-input100 validate-input m-b-20" data-validate = "공원보유시설운동시설">
						<input class="input100" type="text" name="park_est2" id="park_est2" style="background-color:white; width:1000px" placeholder="공원보유시설운동시설">
						<span class="focus-input100"></span>
					</div>
										<div class="wrap-input100 validate-input m-b-20" data-validate = "공원보유시설편익시설">
						<input class="input100" type="text" name="park_est3" id="park_est3" style="background-color:white; width:1000px" placeholder="공원보유시설편익시설">
						<span class="focus-input100"></span>
					</div>
										<div class="wrap-input100 validate-input m-b-20" data-validate = "공원보유시설교양시설">
						<input class="input100" type="text" name="park_est4" id="park_est4" style="background-color:white; width:1000px" placeholder="공원보유시설교양시설">
						<span class="focus-input100"></span>
					</div>
										<div class="wrap-input100 validate-input m-b-20" data-validate = "공원보유시설기타시설">
						<input class="input100" type="text" name="park_est5" id="park_est5" style="background-color:white; width:1000px" placeholder="공원보유시설기타시설">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-20" data-validate = "관리기관명">
						<input class="input100" type="text" name="admin_name" id="admin_name" style="background-color:white; width:1000px" placeholder="관리기관명">
						<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "전화번호">
						<input class="input100" type="text" name="number" id="number" style="background-color:white; width:1000px" placeholder="전화번호">
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="등록" >
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