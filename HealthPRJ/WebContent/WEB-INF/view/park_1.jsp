<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.health.util.CmmUtil"%>
<%@ page import="com.health.DTO.freeDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%
	request.setCharacterEncoding("UTF-8");
	freeDTO rDTO = (freeDTO) request.getAttribute("rDTO");
	/* List<FiCommentDTO> list = (List<FiCommentDTO>) request.getAttribute("list"); */

	//공지글 정보를 못불러왔다면, 객체 생성
	if (rDTO == null) {
		rDTO = new freeDTO();

	}

	//게시판 조회 결과 보여주기
/* 	if (list == null) {
		list = new ArrayList<FiCommentDTO>();
}*/

	String ss_user_name = CmmUtil.nvl((String) session.getAttribute("session_user_name"));
	String ss_user_no = CmmUtil.nvl((String) session.getAttribute("session_user_no"));
	String ss_user_id = CmmUtil.nvl((String) session.getAttribute("session_user_id"));
	
	//본인이 작성한 글만 수정 가능하도록 하기(1:작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
	int edit = 1;

	//로그인 안했다면
	if (ss_user_name.equals("")) {
		edit = 3;

		//본인이 작성한 글이면 2가 되도록 변경
	} else if (ss_user_name.equals(CmmUtil.nvl(rDTO.getUser_name()))) {
		edit = 2;

	} else if (ss_user_name.equals("관리자")){
		edit = 4;
	}

	System.out.println("ss_user_name : " + ss_user_name);
%>

<!DOCTYPE html>
<html lang="en">
<head>

	<title>공원정보상세</title>
	<jsp:include page="top.jsp" flush="false"></jsp:include>
</head>


</body>

<jsp:include page="footer.jsp" flush="false"></jsp:include>

</html>