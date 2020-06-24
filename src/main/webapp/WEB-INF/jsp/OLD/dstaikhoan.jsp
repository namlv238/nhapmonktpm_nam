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
			<th>Ten dang nhap</th>
			<th>mat khau </th>
			<th>Ho ten</th>
			<th>Email</th>
			<th>Dia chi</th>
			<th>gioi tinh</th>
		
			<th>Chuc nang</th>
	
			<th>Thêm TK NV</th>
			<th>Xoa tk</th>
		</tr>
		<c:forEach var="sp" items="${listTk}">
			<tr>
				<td>${sp.tendangnhap}</td>
				<td>${sp.matkhau}</td>
				<td>${sp.hoten}</td>
				<td>${sp.email}</td>
				<td>${sp.diachi} </td>
				<td>${sp.gioitinh}</td>
				<td>${sp.chucnang}</td>

				
				
			
				<td><a href="/themTKNV">Them Tk Nv</a></td>
				<td><a href="/xoaTk/${sp.tendangnhap}">xoa Tk</a>  </td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>