<%@page import="dao.OrderDAO"%>
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
String ordername = request.getParameter("ordername");
String content = request.getParameter("content");

OrderDAO dao = new OrderDAO();

int count = dao.deleteByNameContent(ordername, content);
if(count < 1) {
	out.print("장바구니 상품 삭제 중 알수없는 에러가 발생하였습니다.");
	return;
}
response.sendRedirect("orderList.jsp");
%>

</body>
</html>