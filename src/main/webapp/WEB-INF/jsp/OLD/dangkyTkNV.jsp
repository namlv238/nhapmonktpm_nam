<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <form:form action="/dangkynv" method="post" modelAttribute="taikhoanNv">
        <div>Ten dang nhap</div>
        <form:input path="tendangnhap" />
        <div>matkhau</div>
        <form:password path="matkhau" />
        <div>ho ten</div>
        <form:input path="hoten" />
        <div>Email</div>
        <form:input path="email" />
        <div>Dia chi</div>
        <form:input path="diachi" />
        <div>gioi tinh </div>
        <form:radiobutton path="gioitinh" value="Nam" label="Nam" />
        <form:radiobutton path="gioitinh" value="Nu" label="Nu" />

        <h3>${mes}</h3>
        <button name="btn_dangkynv"> Dang Ky</button>
    </form:form>




</body>

</html>