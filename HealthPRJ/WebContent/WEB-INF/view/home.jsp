<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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

  <body>

    <!-- Page Content -->
    <div class="container">

      <!-- Heading Row -->
      
    <div style="width:100%;height:400px;" class="row">
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
	</div>
	
	  <div id="seoulMap" class="area-map ui-display-on"><!-- 서울특별시 -->
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
					</div>
					
	  <div class="divs"></div>
      
      <div class="row my-4">
        <div class="col-lg-8">
          <img class="img-fluid rounded" src="http://placehold.it/900x400" alt="">
        </div>
        <!-- /.col-lg-8 -->
        <div class="col-lg-4">
          <h1>Business Name or Tagline</h1>
          <p>This is a template that is great for small businesses. It doesn't have too much fancy flare to it, but it makes a great use of the standard Bootstrap core components. Feel free to use this template for any project you want!</p>
          <a class="btn btn-primary btn-lg" href="#">Call to Action!</a>
        </div>
        <!-- /.col-md-4 -->
      </div>
      <!-- /.row -->

      <!-- Call to Action Well -->
      <div class="card text-white bg-secondary my-4 text-center">
        <div class="card-body">
          <p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p>
        </div>
      </div>


      <!-- Content Row -->
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <h2 class="card-title">Card One</h2>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">More Info</a>
            </div>
          </div>
        </div>
        <!-- /.col-md-4 -->
        <div class="col-md-4 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <h2 class="card-title">Card Two</h2>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt pariatur voluptatem sunt quam eaque, vel, non in id dolore voluptates quos eligendi labore.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">More Info</a>
            </div>
          </div>
        </div>
        <!-- /.col-md-4 -->
        <div class="col-md-4 mb-4">
          <div class="card h-100">
            <div class="card-body">
              <h2 class="card-title">Card Three</h2>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem magni quas ex numquam, maxime minus quam molestias corporis quod, ea minima accusamus.</p>
            </div>
            <div class="card-footer">
              <a href="#" class="btn btn-primary">More Info</a>
            </div>
          </div>
        </div>
        <!-- /.col-md-4 -->

      </div>
      <!-- /.row -->

    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>
  
  <jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>
