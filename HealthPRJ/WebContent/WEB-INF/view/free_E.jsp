<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.health.DTO.freeDTO" %>
<%@ page import="com.health.util.CmmUtil" %>
<%@ page import="com.health.DTO.mainDTO" %>

<%
freeDTO rDTO = (freeDTO)request.getAttribute("rDTO");
if(rDTO == null) rDTO = new freeDTO();

%>

<%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>
 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>
 

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

<jsp:include page="top.jsp" flush="false"></jsp:include>

<br><br><br><br><br>
<form action="/freeUpdate.do" method="post">

<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9; align:center;">
<h2 align="center">자유게시판수정</h2>
</div>
<hr style="width:60%">
<br>
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">

<div class="divTableHead"><h3 style="display:inline-block; width:72%; text-align:left;">
<input type="text" name="title" value="<%= CmmUtil.nvl(rDTO.getTitle()) %>"></h3>
<div style="display: inline-block; align:right;"><%= CmmUtil.nvl(rDTO.getUser_name()) %></div>
</div>
</div>
</div>
<div class="divTableBody" >
<div class="divTableRow">
<div class="divTableCell">
<textarea style="width:77%; height:500px;" name="content"><%= CmmUtil.nvl(rDTO.getContent()) %></textarea></div></div>
</div>
</div>
<br>
<hr>
</div>
<input type="hidden" name="fr_no" value="<%=rDTO.getFr_no() %>" />



<div align="center">	
<input type="submit" value="수정" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;">
<input type="reset" value="초기화" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;" >
</div>		
<br><br>

	<div id="dropDownSelect1"></div>
	</form>
<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>