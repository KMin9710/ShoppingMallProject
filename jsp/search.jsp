<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css" />

</head>
<body>
<body>
	<div id="wrap">
		<div id="top">
			<div class="topin">
				<div class="topsns">
					<ul>
						<li><a href="">FACE BOOK</a></li>
						<li><a href="">INSTAGRAM</a></li>
						<li><a href="">YOUTUBE</a></li>
						<li><a href="">BLOG</a></li>
					</ul>
				</div>
				<div class="toplogin">
					<ul>
						<li><a href="signup.html">CART</a></li>
						<li><a href="../jsp/logout.jsp">LOGOUT</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="logologo">
			<div class="logoin">
				<div class="logologo">
					<h1>YMall</h1>
				</div>
				<div class="logosearch">
					<form id="searchBarForm" action="search.jsp" method="get"
						target="_self" enctype="multipart/form-data">
						<input id="banner_action" name="banner_action" type="hidden">
						<div class="xans-element- xans-layout xans-layout-searchheader">
							<fieldset>
								<legend>검색</legend>

								<div class="searchinput">
									<input id="keyword" name="keyword" class="inputTypeText"
										type="text" autocomplete="off">
								</div>
								<div class="searchimg">
									<img src="../otherimg/search.jpg" width="30" height="30" />
								</div>
							</fieldset>
						</div>
					</form>
				</div>
			</div>
		</div>

		<div id="menu" style="position: relative; top: 0px;">
			<div id="category">
				<ul>
					<li class="all"><a href="productList.jsp">ALL</a></li>
					<li>
						<div class="xans-element- xans-layout xans-layout-category">
							<div class="position">
								<ul>
									<li class="outer"><a href="cateList.jsp?category=outer">OUTER</a></li>
									<li class="top"><a href="cateList.jsp?category=top">TOP</a></li>
									<li class="bottom"><a href="cateList.jsp?category=bottom">BOTTOM</a></li>
									<li class="headwear"><a
										href="cateList.jsp?category=headwear">HEADWEAR</a></li>
									<li class="bag"><a href="cateList.jsp?category=bag">BAG</a></li>
									<li class="acc"><a href="cateList.jsp?category=acc">ACC</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<%
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword");
		ProductDAO dao = new ProductDAO();
		List<ProductDTO> lists = dao.productRetrieve(keyword);
		%>

		<!-- 내용물 -->

		<div id="container" align="center">
			<h3>검색결과</h3>
			<div class="searchResult">
				<p class="record">
					총 <strong><%=lists.size()%></strong>개 의 상품이 검색되었습니다.
				</p>
			</div>
			<%
			for (ProductDTO dto : lists) {
			%>
			<table class="productList grid4">
				<tr align="center">
					<td><a
						href="productDetail.jsp?name=<%=dto.getName()%>&category=<%=dto.getCategory()%>&content=<%=dto.getContent()%>&price=<%=dto.getPrice()%>&images=<%=dto.getImages()%>">
							<img src="../img/<%=dto.getImages()%>" width="400" height="400" />
					</a></td>
				</tr>
				<tr align="left">
					<td><%=dto.getName()%></td>
				</tr>
				<tr align="left">
					<td><%=dto.getContent()%></td>
				</tr>
				<tr>
					<td>
						<p></p>
					</td>
				</tr>
				<tr>
					<td align="left"><%=dto.getPrice()%>원 <img alt="baguni"
						src="../otherimg/baguni.png" width="40" height="40" /></td>
				</tr>
				<tr>
					<td>
						<p></p>
					</td>
				</tr>
			</table>
			<%
			}
			%>

		</div>



	</div>

</body>
</html>