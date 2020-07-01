<%@page import="lenam.Ass.Entity.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" style="border-collapse: collapse; width: 100% ;" >
<tr>
			<th>Mã sản phẩm</th>
			<th>Tên Sản Phẩm</th>
			<th>Giá Sản Phẩm</th>
			<th>Mã Loại Sản Phẩm</th>
			<th>Hình Ảnh</th>
			<th>Số Lượng </th>
			<th> Tổng tiền </th>
			<th>xoa</th>
			<th>index</th>
		</tr>
		<c:forEach var="dssp" items="${giohang}">
			<tr>
				<td>${dssp.sp.masanpham}</td>
				<td>${dssp.sp.tensanpham}</td>
				<td>${dssp.sp.giasanpham}</td>
				<td>${dssp.sp.loaisanphams.maloaisanpham}</td>
				<td><img alt="" src="/static/${dssp.sp.hinhanh}" width="300px" height="300px"> </td>
				<td>${dssp.soluong}</td>
				<td>${dssp.tongTien()}</td>
			
				<td><a href="/btn_xoagiohang/${dssp.sp.masanpham}">Xoa Gio Hang</a></td>
				<td><a href="/index">Index</a></td>
			</tr>
		</c:forEach>
		<tr> 
		<td  >Tổng tiền thanh toán</td>
		<td > <input value="<% int tongtien=0;
		
		List<Cart> list= (List<Cart>) session.getAttribute("giohang");
		if(list!=null){
			for(int i=0; i<list.size();i++){
				tongtien+=list.get(i).getSp().getGiasanpham()*list.get(i).getSoluong();
				
			}
			
		}
		out.print(tongtien);
		
		%>  " name="tongtien" disabled="disabled"> </td>
		

		<td> </td>
		
		
		
		</tr>
		
		
		






</table>
<div>
<h1>Đặt hàng</h1>

<form action="/dathang" method="post">
<div>Họ tên</div>
<input name="hotennguoinhan">
<div>Địa chỉ nhận hàng</div>
<input name="diachinhanhang">
<div>Số điện thoại</div>
<input name="sdtnhanhang">

<div>Tổng tiền thanh toán</div>
<input name="tt" disabled="disabled">

<h2>${mes}</h2>

<div><button name="dathang">Xác nhận</button> </div>



</form>

</div>


 <script type="text/javascript">

			var tongtien = document.getElementsByName("tongtien")[0].value;
			document.getElementsByName("tt")[0].value = tongtien;
		
	</script>



</body>
</html>