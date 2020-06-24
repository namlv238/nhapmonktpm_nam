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
    <h1>Danh sách đặt Hàng</h1>
    <table border="1" style="border-collapse: collapse; width: 100%">
        <tr>
            <th>ma hoa don</th>
            <th>Ten tai khoan</th>
            <th>ngay hoa don</th>
            <th>Ghi chu</th>
            <th>Trang thai</th>
            <th>Chi tiet hoa don</th>
            <th>Chuyển Đơn hàng</th>
            <th>Huỷ</th>
        </tr>

        <c:forEach var="x" items="${listDh}">
            <tr>
                <td>${x.mahoadon}</td>
                <td>${x.taikhoans.tendangnhap}</td>
                <td>${x.ngayhoadon}</td>
                <td>${x.ghichu}</td>
                <td>
                    ${x.trangthai}

                </td>
                <td><a href="/dshoadonchitiet/${x.mahoadon}">Hoa don chi tiet</a> </td>
                <td><a href="/chuyenhang/${x.mahoadon}">Chuyển</a> </td>
                <td><a href="/huychuyenhang/${x.mahoadon}">Huỷ</a> </td>
            </tr>
        </c:forEach>




    </table>

</body>

</html>