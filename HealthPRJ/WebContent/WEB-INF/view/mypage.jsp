<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.util.CmmUtil" %>

<%
mainDTO gDTO = (mainDTO)request.getAttribute("gDTO");
if(gDTO == null) gDTO = new mainDTO();

mainDTO pDTO = (mainDTO)request.getAttribute("pDTO");
if(pDTO == null) pDTO = new mainDTO();

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
<%-- <script>

function delete_check() {
	
    if(confirm("삭제하시겠습니까?")){
    	
       location.href="/user_delete.do?user_no=<%=gDTO.getUser_no()%>";
       
       return true;
       
    }else{
    	
       return false;
    }
  }
  
</script> --%>
<jsp:include page="top.jsp" flush="false"></jsp:include>

<script>

function delete_check() {
    if(confirm("삭제하시겠습니까?")){
       location.href="/user_delete.do?user_no=<%=gDTO.getUser_no()%>";
       return true;
    }else{
       return false;
    }
  }
  
function mylike(){
	location.href="mylike.do";
  }
  
</script>

<body>
	<div style="width:40%; align:center">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w" method="post" action="/user_update.do">
					<div class="login100-form-title p-b-45">
					 마이페이지
					</div>
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Userid is required">
						<!-- <input class="input100" type="text" name="user_id" placeholder="아이디"> -->
						<input class="input100" type="hidden" id="user_id" name="user_id" value="<%=CmmUtil.nvl(gDTO.getUser_no()) %>">
                		<input class="input100" type="text" id="user_id" style="background-color:white;" name="user_id" value="<%= CmmUtil.nvl(gDTO.getUser_id()) %>" readonly />
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "Username is required">
						<input class="input100" type="text" name="user_name" style="background-color:white;" value="<%= CmmUtil.nvl(gDTO.getUser_name()) %>" readonly />
						<span class="focus-input100"></span>
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "email is required">
						<input class="input100" type="email" name="email" style="background-color:white;" value="<%= CmmUtil.nvl(gDTO.getEmail()) %>" />
						<span class="focus-input100"></span>
					</div>
					
					
					<!-- <div class="wrap-input100 validate-input m-b-20" data-validate = "email is required">
						<select class="input100" name="addr" style="background-color:white; width:100%" >
  						<option value="서울특별시">서울특별시</option>
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
					</div> -->
					
					<div class="wrap-input100 validate-input m-b-20" data-validate = "addr is required">
						<input class="input100" type="text" name="addr1" style="background-color:white;" value="<%= CmmUtil.nvl(gDTO.getAddr()) %>" />
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="수정">
					</div>

					
					<!-- <form class="login100-form validate-form flex-sb flex-w" method="post" action="/user_delete.do"> -->
					<div class="container-login100-form-btn">
						<input type="button" class="login100-form-btn" value="탈퇴" onclick="delete_check()">
					</div>
					</form>
					
					<div>
					<button onclick="mylike()">나의좋아요!</button>
					</div>
				
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