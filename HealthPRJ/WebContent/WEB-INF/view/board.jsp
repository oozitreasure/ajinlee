<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<title>자유게시판</title>
	<jsp:include page="top.jsp" flush="false"></jsp:include>
</head>
<style>
div.blueTable {
  background-color: #FFFFFF;
  width: 80%;
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
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead">head1</div>
<div class="divTableHead">head2</div>
<div class="divTableHead">head3</div>
<div class="divTableHead">head4</div>
<div class="divTableHead">head5</div>
<div class="divTableHead">head6</div>
<div class="divTableHead">head7</div>
<div class="divTableHead">head8</div>
</div>
</div>
<div class="divTableBody">
<div class="divTableRow">
<div class="divTableCell">cell1_1</div>
<div class="divTableCell">cell2_1</div>
<div class="divTableCell">cell3_1</div>
<div class="divTableCell">cell4_1</div>
<div class="divTableCell">cell5_1</div>
<div class="divTableCell">cell6_1</div>
<div class="divTableCell">cell7_1</div>
<div class="divTableCell">cell8_1</div>
</div>
</div>
</div>
<div class="blueTable outerTableFooter">
<div class="tableFootStyle">
<div class="links"><a href="#">&laquo;</a> <a class="active" href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">&raquo;</a></div>
</div>
</div>

</body>

<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>