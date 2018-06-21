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

<jsp:include page="top.jsp" flush="false"></jsp:include>

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

<br><br>
<div align="center">
<input type="submit" value="수정" style="border:1px; background-color:#ede6da; color:#1c1c1c; width:60px; height:40px; border-radius: 3px;">
<input type="button" value="탈퇴" onclick="user_delete()" style="border:1px; background-color:#ede6da; color:#1c1c1c; width:60px; height:40px; border-radius: 3px;">
</div>
</form>

<br><br>

<div align="center">
<br><br><br>


<%if (SESSION_USER_ID.equals("admin")){ %>

<%}else{ %> 


<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">좋아요</h2>
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
<%for (HoDTO hoDTO : hList) {%>
<div class="divTableRow">
<div class="divTableCell" onclick="doDetail('<%=hoDTO.getAdmin_no()%>')"><%=hoDTO.getAdmin_no()%></div>
<div class="divTableCell"><%=CmmUtil.nvl(hoDTO.getPark_name()) %></div></div>
<%} %>
</div>
</div>
</div>

<br>
</div><br><br>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<div align="center">
<div style="width:500px; height:500px;">
<canvas id="myChart"></canvas>
</div>
</div>
<br><br><br>
<script>
window.onload = function() {
	$.ajax({
		url : "/chart.do",
		method : "post",
		success : function(data){
			var num1 = []; //주소
			var num2 = []; //count
			$.each(data, function(key, value){
				if(value != null) {
					num1.push(value.data)
					num2.push(value.num);
				}
				console.log(num1);
				console.log(num2);
			});
			var ctx = document.getElementById("myChart");

			var myChart = new Chart(ctx, {
			    type: 'doughnut',
			    data: {
			        labels: num1,
			        datasets: [{
			            label: '지역별 좋아요 분석',
			            data: num2,
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 159, 250, 0.2)',
			                'rgba(153, 15, 251, 1)',
			                'rgba(154, 135, 45, 1)',
			                'rgba(155, 201, 7, 1)',
			                'rgba(156, 510, 6, 1)',
			                'rgba(157, 925, 32, 0.1)',
			                'rgba(158, 120, 74, 0.4)',
			                'rgba(159, 159, 65, 0.6)',
			                'rgba(160, 167, 84, 0.5)',
			                'rgba(161, 189, 15, 0.4)',
			                'rgba(162, 131, 25, 0.8)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 103, 255, 0.2)',
			                'rgba(153, 104, 255, 0.2)',
			                'rgba(154, 105, 255, 0.2)',
			                'rgba(155, 106, 255, 0.2)',
			                'rgba(156, 107, 255, 0.2)',
			                'rgba(157, 108, 255, 0.2)',
			                'rgba(158, 109, 255, 0.2)',
			                'rgba(159, 110, 255, 0.2)',
			                'rgba(160, 111, 255, 0.2)',
			                'rgba(161, 112, 255, 0.2)',
			                'rgba(162, 131, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			            yAxes: [{
			                ticks: {
			                   
			                }
			            }]

			    }
			});
		}
	})
}

</script>

<%} %>
	<div id="dropDownSelect1"></div>
	
<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>