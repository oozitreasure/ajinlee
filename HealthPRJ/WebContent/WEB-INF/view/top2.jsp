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

    <title>ParkMation</title>

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

 </script>
 
<body data-spy="scroll" data-target="#topnav" onload="doSearch()">

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
    </div>
</div>