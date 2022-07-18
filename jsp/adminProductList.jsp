<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<%
	ProductDAO dao = new ProductDAO();
	List<ProductDTO> lists = dao.getAllProduct();
	%>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">사진</th>
				<th scope="col">카테고리</th>
				<th scope="col">이름</th>
				<th scope="col">내용</th>
				<th scope="col">가격</th>
			</tr>
		</thead>
		<tbody>
			<%
			int count = 0;
			for (ProductDTO dto : lists) {
				count++;
			%>
			<tr>
				<th scope="row"><%=count%></th>
				<td><img src="../img/<%=dto.getImages()%>" width="40"
					height="40" /></td>
				<td><%=dto.getCategory()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getContent()%></td>
				<td><%=dto.getPrice()%></td>
				<td><a
					href="productDelete.jsp?name=<%=dto.getName()%>&content=<%=dto.getContent()%>">
						Delete </a></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>


</body>
</html>