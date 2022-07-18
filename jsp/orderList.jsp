<%@page import="dao.OrderDAO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" href="../css/main.css" />
<link rel="stylesheet" href="../css/orderList.css" />
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
						<li><a href="signup.html">CART</a></li>
						<li><a href="../jsp/logout.jsp">LOGOUT</a></li>
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
									<li class="outer"><a href="cateOuter.jsp">OUTER</a></li>
									<li class="top"><a href="">TOP</a></li>
									<li class="bottom"><a href="">BOTTOM</a></li>
									<li class="headwear"><a href="">HEADWEAR</a></li>
									<li class="bag"><a href="">BAG</a></li>
									<li class="acc"><a href="">ACC</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<!-- 내용물 -->
		<%
		request.setCharacterEncoding("utf-8");

		OrderDAO dao = new OrderDAO();
		List<OrderDTO> lists = dao.getAllOrder();
		int count = 0;
		int total = 0;
		%>
		<div class="container">
			<div class="titleArea">
				<h3>CART</h3>
			</div>
			<div class="xans-element- xans-order xans-order-basketpackage"
				align="center";>
				<div
					class="xans-element- xans-order xans-order-tabinfo ec-base-tab typeLight">

					<p class="right">장바구니에 담긴 상품은 3일 동안 보관됩니다.</p>
				</div>
				<div class="orderListArea ec-base-table typeList gBorder">
					<div class="xans-element- xans-order xans-order-normtitle title">
						<h4>
							일반상품(<%=lists.size()%>)
						</h4>
					</div>
					<table border="1" summary
						class="xans-element- xans-order xans-order-normnormal xans-record-">
						<caption>기본배송</caption>
						<colgroup>
							<col style="width: 80px">
							<col style="width: 220px">
							<col style="width: 120px">
							<col style="width: 200px">
							<col style="width: 100px">
							<col style="width: 120px">
							<col style="width: 100px">
							<col style="width: 100px">
							<col style="width: 100px">
							<col style="width: 110px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">이미지</th>
								<th scope="col">브랜드</th>
								<th scope="col">상품정보</th>
								<th scope="col">수량</th>
								<th scope="col">상품구매금액</th>
								<th scope="col">할인금액</th>
								<th scope="col">배송구분</th>
								<th scope="col">배송비</th>
								<th scope="col">선택</th>
							</tr>
						</thead>

						<tbody class="xans-element- xans-order xans-order-list center">
							<%
							if (lists.size() == 0) {
							%>
							<h2>
								장바구니에 담긴 상품이 없습니다. <a href="productList.jsp">[주문하기]</a>
							</h2>
							<tr class="xans-record-">

								<%
								} else {
								for (OrderDTO dto : lists) {
									count++;
									int num = Integer.parseInt(dto.getPrice().replaceAll("[^\\d]", ""));
									total += num;
								%>
								<td><strong><%=count%></strong></td>
								<td class="thumb gClearLine"><img
									src="../img/<%=dto.getImages()%>"></td>
								<td class="left gClearLine"><strong class="name"><%=dto.getOrdername()%></strong></td>
								<td><%=dto.getContent()%></td>
								<td>1</td>
								<td><%=dto.getPrice()%> won</td>
								<td>-</td>
								<td>기본배송</td>
								<td>선택</td>
								<td class=button><a
									href="orderDelete.jsp?ordername=<%=dto.getOrdername()%>&content=<%=dto.getContent()%>"
									class="btnNormal">DELETE</a></td>
							</tr>
							<%
							}
							}
							%>
						</tbody>
					</table>
				</div>

				<div
					class="xans-element- xans-order xans-order-totalsummary ec-base-table typeList gBorder total">
					<table boarder="1" summary>
						<caption>총 주문금액</caption>
						<colgroup>
							<col style="width: 400px;">
							<col style="width: 400px;">
							<col style="width: 400px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><strong>총 상품금액</strong></th>
								<th scope="col"><strong>총 배송비<br />(5만원 이상 무료배송)
								</strong></th>
								<th scope="col"><strong>결제예정금액</strong></th>
							</tr>

						</thead>

						<tbody class="center">
							<tr>
								<td><strong><%=total%></strong>won</td>
								<td><strong>+ 0</strong>won</td>
								<td><strong>= <%=total%></strong>won</td>
							</tr>
						</tbody>
					</table>

				</div>
				<div class="xans-element- xans-product xans-product-action">
					<div class="ec-base-button gColumn">
						<a href="#" class="btnBuy"><span id="btnBuy">구매하기</span></a> <a
							href="productList.jsp" class="btnShop"><span id="btnShop">쇼핑계속하기</span></a>
					</div>
				</div>
			</div>

		</div>



	</div>

</body>
</html>