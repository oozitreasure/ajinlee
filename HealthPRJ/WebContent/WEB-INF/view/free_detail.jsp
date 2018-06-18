<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.health.DTO.freeDTO" %>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.DTO.fiDTO" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
freeDTO fDTO = (freeDTO)request.getAttribute("rDTO");
if(fDTO == null) fDTO = new freeDTO();

mainDTO mDTO = (mainDTO)request.getAttribute("mDTO");
if(mDTO == null) mDTO = new mainDTO();

fiDTO fiDTO = (fiDTO)request.getAttribute("fiDTO");
if(fiDTO == null) fiDTO = new fiDTO();


request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

	request.setCharacterEncoding("UTF-8");

	List<fiDTO> list = (List<fiDTO>) request.getAttribute("list");

	//공지글 정보를 못불러왔다면, 객체 생성

	//게시판 조회 결과 보여주기
	if (list == null) {
		list = new ArrayList<fiDTO>();

	}

	String ss_user_name = CmmUtil.nvl((String) session.getAttribute("session_user_name"));
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	String ss_user_id = CmmUtil.nvl((String) session.getAttribute("session_user_id"));
	
	//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
	int edit = 1;

	//로그인 안했다면
	if (ss_user_name.equals("")) {
		edit = 3;

		//본인이 작성한 글이면 2가 되도록 변경
	} else if (ss_user_name.equals(CmmUtil.nvl(fDTO.getUser_name()))) {
		edit = 2;

	} else if (ss_user_name.equals("관리자")){
		edit = 4;
	}

	System.out.println("ss_user_name : " + ss_user_name);
	
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

 <script src="/resources/js/jquery-3.3.1.min.js"></script>
 

<script>
$(function() {
	
	var fr_no = '<%=fDTO.getFr_no() %>';

	
	console.log(fr_no);
	
	commentList(); //페이지 로딩시 댓글 목록 출력 
		// 댓글 쓰기
		
		$("#write").click(function(){ 
			
			// 로그인과 글 내용 유무 확인
			
				if ("<%=edit%>" == 3) {
					alert("로그인 하시길 바랍니다.");
					location.href = "login.do";
					return false;
				} else {
					if ($("#content").val() == "") {
						alert("댓글을 입력해주세요");
						$("#content").focus();
						return false;
						
					} else{
					
					
					$.ajax({
						type : 'post',
						url : "/free/insert.do",
						data : {
							'fr_no' : "${param.fr_no}",
							
							'user_name' : "${sessionScope.ss_user_name}",
							'frc_no' : "${param.frc_no}",
							'content' : $("#content").val(),
							'user_no' : "${sessionScope.ss_user_no}",
							'secret_check' : $('input:checkbox[id="secret_check"]').val()
						},
						success : function(data) {
							
							if(data==1){
							
								alert("댓글이 등록되었습니다.");
								console.log("댓글 등록");
								//댓글 목록
								commentList(data);
								$('#content').val('');
							}
						},
						
						error : function(data) {
							alert("다시 입력해주세요.");
						}
				});
			}
						 
		}
	})
})

//댓글 목록
function commentList(){
	$.ajax({
	    url : '/free/list.do',
	    data : { 'fr_no' : "${param.fr_no}" },
	    type : 'get',
	    success : function(data) {
	    	 
	    
	    	console.log(data);
	    	   var output="";
		       var user_name = '<%=ss_user_name%>';
		       var user_no = '<%=ss_user_no%>';
		       var reg_no = <%=fDTO.getReg_no()%>;
		       var num = Object.keys(data).length;
				<%System.out.println("reg_no : " + fDTO.getReg_no());%>
		       
		    $.each(data,function(index,value){
		    	if(value.secret_check == "1"){
					if (user_no == fi_reg_no || user_no == value.reg_no || user_name == "관리자"){
						
							   output += "<div class='row' id='updateCommentForm"+value.frc_no+"'>";
					    	   output += "<div class='post-preview' style='width:100%'>";
					    	   output += 	   	"<hr/>&emsp;<font color='red' style='font-family: 조선일보명조' size='3'><b> 비밀댓글 입니다. </b></font><br/>";
					    	   output +=		"&emsp; <font style='font-family: 조선일보명조' size='4'><b>" + value.user_name +"</b>&emsp; | &emsp;" + value.reg_dt;
					    	   if(user_no == value.user_no || user_name == "관리자" ){ 
					    		   
					    	   output +=		"<input type='button' value='수정' onclick='commentUpdateForm("+value.frc_no+",\""+value.content+"\")'/>&nbsp;&nbsp;"
						    	output +=	    "<input type='button' value='삭제' onclick='commentDelete("+value.frc_no+")'/>";
					    	   	}
					    	   output += 		"</font><br/>";
					    	   output += 		"&emsp;<font style='font-family: 조선일보명조' size='3'>" + value.content + "</font></div>";
				               output += "</div>";
						
						}else{
							output += 	"<div class='row'>";
				    	    output += 	"<div class='post-preview' style='width:100%'>"
				    	    output +=	"<hr><font color='gray' style='font-family: 조선일보명조' size='3'><b> 비밀댓글 입니다. </b></font><br/></div>";
				    		output += 	"</div>";
				    	  }   	
					}else{
							    output += "<div class='row' id='updateCommentForm"+value.frc_no+"'>";
					    	    output += "<div class='post-preview' style='width:100%'>";
					    	    output +=		"<hr/>&emsp;<font  style='font-family: 조선일보명조' size='4'><b>" + value.user_name +"</b>&emsp; | &emsp;" +  value.reg_dt + "&nbsp;";
					    	    if(user_no == value.user_no || user_name == "관리자"){
					    	    output +=	   "<input type='button'  style='font-family: 조선일보명조' value='수정' onclick='commentUpdateForm("+value.frc_no+",\""+value.content+"\");' />&nbsp;&nbsp;";
					    		output +=	   "<input type='button'  style='font-family: 조선일보명조' value='삭제' onclick='commentDelete("+value.frc_no+")'/>";
					    	    }
					    	   
					    	   output += 		"</font><br/>";
					    	   output += 		"&emsp;<font  style='font-family: 조선일보명조' size='3'>" + value.content + "</font></div>";
				               output += "</div>";
					}
		       })
		    $('#commentCount').html(num);
			$('#listComment').html('');
		   	$('#listComment').html(output);
				
	    }
		       
	 });
	
}

//수정 Form
function commentUpdateForm(frc_no, content) {
	
	console.log("수정Form :"+frc_no, content);
	
	var output = '';
	
	output +=	"<div class='modal-footer'>";
	output +=	"<textarea name='content' id='edit' style='margin-top: 0px; margin-bottom: 0px; width: 600px; height: 70px;'>"+content+"</textarea>"
	output +=	"<input type='button' class='btn default' value='수정' id='updateComment' onclick='commentUpdate(" + frc_no + ");'></div>";
	
	$("#updateCommentForm"+frc_no).html(output);
}

//수정 실행
function commentUpdate(frc_no) {

	
	var content = $("#edit").val();
	
	
	console.log(frc_no, content);
	
	
	if($("#edit").val() == "") {
			
			alert("댓글을 입력해 주세요.");
			$("#edit").focus();
			return false;	}
	
		$.ajax({
			
			url : "/free/update.do",
			type : 'post',
			data : {'content' : content , 'frc_no' : frc_no},
			
			
			success : function(data) {
				
				if(data==1){
					alert("수정하였습니다.");
					console.log(data);
					
					//댓글 목록
					commentList(data);
				}
			},
			
			error : function(data) {
				alert("다시 입력해주세요.");
			}
				
			});
	
	}

//댓글 삭제
function commentDelete(frc_no) {
	 
	console.log(frc_no);
	
	if (!confirm("삭제하시겠습니까?")) {
		return true;
	
	}
		$.ajax ({

			url : "/free/delete.do",
			type : 'post',
			data : { 'frc_no' : frc_no },
			
			success : function(data){
				if(data==1){
					
					alert("삭제되었습니다.");
					console.log(data + "삭제됨");
					
					//댓글 목록
					commentList(data);
					$("#content").val('');
					
				}
					
				
			},
			
			error : function() {
				alert("실패하였습니다.");
		}
	});
}

function sc() {
	var sc = document.getElementById("secret_check");
	if(sc.value == "0"){
		sc.value = "1";
	}else{
		sc.value="0";
	}
}





</script>



<script>
function freeUp(){
	
	   location.href="park_E.do?fr_no";
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
 
 function freeE(){
	 
	 location.href="free_E.do";
	 
	 
		var no = <%=fDTO.getFr_no()%>;
		   location.href="free_E.do?fr_no="+no;
		   
 }
 
 
 


 </script>
 
 <script>
 
 
//수정하기
function doEdit(){
	
	if ("<%=edit%>"==2){
		
		location.href="/free_E.do?fr_no=<%=fDTO.getFr_no()%>";
		
	}else if ("<%=edit%>"==3){
		alert("로그인 하시길 바랍니다.");
		
	}else {
		alert("본인이 작성한 글만 수정 가능합니다.");
		
	}
}


//삭제하기
function doDelete(){
	if ("<%=edit%>"==2 || "<%=edit%>"==4){
		if(confirm("작성한 글을 삭제하시겠습니까?")){
			location.href="/freeDelete.do?fr_no=<%=fDTO.getFr_no()%>";
			
		}
		
	}else if ("<%=edit%>"==3){
		alert("로그인 하시길 바랍니다.");
		
	}else {
		alert("본인이 작성한 글만 삭제 가능합니다.");
		
	}
}


 </script>
 


<style>

div.blueTable {
  background-color: #FFFFFF;
  width: 60%;
}
.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
/*   border-bottom : 1px solid #D1D1D1; */
  padding-bottom: 9px;
/*   border : 1px solid #D1D1D1; */

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
  background-color: #FFFFFF;

}
.divTable.blueTable .divTableHeading .divTableHead:first-child {
  border-left: none;
/*   border-top : 1px solid #d1dee2;
  boerder-button :1px solid #d1dee2; */
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
            <li><a onclick="openMap()">지역검색</a></li>
            <li><a href="parkList2.do">공원정보</a></li>
            <li><a href="freeList.do">자유게시판</a></li>
              <%} %>
            </ul>

        </div>
        <!--/.navbar-collapse -->
    </div>
</div>


<br><br><br><br><br>
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9; align:center;">
<h2 align="center">자유게시판상세</h2>
</div>
<hr style="width:60%">
<br>
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead"><h3 style="display:inline-block; width:60%; text-align:left;"><%= CmmUtil.nvl(fDTO.getTitle()) %></h3>
<div style="display: inline-block; align:right;"><%= CmmUtil.nvl(fDTO.getUser_name()) %>&nbsp;|&nbsp;<%= CmmUtil.nvl(fDTO.getReg_dt()) %></div>
</div>
</div>
</div>
<br><br><br>
<div class="divTableBody" >
<div class="divTableRow">
<div class="divTableCell">
<textarea style="width:77%; height:500px; border:0px; resize: none;" readonly ><%= CmmUtil.nvl(fDTO.getContent()) %></textarea></div></div>
</div>
</div>
<br>
<hr style="width:60%">
		
		


</div>

<input type="hidden" name="fr_no" value="<%= CmmUtil.nvl(fDTO.getFr_no()) %>" />
<br><br>
<div align="center">	
<input type="button" value="수정" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" onclick="doEdit()">
<input type="submit" value="삭제" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" onclick="javascript:doDelete();">
</div>		
<br><br>
					<div style="width:60%; margin-left: auto; margin-right: auto;">
					<div class="form-group floating-label-form-group controls">
					 <font style="font-family: 조선일보명조" size="4">댓글</font>(<span id="commentCount"></span>)
					
					<% if ( edit != 3) { %>
					<div id="listComment"></div>
					
						<div class="form-group col-xs-12 floating-label-form-group controls">
						<br/><b><font  style='font-family: 조선일보명조' size="4"><%=ss_user_name%>(<%=ss_user_id%>)</font></b>
							<font  style='font-family: 조선일보명조' size="3">주인만 보기
								<input type="checkbox" id="secret_check" value="0" onclick="sc();"></font></div>
					<form id="commentInsertForm" onsubmit="return ok(this);">
					<div class="modal-footer">
						<textarea name="content" id="content" placeholder="Comment" 
							style="margin-top: 0px; margin-bottom: 0px; width: 100%; height: 70px; resize:none;"></textarea>
						<input type="button" class="btn default" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" value="확인" id="write"></div>
				</form>
					</div>
					<%} %>
					</div>

				
				
				
		
	
<%-- <div align="left" style="width:60%;">
<input type="text" style="height:40px;" readonly value="<%=ss_user_name%>(<%=ss_user_id%>)"/>
주인만 보기<input type="checkbox" id="secret_check" value="0" onclick="sc();">
								
</div>

<br>

<input type="text" id="content" style="width:55.5%; height:100px;">
<input type="submit" id="write" value="등록" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:100px; border-radius: 3px;">
 --%>

		

<br><br><br>
	<div id="dropDownSelect1"></div>
	
<footer id="footer"><!--  style="position: fixed;bottom: 0; right: 0; width: 100%;"> -->

    <div class="footer-copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <a class="logo" href="/resources/cupid/index.html">
                       <!--  <img src="/resources/cupid/images/logo.png" alt="Template Eden"> -->
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