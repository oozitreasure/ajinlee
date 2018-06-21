<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
   List<mainDTO> uList = (List<mainDTO>)request.getAttribute("uList");
   if(uList == null){
      uList = new ArrayList();
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
    var user_no = n;
    location.href="/user_detail.do?user_no="+ user_no;
 }
 
</script>


<script>

function doSearch() {
 	
 	var contents = "";
 	var cnt = 10;
 	var search = $('#searchbox').val();
 	
 	if (search == "") {
 		location.href="/userSearch.do";
 		
 	} else {
 		
 		$.ajax({
 			
 			url : "/userSearch.do",
 			method : "post",
 			data : {'search' : search},
 			datatype : "json", 
 			success : function(data) {
 				
 					var contents = "";
 					var content = "";
 					
					contents += "<div class='divTable blueTable' style='width:100%'>";
					contents += "<div class='divTableHeading'>";
					contents += "<div class='divTableRow'>";
					contents += "<div class='divTableHead'>번호</div>";
					contents += "<div class='divTableHead'>이름</div>";
					contents += "<div class='divTableHead'>아이디</div>";
					contents += "<div class='divTableHead'>이메일</div>";
					contents += "<div class='divTableHead'>지역</div></div></div>";

					contents += "<div class='divTableBody'>";
				$.each(data, function (key, value) {
					content += "<div class='divTableRow'>";
		 			content += "<div class='divTableCell'>"+value.user_no+"</div>";
		 			content += "<div class='divTableCell' onclick='doDetail("+value.user_no+");'>"+value.user_name+"</div>";
		 			content += "<div class='divTableCell'>"+value.user_id+"</div>";
		 			content += "<div class='divTableCell'>"+value.email+"</div>";
		 			content += "<div class='divTableCell'>"+value.addr+"</div></div>";

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

<jsp:include page="top.jsp" flush="false"></jsp:include>


<br><br><br><br><br>
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">회원정보리스트</h2>
</div>
</div>
<br>
<div align="center">
<div class="divTable blueTable" id="divTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">번호</div>
<div class="divTableHead">이름</div>
<div class="divTableHead">아이디</div>
</div>
</div>
<div class="divTableBody">
<%for (mainDTO uDTO : uList) { %>
<div class="divTableRow">
<div class="divTableCell"><%=uDTO.getUser_no() %></div>
<div class="divTableCell" onclick="doDetail(<%=uDTO.getUser_no()%>)"><%=uDTO.getUser_name() %></div>
<div class="divTableCell"><%=uDTO.getUser_id() %></div>
</div>
<%} %>
</div>
</div>
<br>
<div>
<input type="text" onchange="doSearch()" id="searchbox" style="width:20%; height:40px; display: inline-block;" placeholder="ID or 이름"/>
<input type="submit" value="검색" style="border:1px; background-color:#ede6da; color:#1c1c1c; width:60px; height:40px; border-radius: 3px;">
</div>
<br>
<div class="blueTable outerTableFooter">
<div class="tableFootStyle">
</div>
</div>
</div>
<br>
<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>