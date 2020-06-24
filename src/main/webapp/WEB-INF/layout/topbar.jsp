<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Sidebar Toggle (Topbar) -->
<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
  <i class="fa fa-bars"></i>
</button>

<!-- Topbar Search -->


<!-- Topbar Navbar -->
 

  <c:if test="${sessionScope.taikhoandn == null}">
    <a class="nav-link " href="/dangnhap">
      <span class=" ">Đăng nhập</span>
    </a>
  </c:if>

  <c:if test="${sessionScope.taikhoandn != null}">
    <a class="nav-link " href="${pageContext.servletContext.contextPath}/dangxuat/">
      <span class=" ">Đăng xuất</span>
    </a>
  </c:if>
 