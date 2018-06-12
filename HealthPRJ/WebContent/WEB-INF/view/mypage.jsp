<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import = "com.health.DTO.HoDTO" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
mainDTO gDTO = (mainDTO)request.getAttribute("gDTO");
if(gDTO == null) gDTO = new mainDTO();

mainDTO pDTO = (mainDTO)request.getAttribute("pDTO");
if(pDTO == null) pDTO = new mainDTO();

%>
 <%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>

<%
   List<HoDTO> hList = (List<HoDTO>) request.getAttribute("hList");
if (hList==null){
   hList = new ArrayList();
}

   System.out.println("list: " + hList);

%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/resources/cupid/images/favicon.png">

    <title>마이페이지</title>

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
		
	   location.href="park.do";
	}
 
 function freeIn(){
		
	   location.href="freeList.do";
	}

 

 </script>
 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>
 
<script>

function user_delete(){
	
	   location.href="/user_delete.do";
	}
  
</script>


<style>

div.blueTable {
  background-color: #FFFFFF;
  width: 40%;
  text-align: center;
}
.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
  border-bottom : 1px solid #D1D1D1;
  padding-top: 9px;
  padding-bottom: 9px;
  width:50%;
}
.divTable.blueTable .divTableBody .divTableCell {
  font-size: 15px;
  color: #1c1c1c;
}
.divTable.blueTable .divTableHeading {
  background: #ede6da;
  background: -moz-linear-gradient(top, #7da693 0%, #63947d 66%, #ede6da 100%);
  background: -webkit-linear-gradient(top, #7da693 0%, #63947d 66%, #ede6da 100%);
  background: linear-gradient(to bottom, #7da693 0%, #63947d 66%, #ede6da 100%);
  border-bottom: 1px solid #000000;
}
.divTable.blueTable .divTableHeading .divTableHead {
  font-size: 17px;
  font-weight: bold;
  color: #1c1c1c;
  text-align: center;
  background-color: #ede6da;

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
  background: #ede6da;
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
<script src="/resources/js/jquery-3.3.1.min.js"></script>

<body>

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


<br><br><br><br><br>
<form method="post" action="/user_update.do">
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">정보상세</h2>
</div>
</div>
<br>
<div align="center">
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">NO.</div>
<div class="divTableHead"><%=CmmUtil.nvl(gDTO.getUser_no()) %></div>
</div>
</div>
<div class="divTableBody">
<div class="divTableRow">
<div class="divTableCell">아이디</div>
<div class="divTableCell"><input style="width:100%" type = text value="<%= CmmUtil.nvl(gDTO.getUser_id()) %>" readonly ></div></div>
<div class="divTableRow">
<div class="divTableCell">이름</div>
<div class="divTableCell"><input style="width:100%" type = text value="<%= CmmUtil.nvl(gDTO.getUser_name()) %>" readonly ></div></div>
<div class="divTableRow">
<div class="divTableCell">이메일</div>
<div class="divTableCell"><input style="width:100%" id="email" name="email" type = email value="<%= CmmUtil.nvl(gDTO.getEmail()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">주소</div>
<div class="divTableCell"><select name="addr" style="width:100%">
						<option value="<%= CmmUtil.nvl(gDTO.getAddr()) %>" selected ><%= CmmUtil.nvl(gDTO.getAddr()) %></option>
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
					</select></div></div>
</div>
</div>
</div>

<br>
<div align="center">
<input type="submit" value="수정" style="border:1px; background-color:#ede6da; color:#1c1c1c; width:60px; height:40px; border-radius: 3px;">
<input type="button" value="탈퇴" onclick="user_delete()" style="border:1px; background-color:#ede6da; color:#1c1c1c; width:60px; height:40px; border-radius: 3px;">
</div>
</form>

<br><br>

<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">좋아요!</h2>
</div>
</div>
<br>
<div align="center">
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">공원번호</div>
<div class="divTableHead">공원이름</div>
</div>
</div>
<div class="divTableBody">



<%-- <a href="javascript:doDetail('<%=hDTO.getLicense_no()%>')"></a> --%>


<%for (HoDTO hDTO : hList) {%>

<input type="hidden" value="<%=CmmUtil.nvl(hDTO.getHo_no()) %>" />

<%System.out.println("Ho_no : " + hDTO.getHo_no()); %>

<div class="divTableRow">
<img id="like" src="/resources/img/like.png" style="width:30px; height: 30px">
<div class="divTableCell"><%=CmmUtil.nvl(hDTO.getAdmin_no()) %></div>
<div class="divTableCell"><%=CmmUtil.nvl(hDTO.getPark_name()) %></div></div>
</div>
<%} %>
</div>
</div>


	<div id="dropDownSelect1"></div>
	
	
<footer id="footer" style="position: fixed;bottom: 0; right: 0; width: 100%;">

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