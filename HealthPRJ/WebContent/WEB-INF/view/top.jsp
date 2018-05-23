<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
<%@ page import="com.health.DTO.mainDTO" %>
<%@ page import="com.health.util.CmmUtil" %>
<!DOCTYPE html>
<html lang="en">

  <head>
  
 <%

request.setCharacterEncoding("euc-kr");

String SESSION_USER_ID = CmmUtil.nvl((String)session.getAttribute("session_user_id"));
String SESSION_USER_NO = CmmUtil.nvl((String)session.getAttribute("session_user_no"));
String SESSION_USER_NAME = CmmUtil.nvl((String)session.getAttribute("session_user_name"));

%>


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
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
  </head>
<script type="text/javascript">

 
 function openLogin()
 {
     window.name = "LoginForm";
     window.open("login.do", "childForm", "width=450, height=500,left=730, top=230, resizable = no, scrollbars = no"); 
   
 }		
 </script>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="home.do" style="font-size:30px;"><b>ParkMation</b></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <% if (SESSION_USER_ID.equals(" ")||SESSION_USER_ID.equals("")) {%>
            <li class="nav-item">
              <a class="nav-link" onclick="openLogin()" style="font-size:20px; color:black;">Login</a>
            </li>
           <li class="nav-item">
              <a class="nav-link" href="register.do" style="font-size:20px; color:black;">Join</a>
            </li>
            <%} else {%>
            <li class="nav-item">
              <a class="nav-link" href="mypage.do" style="font-size:20px; color:black;"><%=SESSION_USER_NAME %>님!</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/logout_proc.do" style="font-size:20px; color:black;">Logout</a>
            </li>
            <%if (SESSION_USER_ID.equals("admin")){ %>
			<li class="nav-item">
              <a class="nav-link" href="userList.do" style="font-size:20px; color:black;">회원정보</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="park.do" style="font-size:20px; color:black;">Park</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="board.do" style="font-size:20px; color:black;">Board</a>
            </li>
            <%}else{ %>      
               <%} %>
            <%} %>
            <% if (!SESSION_USER_ID.equals("admin")&&!SESSION_USER_ID.equals("")&&!SESSION_USER_ID.equals(" ")) {%>
            <li class="nav-item">
              <a class="nav-link" href="park.do" style="font-size:20px; color:black;">Park</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="board.do" style="font-size:20px; color:black;">Board</a>
            </li>
            <%} %>
          </ul>

        </div>
      </div>
      <input type="text" style="height:35px;">
      <button class="dd" style="border:0px; background-color:transparent;"><img src="/resources/img/search1.png" style="width:45px; height:45px"></button>
    </nav>
    
    <!-- Bootstrap core JavaScript -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<br>
  </body>

</html>
