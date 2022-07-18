<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
						<li><a href="../jsp/logout.jsp">LOGOUT</a></li>
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

		<h2>
			<img src="../otherimg/mainlogo.jpg" alt="mainphoto" width="100%"
				height="750px">
		</h2>


	</div>

</body>
</html>