<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<link rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet" href="../css/productDetail.css" />

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
		String category = request.getParameter("category");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String price = request.getParameter("price");
		String images = request.getParameter("images");

		ProductDAO dao = new ProductDAO();
		ProductDTO dto = dao.productNameContent(name, content);

		//List<ProductDTO> lists = dao.getAllProduct();
		%>
		<div id="container" align="center">
			<h3>Detail</h3>

			<div id="somethingin1200">
				<div id="ssleft">
					<div class="detailArea">
						<div class="xans-element- xans-product xans-product-image imgArea">
							<img src="../img/<%=dto.getImages()%>" width="600px"
								height="600px" />
						</div>
					</div>
				</div>
				<div id="ssright">
					<div class="detailArea">
						<div class="infoArea">
							<h2>
								<strong>Category : <%=dto.getCategory()%></strong>
							</h2>
							<h2>
								Brand :
								<%=dto.getName()%></h2>

							<div id="ssinfo1">
								<h2><%=dto.getContent()%></h2>
							</div>


							<div id="ssinfo2"
								class="xans-element- xans-product xans-product-detaildesign">

								<h4>
									판매가격 :
									<%=dto.getPrice()%>won
								</h4>

							</div>
							<div class="xans-element- xans-product xans-product-action">
								<div class="ec-base-button gColumn">
									<a href="#" class="btnBuy"><span id="btnBuy">BUY NOW</span></a>
									<a
										href="orderInsert.jsp?ordername=<%=dto.getName()%>&content=<%=dto.getContent()%>&catego=<%=dto.getCategory()%>&price=<%=dto.getPrice()%>&images=<%=dto.getImages()%>"
										class="btnCart"><span id="btnCart">ADD TO CART</span></a>
								</div>

								<div class="deliveryss">
									<h2>배송정보</h2>
								</div>

								<div class="deliverysscontent" style="display: block;">
									<div class="list">YMALL에서 판매되는 상품들은 5만원 이상시 국내무료배송이며
										배송기간은 입금 확인일로부터 1~3일 정도 소요됩니다.(공휴일 제외)</div>
									<div class="list">YMALL은 온/오프라인 매장 동시 재고로 운영하고 있습니다.
										결제/입금확인보다 매장 판매가 먼저 이루어질 경우, 부득이하게 주문 후 품절되는 경우가 있으니 이 점 양해
										부탁드립니다.</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>


	</div>



</body>
</html>