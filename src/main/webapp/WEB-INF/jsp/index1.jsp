<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="hai.duong.Ass.Entity.Cart"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Electro - HTML Ecommerce Template</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/bootstrap.min.css" />

	<!-- Slick -->
	<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/slick.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/slick-theme.css" />

	<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/nouislider.min.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" />

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

</head>

<body>
	<!-- HEADER -->
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
				</ul>
				<ul class="header-links pull-right">

					<c:if test="${sessionScope.role == true}">
						<a class="nav-link " href="/indexsp">
							<li><a href="/indexsp"><i class="fa fa-dollar"></i> Quản lý</a></li>
							
						</a>
					</c:if>

					<c:if test="${sessionScope.taikhoandn == null}">
						<a class="nav-link " href="/dangnhap">
							<li><a href="/dangnhap"><i class="fa fa-user-o"></i>Đăng nhập</a></li>
							<li><a href="/dangkyKH"><i class="fa fa-user-o"></i>Đăng ký</a></li>
						</a>
					</c:if>

					<c:if test="${sessionScope.taikhoandn != null}">
						<li><a href="/fromdoimk"><i class="fa fa-dollar"></i>Đổi mật khẩu</a></li>
						<li><a href="/dangxuat"><i class="fa fa-user-o"></i>Đăng xuất</a></li>
					</c:if>



				</ul>
			</div>
		</div>
		<!-- /TOP HEADER -->

		<!-- MAIN HEADER -->
		<div id="header">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- LOGO -->
					<div class="col-md-3">
						<div class="header-logo">
							<a href="/index" class="logo">
								<img src="${pageContext.servletContext.contextPath}/img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>

								<input class="input" placeholder="Search here">
								<button class="search-btn">Tìm kiếm</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->

							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
									<i class="fa fa-shopping-cart"></i>
									<span>Giỏ hàng</span>
									<div class="qty"><% int sl=0;
										int tongtien=0;
										List<Cart> list= (List<Cart>) session.getAttribute("giohang");
										if(list!=null){
											for(int i=0; i<list.size();i++){
												sl+=list.get(i).getSoluong();
												tongtien+=list.get(i).getSp().getGiasanpham()*list.get(i).getSoluong();
											}
											
										}
										out.print(sl);
										
										%></div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">

										<c:forEach var="dssp" items="${giohang}">
											<div class="product-widget">
												<div class="product-img">
													<img src="/img/${dssp.sp.hinhanh}" alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name"><a href="#">${dssp.sp.tensanpham}</a></h3>
													<h4 class="product-price"><span
															class="qty">${dssp.soluong}x</span>${dssp.sp.giasanpham} VND
													</h4>
												</div>
												<a href="/btn_xoagiohang/${dssp.sp.masanpham}" class="delete"><i
														class="fa fa-close"></i></a>
											</div>
										</c:forEach>

									</div>
									<div class="cart-summary">
										<small><% out.print(sl); %> Item(s) selected</small>
										<h5>SUBTOTAL: <%  
											out.print(tongtien);
											
											%> VND</h5>
									</div>
									<div class="cart-btns">
										<a href="/btn_giohang">Đặt hàng <i class="fa fa-arrow-circle-right"></i></a>
									</div>
								</div>
							</div>
							<!-- /Cart -->

							<!-- Menu Toogle -->
							<div class="menu-toggle">
								<a href="#">
									<i class="fa fa-bars"></i>
									<span>Menu</span>
								</a>
							</div>
							<!-- /Menu Toogle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
	</header>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">

			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->



	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">



				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab1" class="tab-pane active">
								<div class="products-slick" data-nav="#slick-nav-1">
									<!-- product -->
									<c:forEach var="sp" items="${listsp}">
										<div class="product">
											<div class="product-img">
												<img src="/img/${sp.hinhanh}" alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${sp.loaisanphams.maloaisanpham}</p>
												<h3 class="product-name"><a href="#">${sp.tensanpham}</a></h3>
												<h4 class="product-price">${sp.giasanpham * 90 /100 } VND<del
														class="product-old-price">${sp.giasanpham} VND</del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">

													<a href="/btn_giohang" class="quick-view"><i
															class="fa fa-eye"></i><span class="tooltipp">Xem Giỏ
															Hàng</span></a>
												</div>
											</div>
											<div class="add-to-cart">
												<a href="/btn_themgiohang/${sp.masanpham}" class="add-to-cart-btn"><i
														class="fa fa-shopping-cart"></i> Thêm giỏ hàng</a>
											</div>
										</div>
									</c:forEach>
									<!-- /product -->


								</div>
								<div id="slick-nav-1" class="products-slick-nav"></div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->








	<!-- jQuery Plugins -->
	<script src="${pageContext.servletContext.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/slick.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/nouislider.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/jquery.zoom.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/js/main.js"></script>

</body>

</html>