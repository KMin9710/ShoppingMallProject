<%@page import="java.io.File"%>
<%@page import="dto.MemberDTO"%>
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
	String confirmpsw = request.getParameter("confirmpassword");
	String name = request.getParameter("name");
	String email = request.getParameter("email");

	MemberDAO dao = new MemberDAO();
	//errorcode
	//0 : 성공, 1 : 사용할 수 없는 아이디, 2 : 패스워드 확인 실패

	int errorCode = 0;
	if (dao.findByMemberId(id))
		errorCode = 1;
	if (!psw.equals(confirmpsw))
		errorCode = 2;
	if (errorCode > 0) {
		System.out.println(application.getRealPath(File.separator));
		System.out.println(errorCode);
		request.setAttribute("errorCode", errorCode);
		request.getRequestDispatcher("../jsp/error.jsp").forward(request, response);
		return;
	}

	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPassword(psw);
	dto.setName(name);
	dto.setEmail(email);
	int count = dao.insert(dto);
	if (count < 1) {
		out.print("회원가입중에 알 수 없는 에러가 발생했습니다.");
		return;
	}
	response.sendRedirect("../html/login.html");
	
%>
</body>
</html>
