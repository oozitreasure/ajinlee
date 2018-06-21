
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
 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>




<jsp:include page="top.jsp" flush="false"></jsp:include>

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
<%if (SESSION_USER_ID.equals("") || SESSION_USER_NAME.equals("관리자")) {%>
<input type="button" value="글쓰기" onclick="parkIn()" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" />
</div>
<%} else {%>
	<%} %>

</div>
</div>
</div>

<br>


<jsp:include page="footer2.jsp" flush="false"></jsp:include>

</html>
