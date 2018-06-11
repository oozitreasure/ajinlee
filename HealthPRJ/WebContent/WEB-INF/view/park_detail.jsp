<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.DTO.parkDTO" %>
<%@ page import="com.health.DTO.HoDTO" %>
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


<%
HoDTO hDTO = (HoDTO)request.getAttribute("hDTO");

if (hDTO == null) {
	hDTO = new HoDTO();

}

%>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/resources/cupid/images/favicon.png">

    <title>공원정보상세</title>

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
 
 function parkinsert(){
		
	   location.href="park_insert.do";
	}
 
 function parkE(){
	 
		var no = '<%=aDTO.getAdmin_no()%>';
	   location.href="park_E.do?admin_no="+no;
	   
	}


 </script>
 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>
 

<style>

div.blueTable {
  background-color: #FFFFFF;
  width: 60%;
  text-align: center;
}
.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
  border-bottom : 1px solid #D1D1D1;
  padding-top: 9px;
  padding-bottom: 9px;
  border : 1px solid #D1D1D1;
  width:50%;

}
.divTable.blueTable .divTableBody .divTableCell {
  font-size: 15px;
  color: #1c1c1c;
}
.divTable.blueTable .divTableHeading {
  background: #e8efe8;
  background: -moz-linear-gradient(top, #7da693 0%, #63947d 66%, #e8efe8 100%);
  background: -webkit-linear-gradient(top, #7da693 0%, #63947d 66%, #e8efe8 100%);
  background: linear-gradient(to bottom, #7da693 0%, #63947d 66%, #e8efe8 100%);
  border-bottom: 1px solid #000000;
}
.divTable.blueTable .divTableHeading .divTableHead {
  font-size: 17px;
  font-weight: bold;
  color: #1c1c1c;
  text-align: center;
  background-color: #e8efe8;

}
.divTable.blueTable .divTableHeading .divTableHead:first-child {
  border-left: none;
  border-top : 1px solid #d1dee2;
  boerder-button :1px solid #d1dee2;
}

.blueTable .tableFootStyle {
  font-size: 15px;
  font-weight: normal;
  color: #FFFFFF;
/*   background: #FFFFFF;
  background: -moz-linear-gradient(top, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
  background: -webkit-linear-gradient(top, #ffffff 0%, #ffffff 66%, #FFFFFF 100%);
  background: linear-gradient(to bottom, #ffffff 0%, #ffffff 66%, #FFFFFF 100%); */
  border-top: 1px solid #FFFFFF;

}
.blueTable .tableFootStyle {
  font-size: 15px;
}
.blueTable .tableFootStyle .links {
	 text-align: center;

}
.blueTable .tableFootStyle .links a{
  display: inline-block;
  background: #e8efe8;
  color: #1c1c1c;
  padding: 2px 8px;
  border-radius: 3px;
  
}
.blueTable.outerTableFooter {
  border-top: none;
}
.blueTable.outerTableFooter .tableFootStyle {
  padding: 3px 5px; 
}
/* DivTable.com */
.divTable{ display: table; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}
.divTableCell, .divTableHead { display: table-cell;}
.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}
</style> 



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
            <% if (!SESSION_USER_ID.equals("")&&!SESSION_USER_ID.equals(" ")) {%>
            <li><a href="parkList.do">공원정보</a></li>
            <li><a href="freeList.do">자유게시판</a></li>
              <%} %>
            </ul>

        </div>
        <!--/.navbar-collapse -->
    </div>
</div>


<form method="post" action="/parkDelete.do">
<br><br><br><br><br>
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">공원상세정보</h2>
<br>
</div>

<br><br>
<img style="width:50%; height:600px; align:center;" src="/resources/img/park.GIF">
<br><br>
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">NO.</div>
<div class="divTableHead"><%= CmmUtil.nvl(aDTO.getAdmin_no()) %></div>
<input type="hidden" name="admin_no" value="<%= CmmUtil.nvl(aDTO.getAdmin_no()) %>">
</div>
</div>
<div class="divTableBody">
<div class="divTableRow">
<div class="divTableCell">공원명</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getPark_name()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">공원구분</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getPark_div()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">주소</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getAddr1()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(운동시설)</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getPark_est1()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(유희시설)</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getPark_est2()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(편익시설)</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getPark_est3()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(교양시설)</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getPark_est4()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(기타시설)</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getPark_est5()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">관리기관명</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getAdmin_name()) %></div></div>
<div class="divTableRow">
<div class="divTableCell">전화번호</div>
<div class="divTableCell"><%= CmmUtil.nvl(aDTO.getNumber()) %></div></div>

</div>
</div>
<br>
	
					<div id="map" style="width:60%;height:500px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17b5ba3030d9adc17aaca19e920d2631"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

					mapOption = { 
    				center: new daum.maps.LatLng(<%= CmmUtil.nvl(aDTO.getLat()) %>, <%= CmmUtil.nvl(aDTO.getHar()) %>), // 지도의 중심좌표
    				level: 3 // 지도의 확대 레벨
					};

					//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption); 

					
					var markerPosition  = new daum.maps.LatLng(<%= CmmUtil.nvl(aDTO.getLat()) %>, <%= CmmUtil.nvl(aDTO.getHar()) %>); 

					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
					
					var iwContent = '<div style="padding:5px;"><<%= CmmUtil.nvl(aDTO.getPark_name()) %>><br><a href="http://map.daum.net/link/map/<%= CmmUtil.nvl(aDTO.getPark_name()) %>,<%= CmmUtil.nvl(aDTO.getLat()) %>, <%= CmmUtil.nvl(aDTO.getHar()) %>" style="color:green" target="_blank">큰지도보기</a> <a href="http://map.daum.net/link/to/<%= CmmUtil.nvl(aDTO.getPark_name()) %>,<%= CmmUtil.nvl(aDTO.getLat()) %>, <%= CmmUtil.nvl(aDTO.getHar()) %>" style="color:orange" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new daum.maps.LatLng(<%= CmmUtil.nvl(aDTO.getLat()) %>, <%= CmmUtil.nvl(aDTO.getHar()) %>); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new daum.maps.InfoWindow({
				    position : iwPosition, 
				    content : iwContent 
					});
				  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
					
					</script>
					<br>
					
	<div align="right" style="width:60%;">
	<button style="background-color:white; border:0px;">좋아요<img style="width:40px; height:40px;" src="/resources/img/like.png"></button>
	</div>
	<input type="button" value="수정" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" onclick="parkE()">
	<input type="submit" value="삭제" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;">
</div>
</form>


				<%if(hDTO.getHo_no() == null) {%>
              		 	<img id="like" name="like"  onclick="javascript:Hinsert();return false;" src="/resources/img/like.png" style="width: 30px; height: 30px">
              		 	<img id="unlike" name="unlike" onclick="javascript:Hdelete('<%=CmmUtil.nvl(aDTO.getAdmin_no()) %>');return false;" src="/image/star.png" style="display:none;width:30px; height: 30px">
              		 	<%}else{%>
              		 	<img id="like" name="like"  onclick="javascript:Hinsert();return false;" src="/image/star-sign.png" style="display:none; width: 30px; height: 30px">
              		 	<img id="unlike" name="unlike" onclick="javascript:Hdelete('<%=CmmUtil.nvl(aDTO.getAdmin_no()) %>');return false;" src="/image/star.png" style="width:30px; height: 30px">
            		<%} %>



<br>


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
