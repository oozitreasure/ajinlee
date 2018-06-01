<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지도</title>
</head>
<script language="javascript">

  function Show_map(area){
  //전체 지도에서 지역별 지도 선택시 처리될 함수
    if(area == "전북"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'visible';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "충남"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'visible';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "전남"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'visible';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "경기"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'visible';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "충북"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'visible';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "부산"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'visible';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "대구"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'visible';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "대전"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'visible';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "광주"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'visible';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "경북"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'visible';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "경남"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'visible';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "인천"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'visible';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "제주"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'visible';		div_kangwon.style.visibility = 'hidden';			div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "강원"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'visible';		div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "서울"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';		div_seoul.style.visibility = 'visible';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }else if(area == "울산"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';	div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'visible';		div_nation.style.visibility = 'hidden';
    }else if(area == "외국"){ 
  	div_smap.style.visibility = 'hidden';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';	div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'visible';
    }else{
  	div_smap.style.visibility = 'visible';			div_jeonbuk.style.visibility = 'hidden';	div_chungbuk.style.visibility = 'hidden';	div_busan.style.visibility = 'hidden';
  	div_chungnam.style.visibility = 'hidden';	div_jeonnam.style.visibility = 'hidden';	 div_daegu.style.visibility = 'hidden';		div_daejeon.style.visibility = 'hidden';
  	div_kyonggi.style.visibility = 'hidden';		div_gwangju.style.visibility = 'hidden';	div_gyeongbuk.style.visibility = 'hidden';	div_gyeongnam.style.visibility = 'hidden';
  	div_incheon.style.visibility = 'hidden';		div_jeju.style.visibility = 'hidden';		div_kangwon.style.visibility = 'hidden';	div_seoul.style.visibility = 'hidden';
  	div_ulsan.style.visibility = 'hidden';		div_nation.style.visibility = 'hidden';
    }
  }

  </script>
  
  <script language="javascript">
function imsi_open(){
  window.location='./nation.htm';
}
</script>
  
<body>
<div align="center">
<table style="width:1177px; border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody>
  <tr>
    <td valign="top">
      <table style="width:1177px; border:0px; align:center; cellpadding:0px; cellspacing:0px">
        <tbody>
        <tr>
          <td valign="top">
            <!--GIS:S-->
			<form name="form_Show" method="post" action="/07_gis/07_gis.php">
				  <input type="hidden" name="view_area1" value="">
				  <input type="hidden" name="view_area2" value="">
				  <input type="hidden" name="view_area3" value="">
				  <input type="hidden" name="view_area4" value="">

			<table style="width:1177px; border:0px; align:center; cellpadding:0px; cellspacing:0px">
              <tbody>
              <tr>
                <td valign="top" background="/resources/img/menu_line.gif">
                  <!--지도선택:S-->
				  <table style="width:1177px; border:0px; align:center; cellpadding:0px; cellspacing:0px">
                    <tbody><tr>
                      <td height="36" colspan="3">&nbsp;</td>
                      </tr>
                    <tr>
                      <td width="388" height="36" valign="top">&emsp;&emsp;&emsp;<img src="/resources/img/text01.gif" alt="전국 시 도 선택" width="118" height="16"><br><br><br></td>
                      <td width="21" rowspan="3">
                      &emsp;&emsp;&emsp;&emsp;<img src="/resources/img/map_center01.gif" width="21" height="447"></td>
                      <td valign="top"><img src="/resources/img/text02.gif" alt="상세 지역 선택" width="114" height="16"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="28"><img src="/resources/img/text03.gif" width="170" height="28"></td>
                    </tr>
                    <tr>
                      <td>
                        <div align="center" style="width:500px;"><img src="/resources/img/map.gif" alt="전국지도" width="340" height="499" border="0" usemap="#Map">
                        <br><br><br>
<map name="Map">
  <area shape="poly" coords="73,309,87,325,108,312,157,327,163,314,157,285,175,269,174,261,159,255,143,262,134,251,120,257,110,245,93,263,82,258" href="#전북" onclick="Show_map('전북');">
  <area shape="poly" coords="116,431,176,392,174,359,158,331,125,327,117,352,101,357,88,348,85,329,70,317,36,368,37,441" href="#전남" onclick="Show_map('전남');">
  <area shape="poly" coords="64,492,106,482,121,459,102,440,52,456,51,474" href="#제주" onclick="Show_map('제주');">
  <area shape="poly" coords="141,243,152,236,153,219,142,212,129,229" href="#대전" onclick="Show_map('대전');">
  <area shape="poly" coords="120,329,113,350,101,353,91,348,89,334,102,328" href="#광주" onclick="Show_map('광주');">
  <area shape="poly" coords="178,388,177,359,158,329,166,317,160,286,176,271,205,295,235,304,252,297,260,320,231,340,216,346,224,366,236,356,240,372,230,391" href="#경남" onclick="Show_map('경남');">
  <area shape="poly" coords="220,297,234,284,244,265,230,256,207,268,207,291" href="#대구" onclick="Show_map('대구');">
  <area shape="poly" coords="263,318,256,298,264,285,295,291,291,325" href="#울산" onclick="Show_map('울산');">
  <area shape="poly" coords="243,358,237,353,227,361,222,349,239,340,264,320,279,325,273,347" href="#부산" onclick="Show_map('부산');">
  <area shape="poly" coords="177,259,161,250,154,239,157,217,142,207,136,197,137,174,163,154,185,143,226,160,211,184,193,178,171,202,175,227,186,242" href="#충북" onclick="Show_map('충북');">
<area shape="poly" coords="255,295,264,282,289,286,300,246,284,248,279,155,229,163,216,185,193,183,177,200,180,231,191,237,179,264,206,288,206,261,226,252,250,261,235,297" href="#경북" onclick="Show_map('경북');">
<area shape="poly" coords="278,151,230,160,186,141,168,146,166,111,154,107,155,79,121,43,207,22" href="#강원" onclick="Show_map('강원');">
<area shape="poly" coords="123,127,132,115,119,93,102,105,101,125" href="#서울" onclick="Show_map('서울');">
<area shape="poly" coords="99,125,100,107,82,108,91,88,71,80,48,99,67,128,89,128" href="#인천" onclick="Show_map('인천');">
<area shape="poly" coords="125,129,134,116,120,90,97,103,89,103,96,88,90,75,102,51,123,46,153,80,153,109,163,112,166,148,135,170,107,172,88,159,89,132,102,127" href="#경기" onclick="Show_map('경기');">
<area shape="poly" coords="139,210,132,200,135,176,103,176,79,154,52,188,78,238,86,255,92,260,108,244,121,254,137,249,146,256,156,251,151,241,142,246,128,238,123,229" href="#충남" onclick="Show_map('충남');">
<area shape="rect" coords="218,422,329,471" href="#외국" onclick="Show_map('외국');" onfocus="this.blur();">
</map>

                        </div></td>
                      <td valign="top">

<div style="position:relative; left:0px; top:0px: z-index:1;">

<!-- ------------------- 초기지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_smap" style="position: absolute; overflow:hidden; border:0px; z-index:2; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: visible;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td height="380" align="center"><img src="/resources/img/smap.gif" alt="초기지도" width="300" height="300"></td>
  </tr>
</tbody></table></div>

<!-- ------------------- 외국용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_nation" style="position: absolute; overflow:hidden; border:0px; z-index:2; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<script language="javascript">
function Ok_sub(){
  var Frm = document.form_Show;

  if(Frm.view_area1.value == ""){
    alert('외국 관찰지역을 입력해 주세요.');
	Frm.view_area1.focus();
  }else{
    Frm.submit();
//    top.opener.document.Band.view_area1.value=Frm.view1.value;
//    top.opener.window.close();
//	top.window.close();
  }
}
</script>


<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td height="450" align="center" background="/resoureces/img/nation.gif"><!---->
	  <table style="border:0px; align:center; cellpadding:0px; cellspacing:0px; bgcolor:#DDDDDD;">
	    <tbody><tr>
		  <td width="100" bgcolor="#FFFFFF" align="center"><font size="-1">외국 관찰지역</font></td>
		  <td bgcolor="#FFFFFF"><input type="text" name="view_area1" size="20" maxlength="100" class="form"></td>
		</tr>
		<tr><td height="40" valign="middle" align="center" colspan="2" bgcolor="#FFFFFF"><a href="javascript:Ok_sub();"><img src="/resoureces/bbs/img/ok_btn.gif" border="0"></a></td></tr>
	  </tbody></table>
	
	</td>
  </tr>
</tbody></table>

</div>

<!-- ------------------- 충남지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_chungnam" style="position: absolute; overflow:hidden; border:0px; z-index:3; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_chungnam.gif" alt="충남지도" border="0" usemap="#Gis_chungnam"></td>
  </tr>
</tbody></table>
<map name="Gis_chungnam">
<area shape="poly" coords="163,23,174,23,180,13,199,22,228,32,227,43,181,47" href="#대호지" onclick="Select_chungnam('대호지')">
<area shape="poly" coords="157,189,176,141,183,147,186,172,227,182,230,191" href="#천수만A" onclick="Select_chungnam('천수만A')">
<area shape="poly" coords="114,183,156,179,155,136,132,135,117,156,93,170" href="#천수만B" onclick="Select_chungnam('천수만B')">
<area shape="poly" coords="304,54,305,77,363,78,365,55" href="#아산호" onclick="Select_chungnam('아산호')">
<area shape="poly" coords="293,74,319,82,340,87,340,104,294,106" href="#삽교호" onclick="Select_chungnam('삽교호')">
<area shape="poly" coords="243,447,325,444,306,404,241,427" href="#금강하구" onclick="Select_chungnam('금강하구')">

<area shape="poly" coords="185,54,227,49,233,29,285,44,290,77,293,110,275,124,256,104,239,123,223,92,199,102,183,74" href="#당진군" onclick="Select_chungnam('당진군')">
<area shape="poly" coords="376,52,385,123,358,164,402,175,399,135,446,149,485,114,410,33" href="#천안시" onclick="Select_chungnam('천안시')">
<area shape="poly" coords="444,263,403,185,405,144,450,156,496,191,497,232,464,262" href="#연기군" onclick="Select_chungnam('연기군')">
<area shape="poly" coords="397,180,339,163,312,225,328,246,348,243,360,269,346,296,373,315,436,288,443,265" href="#공주시" onclick="Select_chungnam('공주시')">
<area shape="poly" coords="445,326,432,337,414,326,414,301,434,293,555,298,558,319" href="#계룡시" onclick="Select_chungnam('계룡시')">
<area shape="poly" coords="330,145,342,159,355,163,381,120,371,58,364,84,340,84,344,104,301,110,311,135" href="#아산시" onclick="Select_chungnam('아산시')">
<area shape="poly" coords="318,204,337,159,295,115,279,128,256,112,223,141,219,173,231,177,267,156,279,184,270,211,297,213,304,201" href="#예산군" onclick="Select_chungnam('예산군')">
<area shape="poly" coords="233,122,220,100,200,107,178,76,181,51,160,28,141,32,159,68,134,92,143,130,160,135,159,169,173,137,189,145,193,165,216,169,220,141" href="#서산시" onclick="Select_chungnam('서산시')">
<area shape="poly" coords="276,219,268,240,244,245,186,216,181,194,235,193,230,184,265,164,274,185,265,210" href="#홍성군" onclick="Select_chungnam('홍성군')">
<area shape="poly" coords="249,249,273,243,282,217,300,216,306,210,309,222,322,246,343,246,352,269,343,298,308,300,300,273,282,291,260,278" href="#청양군" onclick="Select_chungnam('청양군')">
<area shape="poly" coords="351,367,349,345,370,321,345,304,305,303,296,288,282,297,259,285,253,317,266,329,254,350,287,357,307,398,317,371" href="#부여군" onclick="Select_chungnam('부여군')">
<area shape="poly" coords="390,405,355,372,354,345,376,321,409,307,411,331,429,345,443,335,455,349,458,376,434,394" href="#논산시" onclick="Select_chungnam('논산시')">
<area shape="poly" coords="484,433,461,373,465,349,472,327,499,347,523,329,546,342,543,376,561,407,546,424,525,411,524,436,505,439,493,416" href="#금산군" onclick="Select_chungnam('금산군')">
<area shape="poly" coords="239,423,300,401,277,362,253,354,192,351" href="#서천군" onclick="Select_chungnam('서천군')">
<area shape="poly" coords="251,350,261,329,246,313,252,280,245,251,186,223,188,275,204,288,192,302,204,347" href="#보령시" onclick="Select_chungnam('보령시')">
<area shape="poly" coords="92,159,116,154,136,127,130,90,120,58,99,69,62,101,5,110,2,140,68,142,77,159" href="#태안군" onclick="Select_chungnam('태안군')">
<area shape="poly" coords="141,261,122,190,149,188,180,277,166,292" href="#태안군" onclick="Select_chungnam('태안군')">
</map>
</div>

<!-- ------------------- 경기지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_kyonggi" style="position: absolute; overflow:hidden; border:0px; z-index:4; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_kyonggi.gif" alt="경기지도" width="570" height="450" border="0" usemap="#Gis_gyeongki">
	<map name="Gis_gyeongki">
	  <area shape="poly" coords="241,114,227,113,237,96,228,93,223,101,215,102,183,104,177,98,258,0,291,36,280,51,288,65,269,73,275,94,265,102,247,99" href="#연천군" onclick="Select_kyonggi('연천군')">
	<area shape="poly" coords="285,123,269,140,237,124,240,117,249,102,263,102" href="#동두천시" onclick="Select_kyonggi('동두천시')">
	<area shape="poly" coords="225,113,233,97,230,97,221,105,184,106,168,100,141,113,142,159,149,188,177,184,207,173,209,149,221,131" href="#파주시" onclick="Select_kyonggi('파주시')">
	<area shape="poly" coords="213,196,241,189,240,166,275,154,268,142,236,127,238,114,227,115,221,132,212,150,218,168" href="#양주시" onclick="Select_kyonggi('양주시')">
	<area shape="poly" coords="233,195,211,197,215,173,178,188,150,190,186,221,206,220,237,209" href="#고양시" onclick="Select_kyonggi('고양시')">
	<area shape="poly" coords="207,432,189,411,205,400,208,385,237,382,239,364,244,360,266,365,270,394,279,398,277,410,261,417" href="#평택시" onclick="Select_kyonggi('평택시')">
	<area shape="poly" coords="314,441,277,415,282,397,270,391,269,367,273,365,291,377,308,359,348,370,354,359,379,374,370,390" href="#안성시" onclick="Select_kyonggi('안성시')">
	<area shape="poly" coords="404,384,417,359,382,337,386,311,361,291,330,318,329,331,357,357,383,372,376,387" href="#이천시" onclick="Select_kyonggi('이천시')">
	<area shape="poly" coords="287,121,267,103,278,94,272,74,291,65,284,50,291,40,311,35,371,84,337,106,314,161,295,169,276,168,269,162,279,156,272,141" href="#포천시" onclick="Select_kyonggi('포천시')">
	<area shape="poly" coords="317,166,337,109,375,90,411,116,405,134,380,150,392,199,396,216,372,222,362,204" href="#가평군" onclick="Select_kyonggi('가평군')">
	<area shape="poly" coords="217,307,227,307,229,299,222,288,212,284,203,294,202,300" href="#군포시&#10;&#9;" onclick="Select_kyonggi('군포시')">
	<area shape="poly" coords="204,287,199,280,206,269,206,254,219,261,229,275,224,286,212,281" href="#안양시" onclick="Select_kyonggi('안양시')">
	<area shape="poly" coords="256,328,239,328,216,314,217,310,228,310,231,298,239,297,261,306" href="#수원시" onclick="Select_kyonggi('수원시')">
	<area shape="poly" coords="241,358,238,334,211,313,188,317,175,324,154,323,148,356,176,350,165,370,182,370,208,370,210,378,233,378" href="#화성시" onclick="Select_kyonggi('화성시')">
	<area shape="poly" coords="267,364,244,358,241,337,247,331,271,348" href="#오산시" onclick="Select_kyonggi('오산시')">
	<area shape="poly" coords="288,371,273,360,273,345,257,329,263,302,282,291,315,297,315,323,326,322,353,356,346,364,307,355" href="#용인시" onclick="Select_kyonggi('용인시')">
	<area shape="poly" coords="386,336,422,359,447,328,448,289,424,276,387,276,379,268,362,283,394,310" href="#여주군" onclick="Select_kyonggi('여주군')">
	<area shape="poly" coords="370,237,372,239,400,220,396,203,404,198,436,219,462,222,471,236,449,247,467,271,452,286,425,274,387,275,379,264,367,271,346,271,338,261,348,255,340,237,348,237,352,241,360,245,365,244,367,239" href="#양평군&#10;&#9;" onclick="Select_kyonggi('양평군')">
	<area shape="poly" coords="213,308,197,301,204,288,162,296,148,305,181,315" href="#안산시" onclick="Select_kyonggi('안산시')">
	<area shape="poly" coords="198,285,191,274,189,266,176,260,151,280,147,289,161,293" href="#시흥시" onclick="Select_kyonggi('시흥시')">
	<area shape="poly" coords="195,276,188,264,190,254,206,254,205,266,199,277" href="#광명시" onclick="Select_kyonggi('광명시')">
	<area shape="poly" coords="186,261,193,252,194,236,171,226,167,246,170,255" href="#부천시" onclick="Select_kyonggi('부천시')">
	<area shape="poly" coords="232,278,259,261,235,258,222,259" href="#과천시" onclick="Select_kyonggi('과천시')">
	<area shape="poly" coords="230,297,226,288,229,279,234,280,243,275,246,285,272,293,261,301,237,294" href="#의왕시" onclick="Select_kyonggi('의왕시')">
	<area shape="poly" coords="147,190,139,161,105,165,100,205,115,216,141,213,161,227,181,223" href="#김포시" onclick="Select_kyonggi('김포시')">
	<area shape="poly" coords="258,193,281,179,278,171,268,161,251,168,244,167,244,186" href="#의정부시" onclick="Select_kyonggi('의정부시')">
	<area shape="poly" coords="259,198,284,183,283,172,297,173,314,166,345,199,329,213,320,216,323,223,318,221,307,223,297,224,282,214,279,203" href="#남양주시" onclick="Select_kyonggi('남양주시')">
	<area shape="poly" coords="320,318,328,317,361,286,357,280,368,273,346,273,336,263,345,253,340,240,326,239,322,246,306,254,289,260,297,275,284,284,317,293" href="#광주시" onclick="Select_kyonggi('광주시')">
	<area shape="poly" coords="274,290,283,286,283,282,292,273,285,260,271,255,247,272,248,281" href="#성남시" onclick="Select_kyonggi('성남시')">
	<area shape="poly" coords="290,249,276,245,270,241,283,226,291,225,307,252" href="#하남시" onclick="Select_kyonggi('하남시')">
	<area shape="poly" coords="264,228,281,226,289,219,280,213,275,201,259,201,258,219" href="#구리시" onclick="Select_kyonggi('구리시')">


	<area shape="poly" coords="210,436,242,424,275,432,280,447,226,446,210,444" href="#아산호" onclick="Select_kyonggi('아산호')">
	<area shape="poly" coords="184,411,202,398,206,380,205,373,175,373,162,383" href="#남양호" onclick="Select_kyonggi('남양호')">
	<area shape="poly" coords="371,234,328,236,308,243,294,225,325,224,326,218,356,218,374,225" href="#팔당대교" onclick="Select_kyonggi('팔당대교')">
	<area shape="poly" coords="300,252,288,257,270,253,260,258,221,256,220,246,265,244" href="#남한산성" onclick="Select_kyonggi('남한산성')">
	</map>
	</td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 전남지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_jeonnam" style="position: absolute; overflow:hidden; border:0px; z-index:5; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_jeonnam.gif" alt="전남지도" width="570" height="450" border="0" usemap="#Gis_jeonnam">
      <map name="Gis_jeonnam">
        <area shape="poly" coords="210,197,185,165,164,136,172,129,224,123,227,113,239,123,244,149,224,161,226,189" href="#함평군" onclick="Select_jeonnam('함평군')">
    <area shape="poly" coords="227,163,246,150,278,168,299,160,309,167,302,178,297,230,282,229,260,222,243,205,248,222,225,216,219,228,201,216,210,200,227,191" href="#나주시" onclick="Select_jeonnam('나주시')">
      <area shape="poly" coords="214,231,220,231,226,219,252,226,248,214,261,225,294,233,279,257,254,268,244,285,216,294,208,275,207,269,207,264,209,253" href="#영암군" onclick="Select_jeonnam('영암군')">
    <area shape="poly" coords="246,288,255,270,278,261,303,298,297,320,299,338,290,366,281,369,274,326,264,368,246,351,248,317,255,309" href="#강진군" onclick="Select_jeonnam('강진군')">
    <area shape="poly" coords="271,433,246,424,231,401,239,386,256,388,277,411" href="#완도군" onclick="Select_jeonnam('완도군')">
    <area shape="poly" coords="429,373,400,345,363,344,384,313,402,313,405,279,399,266,427,246,443,260,478,321" href="#고흥군" onclick="Select_jeonnam('고흥군')">
    <area shape="poly" coords="507,310,480,299,479,237,493,223,552,232,550,269" href="#여수시" onclick="Select_jeonnam('여수시')">
    <area shape="poly" coords="446,240,417,221,403,226,385,196,358,211,362,228,340,245,329,285,345,300,389,283,396,264,426,245" href="#보성군" onclick="Select_jeonnam('보성군')">
    <area shape="poly" coords="293,372,301,377,317,372,332,349,347,303,328,287,337,246,318,244,298,231,282,258,305,294,299,319,302,339" href="#장흥군" onclick="Select_jeonnam('장흥군')">
    <area shape="poly" coords="261,370,245,355,243,317,252,307,244,290,211,295,186,293,168,297,178,317,153,297,137,301,145,321,182,343,198,417,221,414,229,382" href="#해남군" onclick="Select_jeonnam('해남군')">
    <area shape="poly" coords="212,227,207,251,200,260,190,251,174,233,169,201,163,211,140,203,150,185,158,175,150,165,138,167,126,149,134,136,152,136,160,153,173,157,180,168,185,168,207,198,199,215" href="#무안군" onclick="Select_jeonnam('무안군')">
    <area shape="poly" coords="110,401,162,377,172,354,133,322,85,366,88,392" href="#진도군" onclick="Select_jeonnam('진도군')">
    <area shape="poly" coords="476,231,494,220,496,209,484,201,481,186,487,183,486,174,475,167,482,156,453,129,428,158,391,146,385,182,392,199,405,222,419,219,450,240" href="#순천시" onclick="Select_jeonnam('순천시')">
    <area shape="poly" coords="337,244,320,243,303,230,306,177,312,167,306,160,332,143,359,146,353,127,366,122,388,118,391,142,384,180,384,193,356,209,358,227" href="#화순군" onclick="Select_jeonnam('화순군')">
    <area shape="poly" coords="185,287,161,289,155,278,169,237,183,253,178,270,187,282" href="#목포시" onclick="Select_jeonnam('목포시')">
    <area shape="poly" coords="100,290,134,272,97,218,79,244,75,278" href="#신안군" onclick="Select_jeonnam('신안군')">
    <area shape="poly" coords="223,110,237,75,181,42,149,91,142,117,165,131,172,125,220,121" href="#영광군" onclick="Select_jeonnam('영광군')">
    <area shape="poly" coords="500,210,486,200,485,187,491,183,491,172,479,166,485,153,503,132,546,166,547,195,522,217" href="#광양시" onclick="Select_jeonnam('광양시')">
    <area shape="poly" coords="483,151,439,118,441,80,465,57,511,118" href="#구례구" onclick="Select_jeonnam('구례구')">
    <area shape="poly" coords="367,117,360,84,351,31,334,29,316,50,294,85,305,111,336,136,354,141,353,127" href="#담양군" onclick="Select_jeonnam('담양군')">
    <area shape="poly" coords="394,144,428,154,448,128,437,117,438,82,383,73,364,83,370,117,390,116" href="#곡성군" onclick="Select_jeonnam('곡성군')">
    <area shape="poly" coords="201,279,190,275,181,274,181,264,187,252,199,262,205,260,206,281" href="#영산강" onclick="Select_jeonnam('영산강')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 전북지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_jeonbuk" style="position: absolute; overflow:hidden; border:0px; z-index:6; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_jeonbuk.gif" alt="전북지도" width="570" height="450" border="0" usemap="#Gis_jeonbuk">
<map name="Gis_jeonbuk">
<area shape="poly" coords="167,225,138,190,127,202,131,212,106,213,105,227,136,228,147,235" href="#동진강" onclick="Select_jeonbuk('동진강')">
<area shape="poly" coords="64,109,80,104,119,97,134,83,155,82,165,76,161,68,67,70" href="#금강하구" onclick="Select_jeonbuk('금강하구')">
<area shape="poly" coords="151,139,154,130,162,130,169,119,177,119,173,134,192,140,200,155,193,165,172,165,155,153" href="#만경강" onclick="Select_jeonbuk('만경강')">
<area shape="poly" coords="259,271,272,263,272,237,291,225,315,235,315,213,334,195,355,126,352,113,368,87,351,37,269,61,265,126,241,141,271,150,305,167,301,193,293,203,255,221,247,249" href="#완주군" onclick="Select_jeonbuk('완주군')">
<area shape="poly" coords="329,203,335,198,357,131,353,112,368,91,415,105,461,184,417,198,403,233,404,269,391,273,345,243" href="#진안군" onclick="Select_jeonbuk('진안군')">
<area shape="poly" coords="467,185,417,102,422,79,459,61,504,89,546,79,560,119,497,189" href="#무주군" onclick="Select_jeonbuk('무주군')">
<area shape="poly" coords="496,194,464,188,420,198,406,230,406,267,367,280,363,299,399,305,420,335,439,333" href="#장수군" onclick="Select_jeonbuk('장수군')">
<area shape="poly" coords="255,217,293,199,301,189,301,166,264,150,225,148,225,183" href="#전주시" onclick="Select_jeonbuk('전주시')">
<area shape="poly" coords="221,145,261,124,263,67,225,26,177,39,165,73,194,105,175,134" href="#익산시" onclick="Select_jeonbuk('익산시')">
<area shape="poly" coords="259,273,273,267,274,238,292,229,319,237,320,214,325,207,341,243,383,271,365,279,360,296,350,327,337,335,294,339,280,341,265,327" href="#임실군" onclick="Select_jeonbuk('임실군')">
<area shape="poly" coords="262,325,256,272,245,251,221,246,210,227,189,215,180,227,160,231,123,263,119,297,134,301,136,342,169,351,217,307" href="#정읍시" onclick="Select_jeonbuk('정읍시')">
<area shape="poly" coords="173,354,214,311,261,327,280,343,337,339,331,360,292,405,270,426" href="#순창군" onclick="Select_jeonbuk('순창군')">
<area shape="poly" coords="299,409,333,362,339,337,350,329,359,303,395,307,419,339,438,338,452,315,477,361,449,421" href="#남원시" onclick="Select_jeonbuk('남원시')">
<area shape="poly" coords="115,395,133,345,131,299,106,297,27,316,7,359,51,419" href="#고창군" onclick="Select_jeonbuk('고창군')">
<area shape="poly" coords="79,150,129,150,147,140,152,128,162,126,169,116,178,117,190,105,168,79,153,88,135,87,119,101,78,107,65,115" href="#군산시" onclick="Select_jeonbuk('군산시')">
<area shape="poly" coords="151,153,169,166,194,168,206,157,199,143,223,149,221,182,253,220,245,243,223,244,216,226,189,212,170,224,142,192,119,170" href="#김제시" onclick="Select_jeonbuk('김제시')">
<area shape="poly" coords="103,294,115,294,121,262,143,237,106,230,85,210,25,272,34,289" href="#부안군" onclick="Select_jeonbuk('부안군')">
<area shape="poly" coords="472,434" href="#">
</map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 충북지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_chungbuk" style="position: absolute; overflow:hidden; border:0px; z-index:3; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_chungbuk.gif" alt="충북지도" width="570" height="450" border="0" usemap="#Gis_chungbuk">
      <map name="Gis_chungbuk">
        <area shape="poly" coords="425,167,385,139,378,121,392,112,389,91,376,79,403,52,398,43,437,40,437,49,519,75" href="#단양군" onclick="Select_chungbuk('단양군')">
        <area shape="poly" coords="382,139,373,121,387,113,387,91,372,77,399,49,391,41,412,22,369,1,280,4,282,33,304,60,316,55,332,65,317,147,349,153,375,157" href="#제천시" onclick="Select_chungbuk('제천시')">
        <area shape="poly" coords="339,155,314,143,329,64,315,55,305,63,281,38,222,15,205,43,211,53,196,95,235,116,247,114,273,133,290,136,297,153,329,159" href="#충주시" onclick="Select_chungbuk('충주시')">
        <area shape="poly" coords="327,161,295,153,288,137,274,136,246,116,239,119,240,129,187,147,193,162,197,188,229,224,251,231,317,215" href="#괴산군" onclick="Select_chungbuk('괴산군')">
        <area shape="poly" coords="236,119,193,98,207,53,190,39,125,89,133,113,171,145,184,146,237,127" href="#음성군" onclick="Select_chungbuk('음성군')">
        <area shape="poly" coords="235,230,290,266,271,307,217,301,195,285,164,299,151,289,165,267,165,258,183,246,193,231" href="#보은군" onclick="Select_chungbuk('보은군')">
        <area shape="poly" coords="227,225,200,192,181,199,151,176,117,179,99,176,75,205,91,243,99,235,101,209,136,189,163,215,159,231,139,244,103,239,95,248,115,281,139,277,143,297,161,265,161,254,179,241,191,227" href="#청원군" onclick="Select_chungbuk('청원군')">
        <area shape="poly" coords="138,239,105,233,105,212,133,194,159,215,157,226" href="#청주시" onclick="Select_chungbuk('청주시')">
        <area shape="poly" coords="195,189,185,149,166,145,149,172,182,192" href="#증평군" onclick="Select_chungbuk('증평군')">
        <area shape="poly" coords="164,141,132,115,120,91,77,127,109,170,147,172" href="#진천군" onclick="Select_chungbuk('진천군')">
        <area shape="poly" coords="271,309,215,304,191,289,159,303,142,342,181,377,197,377,193,360,259,332,275,320" href="#옥천군" onclick="Select_chungbuk('옥천군')">
        <area shape="poly" coords="178,379,201,379,196,362,269,331,335,366,301,420,234,439,193,423,171,391" href="#영동구" onclick="Select_chungbuk('영동구')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 부산지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_busan" style="position: absolute; overflow:hidden; border:0px; z-index:4; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_busan.gif" alt="부산지도" width="570" height="450" border="0" usemap="#Gis_busan">
      <map name="Gis_busan">
        <area shape="poly" coords="429,275,421,225,443,221,437,204,449,170,479,163,498,179,483,253,461,277" href="#동구" onclick="Select_busan('동구')">
        <area shape="poly" coords="285,249,267,234,267,229,259,223,252,223,244,212,228,219,229,226,224,231,220,249,223,256,225,271,243,271,243,257,256,267,263,267,265,254" href="#부산진구" onclick="Select_busan('부산진구')">
        <area shape="poly" coords="285,247,267,233,268,227,259,221,254,219,246,210,266,216,277,207,296,217,308,220,301,227,295,227" href="#연제구" onclick="Select_busan('연제구')">
        <area shape="poly" coords="243,207,267,211,276,206,307,215,309,200,301,195,279,179,263,179" href="#동래구" onclick="Select_busan('동래구')">
        <area shape="poly" coords="149,331,149,319,155,300,175,288,191,297,191,291,202,291,214,300,219,326,208,329,211,368,199,363,195,382,186,383,165,331" href="#사하구" onclick="Select_busan('사하구')">
        <area shape="poly" coords="233,277,220,268,209,284,220,306,223,361,231,359,239,325,226,308,236,295" href="#서구" onclick="Select_busan('서구')">
        <area shape="poly" coords="252,304,240,297,236,277,247,274,245,262,266,271,267,293" href="#동구" onclick="Select_busan('동구')">
        <area shape="poly" coords="275,305,268,296,269,259,287,250,315,277,333,308,303,317" href="#남구" onclick="Select_busan('남구')">
        <area shape="poly" coords="323,275,289,249,295,231,311,224,332,251" href="#수영구" onclick="Select_busan('수영구')">
        <area shape="poly" coords="340,250,311,220,315,201,305,193,315,187,312,177,337,156,353,182,346,197,369,207,381,214,389,204,392,233,386,251" href="#해운대" onclick="Select_busan('해운대')">
        <area shape="poly" coords="304,192,313,186,307,176,333,155,334,139,318,141,316,101,297,96,254,115,243,139,261,176,279,175" href="#금정구" onclick="Select_busan('금정구')">
        <area shape="poly" coords="239,207,219,217,197,209,209,196,206,167,221,126,245,123,241,139,260,181" href="#북구" onclick="Select_busan('북구')">
        <area shape="poly" coords="395,221,416,225,420,209,414,185,444,89,483,85,481,63,455,51,447,23,426,1,411,13,385,8,363,38,326,29,299,95,319,97,321,137,335,137,338,153,358,179,352,195,378,209,390,202" href="#기장군" onclick="Select_busan('기장군')">
        <area shape="poly" coords="176,285,187,290,205,288,220,262,218,248,223,229,227,223,226,218,218,219,197,211,176,225" href="#사상구" onclick="Select_busan('사상구')">
        <area shape="poly" coords="245,328,229,309,240,299,257,309" href="#중구" onclick="Select_busan('중구')">
        <area shape="poly" coords="294,369,245,332,264,309,299,328,307,360" href="#영도구" onclick="Select_busan('영도구')">
        <area shape="poly" coords="173,285,172,223,206,191,203,168,98,197,99,265,41,247,42,281,70,303,27,362,59,439,81,437,105,352,132,365,149,339,145,319,151,301" href="#강서구" onclick="Select_busan('강서구')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 대구지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_daegu" style="position: absolute; overflow:hidden; border:0px; z-index:5; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_daegu.gif" alt="대구지도" width="570" height="450" border="0" usemap="#Gis_daegu">
      <map name="Gis_daegu">
      <area shape="poly" coords="339,172,334,161,334,148,381,158,367,173" href="#중구" onclick="Select_daegu('중구')">
    <area shape="poly" coords="293,331" href="#"><area shape="poly" coords="317,261,335,254,337,235,346,223,323,197,331,165,301,173,283,161,250,164,241,189,250,211,276,224" href="#달서구" onclick="Select_daegu('달서구')">
    <area shape="poly" coords="471,251" href="#"><area shape="poly" coords="349,220,361,211,359,178,385,159,398,147,431,167,454,165,469,173,457,222,429,243" href="#수성구" onclick="Select_daegu('수성구')">
    <area shape="poly" coords="471,172,454,162,428,164,397,145,381,155,361,149,384,102,355,33,378,7,437,2,477,17,497,170" href="#">
      <area shape="poly" coords="357,147,381,103,351,33,288,37,272,134,309,131,337,140,337,145" href="#북구" onclick="Select_daegu('북구')">
    <area shape="poly" coords="333,161,332,142,307,133,283,138,284,157,304,171" href="#서구" onclick="Select_daegu('서구')">
    <area shape="poly" coords="315,266,337,256,341,234,349,222,428,245,451,305,377,341,366,299,303,329,285,371,285,401,167,436,190,403,143,337,214,323,161,279,192,227,246,212" href="#달성군" onclick="Select_daegu('달성군')">
    <area shape="poly" coords="347,219,325,195,331,167,341,175,356,179,359,208" href="#남구" onclick="Select_daegu('남구')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 대전지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_daejeon" style="position: absolute; overflow:hidden; border:0px; z-index:6; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_daejeon.gif" alt="대전지도" width="570" height="450" border="0" usemap="#Gis_daejeon">
      <map name="Gis_daejeon">
    <area shape="poly" coords="319,411,298,411,272,374,273,333,254,319,243,299,269,271,275,244,287,236,291,215,307,217,363,284,329,300,329,344,344,360,338,379,321,379" href="#중구" onclick="Select_daejeon('중구')">
    <area shape="poly" coords="195,444,243,391,245,358,240,333,250,320,239,299,268,268,271,243,285,233,291,207,275,180,217,211,223,237,205,240,208,272,185,281,163,320,127,341,148,385,166,386" href="#서구" onclick="Select_daejeon('서구')">
    <area shape="poly" coords="264,4,296,25,291,68,274,81,313,125,295,174,216,208,215,233,202,239,204,267,183,276,160,317,143,327,123,331,83,291,126,119,158,107,197,110,235,47,231,18" href="#유성구" onclick="Select_daejeon('유성구')">
    <area shape="poly" coords="281,183,299,175,315,123,281,79,295,64,397,25,428,78,393,102,383,127,360,142,352,172,376,199,372,213,345,207,339,197,312,216,295,211" href="#대덕구" onclick="Select_daejeon('대덕구')">
    <area shape="poly" coords="321,412,362,428,415,365,405,333,427,295,415,284,437,211,459,190,452,163,500,143,471,108,445,102,428,135,410,95,397,103,388,125,361,144,355,169,379,197,374,216,345,209,338,202,315,219,369,286,333,304,333,341,347,359,340,380,323,382" href="#동구" onclick="Select_daejeon('동구')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 광주지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_gwangju" style="position: absolute; overflow:hidden; border:0px; z-index:3; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_gwangju.gif" alt="광주지도" width="570" height="450" border="0" usemap="#Gis_gwangju">
      <map name="Gis_gwangju">
      <area shape="poly" coords="291,189,322,179,322,169,315,140,315,117,283,96,157,45,10,165,8,303,189,381,212,382,233,347,241,315,261,289,273,251,267,218,286,203" href="#광산구" onclick="Select_gwangju('광산구')">
    <area shape="poly" coords="236,348,241,318,262,293,276,254,271,215,287,205,293,193,400,240,365,245,365,303,273,345" href="#서구" onclick="Select_gwangju('서구')">
    <area shape="poly" coords="403,235,296,190,324,179,325,165,315,137,317,113,285,92,397,37,481,151,473,170,481,181,513,167,563,207,541,241,553,292,527,305,505,265,465,264,436,219,413,219" href="#북구" onclick="Select_gwangju('북구')">
    <area shape="poly" coords="407,304,404,330,413,350,434,388,498,366,528,309,495,268,466,271,435,225,413,225,399,246,423,288" href="#동구" onclick="Select_gwangju('동구')">
    <area shape="poly" coords="185,387,212,388,237,350,269,349,367,304,367,247,395,244,420,286,404,304,401,328,411,349,346,381,313,375,261,425,182,413,157,396" href="#남구" onclick="Select_gwangju('남구')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 경북지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_gyeongbuk" style="position: absolute; overflow:hidden; border:0px; z-index:4; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_gyeongbuk.gif" alt="경북지도" width="570" height="450" border="0" usemap="#Gis_gyeongbuk">
      <map name="Gis_gyeongbuk">
        <area shape="poly" coords="297,415,279,385,287,366,278,363,269,378,227,397,211,393,187,389,176,421,195,435,248,433" href="#청도군" onclick="Select_gyeongbuk('청도군')">
        <area shape="poly" coords="127,296,118,267,87,248,110,227,153,238,155,256,175,272,179,289,161,301" href="#구미시" onclick="Select_gyeongbuk('구미시')">
        <area shape="poly" coords="151,235,121,225,132,202,127,195,134,179,152,180,154,190,168,186,195,203,220,189,245,199,257,233,252,250,256,263,241,262,232,273,203,261,189,241" href="#의성군" onclick="Select_gyeongbuk('의성군')">
        <area shape="poly" coords="123,192,131,175,153,176,167,164,164,155,193,140,189,126,178,115,168,117,159,98,138,103,130,124,130,146,115,155,122,169,110,179" href="#예천군" onclick="Select_gyeongbuk('예천군')">
        <area shape="poly" coords="261,233,245,196,219,186,191,198,165,181,156,184,154,178,169,165,170,155,192,141,194,127,219,131,221,106,231,101,269,111,281,155,277,187,272,218" href="#안동시" onclick="Select_gyeongbuk('안동시')">
        <area shape="poly" coords="282,151,271,114,307,81,337,84,347,107,339,136,328,153,331,182,317,182,297,171" href="#영양군" onclick="Select_gyeongbuk('영양군')">
        <area shape="poly" coords="336,231,315,186,296,174,283,157,274,219,255,245,263,267,283,275,298,257,297,240,325,259,325,238" href="#청송군" onclick="Select_gyeongbuk('청송군')">
        <area shape="poly" coords="261,268,241,265,233,276,199,265,187,243,157,239,157,251,173,270,181,289,199,303,205,319,220,316,219,293,244,299,244,284,257,278" href="#군위군" onclick="Select_gyeongbuk('군위군')">
        <area shape="poly" coords="201,320,194,301,182,293,161,304,127,299,122,308,147,345,169,352" href="#칠곡군" onclick="Select_gyeongbuk('칠곡군')">
        <area shape="poly" coords="146,361,94,379,91,414,154,439,174,371" href="#고령군" onclick="Select_gyeongbuk('고령군')">
        <area shape="poly" coords="88,379,140,359,145,347,121,309,95,311,83,331,69,345" href="#성주군" onclick="Select_gyeongbuk('성주군')">
        <area shape="poly" coords="119,305,122,297,115,269,87,251,62,252,24,314,34,360,75,366,67,342,92,311" href="#김천시" onclick="Select_gyeongbuk('김천시')">
        <area shape="poly" coords="286,359,262,363,247,332,224,319,220,295,244,301,245,287,260,279,264,273,291,277,317,301,307,335,287,347" href="#영천시" onclick="Select_gyeongbuk('영천시')">
        <area shape="poly" coords="339,227,320,185,333,184,329,153,340,139,373,140,383,185,374,245,351,245,346,225" href="#영덕군" onclick="Select_gyeongbuk('영덕군')">
        <area shape="poly" coords="343,231,349,246,367,247,382,296,406,293,420,317,399,363,363,345,345,295,332,307,319,303,295,276,285,275,301,261,301,245,324,262,328,244" href="#포항시" onclick="Select_gyeongbuk('포항시')">
        <area shape="poly" coords="399,365,363,347,347,302,333,309,319,305,308,335,294,349,290,367,283,383,303,413,391,412" href="#경주시" onclick="Select_gyeongbuk('경주시')">
        <area shape="poly" coords="273,366,259,366,247,334,225,322,214,387,225,395,265,375" href="#경산시" onclick="Select_gyeongbuk('경산시')">
        <area shape="poly" coords="128,199,81,153,43,179,39,152,5,139,19,251,61,254,83,249,108,223,118,227" href="#상주시" onclick="Select_gyeongbuk('상주시')">
        <area shape="poly" coords="107,175,117,168,112,152,126,141,126,121,134,103,108,81,29,131,39,151,45,173,79,149" href="#문경시" onclick="Select_gyeongbuk('문경시')">
        <area shape="poly" coords="218,127,189,123,179,110,169,111,161,92,142,86,197,31,211,41,197,76,200,94,217,88,217,103" href="#영주시" onclick="Select_gyeongbuk('영주시')">
        <area shape="poly" coords="271,108,231,96,218,102,216,83,203,87,202,75,216,35,234,23,318,35,295,44,297,61,305,79" href="#봉화군" onclick="Select_gyeongbuk('봉화군')">
        <area shape="poly" coords="343,135,383,135,398,103,361,4,324,29,321,37,298,44,307,75,338,81,350,103" href="#">
        <area shape="poly" coords="467,63,493,35,476,2,415,27,427,53" href="#울릉군" onclick="Select_gyeongbuk('울릉군')">
      <area shape="poly" coords="497,83,483,67,502,51,546,62,549,87" href="#독도" onclick="Select_gyeongbuk('독도')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 경남지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_gyeongnam" style="position: absolute; overflow:hidden; border:0px; z-index:5; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_gyeongnam.gif" alt="경남지도" width="570" height="450" border="0" usemap="#Gis_gyeongnam">
      <map name="Gis_gyeongnam">
    <area shape="poly" coords="163,289,159,277,139,275,119,255,141,241,192,208,211,207,219,227,246,236,275,258,271,281,227,293,219,309,203,289" href="#진주시" onclick="Select_gyeongnam('진주시')">
    <area shape="poly" coords="277,257,250,235,267,198,283,211,301,190,341,192,345,228,317,233,319,257,298,271,289,255" href="#함안군" onclick="Select_gyeongnam('함안군')">
    <area shape="poly" coords="246,234,221,225,211,204,189,205,216,187,221,158,247,145,277,145,295,153,279,163,279,177,299,187,283,205,265,195" href="#의령군" onclick="Select_gyeongnam('의령군')">
    <area shape="poly" coords="187,205,169,182,156,183,144,170,143,146,107,125,90,144,96,153,53,218,72,243,98,253,109,241,119,249" href="#산청군" onclick="Select_gyeongnam('산청군')">
    <area shape="poly" coords="102,257,111,249,117,256,135,274,118,279,130,333,88,355,72,340,16,218,46,219,71,249" href="#하동군" onclick="Select_gyeongnam('하동군')">
    <area shape="poly" coords="134,336,124,280,137,278,157,280,161,291,201,292,217,312,194,359" href="#사천시" onclick="Select_gyeongnam('사천시')">
    <area shape="poly" coords="195,358,227,297,272,285,297,303,325,323,303,340,267,355,249,365,223,371" href="#고성군" onclick="Select_gyeongnam('고성군')">
    <area shape="poly" coords="305,303,274,283,278,259,286,261,299,273,321,259,322,235,345,232,363,250,352,268,365,302,345,311" href="#마산시" onclick="Select_gyeongnam('마산시')">
    <area shape="poly" coords="189,200,213,184,220,153,239,142,274,143,275,99,187,28,171,47,182,82,148,117,143,139,147,169,157,181,171,179" href="#합천군" onclick="Select_gyeongnam('합천군')">
    <area shape="poly" coords="305,185,284,177,282,165,300,152,277,141,277,103,329,77,350,117,344,151,353,165,367,174,370,187,345,192,325,187" href="#창녕군" onclick="Select_gyeongnam('창녕군')">
    <area shape="poly" coords="370,171,357,163,347,150,353,118,376,113,414,125,458,98,501,107,489,134,447,189,403,205,371,190" href="#밀양시" onclick="Select_gyeongnam('밀양시')">
    <area shape="poly" coords="364,248,346,229,343,197,369,189,399,208,389,221,409,258,401,267,373,266,363,274,357,267" href="#창원시" onclick="Select_gyeongnam('창원시')">
    <area shape="poly" coords="439,276,409,266,413,257,395,220,403,207,446,195,493,231" href="#김해시" onclick="Select_gyeongnam('김해시')">
    <area shape="poly" coords="499,227,451,192,495,136,556,163,563,197" href="#양산시" onclick="Select_gyeongnam('양산시')">
    <area shape="poly" coords="91,153,86,142,100,122,115,109,115,90,67,71,50,52,37,52,15,132,15,215,51,218" href="#함양군" onclick="Select_gyeongnam('함양군')">
    <area shape="poly" coords="89,387,99,367,115,353,139,355,142,365,139,394,184,395,178,430,152,442,117,435" href="#남해군" onclick="Select_gyeongnam('남해군')">
    <area shape="poly" coords="260,377,268,358,299,349,315,367,304,415,295,421" href="#통영시" onclick="Select_gyeongnam('통영시')">
    <area shape="poly" coords="395,299,365,279,375,271,407,269,443,281,433,299" href="#진해시" onclick="Select_gyeongnam('진해시')">
    <area shape="poly" coords="324,363,389,313,415,390,358,435,321,397" href="#거제시" onclick="Select_gyeongnam('거제시')">
    <area shape="poly" coords="139,137,110,119,117,107,117,87,69,68,53,47,115,3,181,24,168,48,177,80,148,113" href="#거창군" onclick="Select_gyeongnam('거창군')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 인천지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_incheon" style="position: absolute; overflow:hidden; border:0px; z-index:6; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_incheon.gif" alt="인천지도" width="570" height="450" border="0" usemap="#Gis_incheon">
      <map name="Gis_incheon">       
    <area shape="poly" coords="448,424,410,409,435,372,425,341,438,331,464,339,482,327,503,354" href="#남동구" onclick="Select_incheon('남동구')">
    <area shape="poly" coords="250,419,242,398,221,392,215,398,222,411,213,413,215,437,235,432" href="#옹진군" onclick="Select_incheon('옹진군')">
    <area shape="poly" coords="479,323,464,335,440,327,427,335,425,327,432,319,419,285,479,285" href="#부평구" onclick="Select_incheon('부평구')">
    <area shape="poly" coords="477,280,417,281,421,273,439,261,419,228,447,227,452,218,504,230" href="#계양구" onclick="Select_incheon('계양구')">
    <area shape="poly" coords="329,232,313,56,249,2,173,46,176,119,209,142,211,177,183,189,213,237,297,243" href="#강화군" onclick="Select_incheon('강화군')">
    <area shape="poly" coords="446,222,401,169,342,217,329,275,347,289,372,282,369,299,390,306,421,328,428,319,414,281,433,260,415,224" href="#서구" onclick="Select_incheon('서구구')">
    <area shape="poly" coords="408,407,430,369,378,370,385,389" href="#연수구" onclick="Select_incheon('연수구')">
    <area shape="poly" coords="429,364,379,365,379,349,389,338,401,319,420,336" href="#남구" onclick="Select_incheon('남구')">
    <area shape="poly" coords="377,364,377,348,387,335,359,317,347,340,354,361,369,367" href="#중구" onclick="Select_incheon('중구')">
    <area shape="poly" coords="387,332,359,316,387,310,398,321" href="#동구" onclick="Select_incheon('남동구')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 제주도지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_jeju" style="position: absolute; overflow:hidden; border:0px; z-index:3; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_jeju.gif" alt="제주지도" width="570" height="450" border="0" usemap="#Gis_jeju">
      <map name="Gis_jeju">
        <area shape="poly" coords="11,299,25,284,61,300,145,256,204,256,212,245,281,243,294,237,304,239,391,214,403,200,444,195,565,147,525,114,455,91,247,125,78,184,73,203,49,221,3,263" href="#제주시" onclick="Select_jeju('제주시')">
      <area shape="poly" coords="11,305,25,288,66,302,147,259,205,258,215,247,283,244,295,239,302,241,395,215,405,201,445,198,558,152,566,179,552,225,494,289,337,338,229,353,127,337,102,369,47,344" href="#서귀포시" onclick="Select_jeju('서귀포시')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 강원지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_kangwon" style="position: absolute; overflow:hidden; border:0px; z-index:4; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_kangwon.gif" alt="강원지도" width="570" height="450" border="0" usemap="#Gis_kangwon">

<map name="Gis_kangwon">
<area shape="poly" coords="326,107,289,121,301,139,330,125" href="#속초시" onclick="Select_kangwon('속초시')">
<area shape="poly" coords="325,371,330,363,309,331,344,293,361,277,361,240,336,238,329,229,313,247,269,258,260,272,265,300,255,318,259,333,269,340,279,363,295,358" href="#평창군" onclick="Select_kangwon('평창군')">
<area shape="poly" coords="325,211,297,206,307,169,299,156,289,156,289,145,298,141,331,129,380,193" href="#양양군" onclick="Select_kangwon('양양군')">
<area shape="poly" coords="294,207,275,221,261,209,243,225,234,206,215,203,199,191,197,181,224,167,215,139,233,101,224,80,242,71,265,83,268,106,291,109,287,122,295,137,282,149,285,157,297,161,303,170" href="#인제군" onclick="Select_kangwon('인제군')">
<area shape="poly" coords="325,216,297,210,275,225,263,215,243,229,229,209,211,208,199,195,185,223,170,217,163,220,171,242,157,247,121,267,96,255,104,278,159,295,203,282,223,267,258,272,267,257,310,245,324,231" href="#홍천군" onclick="Select_kangwon('홍천군')">
<area shape="poly" coords="196,193,193,178,199,171,182,168,169,161,167,171,105,153,93,176,107,187,112,205,90,222,91,245,121,263,166,240,159,213,185,220" href="#춘천시" onclick="Select_kangwon('춘천시')">
<area shape="poly" coords="204,170,219,162,213,135,231,100,223,85,159,83,179,163" href="#양구군" onclick="Select_kangwon('양구군')">
<area shape="poly" coords="291,115,293,106,269,103,267,81,245,71,261,39,266,3,287,17,324,103" href="#고성군" onclick="Select_kangwon('고성군')">
<area shape="poly" coords="159,165,102,147,88,171,75,149,83,140,110,97,113,81,135,68,156,78,174,159,168,156" href="#화천군" onclick="Select_kangwon('화천군')">
<area shape="poly" coords="72,145,35,145,3,106,9,77,83,87,109,81,109,92,78,142" href="#철원군" onclick="Select_kangwon('철원군')">
<area shape="poly" coords="361,236,339,236,324,215,379,197,432,275,429,291,407,295,386,289,383,303,351,293,363,278" href="#강릉시" onclick="Select_kangwon('강릉시')">
<area shape="poly" coords="255,339,251,315,261,300,257,274,227,271,205,283,161,295,139,307,149,327,163,335,176,313,221,336,209,354,229,363,240,341" href="#횡성군" onclick="Select_kangwon('횡성군')">
<area shape="poly" coords="449,423,440,399,429,399,419,385,423,367,419,351,405,363,400,383,400,399,393,404,403,429" href="#태백시" onclick="Select_kangwon('태백시')">
<area shape="poly" coords="247,381,245,371,222,367,205,356,217,336,177,316,165,337,150,330,141,351,143,405,189,404,227,396" href="#원주시" onclick="Select_kangwon('원주시')">
<area shape="poly" coords="401,430,391,404,365,392,347,396,324,378,295,359,278,365,267,340,239,342,229,365,246,367,249,383,260,408,368,433" href="#영월군" onclick="Select_kangwon('영월군')">
<area shape="poly" coords="393,401,397,384,390,372,389,329,410,319,409,299,388,292,383,307,349,294,312,330,331,361,326,375,346,391,362,389" href="#정선군" onclick="Select_kangwon('정선군')">
<area shape="poly" coords="464,436,452,420,441,395,429,395,423,383,425,367,418,346,405,359,397,376,391,330,411,321,421,329,455,317,505,398" href="#삼척시" onclick="Select_kangwon('삼척시')">
<area shape="poly" coords="455,314,420,328,411,317,412,296,433,293,435,277" href="#동해시" onclick="Select_kangwon('동해시')">
</map>
	  
	  </td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 서울지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_seoul" style="position: absolute; overflow:hidden; border:0px; z-index:5; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_seoul.gif" alt="서울지도" border="0" usemap="#Gis_seoul">
      <map name="Gis_seoul">
        <area shape="poly" coords="438,388,426,365,394,376,365,357,330,280,295,303,291,362,301,385,360,397,382,438,416,420" href="#서초구" onclick="Select_seoul('서초구')">
        <area shape="poly" coords="440,387,426,362,395,372,366,355,331,279,351,261,402,288,405,316,453,341,469,373,464,388" href="#강남구" onclick="Select_seoul('강남구')">
        <area shape="poly" coords="473,373,455,339,408,315,405,288,441,281,453,260,469,259,466,277,495,295,496,317,525,322,504,361" href="#송파구" onclick="Select_seoul('송파구')">
        <area shape="poly" coords="301,388,290,364,274,362,267,337,237,339,226,330,219,342,190,351,198,365,209,391,223,407,261,420" href="#관악구" onclick="Select_seoul('관악구')">
        <area shape="poly" coords="217,407,189,356,156,345,165,387,184,422,210,421" href="#금천구" onclick="Select_seoul('금천구')">
        <area shape="poly" coords="498,293,469,277,471,257,455,258,458,228,534,192,548,250,510,266" href="#강동구" onclick="Select_seoul('강동구')">
        <area shape="poly" coords="454,258,456,228,444,210,414,211,386,275,403,287,437,278" href="#광진구" onclick="Select_seoul('광진구')">
        <area shape="poly" coords="384,273,352,259,338,269,324,251,349,222,344,212,368,210,403,229" href="#성동구" onclick="Select_seoul('성동구')">
        <area shape="poly" coords="289,360,275,360,268,334,237,337,225,326,217,338,196,346,215,324,223,301,248,292,284,306,289,326" href="#동작구" onclick="Select_seoul('동작구')">
        <area shape="poly" coords="290,305,248,290,244,270,275,239,319,247,335,270,326,280" href="#용산구" onclick="Select_seoul('용산구')">
        <area shape="poly" coords="322,247,346,221,341,213,271,216,269,235" href="#중구" onclick="Select_seoul('중구')">
        <area shape="poly" coords="345,210,342,198,403,155,408,163,404,186,414,194,412,208,404,227,368,207" href="#동대문구" onclick="Select_seoul('동대문구')">
        <area shape="poly" coords="445,208,415,209,417,195,409,184,411,162,409,143,426,133,454,131,465,152" href="#중랑구" onclick="Select_seoul('중랑구')">
        <area shape="poly" coords="444,129,408,140,389,143,377,131,372,109,381,96,386,92,376,50,387,21,421,4,443,78,462,106" href="#노원구" onclick="Select_seoul('노원구')">
      <area shape="poly" coords="406,145,406,153,340,196,326,196,317,176,300,177,292,164,300,159,284,116,295,107,322,127,328,143,356,153,375,136,390,146" href="#성북구" onclick="Select_seoul('성북구')">
    <area shape="poly" coords="375,132,369,116,343,88,329,87,339,53,317,30,299,40,287,78,293,105,321,122,329,140,357,149" href="#강북구" onclick="Select_seoul('강북구')">
    <area shape="poly" coords="368,110,344,86,332,85,342,52,321,27,335,2,383,22,374,50,384,89" href="#도봉구" onclick="Select_seoul('도봉구')">
    <area shape="poly" coords="341,211,338,199,325,198,315,180,298,180,289,166,297,159,280,114,250,135,251,150,261,194,271,214" href="#종로구" onclick="Select_seoul('종로구')">
    <area shape="poly" coords="268,233,214,232,221,223,193,204,249,154,259,199,267,216" href="#서대문구" onclick="Select_seoul('서대문구')">
    <area shape="poly" coords="191,202,170,182,193,170,184,135,197,95,245,69,282,112,250,133,248,152" href="#은평구" onclick="Select_seoul('은평구')">
    <area shape="poly" coords="193,345,213,321,223,298,244,289,242,278,231,265,210,265,177,246,171,252,176,271,159,300,180,314,182,341" href="#영등포구" onclick="Select_seoul('영등포구')">
    <area shape="poly" coords="270,239,241,270,231,261,210,262,132,209,162,182,214,223,209,235" href="#마포구" onclick="Select_seoul('마포구')">
    <area shape="poly" coords="189,347,180,340,177,314,162,304,151,320,128,307,109,321,93,308,78,330,88,335,83,354,114,361,143,329,156,339,182,350" href="#구로구" onclick="Select_seoul('구로구')">
    <area shape="poly" coords="174,243,63,160,59,180,17,239,59,259,92,268,91,304,109,317,127,305,148,314,159,306,155,299,172,269,169,252" href="#강서구" onclick="Select_seoul('강서구')">
      </map></td>
  </tr>
</tbody></table>
</div>

<!-- ------------------- 울산지도용 레이어 선언 ---------------------------- visible/hidden -->
<div id="div_ulsan" style="position: absolute; overflow:hidden; border:0px; z-index:6; top:10; left:20; width:570; height:450; filter:alpha(opacity=100); visibility: hidden;">
<table style="border:0px; align:center; cellpadding:0px; cellspacing:0px">
  <tbody><tr>
    <td><img src="/resources/img/s_ulsan.gif" alt="울산지도" width="570" height="450" border="0" usemap="#Gis_ulsan">
      <map name="Gis_ulsan">
    <area shape="poly" coords="429,275,421,225,443,221,437,204,449,170,479,163,498,179,483,253,461,277" href="#동구" onclick="Select_ulsan('동구')">
    <area shape="poly" coords="407,290,429,278,419,223,391,193,298,187,282,193,279,204,333,251,401,294" href="#남구" onclick="Select_ulsan('남구')">
    <area shape="poly" coords="385,188,298,182,288,163,299,152,317,153,319,142,353,135,383,147" href="#중구" onclick="Select_ulsan('중구')">
    <area shape="poly" coords="421,222,437,219,433,208,447,169,485,157,514,132,472,73,378,45,328,87,327,135,353,133,383,141,385,149,389,186" href="#북구" onclick="Select_ulsan('북구')">
    <area shape="poly" coords="410,304" href="#" alt="여기는 어느지역일까요?"><area shape="poly" coords="347,442,401,413,411,301,329,255,277,206,279,192,294,184,284,164,298,149,315,151,317,141,323,136,323,87,289,78,287,63,307,23,179,3,45,113,19,183" href="#울주군" onclick="Select_ulsan('울주군')">
      </map></td>
  </tr>
</tbody></table>
</div>
</div>					  </td>
                  </tbody></table>
                  <!--지도선택:E-->
                </td>
              </tr>
            </tbody></table><!--GIS:E-->
          </form></td>
        </tr>
        <tr>
          <td valign="top">

			
			<!--선택지역 새목록:S-->
			
			<!--선택지역 새목록:E-->
          </td>
        </tr>
      </tbody></table>
    </td>
  </tr>
</tbody>
</table>
<div align="left" class="divs" style="background-color:white;">
</div>
</div>
<body>

</body>
</html>