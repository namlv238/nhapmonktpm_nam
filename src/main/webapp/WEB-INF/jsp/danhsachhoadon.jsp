<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page import="hai.duong.Ass.Entity.Cart"%>
<%@page import="hai.duong.Ass.Entity.hoadon"%>
<%@page import="hai.duong.Ass.Entity.hoadonchitiet"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="hai.duong.Ass.Services.HoaDonServicesIpm"%>
<%@page import="hai.duong.Ass.Services.HoaDonChiTietServicesIpm"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<!doctype html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<base href="${pageContext.servletContext.contextPath}" />
	<title>Quản lý nhân viên</title>

	<!-- Custom fonts for this template-->
	<link href="${pageContext.servletContext.contextPath}/QL/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
		type="text/css">
	<link
		href="/https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
		rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="${pageContext.servletContext.contextPath}/QL/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
			<jsp:include page="../layout/navigator.jsp" flush="true" />

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<jsp:include page="../layout/topbar.jsp" flush="true" />



				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">






					<%
						HttpSession httpSession;
						List<hoadon> list = (List<hoadon>) request.getAttribute("listhd");
					%>





					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Quản lý danh
								sách Hoá đơn</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th>Mã HD</th>
											<th>Tên tài khoản</th>
											<th>Ngày hoá đơn</th>
											<th>Ghi chú</th>
											<th>Trạng thái</th>
											<th>Chi tiết hoá đơn</th>

										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Mã HD</th>
											<th>Tên tài khoản</th>
											<th>Ngày hoá đơn</th>
											<th>Ghi chú</th>
											<th>Trạng thái</th>
											<th>Chi tiết hoá đơn</th>

										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="x" items="${listhd}">
											<tr>
												<td>${x.mahoadon}</td>
												<td>${x.taikhoans.tendangnhap}</td>
												<td>${x.ngayhoadon}</td>
												<td>${x.ghichu}</td>
												<td>${x.trangthai}</td>



												<td> 
													
													<a class="btn btn-info btn-icon-split btn-sm"
														data-toggle="modal"
														data-target="#myModal-${x.mahoadon}"> <span
															class="icon text-white-50"> <i
																class="fas fa-info-circle"></i>
														</span> <span class="text">Hoá đơn chi tiết</span>
													</a></td>
											</tr>






										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>



					<!-- /.container-fluid -->

					<%
						for (hoadon hd : list) {
							List<hoadonchitiet> key = (List<hoadonchitiet>) request.getAttribute(hd.getMahoadon() + "1");
					%>
					<!-- Modal 2 -->
					<div class="modal fade bd-example-modal-lg" id="myModal-<%out.print(hd.getMahoadon());%>"
						tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-lg" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Hoá đơn chi tiết</h4>
								</div>
								<div class="modal-body">









									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>Mã HDCT</th>
												<th>Mã sản phẩm</th>
												<th>Tên sản phẩm</th>
												<th>Số lượng</th>
												<th></th>

											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>Mã HDCT</th>
												<th>Mã sản phẩm</th>
												<th>Tên sản phẩm</th>
												<th>Số lượng</th>
												<th></th>

											</tr>
										</tfoot>
										<tbody>

											<%
												for (hoadonchitiet hdct : key) {
														out.print("  <form action='/capnhatsoluong'><tr><td>" + hdct.getMahoadonchitiet()
																+ "<input hidden value='" + hdct.getMahoadonchitiet() + "' name='mahdct' ></td><td>"
																+ hdct.getSanphams().getMasanpham() + "</td><td>" + hdct.getSanphams().getTensanpham()
																+ "</td><td>" + hdct.getSoluong() + "</td>");
											%>
										
													 
											</tr>
											</form>
											<%
												} ;
											%>




										</tbody>
									</table>



								</div>
								<div class="modal-footer">Cảm ơn đã xem</div>
							</div>
						</div>
					</div>
					<%
						} ;
					%>
					<!-- Modal 2 -->


















				</div>
				<!-- End of Main Content -->

				<!-- Footer -->
				<footer class="sticky-footer bg-white">
					<jsp:include page="../layout/footer.jsp" flush="true" />
				</footer>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

		</div>
		<!-- End of Page Wrapper -->

		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
		</a>

		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						ready to end your current .</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="login.html">Logout</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Bootstrap core JavaScript-->
		<script src="${pageContext.servletContext.contextPath}/QL/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.servletContext.contextPath}/QL/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="${pageContext.servletContext.contextPath}/QL/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="${pageContext.servletContext.contextPath}/QL/js/sb-admin-2.min.js"></script>
		<!-- Page level plugins -->
		<script src="${pageContext.servletContext.contextPath}/QL/vendor/datatables/jquery.dataTables.min.js"></script>
		<script
			src="${pageContext.servletContext.contextPath}/QL/vendor/datatables/dataTables.bootstrap4.min.js"></script>

		<!-- Page level custom scripts -->
		<script src="${pageContext.servletContext.contextPath}/QL/js/demo/datatables-demo.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>


	 
		<script>
			$(window).on('load', function () {
				$('#myModal-${chinhsua}').modal('show');
			});
		</script>
</body>

</html>