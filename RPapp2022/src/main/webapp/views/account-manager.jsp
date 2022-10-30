<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="common/taglib.jsp" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
      <link rel="icon" type="image/png" href="./assets/img/favicon.png">
      <%@ include file="common/head.jsp" %>
        <title>
          RPapp - Quản lý tài khoản
        </title>

    </head>

    <body class="g-sidenav-show  bg-gray-200">
      <!-- Header menu -->
      <%@ include file="common/header.jsp" %>
        <!-- Header menu -->
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
          <!-- Navbar -->
          <%@ include file="common/header2.jsp" %>
            <!-- End Navbar -->
            <!-- Main -->
             <div class="container-fluid py-4">
              <div class="row">
                <div class="col-lg-12 col-md-12 mx-auto">
                  <div class="card mt-4">
                    <div class="card-header p-3 pb-0">
                      <a href="/RPapp2022/account-form" class="btn btn-success">
                        <span class="material-icons align-middle">
                          add_circle_outline
                        </span>
                        Thêm tài khoản mới</a>
                    </div>
                    <div class="card-body p-3">
                      <!-- Conntent start -->
                      <div class="nav-wrapper position-relative end-0">
                        <!-- Table start -->
                            <div class="card mt-5">
                              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                  <h6 class="text-white text-capitalize ps-3">Danh Sách Tài Khoản</h6>
                                </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                  <table class="table align-items-center mb-0">
                                    <thead>
                                      <tr>
                                        <th
                                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                          #ID Tài khoản</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Họ tên</th>
                                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Giới tính</th>
                                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Email</th>
                                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Trạng thái</th>
                                          <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Vai trò</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Action</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <!-- List item start -->
                                      <c:forEach items="${accounts}" var="item" varStatus="i2">
                                      <tr>
                                        <td>${item.username}</td>
                                        <td>${item.fullname}</td>
                                        <td>${item.gender?'Nam':'Nữ'}</td>
                                        <td>${item.email}</td>
                                        <td>
                                        	<span class="badge ${item.active?'bg-gradient-primary':'bg-gradient-danger'} text-white" role="alert">
											     ${item.active?'Hoạt động':'Ngừng hoạt động'}
											  </span>
                                        </td>
                                        <td>${item.role.name}</td>
                                        <td class="align-middle">
                                          <a href="/RPapp2022/account-form/edit/${item.username}"
                                            class="text-white font-weight-normal text-xs btn btn-primary"
                                            data-toggle="tooltip" data-original-title="Edit user">
                                            Edit
                                          </a>
                                        </td>
                                      </tr>
                                      </c:forEach>
                                      <!-- List item end -->
                                    </tbody>
                                  </table>
                                </div>
                              </div>
                            </div>
                            <!-- Table end -->
                            
                            <nav aria-label=" Page navigation example" class="mt-3">
                              <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                  <a class="page-link" href="javascript:;" tabindex="-1">
                                    <span class="material-icons">
                                      keyboard_arrow_left
                                    </span>
                                    <span class="sr-only">Previous</span>
                                  </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="javascript:;">1</a></li>
                                <li class="page-item active"><a class="page-link" href="javascript:;">2</a></li>
                                <li class="page-item"><a class="page-link" href="javascript:;">3</a></li>
                                <li class="page-item">
                                  <a class="page-link" href="javascript:;">
                                    <span class="material-icons">
                                      keyboard_arrow_right
                                    </span>
                                    <span class="sr-only">Next</span>
                                  </a>
                                </li>
                              </ul>
                            </nav>
                          </div>
                         
                      </div>
                      <!-- Content end -->
                    </div>
                  </div>

                </div>
              </div>
              <!-- Main -->
              <!-- footer start -->
              <%@ include file="common/footer.jsp" %>
                <!-- footer end -->
            </div>
        </main>

        <!--   Core JS Files   -->
        <%@ include file="common/javascript.jsp" %>
          <!--   Core JS Files   -->
    </body>

    </html>