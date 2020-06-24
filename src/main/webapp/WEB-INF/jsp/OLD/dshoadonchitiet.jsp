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
            <th>ma HDCT</th>
            <th>ma san pham</th>
            <th>Ten san pham</th>
            <th>so luong</th>

            <th>ds don hang</th>
            <th>cap nhat</th>
            <th>xoa</th>

        </tr>

        <c:forEach var="x" items="${listhdct}">
            <form action="/capnhatsoluong">
                <tr>

                    <td>${x.mahoadonchitiet}
                        <input value="${x.mahoadonchitiet}" name="mahdct" type="hidden">
                    </td>
                    <td>${x.sanphams.masanpham}</td>
                    <td>${x.sanphams.tensanpham}</td>
                    <td> <input name="slsp" value="${x.soluong}" type="text" min="0"> </td>
                    <td><a href="/dsdathang">danh sach hoa don</a> </td>
                    <td><button name="btn_capnhatsl">cap nhat so luong</button> </td>
                    <td><a href="/huydathanghdct/${x.mahoadonchitiet}">Xoa</a> </td>
                </tr>
            </form>
        </c:forEach>




    </table>
</body>

</html>