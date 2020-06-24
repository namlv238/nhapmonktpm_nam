<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Add Or Update</h1>
<hr>
<h3>${mes}</h3>
<form:form  action="/addorupdateSP" method="post" modelAttribute="sanpham"  enctype="multipart/form-data">
<div>Ma san pham</div>
<c:if test="${empty sanpham.masanpham}"><form:input path="masanpham"/></c:if>
<c:if test="${not empty sanpham.masanpham}"> ${sanpham.masanpham}
<form:hidden path="masanpham"/>
</c:if>
<div>Ten san pham</div>
<form:input path="tensanpham"/>
<div>Gia san pham</div>
<form:input path="giasanpham"/>
<div>hinh anh</div>
<form:hidden path="hinhanh"/>
<input type="file" name="photo">

<div>Loai san pham</div>
<form:input path="loaisanphams.maloaisanpham"/>
<c:if test="${empty sanpham.masanpham}"><div> <button name="btn_addorupdateSP">Thêm</button> </div></c:if>
<c:if test="${not empty sanpham.masanpham}"> <div> <button name="btn_addorupdateSP">Cập nhật</button> </div></c:if>
</form:form>


</body>
</html>