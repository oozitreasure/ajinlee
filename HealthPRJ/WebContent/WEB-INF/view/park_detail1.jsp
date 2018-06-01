<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.health.DTO.parkDTO" %>
<%@ page import="com.health.util.CmmUtil" %>

<%

parkDTO aDTO = (parkDTO)request.getAttribute("aDTO");
if(aDTO == null) aDTO = new parkDTO();

%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>park_detail</title>
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
<script>
function freeUp(){
	
	   location.href="park_E.do";
	}
</script>

<jsp:include page="top.jsp" flush="false"></jsp:include>
<body>

	<div style="width:60%; align:center">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w" method="post" action="/park_E.do">
					<div class="login100-form-title p-b-45">
					 
					</div>
					<button>좋아요!</button>
					<input class="input100" type="hidden" id="admin_no" name="admin_no" value="<%=CmmUtil.nvl(aDTO.getAdmin_no()) %>">
					<span>공원명 : </span> 
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="park_name" id="park_name" style="background-color:white;" value="<%= CmmUtil.nvl(aDTO.getPark_name()) %>" readonly />
					</div>
					
					
					<div class="wrap-input100 validate-input m-b-20">
						<img name="img" style="background-color:white; height:500px">
					</div>
					
					<span>공원구분 : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="park_div" id="park_div" style="background-color:white;" value="<%= CmmUtil.nvl(aDTO.getPark_div()) %>" readonly />

					</div>
					
					<span>주소 : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="addr1" id="addr1" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getAddr1()) %>" readonly />

					</div>
					<span>공원보유시설(운동시설) : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text"name="park_est1" id="park_est1" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getPark_est1()) %>" readonly />

					</div>
					<span>공원보유시설(유희시설) : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="park_est2" id="park_est2" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getPark_est2()) %>" readonly />

					</div>
					<span>공원보유시설(편익시설) : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="park_est3" id="park_est3" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getPark_est3()) %>" readonly />

					</div>
					<span>공원보유시설(교양시설) : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="park_est4" id="park_est4" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getPark_est4()) %>" readonly />

					</div>
					<span>공원보유시설(기타시설) : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="park_est5" id="park_est5" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getPark_est5()) %>" readonly />

					</div>
					<span>관리기관명 : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="admin_name" id="admin_name" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getAdmin_name()) %>" readonly />

					</div>
					<span>관리기관 전화번호 : </span>
					<div class="wrap-input100 validate-input m-b-20">
						<input type="text" name="number" id="number" style="background-color:white; width:100%" value="<%= CmmUtil.nvl(aDTO.getNumber()) %>" readonly />

					</div>
					
					<div id="map" style="width:1000px;height:450px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17b5ba3030d9adc17aaca19e920d2631"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

					mapOption = { 
    				center: new daum.maps.LatLng(37.615353, 126.97464), // 지도의 중심좌표
    				level: 3 // 지도의 확대 레벨
					};

					//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption); 

					
					var markerPosition  = new daum.maps.LatLng(37.615353, 126.97464); 

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					</script>
													
				 	<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" value="수정">
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