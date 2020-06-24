<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" style="border-collapse: collapse; width: 95%">
		<tr>
			<th>Mã sản phẩm</th>
			<th>Tên Sản Phẩm</th>
			<th>Giá Sản Phẩm</th>
			<th>Mã Loại Sản Phẩm</th>
			<th>Hình Ảnh</th>
			<th>Xoá</th>
			<th>Cập Nhật</th>
			<th>Thêm Sản Phẩm</th>
		</tr>
		<c:forEach var="sp" items="${listsp}">
			<tr>
				<td>${sp.masanpham}</td>
				<td>${sp.tensanpham}</td>
				<td>${sp.giasanpham}</td>
				<td>${sp.loaisanphams.maloaisanpham}</td>
				<td>  <img alt="" src="/static/${sp.hinhanh}"  width="300px" height="300px"> </td>
				<td><a href="/btn_xoasp/${sp.masanpham}">Xoá</a></td>
				<td><a href="/btn_capnhatsp/${sp.masanpham}">Cập nhật</a></td>
				<td><a href="/btn_themsp">Thêm Sản Phẩm</a></td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>