<%@page import="java.util.ArrayList"%>
<%@page import="dto.OrderDTO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="common.DbCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String catego = request.getParameter("catego");
String ordername = request.getParameter("ordername");
String content = request.getParameter("content");
String price = request.getParameter("price");
String images = request.getParameter("images");

OrderDTO dto = new OrderDTO();

dto.setCatego(catego);
dto.setOrdername(ordername);
dto.setContent(content);
dto.setPrice(price);
dto.setImages(images);

OrderDAO dao = new OrderDAO();
try{
	dao.insertOrder(dto);
}catch(Exception e) {
	request.setAttribute("errorCode", 1);
	request.getRequestDispatcher("error.jsp").forward(request, response);
}
%>
<script>
	alert("장바구니에 담았습니다.");
	location.href = "productList.jsp";
</script>
