<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.DTO.parkDTO" %>
<%@ page import="com.health.util.CmmUtil" %>


 <%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>

<%

parkDTO aDTO = (parkDTO)request.getAttribute("aDTO");
if(aDTO == null) aDTO = new parkDTO();

%>


 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>


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


<br><br><br><br><br>
<form method="post" action="/park_insert_proc.do">
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">공원정보등록</h2>
<br>
</div>

<br><br>

<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">NO.</div>
<div class="divTableHead"><input style="width:100%" type="text" id="admin_no" name="admin_no"></div>
</div>
</div>
<div class="divTableBody">
<div class="divTableRow">
<div class="divTableCell">공원명</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_name" name="park_name"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원구분</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_div" name="park_div"></div></div>
<div class="divTableRow">
<div class="divTableCell">주소1</div>
<div class="divTableCell"><input style="width:100%" type="text" id="addr1" name="addr1"></div></div>
<div class="divTableRow">
<div class="divTableCell">주소2</div>
<div class="divTableCell"><input style="width:100%" type="text" id="addr2" name="addr2"></div></div>
<div class="divTableRow">
<div class="divTableCell">위도</div>
<div class="divTableCell"><input style="width:100%" type="text" id="lat" name="lat"></div></div>
<div class="divTableRow">
<div class="divTableCell">경도</div>
<div class="divTableCell"><input style="width:100%" type="text" id="har" name="har"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원면적</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_area" name="park_area"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(운동시설)</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_est1" name="park_est1"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(유희시설)</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_est2" name="park_est2"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(편익시설)</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_est3" name="park_est3"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(교양시설)</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_est4" name="park_est4"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(기타시설)</div>
<div class="divTableCell"><input style="width:100%" type="text" id="park_est5" name="park_est5"></div></div>
<div class="divTableRow">
<div class="divTableCell">관리기관명</div>
<div class="divTableCell"><input style="width:100%" type="text" id="admin_name" name="admin_name"></div></div>
<div class="divTableRow">
<div class="divTableCell">전화번호</div>
<div class="divTableCell"><input style="width:100%" type="text" id="number" name="number"></div></div>

</div>
</div>
<br>
<input type="submit" value="등록" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;">
<input type="reset" value="초기화" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;">
	</div>
	</form>
					


<br><br><br>

	<div id="dropDownSelect1"></div>
	
	
<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>
