<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside
    class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark"
    id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
        aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="/RPapp2022/dashboard" target="_blank">
        <img src="<c:url value='/assets/img/logo-ct.png'/>" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold text-white">RPapp Dashboard</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100" id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-white ${change1} bg-gradient-primary" href="/RPapp2022/dashboard">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">dashboard</i>
            </div>
            <span class="nav-link-text ms-1">Dashboard</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${change3} text-white " href="/RPapp2022/account-manager">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">account_circle
              </i>
            </div>
            <span class="nav-link-text ms-1">Quản lý người dùng</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ${change5}" href="/RPapp2022/pays-manager">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">inventory
              </i>
            </div>
            <span class="nav-link-text ms-1">Quản lý thu chi</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ${change2}" href="/RPapp2022/categories-manager">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">description
              </i>
            </div>
            <span class="nav-link-text ms-1">Quản lý danh mục thu chi</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white ${change4}" href="/RPapp2022/change-pass">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">password
              </i>
            </div>
            <span class="nav-link-text ms-1">Thay đổi mật khẩu</span>
          </a>
        </li>

      </ul>
    </div>
    <div class="sidenav-footer position-absolute w-100 bottom-0 ">
      <div class="mx-3">
        <a class="btn bg-gradient-primary mt-4 w-100" href="/RPapp2022/logout" type="button">
          <i class="material-icons opacity-10">sell
          </i>
          Đăng xuất
        </a>
      </div>
    </div>
  </aside>