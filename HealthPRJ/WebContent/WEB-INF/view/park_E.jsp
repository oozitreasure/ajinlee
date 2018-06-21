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

<form method="post" action="/parkUpdate.do">
<br><br><br><br><br>
<div align="center">
<div style="display: inline-block; position: relative; padding: 15px 15px 14px 14px; border : 1px solid #dde4e9;">
<h2 align="center">공원상세정보</h2>
<br>
</div>

<br><br>

<br><br>
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">NO.</div>
<div class="divTableHead"><input type="text" name="admin_no" value="<%= CmmUtil.nvl(aDTO.getAdmin_no()) %>"></div>
</div>
</div>
<input type="hidden" name="addr2" value="<%= CmmUtil.nvl(aDTO.getAddr2()) %>">
<input type="hidden" name="lat" value="<%= CmmUtil.nvl(aDTO.getLat()) %>">
<input type="hidden" name="har" value="<%= CmmUtil.nvl(aDTO.getHar()) %>">
<input type="hidden" name="park_area" value="<%= CmmUtil.nvl(aDTO.getPark_area()) %>">	  
<div class="divTableBody">
<div class="divTableRow">
<div class="divTableCell">공원명</div>
<div class="divTableCell"><input type="text" name="park_name" value="<%= CmmUtil.nvl(aDTO.getPark_name()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원구분</div>
<div class="divTableCell"><input type="text" name="park_div" value="<%= CmmUtil.nvl(aDTO.getPark_div()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">주소</div>
<div class="divTableCell"><input type="text" name="addr1" value="<%= CmmUtil.nvl(aDTO.getAddr1()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(운동시설)</div>
<div class="divTableCell"><input type="text" name="park_est1" value="<%= CmmUtil.nvl(aDTO.getPark_est1()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(유희시설)</div>
<div class="divTableCell"><input type="text" name="park_est2" value="<%= CmmUtil.nvl(aDTO.getPark_est2()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(편익시설)</div>
<div class="divTableCell"><input type="text" name="park_est3" value="<%= CmmUtil.nvl(aDTO.getPark_est3()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(교양시설)</div>
<div class="divTableCell"><input type="text" name="park_est4" value="<%= CmmUtil.nvl(aDTO.getPark_est4()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">공원보유시설(기타시설)</div>
<div class="divTableCell"><input type="text" name="park_est5" value="<%= CmmUtil.nvl(aDTO.getPark_est5()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">관리기관명</div>
<div class="divTableCell"><input type="text" name="admin_name" value="<%= CmmUtil.nvl(aDTO.getAdmin_name()) %>"></div></div>
<div class="divTableRow">
<div class="divTableCell">전화번호</div>
<div class="divTableCell"><input type="text" name="number" value="<%= CmmUtil.nvl(aDTO.getNumber()) %>"></div></div>

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
					</div>
<div align="center">
<input type="submit" value="수정" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;">
<input type="reset" value="초기화" style="border:1px; background-color:#e8efe8; color:#1c1c1c; width:75px; height:40px; border-radius: 3px;">
</div>
<br><br>
	<div id="dropDownSelect1"></div>
	
</form>

<jsp:include page="footer2.jsp" flush="false"></jsp:include>

</html>