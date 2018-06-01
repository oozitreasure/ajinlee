<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.DTO.parkDTO" %>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<%
   List<parkDTO> pList = (List<parkDTO>)request.getAttribute("pList");
   if(pList == null){
      pList = new ArrayList();
   }
   
%>

<!DOCTYPE html>
<html lang="en">
<head>

	<title>park</title>
	<jsp:include page="top.jsp" flush="false"></jsp:include>
</head>
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
 		location.href="/parkList.do";
 	} else {
 		
 		$.ajax({
 			
 			url : "/parkSearch.do",
 			method : "post",
 			data : {'search' : search},
 			datatype : "json", 
 			success : function(data) {
 					var contents = "";
 					var content = "";
 					
					contents += "<div class='divTable blueTable'>";
					contents += "<div class='divTableHeading'>";
					contents += "<div class='divTableHead'>공원명</div>";
					contents += "<div class='divTableHead'>이름</div>";
					contents += "<div class='divTableHead'>아이디</div>";
					contents += "<div class='divTableHead'>이메일</div>";
					contents += "<div class='divTableHead'>전화번호</div></div></div>";
					
 					
				$.each(data, function (key, value) {
					content += "<div class='divTableBody'>";
					content += "<div class='divTableRow'>";
		 			content += "<div class='divTableCell' onclick='doDetail("+value.admin_no+");'>"+value.park_name+"</div>";
		 			content += "<div class='divTableCell'>"+value.user_no+"</div>";
		 			content += "<div class='divTableCell'>"+value.addr1+"</div>";
		 			content += "<div class='divTableCell'>"+value.admin_name+"</div>";
		 			content += "<div class='divTableCell'>"+value.number+"</div></div></div>";

		 			
		 			
		 			
 				});
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
  width: 75%;
  text-align: center;
}
.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
  border: 1px solid #D1D1D1;
  padding: 3px 2px;
}
.divTable.blueTable .divTableBody .divTableCell {
  font-size: 15px;
  color: #000000;
}
.divTable.blueTable .divTableHeading {
  background: #52896F;
  background: -moz-linear-gradient(top, #7da693 0%, #63947d 66%, #52896F 100%);
  background: -webkit-linear-gradient(top, #7da693 0%, #63947d 66%, #52896F 100%);
  background: linear-gradient(to bottom, #7da693 0%, #63947d 66%, #52896F 100%);
  border-bottom: 1px solid #000000;
}
.divTable.blueTable .divTableHeading .divTableHead {
  font-size: 20px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: center;
  border-left: 1px solid #FFFFFF;
}
.divTable.blueTable .divTableHeading .divTableHead:first-child {
  border-left: none;
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
  background-color: #FFF4E3;
}
.blueTable .tableFootStyle {
  font-size: 15px;
}
.blueTable .tableFootStyle .links {
	 text-align: center;
	 background-color: #FFF4E3;
}
.blueTable .tableFootStyle .links a{
  display: inline-block;
  background: #52896F;
  color: #FFFFFF;
  padding: 2px 8px;
  border-radius: 5px;
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
<body>
<br>
<div align="center">
<div>
<input type="text" onchange="doSearch()" id="searchbox" style="width:30%; height:50px;" />
<input type="submit" value="검색" style="background-color:#52896F; color:white; width:70px; height:50px">
</div>
<br>

<div class="divTable blueTable">
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
<input type="button" value="글쓰기" onclick="parkIn()" style="background-color:#52896F; color:white; width:70px; height:45px" />
</div>
<div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
</div>
</div>
</div>
<br>
</body>

<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>