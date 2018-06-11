<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.parkDTO" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>


<%
   List<parkDTO> pList = (List<parkDTO>)request.getAttribute("pList");
   if(pList == null){
      pList = new ArrayList();
   }
   
%>

 <%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/resources/cupid/images/favicon.png">

    <title>공원정보리스트</title>

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
 
 <script>
function doDetail(n){
    var admin_no = n;
    location.href="/park_detail.do?admin_no="+admin_no;
 }
 
 
function parkIn(){

    location.href="/park_insert.do"
 }
</script>


<script>

function doSearch() {
 	
 	var contents = "";
 	var cnt = 10;
 	var search = $('#searchbox').val();
 	
 	if (search == "") {
 		location.href="/parkSearch.do";
 		
 	} else {
 		
 		$.ajax({
 			
 			url : "/parkSearch.do",
 			method : "get",
 			data : {'search' : search},
 			datatype : "json", 
 			success : function(data) {
 				
 					var contents = "";
 					var content = "";
 					
					contents += "<div class='divTable blueTable' style='width:100%'>";
					contents += "<div class='divTableHeading'>";
					contents += "<div class='divTableRow'>";
					contents += "<div class='divTableHead'>공원명</div>";
					contents += "<div class='divTableHead'>공원주소</div>";
					contents += "<div class='divTableHead'>관리기관명</div>";
					contents += "<div class='divTableHead'>전화번호</div></div></div>";

					contents += "<div class='divTableBody'>";
				$.each(data, function (key, value) {
					content += "<div class='divTableRow'>";
		 			content += "<div class='divTableCell' onclick='doDetail("+value.admin_no+");'>"+value.park_name+"</div>";
		 			content += "<div class='divTableCell'>"+value.addr1+"</div>";
		 			content += "<div class='divTableCell'>"+value.admin_name+"</div>";
		 			content += "<div class='divTableCell'>"+value.number+"</div></div>";

 				});
				content += "</div></div>";
				
				if(content == ""){
					
					content += '<div>"'+search+'" 에 해당하는 검색결과가 없습니다.</div>';
					
		 			$('#divTable').html(content);
		 			$('#delete').remove();
		 			
				}else{
					
 				$('#divTable').html(contents+content);
 				
				}
				
 				if ((data).length<10) {
 					$('#addview').remove();
 				}
 			}
 			
 		});
 		
 	}
 	
}

</script>


    <script>
      var str = 'http://localhost:8080/map.do#대호지';
      document.write(str);
      var stq = str.substring( 29 , 33);
      document.write(stq);
      
    		  
    </script>
    
    


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
 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>




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
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">공원정보</h2>
<h5 align="center">찾고싶은 공원을 검색 해보세요.</h5>
</div>
</div>
<br>
<div align="center">
<div>
<input type="text" onchange="doSearch()" id="searchbox" style="width:25%; height:50px;" placeholder="공원이름 or 주소"/>
<input type="submit" value="검색" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:70px; height:50px; border-radius: 3px;">
</div>
<br>
<div class="divTable blueTable" id="divTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">공원명</div>
<div class="divTableHead">도로명주소</div>
<div class="divTableHead">관리기관명</div>
<div class="divTableHead">전화번호</div>
</div>
</div>
<div class="divTableBody">
<%for (parkDTO pDTO : pList) { %>
<div class="divTableRow">
<div class="divTableCell" onclick="doDetail('<%=pDTO.getAdmin_no()%>');"><%=pDTO.getPark_name()%></div>
<%System.out.println("공원번호 : " + pDTO.getAdmin_no()); %>
<div class="divTableCell"><%=pDTO.getAddr1() %></div>
<div class="divTableCell"><%=pDTO.getAdmin_name() %></div>
<div class="divTableCell"><%=pDTO.getNumber() %></div>
</div>
<%} %>
</div>
</div>

<div class="blueTable outerTableFooter">
<div class="tableFootStyle">
<div align="right">
<input type="button" value="글쓰기" onclick="parkIn()" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" />
</div>
<div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a>
</div>
</div>
</div>
</div>
<br>


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
