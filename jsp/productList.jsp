<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ALL PRODUCT</title>
<link rel="stylesheet" href="../css/main.css" />
</head>
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
						<li><a href="orderList.jsp">CART</a></li>
						<li><a href="logout.jsp">LOGOUT</a></li>
						<li><a href="../html/withdraw.html">SIGNOUT</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div id="logologo">
			<div class="logoin">
				<div class="logologo">

					<h1>
						<a href="homepage.jsp">YMall</a>
					</h1>

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

		<!-- 내용물 -->
		<%
		ProductDAO dao = new ProductDAO();
		List<ProductDTO> lists = dao.getAllProduct();
		%>
		<div id="container" align="center">
			<h3>ALL</h3>
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
					<td class="name"><strong><%=dto.getName()%></strong></td>
				</tr>
				<tr align="left">
					<td id="content"><%=dto.getContent()%></td>
				</tr>
				<tr>
					<td>
						<p></p>
					</td>
				</tr>
				<tr>
					<td align="left"><%=dto.getPrice()%>원 <a
						href="orderInsert.jsp?ordername=<%=dto.getName()%>&content=<%=dto.getContent()%>&catego=<%=dto.getCategory()%>&price=<%=dto.getPrice()%>&images=<%=dto.getImages()%>">
							<img src="../otherimg/baguni.png" width="35px" height="30px">
					</a></td>
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
	<!-- 
<script type="text/javascript">
	function fnCart(name, content) {
		if(confirm("장바구니에 담으시겠습니까?")) {
			window.location("orderInsert.jsp")
		}
	}
</script>
 -->
</body>
</html>