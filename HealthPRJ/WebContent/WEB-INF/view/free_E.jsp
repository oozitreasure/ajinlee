<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.health.DTO.freeDTO" %>
<%@ page import="com.health.util.CmmUtil" %>

<%
freeDTO rDTO = (freeDTO)request.getAttribute("rDTO");
if(rDTO == null) rDTO = new freeDTO();

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>디테일</title>
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
<style>
.container-login100-form-btn{
display: inline-block;
}
</style>
<jsp:include page="top.jsp" flush="false"></jsp:include>
<style>
.container-login100-form-btn{
display: inline;
}
.container-login100-form-btn{
display: inline;
}
</style>
<script>

<%-- function delete_check() {
    if(confirm("삭제하시겠습니까?")){
       location.href="/free_delete.do?fr_no=<%=rDTO.getFr_no()%>";
       return true;
    }else{
       return false;
    }
  } --%>
  
</script>

<body>
	<div style="width:60%;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w" method="post" action="/free_delete_proc.do">
				
					<input class="input100" type="hidden" id="user_no" name="fr_no" value="<%=CmmUtil.nvl(rDTO.getFr_no()) %>">
					<div class="wrap-input100 validate-input m-b-20">
                		<input class="input100" type="text" id="title" name="title" style="background-color:white;" value="<%=CmmUtil.nvl(rDTO.getTitle()) %>" />
					<span class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-20">
					<br>
						<textarea class="input100" name="cont" id="cont" style="background-color:white; height:500px"><%= CmmUtil.nvl(rDTO.getContent()) %></textarea>
					<span class="focus-input100"></span>
					</div>
					
 					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="수정" >
					</div>

					<div class="container-login100-form-btn">
						<input type="reset" class="login100-form-btn" value="삭제">
					</div>
					
					</form>
					

			</div>
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