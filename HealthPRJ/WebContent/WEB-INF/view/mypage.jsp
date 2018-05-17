<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.util.CmmUtil" %>

<%
mainDTO gDTO = (mainDTO)request.getAttribute("gDTO");
if(gDTO == null) gDTO = new mainDTO();
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>마이페이지</title>
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
				<form class="login100-form validate-form flex-sb flex-w" method="post" action="/user_detail.do">
					<div class="login100-form-title p-b-45">
					 마이페이지
					</div>
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Userid is required">
						<!-- <input class="input100" type="text" name="user_id" placeholder="아이디"> -->
						<input class="input100" type="hidden" id="user_no" name="user_no" value="<%=CmmUtil.nvl(gDTO.getUser_no()) %>">
                		<input class="input100" type="text" id="user_id" name="user_id" value="<%= CmmUtil.nvl(gDTO.getUser_id()) %>" readonly disabled />
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
						<input class="input100" type="text" name="user_name" value="<%= CmmUtil.nvl(gDTO.getUser_name()) %>" readonly disabled />
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
						<input class="input100" type="email" name="email" value="<%= CmmUtil.nvl(gDTO.getEmail()) %>" />
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-45" data-validate = "addr is required">
						<input class="input100" type="text" name="addr" value="<%= CmmUtil.nvl(gDTO.getAddr()) %>" />
						<span class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="수정">
					</div>
						
						
					<div class="container-login100-form-btn">
						<input type="reset" class="login100-form-btn" value="탈퇴">
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