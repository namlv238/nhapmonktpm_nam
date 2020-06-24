<%@page import="hai.duong.Ass.Entity.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
						<li><a href="/dangnhap"><i class="fa fa-user-o"></i>Đăng xuất</a></li>
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
													<img src="/static/${dssp.sp.hinhanh}" alt="">
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

				<div class="col-md-7">
					<!-- Billing Details -->
					<div class="billing-details">
						<div class="section-title">
							<h3 class="title">Đặt hàng</h3>
						</div>
						<form action="/dathang" method="post">
							<div class="form-group">
								<input class="input" type="text" name="hotennguoinhan" placeholder="Họ tên">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="diachinhanhang" placeholder="Địa chỉ nhận hàng">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="sdtnhanhang" placeholder="Số điện thoại">
							</div>
							<div class="form-group">
								<input class="input" type="text" name="tt" disabled="disabled" placeholder="Tổng tiền thanh toán">
							</div>
							 
						 
					
					</div>
					<!-- /Billing Details -->



				 
				</div>

				<!-- Order Details -->
				<div class="col-md-5 order-details">
					<div class="section-title text-center">
						<h3 class="title">Danh sách đặt hàng</h3>
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div><strong>Sản phẩm</strong></div>
							<div><strong>Tổng</strong></div>
						</div>
						<div class="order-products">
							<c:forEach var="dssp" items="${giohang}">
								<div class="order-col">
									<div>${dssp.soluong}x ${dssp.sp.tensanpham} VND</div>
									<div>${dssp.tongTien()} VND</div>
								</div>
							</c:forEach>
						</div>
						<div class="order-col">
							<div>Shiping</div>
							<div><strong>FREE</strong></div>
						</div>
						<div class="order-col">
							<div><strong>Tổng tiền</strong></div>
							<div><strong class="order-total"><% out.print(tongtien); %></strong></div>
						</div>
					</div>
					<div class="input-checkbox">
						<input type="checkbox" id="terms">
						<label for="terms">
							<span></span>
							Tôi đã đọc và đông ý với các <a href="#">điều khoản</a>
						</label>
					</div>
					<button href="#" name="dathang" class="primary-btn order-submit">Đặt hàng</button>
				</form>
				</div>
				<!-- /Order Details -->
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