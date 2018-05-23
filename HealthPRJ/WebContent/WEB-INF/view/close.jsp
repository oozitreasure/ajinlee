<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
window.onload = function() {
	window.opener.top.location.href="/home.do"
		window.opener.top.location.reload(); //새로고침
		window.close();
}

</script>
