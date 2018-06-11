<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
   String msg = (String) request.getAttribute("msg"); //Object형으로 나오기 때문에 문자형으로 변환시켜주기위해 앞에 (String)을 붙여줌.
   String url = (String) request.getAttribute("url");
%>

<script>
window.onload = function() {

	window.opener.top.location.href="http://localhost:8080/parkList.do?=%EC%97%B0%EC%B2%9C%EA%B5%B0";
		window.opener.top.location.reload(); //새로고침
		window.close();
}

</script>
