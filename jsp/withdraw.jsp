<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String psw = request.getParameter("password");

MemberDAO dao = new MemberDAO();

int errorCode = 0;
if(!dao.findByMemberId(id))
	errorCode = 1;
if(errorCode > 0) {
	return;
}

int count = dao.deleteById(id, psw);
if(count < 1) {
	out.print("회원탈퇴 중 알 수 없는 에러가 발생했습니다.");
	return;
}
response.sendRedirect("../html/main.html");
%>
</body>
</html>