<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page import="com.health.DTO.freeDTO" %>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>




<%
   List<freeDTO> fList = (List<freeDTO>)request.getAttribute("fList");
   if(fList == null){
      fList = new ArrayList();
   }
  
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ParkMation</title>
    <link rel="icon" type="/image/png" href="/resources/img/tree.png">

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/css/small-business.css" rel="stylesheet">


	<jsp:include page="top.jsp" flush="false"></jsp:include>
	
	
	<script type="text/javascript" src="/resources/area/raphael_min.js"></script>
	<script type="text/javascript" src="/resources/area/raphael_path_s.korea.js"></script>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	
	<script>
	var sca = '01';
	
	
	function doDetail(n){
		var fr_no = n;
		   location.href="free_detail.do?fr_no="+ fr_no;
		}
	
	</script>
	
	
	
	<script>
	
	

	$(function(){

	
 	var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=9387cf9977f607739cd8bcf11b24d319";
        $.ajax({
            url: apiURI,
            dataType: "json",
            type: "GET",
            async: "false",
            success: function(resp) {
                 console.log(resp);
                console.log("현재온도 : "+ (resp.main.temp- 273.15));
                console.log("현재습도 : "+ resp.main.humidity);
                console.log("날씨 : "+ resp.weather[0].main );
                console.log("상세날씨설명 : "+ resp.weather[0].description );
                console.log("날씨 이미지 : "+ resp.weather[0].icon );
                console.log("바람   : "+ resp.wind.speed );
                console.log("나라   : "+ resp.sys.country );
                console.log("도시이름  : "+ resp.name );
                console.log("구름  : "+ (resp.clouds.all) +"%" );
                
                var tableStr ="<table>";
    			
    			tableStr += "<tr><th>현재온도</th><th>현재습도</th></tr>";
                tableStr += "<tr><th>"+ (resp.main.temp-273.15) +"</th><th>" + resp.main.humidity +"</th></tr>";
                tableStr += "<tr><th>날씨</th><th>상세날씨설명</th></tr>";
                tableStr += "<tr><th>"+ resp.weather[0].main +"</th><th>" + resp.weather[0].description +"</th></tr>";
                tableStr += "<tr><th>날씨 이미지</th><th>바람</th></tr>";
                tableStr += "<tr><th>"+ resp.weather[0].icon +"</th><th>" + resp.wind.speed +"</th></tr>";
                tableStr += "<tr><th>나라</th><th>도시이름</th></tr>";
                tableStr += "<tr><th>"+ resp.sys.country +"</th><th>" + resp.name +"</th></tr>";
                tableStr += "<tr><th>구름</th>";
                tableStr += "<tr><th>"+ (resp.clouds.all) +"%";
                
                    
               tableStr += "</table>";

   			$(".divs").append(tableStr);

                    
    		},
    		
    		error : function(error) {
    			
    			alert("error!");
    			
    		},
        

       
        });


	});




    	
/*         var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Sejong&appid=9387cf9977f607739cd8bcf11b24d319";
        $.ajax({
            url: apiURI,
            dataType: "json",
            type: "GET",
            async: "false",
            success: function(resp) {
                console.log(resp);
                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
                console.log("현재습도 : "+ resp.main.humidity);
                console.log("날씨 : "+ resp.weather[0].main );
                console.log("상세날씨설명 : "+ resp.weather[0].description );
                console.log("날씨 이미지 : "+ resp.weather[0].icon );
                console.log("바람   : "+ resp.wind.speed );
                console.log("나라   : "+ resp.sys.country );
                console.log("도시이름  : "+ resp.name );
                console.log("구름  : "+ (resp.clouds.all) +"%" );     
            }    
       
        }); */

        
</script>

<style>
.divTableCell{
display: inline-block;
}

div.blueTable {
  border: 0px solid #FFFFFF;
  background-color: #FFFFFF;
  width: 50%;
  text-align: left;
}
.divTable.blueTable .divTableCell, .divTable.blueTable .divTableHead {
  border: 0px solid #FFFFFF;
}
.divTable.blueTable .divTableBody .divTableCell {
  font-size: 15px;
  color: #333333;
}
.divTable.blueTable .divTableRow:nth-child(even) {
  background: #FFFFFF;
}
.divTable.blueTable .divTableHeading {
  background: #FFFFFF;
}
.divTable.blueTable .divTableHeading .divTableHead {
  font-size: 15px;
  font-weight: bold;
  color: #333333;
  text-align: left;
}
/* DivTable.com */
.divTable{ display: table; }
.divTableRow { display: table-row; }
.divTableHeading { display: table-header-group;}

.divTableHeading { display: table-header-group;}
.divTableFoot { display: table-footer-group;}
.divTableBody { display: table-row-group;}


#canvas {float:left; position:relative; width: 380px; height:430px; margin: 0;}
#south {width: 380px; height:430px; top: 0px; left: 0;}

#canvas h2{ padding:0; margin:0; font-size:12px; }

#seoul, #gygg, #incheon, #gangwon, #chungbuk, #chungnam, #daejeon, #sejong, #jeonbuk, #jeonnam, #gwangju, #gyeongbuk, #gyeongnam, #daegu, #busan, #ulsan, #jeju { display: none; position: absolute; height:16px; background-color:#000; color:#fff; padding:2px 5px; text-align:center;}

#seoul{ left:80px; top:75px; }
#gygg{ left:80px; top:45px; }
#incheon{ left:60px; top:75px; }
#gangwon{ left:150px; top:45px; }
#chungbuk{ left:120px; top:145px; }
#chungnam{ left:60px; top:165px; }
#daejeon{ left:80px; top:165px; }
#sejong{ left:70px; top:145px; }
#jeonbuk{ left:60px; top:205px; }
#jeonnam{ left:60px; top:260px; }
#gwangju{ left:	60px; top:260px; }
#gyeongbuk{ left:150px; top:165px; }
#gyeongnam{ left:130px; top:240px; }
#daegu{ left:170px; top:210px; }
#busan{ left:190px; top:250px; }
#ulsan{ left:200px; top:225px; }
#jeju{ left:80px; top:340px; }

.row, #canvas{
display: inline-block;
}
#seoulMap, #seoulAllMap{
display: inline-block;
}
.divs{
display: inline-block;
}
</style>
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
  
  <body>

    <!-- Page Content -->
    <div class="container">

      <!-- Heading Row -->
      
   <!--  <div style="width:100%;height:400px;" class="row">
	<div id="canvas">

	<div id="south"></div>
	<div id="seoul"><h2>서울특별시</h2></div>
	<div id="gygg"><h2>경기도</h2></div>
	<div id="incheon"><h2>인천광역시</h2></div>
	<div id="gangwon"><h2>강원도</h2></div>
	<div id="chungbuk"><h2>충청북도</h2></div>
	<div id="chungnam"><h2>충청남도</h2></div>
	<div id="daejeon"><h2>대전광역시</h2></div>
	<div id="sejong"><h2>세종특별자치시</h2></div>
	<div id="gwangju"><h2>광주광역시</h2></div>
	<div id="jeonbuk"><h2>전라북도</h2></div>
	<div id="jeonnam"><h2>전라남도</h2></div>
	<div id="gyeongbuk"><h2>경상북도</h2></div>
	<div id="gyeongnam"><h2>경상남도</h2></div>
	<div id="daegu"><h2>대구광역시</h2></div>
	<div id="busan"><h2>부산광역시</h2></div>
	<div id="ulsan"><h2>울산광역시</h2></div>
	<div id="jeju"><h2>제주특별자치도</h2></div>

	</div>
	</div> -->
<div style="background-color:white;" class="map" align="center">
<img src="/resources/img/map.png" alt="전국지도" width="340" height="499" border="0" usemap="#Map">
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
</map>



    <img src="/resources/img/s_seoul.gif" alt="서울지도" border="0" usemap="#Gis_seoul">
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
      </map>
      
      <img src="/resources/img/s_kyonggi.gif" alt="경기지도" width="570" height="450" border="0" usemap="#Gis_gyeongki">
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

</div>
	
	
	
	  <!-- <div id="seoulMap" class="area-map ui-display-on">서울특별시
	  <img usemap="#seoulArea" alt="서울특별시 구선택 지도" src="/resources/img/map.png" id="seoulAllMap">
	  <map name="seoulArea" id="seoulArea">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_01.gif" onclick="javascript:setSiCode('11320');" alt="서울특별시 도봉구" coords="277,26,277,45,285,60,283,69,278,69,282,82,309,102,314,91,320,91,316,74,314,33,308,28,300,33,293,23,283,22">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_02.gif" onclick="javascript:setSiCode('11350');" alt="서울특별시 노원구" coords="319,34,316,66,322,90,313,96,310,106,327,125,368,115,376,104,376,93,370,89,363,90,356,85,355,73,360,60,356,49,359,37,342,25">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_03.gif" onclick="javascript:setSiCode('11305');" alt="서울특별시 강북구" coords="274,39,258,46,260,66,247,77,252,86,252,100,282,128,298,131,306,128,314,113,297,92,281,83,274,70,283,65,284,58">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_04.gif" onclick="javascript:setSiCode('11260');" alt="서울특별시 중랑구" coords="348,119,337,122,339,164,344,171,344,179,356,182,367,178,379,154,383,149,379,145,385,130,381,119,371,117,359,122">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_05.gif" onclick="javascript:setSiCode('11290');" alt="서울특별시 성북구" coords="251,101,242,106,251,119,252,141,245,148,259,155,267,155,273,160,273,166,282,167,285,172,295,163,304,150,327,141,337,133,336,126,327,127,315,115,307,124,306,130,297,134,290,131,279,131,267,114">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_06.gif" onclick="javascript:setSiCode('11230');" alt="서울특별시 동대문구" coords="336,136,324,145,314,145,313,151,306,151,294,168,291,180,307,178,327,192,337,192,343,179,343,169,336,165">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_07.gif" onclick="javascript:setSiCode('11110');" alt="서울특별시 종로구" coords="224,110,216,123,221,144,227,151,225,167,219,172,235,186,244,181,251,185,269,185,278,179,290,179,292,170,283,175,280,170,270,170,270,157,264,155,257,158,242,148,251,140,250,120,239,107">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_08.gif" onclick="javascript:setSiCode('11380');" alt="서울특별시 은평구" coords="177,89,179,100,175,111,175,117,169,134,167,160,150,157,169,171,181,159,186,166,195,158,196,153,207,147,206,141,219,137,218,128,215,114,235,105,226,84,214,74,207,73,197,85">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_09.gif" onclick="javascript:setSiCode('11410');" alt="서울특별시 서대문구" coords="217,136,208,142,207,148,198,154,185,168,179,162,171,173,201,200,232,195,231,187,217,172,225,163,226,150,219,146">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_10.gif" onclick="javascript:setSiCode('11440');" alt="서울특별시 마포구" coords="148,156,142,171,124,176,155,204,169,209,179,218,198,218,212,225,227,212,228,198,209,203,194,197,190,189">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_11.gif" onclick="javascript:setSiCode('11140');" alt="서울특별시 중구" coords="243,183,235,187,234,197,229,199,229,204,240,200,243,203,247,200,264,209,272,206,274,211,289,190,288,182,274,184,264,187,250,187">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_12.gif" onclick="javascript:setSiCode('11170');" alt="서울특별시 용산구" coords="237,202,229,207,229,212,215,228,217,236,217,241,244,248,251,255,257,254,284,227,274,220,273,214,269,207,263,211,248,203">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_13.gif" onclick="javascript:setSiCode('11200');" alt="서울특별시 성동구" coords="289,182,289,192,273,213,274,220,282,223,284,228,298,221,325,232,339,196,335,192,326,192,308,179,297,182">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_14.gif" onclick="javascript:setSiCode('11215');" alt="서울특별시 광진구" coords="344,181,323,232,336,239,353,239,366,230,375,216,377,199,365,199,363,194,368,189,367,180,357,184">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_15.gif" onclick="javascript:setSiCode('11740');" alt="서울특별시 강동구" coords="432,171,416,183,396,185,380,198,377,216,389,221,384,235,409,246,421,229,427,212,445,211,449,205,441,184,441,171">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_16.gif" onclick="javascript:setSiCode('11710');" alt="서울특별시 송파구" coords="377,217,355,240,334,241,335,263,345,269,376,284,389,309,399,309,394,302,400,299,401,301,407,296,412,296,417,284,421,284,426,274,418,263,407,265,403,257,406,248,384,237,387,222">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_17.gif" onclick="javascript:setSiCode('11680');" alt="서울특별시 강남구" coords="296,221,280,235,293,269,298,285,305,286,318,307,330,306,345,299,361,317,377,317,383,321,389,310,376,286,356,274,341,269,333,256,333,243">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_18.gif" onclick="javascript:setSiCode('11650');" alt="서울특별시 서초구" coords="278,236,254,257,246,257,245,266,251,270,251,290,249,293,249,302,256,317,264,316,270,311,278,325,289,322,298,313,303,321,304,344,319,357,336,356,350,342,359,319,348,301,327,308,318,309,305,290,296,289,294,274,289,260">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_19.gif" onclick="javascript:setSiCode('11590');" alt="서울특별시 동작구" coords="172,285,191,280,197,275,228,278,234,297,243,299,247,297,250,271,245,254,219,244,193,249,189,269,179,277">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_20.gif" onclick="javascript:setSiCode('11545');" alt="서울특별시 금천구" coords="144,286,143,298,154,327,168,348,178,350,195,331,190,323,180,323,179,309,174,304,178,298,168,296,158,298">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_21.gif" onclick="javascript:setSiCode('11620');" alt="서울특별시 관악구" coords="193,277,168,293,181,297,175,305,183,313,182,322,190,321,199,338,208,348,228,344,242,334,252,321,252,307,247,300,232,301,229,293,226,279">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_22.gif" onclick="javascript:setSiCode('11530');" alt="서울특별시 구로구" coords="95,259,82,276,87,283,84,300,111,301,113,292,134,279,142,282,165,295,167,288,160,262,147,251,136,265,130,261,119,258,106,267">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_23.gif" onclick="javascript:setSiCode('11470');" alt="서울특별시 양천구" coords="95,212,92,227,96,237,92,249,92,258,100,258,104,265,121,256,134,264,145,250,147,235,155,230,148,211,133,207,131,225,132,230,117,239,106,236">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_24.gif" onclick="javascript:setSiCode('11560');" alt="서울특별시 영등포구" coords="146,197,157,227,157,233,148,237,148,251,165,280,168,286,184,273,189,266,192,248,214,242,215,233,210,226,198,220,179,220,165,211">
							<area shape="poly" href="#" class="js-ajax js-image-changer ui-set-image-changer ui-set-ajax-link" data-image="#seoulAllMap" data-image-over="/img/section/ln/map/map_seoul_25.gif" onclick="javascript:setSiCode('11500');" alt="서울특별시 강서구" coords="65,139,66,152,68,157,61,171,51,175,45,197,34,199,45,211,63,221,74,215,89,217,95,212,101,217,108,234,124,237,131,231,129,208,133,206,139,208,146,208,144,197,118,175">
						</map>
					</div> -->
					
	  <div class="divs"></div>
      
      
<div align="right"><a href="freeList.do" style="color:black" >+ 더보기</a></div>
<div align="right">        
<div class="divTable blueTable">
<div class="divTableHeading">
<div class="divTableRow">
<div class="divTableHead" style="font-size:20px;">오늘의 자유게시판</div>
<hr>
<!-- <div class="divTableHead">작성자</div>
<div class="divTableHead">조회수</div>
<div class="divTableHead">작성일</div> -->
</div>
</div>
<div class="divTableBody">
<%for (freeDTO uDTO : fList) { %>
<div class="divTableRow">
<div class="divTableCell" onclick="doDetail(<%=uDTO.getFr_no()%>)""><%=uDTO.getTitle() %></div><a style="color:red">(<%=uDTO.getCnt() %>)</a>
<%-- <div class="divTableCell"><%=uDTO.getUser_id() %></div>
<div class="divTableCell"><%=uDTO.getCnt() %></div>
<div class="divTableCell"><%=uDTO.getReg_dt() %></div> --%>
</div>
<%} %>
</div>
</div>
</div>
</div>
<br>
    <!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>
  
  <jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>
