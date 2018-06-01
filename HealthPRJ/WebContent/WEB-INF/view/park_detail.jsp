<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.DTO.parkDTO" %>
<%@ page import="com.health.util.CmmUtil" %>


 <%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>

<%

parkDTO aDTO = (parkDTO)request.getAttribute("aDTO");
if(aDTO == null) aDTO = new parkDTO();

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/resources/cupid/images/favicon.png">

    <title>PkMn</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/cupid/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/cupid/skins/eden.css" rel="stylesheet">
    <link href="/resources/cupid/css/animate.min.css" rel="stylesheet">
    <link href="/resources/cupid/css/icons/icons.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/cupid/style.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="bootstrap/js/html5shiv.js"></script>
    <script src="bootstrap/js/respond.min.js"></script>
    <![endif]-->

</head>

<script>
function freeUp(){
	
	   location.href="park_E.do";
	}
</script>


<script type="text/javascript">

 
  function openLogin()
 {
     window.name = "LoginForm";
     window.open("login.do", "childForm", "width=450, height=600, left=730, top=200, resizable = no, scrollbars = no"); 
   
 }
 
 function openJoin()
 {
     window.name = "JoinForm";
     window.open("register.do", "childForm", "width=450, height=700, left=730, top=120, resizable = no, scrollbars = no"); 
   
 }	 
 
 function openMap()
 {
     window.name = "MapForm";
     window.open("map.do", "childForm", "width=1220, height=730, left=350, top=120, resizable = no, scrollbars = no"); 
   
 }	
 
 function parkIn(){
		
	   location.href="parkList.do";
	}
 
 function freeIn(){
		
	   location.href="freeList.do";
	}

 

 </script>
 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>
 
 <script>
	
	$(function(){

	
 	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=9387cf9977f607739cd8bcf11b24d319";
        $.ajax({
            url: apiURI,
            dataType: "json",
            type: "GET",
            async: "false",
            success: function(resp) {
            	
                 console.log(resp);
                 console.log("도시이름  : "+ resp.name );
                 console.log("현재온도 : "+ (resp.main.temp- 273.15));
                 console.log("날씨 : "+ resp.weather[0].main );
                 
                var tableStr ="<table>";
                tableStr += "<tr><th><b>"+ resp.name +"</b></th></tr>";
                tableStr += "<tr><th>"+ (resp.main.temp- 273.15) +"</th></tr>";
                tableStr += "<tr><th>"+ resp.weather[0].main +"</th></tr>";

                
                    
               tableStr += "</table>";

   			$(".divs").append(tableStr);

                    
    		},
    		
    		error : function(error) {
    			
    			alert("error!");
    			
    		},
        

       
        });


	});

</script>

<body data-spy="scroll" data-target="#topnav">

<div class="navbar navbar-color navbar-fixed-top" id="topnav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon icon-reorder"></span>

            </button>
            <!-- <a class="navbar-brand" href="#">ParkMation</a> -->
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home.do">홈</a></li>
                <% if (SESSION_USER_ID.equals(" ")||SESSION_USER_ID.equals("")) {%>
                <li><a onclick="openLogin()">로그인</a></li>
                <li><a onclick="openJoin()">회원가입</a></li>
                <%} else {%>
                <li><a href="mypage.do"><b><%=SESSION_USER_NAME %>님!</b></a></li>
                <li><a href="/logout_proc.do">로그아웃</a></li>
                 <%if (SESSION_USER_ID.equals("admin")){ %>
                <li><a href="userList.do">회원정보</a></li>
                <%}else{ %>      
               <%} %>
            <%} %>
            </ul>

        </div>
        <!--/.navbar-collapse -->
    </div>
</div>
<br><br><br>
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
					
<!-- 					<div class="wrap-input100 validate-input m-b-20">
						<img name="img" style="background-color:white; height:500px">
					</div> -->
					
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
<footer id="footer">

    <div class="footer-copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <a class="logo" href="/resources/cupid/index.html">
                        <img src="/resources/cupid/images/logo.png" alt="Template Eden">
                    </a>
                </div>
                <div class="col-md-5">
                    <p>&copy; Copyright 2013 by Template Eden. All Rights Reserved.</p>
                </div>
                <div class="col-md-5">
                    <nav id="footer-menu">
                        <ul>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Sitemap</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/resources/cupid/js/jquery.js"></script>
<script src="/resources/cupid/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(function () {
        if($(window).width()>960){
        var tw = $('.triangles').width()/7+32;
        var ta = tw/2+22;
        $('.down-triangle').css('border-top',tw+'px solid rgba(0,0,0,0.8)').css('border-left',ta+'px solid transparent').css('border-right',ta+'px solid transparent');
        $('.up-triangle').css('border-bottom',tw+'px solid rgba(0,0,0,0.8)').css('border-left',ta+'px solid transparent').css('border-right',ta+'px solid transparent');
        }
        $('#wd-wrapper').sinusoid({
            minImgW: 80,
            maxImgW: 130,
            minImgAngle: -20,
            maxImgAngle: 20,
            leftFactor: 60,
            sinusoidFunction: {
                A: 70,
                T: 1700,
                P: 0
            }
        });


        $('a[href*=#]:not([href=#]):not([rel=crs])').click(function() {
            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });

    });
</script>
</body>
</html>
