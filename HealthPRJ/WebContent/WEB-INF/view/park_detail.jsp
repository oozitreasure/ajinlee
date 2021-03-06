<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.DTO.parkDTO" %>
<%@ page import="com.health.DTO.HoDTO" %>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.piDTO" %>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

 <%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>

<%

mainDTO mDTO = (mainDTO)request.getAttribute("mDTO");
if(mDTO == null) mDTO = new mainDTO();

parkDTO aDTO = (parkDTO)request.getAttribute("aDTO");
if(aDTO == null) aDTO = new parkDTO();


HoDTO hDTO = (HoDTO)request.getAttribute("hDTO");

if (hDTO == null) {
	hDTO = new HoDTO();

}


request.setCharacterEncoding("euc-kr");


	request.setCharacterEncoding("UTF-8");

	List<piDTO> list = (List<piDTO>) request.getAttribute("list");

	//공지글 정보를 못불러왔다면, 객체 생성

	//게시판 조회 결과 보여주기
	if (list == null) {
		list = new ArrayList<piDTO>();

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
	} else if (ss_user_name.equals(CmmUtil.nvl(mDTO.getUser_name()))) {
		edit = 2;

	} else if (ss_user_name.equals("관리자")){
		edit = 4;
	}

	System.out.println("ss_user_name : " + ss_user_name);
	
	
%>


 <script src="/resources/js/jquery-3.3.1.min.js"></script>

<script>
$(function() {
	

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
						url : "/park/insert.do",
						data : {
							'admin_no' : "${param.admin_no}",
							
							'user_name' : "${sessionScope.ss_user_name}",
							'prc_no' : "${param.prc_no}",
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
	    url : '/park/list.do',
	    data : { 'admin_no' : "${param.admin_no}" },
	    type : 'get',
	    success : function(data) {
	    	 
	    	   var output="";
		       var user_name = '<%=ss_user_name%>';
		       var user_no = '<%=ss_user_no%>';
		       var reg_no = <%=aDTO.getReg_no()%>;
		       
		       var num = Object.keys(data).length;
				<%System.out.println("reg_no : " + aDTO.getReg_no());%>
		       
		    $.each(data,function(index,value){
		    	
		    	if(value.secret_check == "1"){
					if (user_no == reg_no || user_no == value.user_no || user_name == "관리자"){
							
							   output += "<div class='row' id='updateCommentForm"+value.prc_no+"'>";
					    	   output += "<div class='post-preview' style='width:100%'>";
					    	   output += 	   	"<hr/>&emsp;<font color='red' style='font-family: 조선일보명조' size='3'><b> 비밀댓글 입니다. </b></font><br/>";
					    	   output +=		"&emsp; <font style='font-family: 조선일보명조' size='4'><b>" + value.user_name +"</b>&emsp; | &emsp;" + value.reg_dt;
					    	   if(user_no == value.user_no || user_name == "관리자" ){ 
					    	   output +=		"<input type='button' value='수정' onclick='commentUpdateForm("+value.prc_no+",\""+value.content+"\")'/>&nbsp;&nbsp;"
						    	output +=	    "<input type='button' value='삭제' onclick='commentDelete("+value.prc_no+")'/>";
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
							    output += "<div class='row' id='updateCommentForm"+value.prc_no+"'>";
					    	    output += "<div class='post-preview' style='width:100%'>";
					    	    output +=		"<hr/>&emsp;<font  style='font-family: 조선일보명조' size='4'><b>" + value.user_name +"</b>&emsp; | &emsp;" +  value.reg_dt + "&nbsp;";
					    	    if(user_no == value.user_no || user_name == "관리자"){
					    	    output +=	   "<input type='button'  style='font-family: 조선일보명조' value='수정' onclick='commentUpdateForm("+value.prc_no+",\""+value.content+"\");' />&nbsp;&nbsp;";
					    		output +=	   "<input type='button'  style='font-family: 조선일보명조' value='삭제' onclick='commentDelete("+value.prc_no+")'/>";
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
function commentUpdateForm(prc_no, content) {
	
	console.log("수정Form :"+prc_no, content);
	
	var output = '';
	
	output +=	"<div class='modal-footer'>";
	output +=	"<textarea name='content' id='edit' style='margin-top: 0px; margin-bottom: 0px; width: 600px; height: 70px;'>"+content+"</textarea>"
	output +=	"<input type='button' class='btn default' value='수정' id='updateComment' onclick='commentUpdate(" + prc_no + ");'></div>";
	
	$("#updateCommentForm"+prc_no).html(output);
}

//수정 실행
function commentUpdate(prc_no) {

	
	var content = $("#edit").val();
	

	
	
	if($("#edit").val() == "") {
			
			alert("댓글을 입력해 주세요.");
			$("#edit").focus();
			return false;	}
	
		$.ajax({
			
			url : "/park/update.do",
			type : 'post',
			data : {'content' : content , 'prc_no' : prc_no},
			
			
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
function commentDelete(prc_no) {

	
	if (!confirm("삭제하시겠습니까?")) {
		return true;
	
	}
		$.ajax ({

			url : "/park/delete.do",
			type : 'post',
			data : { 'prc_no' : prc_no },
			
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
	
	   location.href="park_E.do";
	}
</script>

<script>
 
 function parkE(){
	 
		var no = '<%=aDTO.getAdmin_no()%>';

	   location.href="park_E.do?admin_no="+no;
	   
	}

 </script>
 
 <script>
 
 
 $(function() {
	 
		Hselect();
	})
	function Hselect() {

	 
		$.ajax({
			type: 'post',
			url : '/like.do',
			data : {
		             'user_no' : '${sessionScope.SESSION_USER_NO}',
		             'admin_no' : '<%=aDTO.getAdmin_no() %>',
		    },
		    success : function(data) {

		    }, 
			error : function(data) {
	           console.log("검색 실패");
		    }
		    
		});
		
	}
 
 
 
 function Hinsert() {
	 
	    var like = document.getElementById('like'); 
	    var unlike = document.getElementById('unlike');
	    
	       $.ajax({
	          type : 'post',
	          url : '/my_page/Hinsert.do',
	          data : {
	             'user_no' : '${sessionScope.SESSION_USER_NO}',
	             'admin_no' : '<%=aDTO.getAdmin_no() %>',
	             'reg_no' : '${sessionScope.SESSION_USER_NO}',
	             'park_name' : '<%=aDTO.getPark_name() %>',
	             'addr' : '<%=aDTO.getAddr1()%>'
	          },
	          success : function(data) {
	              alert("즐겨찾기에 추가되었습니다.");
	              console.log("즐찾추가");
	              console.log(data);

	              
	             $('#like').hide();
	              $('#unlike').show();
	              
	          },
	          error : function(data) {
	             alert("다시 시도해주세요.");
	            
	          }
	    });
	 }
 
 
//즐겨찾기 취소
function Hdelete(){
	 
	 var like = document.getElementById('like'); 
	 var unlike = document.getElementById('unlike');
	 
	 
       $.ajax({
          type : 'post',
          url : '/my_page/Hdelete.do',
          data : {
             'admin_no' : '<%=aDTO.getAdmin_no() %>'
          },
          success : function(data) {
       
                alert("즐겨찾기 삭제되었습니다.");
                console.log("즐찾삭제");
                
               $('#unlike').hide();
                $('#like').show();
                
          },
          error : function(data) {
             alert("다시 시도해주시기 바랍니다.");
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



<jsp:include page="top.jsp" flush="false"></jsp:include>

<form method="post" action="/parkDelete.do">
<br><br><br><br><br>
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">공원상세정보</h2>
<br>
</div>

<input type="hidden" name="admin_no" value="<%= aDTO.getAdmin_no()%>">

<input type="hidden" name="lat" value="<%= aDTO.getLat()%>">
<input type="hidden" name="har" value="<%= aDTO.getHar()%>">


<br><br>
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">NO.</div>
<div class="divTableHead"><%= CmmUtil.nvl(aDTO.getAdmin_no()) %></div>

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
					
					
	<%if (SESSION_USER_ID.equals("") || SESSION_USER_NAME.equals("관리자")) {%>
	
	<%} else {%>				
	<%System.out.println("과연? : " + hDTO.getHo_no()); %>
	
	<div align="right" style="width:60%;">				
	<%if(hDTO.getHo_no() == null) {%>		
	
	<img style="background-color:white; border:0px; width:40px; height:40px" id="like" name="like" onclick="javascript:Hinsert();return false; " src="/resources/img/like3.png">
	<img style="display:none; background-color:white; border:0px; width:40px; height:40px" id="unlike" name="unlike" onclick="javascript:Hdelete('<%=CmmUtil.nvl(aDTO.getAdmin_no()) %>');return false;" src="/resources/img/like.png">
	
	<%}else{%>
	
	<img style="display:none; background-color:white; border:0px; width:40px; height:40px" id="like" name="like"  onclick="javascript:Hinsert();return false;" src="/resources/img/like3.png">
    <img style=" background-color:white; border:0px; width:40px; height:40px" id="unlike" name="unlike" onclick="javascript:Hdelete('<%=CmmUtil.nvl(aDTO.getAdmin_no()) %>');return false;" src="/resources/img/like.png">
              		 	
	<%} }%>
	
	</div>
	 
	 	<%if (SESSION_USER_ID.equals("") || SESSION_USER_NAME.equals("관리자")) {%>
	 	<div align="center">
	<input type="button" value="수정" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" onclick="parkE()">
	<input type="submit" value="삭제" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;">
</div>

	<%} else {%>
	<%} %>
	<br><br>
	</div>
</form>				


					<div>
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
							style="margin-top: 0px; margin-bottom: 0px; width: 100%; height: 70px; resize:none;font-family: 조선일보명조"></textarea>
						<input type="button" class="btn default" value="확인" id="write" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;"></div>
				</form>
					</div>
					<%} %>
					</div>
					</div>
<br>


	<div id="dropDownSelect1"></div>
	
	
<jsp:include page="footer2.jsp" flush="false"></jsp:include>

</html>
