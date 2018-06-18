<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.util.CmmUtil" %>


 <%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="/resources/cupid/images/favicon.png">

    <title>공원정보리스트</title>

    <!-- Bootstrap core CSS -->
    <link href="/resources/cupid/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/cupid/skins/eden.css" rel="stylesheet">
    <link href="/resources/cupid/css/animate.min.css" rel="stylesheet">
    <link href="/resources/cupid/css/icons/icons.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/resources/cupid/style.css" rel="stylesheet">


    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="bootstrap/js/html5shiv.js"></script>
    <script src="bootstrap/js/respond.min.js"></script>
    <![endif]-->

</head>
<script type="text/javascript">
 
  function openLogin()
 {
     window.name = "LoginForm";
     window.open("login.do", "childForm", "width=450, height=600, left=730, top=200, resizable = no, scrollbars = no"); 
   
 }
 
 function openJoin()
 {
     window.name = "JoinForm";
     window.open("register.do", "childForm", "width=450, height=700, left=730, top=120, resizable = no, scrollbars = no"); 
   
 }	 
 
 function openMap()
 {
     window.name = "MapForm";
     window.open("map.do", "childForm", "width=1220, height=730, left=350, top=120, resizable = no, scrollbars = no"); 
   
 }	
 
 function parkIn(){
		
	   location.href="park.do";
	}
 
 function freeIn(){
		
	   location.href="freeList.do";
	}
 
 </script>
 
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
 		location.href="/parkSearch.do";
 		
 	} else {
 		
 		$.ajax({
 			
 			url : "/parkSearch.do",
 			method : "post",
 			data : {'search' : search},
 			datatype : "json", 
 			success : function(data) {
 				
 					var contents = "";
 					var content = "";
 					
					contents += "<div class='divTable blueTable' style='width:100%'>";
					contents += "<div class='divTableHeading'>";
					contents += "<div class='divTableRow'>";
					contents += "<div class='divTableHead'>공원명</div>";
					contents += "<div class='divTableHead'>공원주소</div>";
					contents += "<div class='divTableHead'>관리기관명</div>";
					contents += "<div class='divTableHead'>전화번호</div></div></div>";
					contents += "<div class='divTableBody'>";
				$.each(data, function (key, value) {
					content += "<div class='divTableRow'>";
					console.log(value.admin_no);
		 			content += "<div class='divTableCell' onclick=doDetail('"+value.admin_no +"');>"+value.park_name+"</div>";
		 			console.log("admin_no : " + value.admin_no);
		 			content += "<div class='divTableCell'>"+value.addr1+"</div>";
		 			content += "<div class='divTableCell'>"+value.admin_name+"</div>";
		 			content += "<div class='divTableCell'>"+value.number+"</div></div>";
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
 
 <script src="/resources/js/jquery-3.3.1.min.js"></script>

<body data-spy="scroll" data-target="#topnav">

<div class="navbar navbar-color navbar-fixed-top" id="topnav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon icon-reorder"></span>

            </button>
            <!-- <a class="navbar-brand" href="#">ParkMation</a> -->
        </div>
	<div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="home.do">홈</a></li>
                <% if (SESSION_USER_ID.equals(" ")||SESSION_USER_ID.equals("")) {%>
                <li><a onclick="openLogin()">로그인</a></li>
                <li><a onclick="openJoin()">회원가입</a></li>
                <%} else {%>
                <li><a href="mypage.do"><b><%=SESSION_USER_NAME %>님!</b></a></li>
                <li><a href="/logout_proc.do">로그아웃</a></li>
                 <%if (SESSION_USER_ID.equals("admin")){ %>
                <li><a href="userList.do">회원정보</a></li>
                <%}else{ %> 
               <%} %>
            <%} %>
             <% if (!SESSION_USER_ID.equals("")&&!SESSION_USER_ID.equals(" ")) {%>
            <li><a onclick="openMap()">지역검색</a></li>
            <li><a href="parkList2.do">공원정보</a></li>
            <li><a href="freeList.do">자유게시판</a></li>
              <%} %>
            </ul>

        </div>
        <!--/.navbar-collapse -->
    </div>
</div>

<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron" id="home">
    <div class="intro">
        <div class="container">
            <div class="row">
            <br><br>
                <h1 class="text-center">Park Mation</h1>

                <h3 class="text-center">Have A Good Rest In A Good Park</h3><br/>
            </div>




            </div>

        </div>
    </div>


<!-- <section id="services">
<div class="container">
    Example row of columns
    <div class="row features">
        <div class="col-md-12 text-center">
            <h2>Amazing Features</h2>

            <p>Product is packed with everything you may ever need. Product is packed with everything <Br/>you may ever
                need. Product is packed with everything you may ever need. </p>
        </div>
    </div>
    <div class="row features">

        <div class="col-lg-2 col-sm-4">
            <div class="hexicon">
                <div class="inicon retina"></div>
            </div>
        </div>

        <div class="col-lg-2 col-sm-4">
            <div class="hexicon">
                <div class="inicon support"></div>
            </div>
        </div>

        <div class="col-lg-2 col-sm-4">
            <div class="hexicon">
                <div class="inicon speed"></div>
            </div>
        </div>

        <div class="col-lg-2 col-sm-4">
            <div class="hexicon">
                <div class="inicon social"></div>
            </div>
        </div>
        <div class="col-lg-2 col-sm-4">
            <div class="hexicon">
                <div class="inicon shopping"></div>
            </div>
        </div>
        <div class="col-lg-2 col-sm-4">
            <div class="hexicon">
                <div class="inicon cloud"></div>
            </div>
        </div>


    </div>


</div>
</section>

<section class="slider" id="features">
    <div class="container">
        <div class="inner-page">
            <h2 class="text-center">Awesome Story.</h2>

            <p class="text-center">Tell your projects awesome story. Tell your projects awesome story. Tell your<br/>
                projects awesome story. Tell your projects awesome story.</p>
        </div>
        <div class="row inner-page">


            <div class="col-md-4">
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="icon-group"></i>
                    </div>
                    <div class="feature-box-info">
                        <h4 class="shorter">Customer Support</h4>

                        <p class="tall">Lorem ipsum dolor sit amet, consectetur </p>
                    </div>
                </div>
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="icon-file"></i>
                    </div>
                    <div class="feature-box-info">
                        <h4 class="shorter">HTML5 / CSS3 / JS</h4>

                        <p class="tall">Lorem ipsum dolor sit amet, adip.</p>
                    </div>
                </div>

            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="icon-film"></i>
                    </div>
                    <div class="feature-box-info">
                        <h4 class="shorter">Sliders</h4>

                        <p class="tall">Lorem ipsum dolor sit amet, consectetur.</p>
                    </div>
                </div>
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="icon-magic small user"></i>
                    </div>
                    <div class="feature-box-info">
                        <h4 class="shorter">Icons</h4>

                        <p class="tall">Lorem ipsum dolor sit amet, consectetur </p>
                    </div>
                </div>

            </div>
            <div class="col-md-4">

                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="icon-reorder"></i>
                    </div>
                    <div class="feature-box-info">
                        <h4 class="shorter">Buttons</h4>

                        <p class="tall">Lorem ipsum dolor sit, consectetur adip.</p>
                    </div>
                </div>
                <div class="feature-box">
                    <div class="feature-box-icon">
                        <i class="icon-desktop"></i>
                    </div>
                    <div class="feature-box-info">
                        <h4 class="shorter">Lightbox</h4>

                        <p class="tall">Lorem sit amet, consectetur adip.</p>
                    </div>
                </div>
            </div>


        </div>
    </div>
</section>

<section class="portfolio" id="portfolio">
<div class="container">
    <div class="row">
        <div class="col-md-12 text-center inner-page">
            <h2>Our Projects</h2>

            <p>Lorem Ipsum is simply dummy text of the printing and
                typesetting industry. Lorem Ipsum <br/>has been the
                industry's standard dummy text ever since the 1500s,</p>
        </div>
    </div>
</div>


<div class="clr"></div>
    <div class="container">
    <div class="row">
        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/1.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/2.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/3.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/4.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/5.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/6.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/7.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="portfolio-block"><img src="/resources/cupid/images/projects/8.jpg" alt="Protect" />
                <div class="portfolio-caption text-center animated">
                    <h3 class="animated">Portfolio Item #1</h3>

                    <a href="#" class="btn btn-social btn-skype btn-sm animated"><i class="tn-plus"></i></a>
                    <a href="#" class="btn btn-social btn-stack-overflow btn-sm animated"><i class="tn-arrow-right"></i></a>
                </div>
            </div>
        </div>



    </div>
    </div>

</section>

<section class="pricing" id="pricing">

    <div class="container">
        <div class="row">
            <div class="col-md-12 pricing-intro white">
                <h2 class="page-headline large text-center">Tell your projects awesome story.</h2>

                <p class="text-center">Tell your projects awesome story. Tell your projects awesome story. Tell your
                    projects awesome story. Tell your projects awesome story.</p>
            </div>
        </div>
    </div>


    <div class="container">

        <div class="row pricing-table">
            <div class="col-md-3">
                <div class="panel panel-danger">
                    <div class="panel-heading"><h3 class="text-center">DEV PLAN</h3></div>
                    <div class="panel-body text-center">
                        <div class="pricing-circle bg-danger">$10.00</div>

                        <a class="btn btn-lg btn-block btn-danger" href="#">BUY NOW!</a>

                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                    </ul>

                </div>

            </div>
            <div class="col-md-3">
                <div class="panel panel-info">
                    <div class="panel-heading"><h3 class="text-center">PRO PLAN</h3></div>
                    <div class="panel-body text-center">
                        <div class="pricing-circle bg-info">$10.00</div>
                        <a class="btn btn-lg btn-block btn-info" href="#">BUY NOW!</a>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                    </ul>

                </div>

            </div>
            <div class="col-md-3">
                <div class="panel panel-success">
                    <div class="panel-heading"><h3 class="text-center">FREE PLAN</h3></div>
                    <div class="panel-body text-center">
                        <div class="pricing-circle bg-success">$10.00</div>
                        <a class="btn btn-lg btn-block btn-primary" href="#">BUY NOW!</a>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                    </ul>

                </div>

            </div>
            <div class="col-md-3">
                <div class="panel panel-warning">
                    <div class="panel-heading"><h3 class="text-center">FREE PLAN</h3></div>
                    <div class="panel-body text-center">
                        <div class="pricing-circle bg-warning">$10.00</div>
                        <a class="btn btn-lg btn-block btn-warning" href="#">BUY NOW!</a>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Personal use</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> Unlimited projects</li>
                        <li class="list-group-item"><i class="icon-ok text-danger"></i> 27/7 support</li>
                    </ul>

                </div>

            </div>
        </div>
    </div>


</section>
<section class="gray">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="text-center">Tell your projects awesome story.</h3>
            </div>
        </div>
    </div>
</section>
<section class="about" id="clients">
    <div class="dmask">

        <div class="our-clients">
            <div class="container">
                <div class="row">
                    <div class="client" style="background-position: 50% 27px;">
                        <div class="client-logo">
                            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12">
                                <div class="clients-title">
                                    <h3 class="title">Our <span>Clients</span></h3>

                                    <div class="carousel-controls pull-right">
                                        <a data-slide="prev" rel="crs" href="#client-carousel" class="prev btn-mini"><i
                                                class="icon-angle-left"></i></a>
                                        <a data-slide="next" rel="crs" href="#client-carousel" class="next btn-mini"><i
                                                class="icon-angle-right"></i></a>

                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="client-carousel slide" id="client-carousel">
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d1 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-1.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d2 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-2.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d3 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-3.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item animate_afc d4 animate_start">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-4.png" alt="Upportdash"></a></div>
                                                </div>
                                            </div>
                                            <div class="item">
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-5.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-4.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-3.png" alt="Upportdash"></a></div>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 item">
                                                    <div class="item-inner"><a style="cursor: pointer;"><img
                                                            src="/resources/cupid/images/logo-2.png" alt="Upportdash"></a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                Testimonials Widget Start
                                <div class="row ">
                                    <div class="testimonials widget">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="testimonials-title">
                                                <h3 class="title">Client <span>Testimonials</span></h3>

                                                <div class="carousel-controls pull-right">
                                                    <a data-slide="prev" rel="crs" href="#testimonials-carousel"
                                                       class="prev btn-mini"><i class="icon-angle-left"></i></a>
                                                    <a data-slide="next" rel="crs" href="#testimonials-carousel"
                                                       class="next btn-mini"><i class="icon-angle-right"></i></a>

                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="testimonials-carousel slide animate_afr d5 animate_start"
                                             id="testimonials-carousel">
                                            <div class="carousel-inner">
                                                <div class="item">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="testimonial item">
                                                            <p>
                                                                Lorem Ipsum is simply dummy text of the printing and
                                                                typesetting industry. Lorem Ipsum has been the
                                                                industry's standard dummy text ever since the 1500s,
                                                                when an unknown printer took a galley of type.
                                                            </p>

                                                            <div class="testimonials-arrow">
                                                            </div>
                                                            <div class="author">
                                                                <div class="testimonial-image "><img
                                                                        src="/resources/cupid/images/team-member-1.jpg" alt=""></div>
                                                                <div class="testimonial-author-info">
                                                                    <a style="cursor: pointer;">Monica Sing</a> Template
                                                                    Eden
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item active">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="testimonial item">
                                                            <p>
                                                                Lorem Ipsum is simply dummy text of the printing and
                                                                typesetting industry. Lorem Ipsum has been the
                                                                industry's standard dummy text ever since the 1500s,
                                                                when an unknown printer took a galley of type.
                                                            </p>

                                                            <div class="testimonials-arrow">
                                                            </div>
                                                            <div class="author">
                                                                <div class="testimonial-image "><img
                                                                        src="/resources/cupid/images/team-member-2.jpg" alt=""></div>
                                                                <div class="testimonial-author-info">
                                                                    <a href="#">John Doe</a> Template Eden
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="item">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="testimonial item">
                                                            <p>
                                                                Lorem Ipsum is simply dummy text of the printing and
                                                                typesetting industry. Lorem Ipsum has been the
                                                                industry's standard dummy text ever since the 1500s,
                                                                when an unknown printer took a galley of type.
                                                            </p>

                                                            <div class="testimonials-arrow">
                                                            </div>
                                                            <div class="author">
                                                                <div class="testimonial-image "><img
                                                                        src="/resources/cupid/images/team-member-3.jpg" alt=""></div>
                                                                <div class="testimonial-author-info">
                                                                    <a style="cursor: pointer;">Carol Johansen</a>
                                                                    Template Eden
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> 
</section>

<section class="contact" id="contact">

    <div class="container">

        <div class="row">

            <div class="col-md-6">

                <div class="alert alert-success hidden" id="contactSuccess">
                    <strong>Success!</strong> Your message has been sent to us.
                </div>

                <div class="alert alert-error hidden" id="contactError">
                    <strong>Error!</strong> There was an error sending your message.
                </div>

                <h2 class="short"><strong>Contact</strong> Us</h2>

                <form class="clearfix" accept-charset="utf-8" method="get" action="#">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <label for="name">Name</label>
                            <input type="text" placeholder="" value="" name="name" id="name"
                                   class="form-control input-lg">
                        </div>

                        <div class="col-sm-6 form-group">
                            <label for="email">Email Address</label>
                            <input type="email" placeholder="" value="" name="email" id="email"
                                   class="form-control input-lg">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 form-group">
                            <label for="message">Message</label>
                            <textarea rows="4" name="message" id="message" class="form-control"></textarea>
                        </div>
                    </div>

                    <button class="btn btn-success btn-xlg" type="submit">Send Message</button>
                </form>
            </div>
            <div class="col-md-offset-1 col-md-5">
                <br/>
                <h4 class="pull-top">Get in <strong>touch</strong></h4>

                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur eget leo at velit imperdiet
                    varius. In eu ipsum vitae velit congue iaculis vitae at risus.</p>

                <hr>

                <h4>The <strong>Office</strong></h4>
                <ul class="unstyled">
                    <li><i class="icon-map-marker"></i> <strong>Address:</strong> 1234 Street Name, City Name, United
                        States
                    </li>
                    <li><i class="icon-phone"></i> <strong>Phone:</strong> (123) 456-7890</li>
                    <li><i class="icon-envelope"></i> <strong>Email:</strong> <a href="mailto:mail@example.com">mail@example.com</a>
                    </li>
                </ul>


            </div>


        </div>

    </div>

</section> -->

<footer id="footer" style="position: fixed;bottom: 0; right: 0; width: 100%;">

    <div class="footer-copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <a class="logo" href="/resources/cupid/index.html">
                        <img src="/resources/cupid/images/logo.png" alt="Template Eden">
                    </a>
                </div>
                <div class="col-md-5">
                    <p>&copy; Copyright 2013 by Template Eden. All Rights Reserved.</p>
                </div>
                <div class="col-md-5">
                    <nav id="footer-menu">
                        <ul>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Sitemap</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/resources/cupid/js/jquery.js"></script>
<script src="/resources/cupid/bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(function () {
        if($(window).width()>960){
        var tw = $('.triangles').width()/7+32;
        var ta = tw/2+22;
        $('.down-triangle').css('border-top',tw+'px solid rgba(0,0,0,0.8)').css('border-left',ta+'px solid transparent').css('border-right',ta+'px solid transparent');
        $('.up-triangle').css('border-bottom',tw+'px solid rgba(0,0,0,0.8)').css('border-left',ta+'px solid transparent').css('border-right',ta+'px solid transparent');
        }
        $('#wd-wrapper').sinusoid({
            minImgW: 80,
            maxImgW: 130,
            minImgAngle: -20,
            maxImgAngle: 20,
            leftFactor: 60,
            sinusoidFunction: {
                A: 70,
                T: 1700,
                P: 0
            }
        });


        $('a[href*=#]:not([href=#]):not([rel=crs])').click(function() {
            if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });

    });
</script>
</body>
</html>
