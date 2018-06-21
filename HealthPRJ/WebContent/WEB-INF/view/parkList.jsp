
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

    <title>ParkMation</title>

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
	
var sta = window.location.href;
console.log(sta);

var stb = sta.substring( 35, 62);
console.log(stb);

if(stb == "%EB%8F%99%EB%91%90%EC%B2%9C"){
	
	var search = "동두천시";

}else if(stb == "%ED%8C%8C%EC%A3%BC%EC%8B%9C"){
	
	var search = "파주시";
	
}else if(stb == "%EC%97%B0%EC%B2%9C%EA%B5%B0"){
	
	var search = "연천군";
	
}else if(stb == "%EC%96%91%EC%A3%BC%EC%8B%9C"){
	
	var search="양주시";
	
}else if(stb == "%EA%B3%A0%EC%96%91%EC%8B%9C"){
	
	var search="고양시";
	
}else if(stb == "%ED%8F%89%ED%83%9D%EC%8B%9C"){
	
	var search="평택시";
	
}else if(stb == "%EC%95%88%EC%84%B1%EC%8B%9C"){
	
	var search="안성시";
	
}else if(stb == "%EC%9D%B4%EC%B2%9C%EC%8B%9C"){
	
	var search = "이천시";
	
}else if(stb == "%ED%8F%AC%EC%B2%9C%EC%8B%9C"){
	
	var search="포천시";
	
}else if(stb == "%EA%B0%80%ED%8F%89%EA%B5%B0"){
	
	var search="가평군";
	
}else if(stb == "%EA%B5%B0%ED%8F%AC%EC%8B%9C"){
	
	var search="군포시";
	
}else if(stb == "%EC%95%88%EC%96%91%EC%8B%9C"){
	
	var search="안양시";
	
}else if(stb == "%EC%88%98%EC%9B%90%EC%8B%9C"){
	
	var search="수원시";
	
}else if(stb == "%ED%99%94%EC%84%B1%EC%8B%9C"){
	
	var search="화성시";
	
}else if (stb == "%EC%98%A4%EC%82%B0%EC%8B%9C"){
	
	var search="오산시";
	
}else if (stb == "%EC%9A%A9%EC%9D%B8%EC%8B%9C"){
	
	var search="용인시";
	
}else if(stb =="%EC%97%AC%EC%A3%BC%EA%B5%B0"){
	
	var search="여주군";
}else if (stb =="%EC%96%91%ED%8F%89%EA%B5%B0"){
	
	var search="양평군";
	
}else if (stb == "%EC%95%88%EC%82%B0%EC%8B%9C"){
	
	var search="안산시";
	
}else if(stb == "%EC%8B%9C%ED%9D%A5%EC%8B%9C"){
	
	var search="시흥시";
	
}else if (stb == "%EA%B4%91%EB%AA%85%EC%8B%9C"){
	
	var search="광명시";
	
}else if (stb == "%EB%B6%80%EC%B2%9C%EC%8B%9C"){
	
	var search="부천시";
	
}else if (stb == "%EA%B3%BC%EC%B2%9C%EC%8B%9C"){
	
	var search="과천시";
	
}else if(stb == "%EC%9D%98%EC%99%95%EC%8B%9C"){
	
	var search="의왕시";
	
}else if (stb == "%EA%B9%80%ED%8F%AC%EC%8B%9C"){
	
	var search="김포시";
	
}else if (stb == "%EC%9D%98%EC%A0%95%EB%B6%80"){
	
	var search="의정부시";
	
}else if (stb == "%EB%82%A8%EC%96%91%EC%A3%BC"){
	
	var search="남양주시";
	
}else if(stb =="%EA%B4%91%EC%A3%BC%EC%8B%9C"){
	
	var search="광주시";
	
}else if( stb == "%EC%84%B1%EB%82%A8%EC%8B%9C"){
	
	var search="성남시";
	
}else if (stb == "%ED%95%98%EB%82%A8%EC%8B%9C"){
	
	var search="하남시";
	
}else if (stb == "%EA%B5%AC%EB%A6%AC%EC%8B%9C"){
	
	var search="구리시";
	
}


	function doSearch() {
		
 		
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
						console.log(value.admin_no);
			 			content += "<div class='divTableCell' onclick=doDetail('"+value.admin_no +"');>"+value.park_name+"</div>";
			 			console.log("admin_no : " + value.admin_no);
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
 
<body data-spy="scroll" data-target="#topnav" onload="doSearch()">

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
            <li><a onclick="openMap()">지역검색</a></li>
            <li><a href="parkList2.do">공원정보</a></li>
            <li><a href="freeList.do">자유게시판</a></li>
              <%} %>
            </ul>

        </div>
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
<!-- <input type="text" id="searchbox" style="width:25%; height:50px;" placeholder="공원이름 or 주소"/>
<input type="button" value="검색" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:70px; height:50px; border-radius: 3px;"> -->
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
<%-- <%System.out.println("공원번호 : " + pDTO.getAdmin_no()); %> --%>
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
</div>
</div>
</div>

<br>

<jsp:include page="footer2.jsp" flush="false"></jsp:include>
</body>
</html>
