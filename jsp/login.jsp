<%@page import="java.io.PrintWriter"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String password = request.getParameter("password");

MemberDAO mdao = new MemberDAO();

int code = mdao.login(id, password);
//회원 로그인

if (code == 1) {
	PrintWriter script = response.getWriter();
	session.setAttribute("id", id);
	script.println("<script>");
	script.println("location.href = 'homepage.jsp'");
	script.println("</script>");

} else if (code == 2) {
	PrintWriter script = response.getWriter();
	session.setAttribute("id", id);
	script.println("<script>");
	script.println("location.href = '../html/adminHome.html'");
	script.println("</script>");
}

else if (code == 0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀립니다.')");
	script.println("history.back()");
	script.println("</script>");
} else if (code == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('존재하지 않는 아이디입니다.')");
	script.println("history.back()");
	script.println("</script>");
} else if (code == -2) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('알 수 없는 오류가 발생했습니다.')");
	script.println("history.back()");
	script.println("</script>");
}
%>

