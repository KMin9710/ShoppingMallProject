<%@page import="dao.ProductDAO"%>
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
String name = request.getParameter("name");
String content = request.getParameter("content");

ProductDAO dao = new ProductDAO();

int count = dao.deleteByName(name, content);
if(count < 1) {
	out.print("상품 삭제중 알 수 없는 에러가 발생했습니다.");
	return;
}
response.sendRedirect("adminProductList.jsp");
%>
</body>
</html>
