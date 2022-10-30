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
          RPapp Dashboard
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
                      <a href="/RPapp2022/categories-form" class="btn btn-success">
                        <span class="material-icons align-middle">
                          add_circle_outline
                        </span>
                        Thêm danh mục mới</a>
                    </div>
                    <div class="card-body p-3">
                      <!-- Conntent start -->
                      <div class="nav-wrapper position-relative end-0">
                        <ul class="nav nav-pills nav-fill p-1" role="tablist">
                          <li class="nav-item">
                            <a class="nav-link mb-0 px-0 py-1 active text-uppercase" data-bs-toggle="tab"
                              href="#profile-tabs-icons" role="tab" aria-controls="preview" aria-selected="true">
                              <span class="material-icons align-middle mb-1">
                                format_list_bulleted
                              </span>
                              Danh Mục Thu
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link mb-0 px-0 py-1 text-uppercase" data-bs-toggle="tab"
                              href="#dashboard-tabs-icons" role="tab" aria-controls="code" aria-selected="false">
                              <span class="material-icons align-middle mb-1">
                                format_list_bulleted
                              </span>
                              Danh Mục Chi
                            </a>
                          </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                          <div class="tab-pane fade show active" id="profile-tabs-icons" role="tabpanel"
                            aria-labelledby="pills-home-tab">
                            <!-- Table start -->
                            <div class="card mt-5">
                              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                  <h6 class="text-white text-capitalize ps-3">Danh Sách Danh Mục Thu</h6>
                                </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                  <table class="table align-items-center mb-0">
                                    <thead>
                                      <tr>
                                        <th
                                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                          #ID Danh mục</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Tên danh mục</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Action</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <!-- List item start -->
                                      <c:forEach items="${cate1}" var="cate" varStatus="i2">
                                      <tr>
                                        <td>##${cate.id}</td>
                                        <td>${cate.name}</td>
                                        <td class="align-middle">
                                          <a href="/RPapp2022/categories-form/edit/${cate.id}"
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
                          <!-- Tab 2 -->
                          <div class="tab-pane fade" id="dashboard-tabs-icons" role="tabpanel"
                            aria-labelledby="pills-profile-tab">
                            <!-- Table start -->
                            <div class="card mt-5">
                              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                                <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                                  <h6 class="text-white text-capitalize ps-3">Danh Sách Danh Mục Chi</h6>
                                </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                  <table class="table align-items-center mb-0">
                                    <thead>
                                      <tr>
                                        <th
                                          class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                          #ID Danh mục</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Tên danh mục</th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Action</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <!-- List item start -->
                                       <c:forEach items="${cate2}" var="cates" varStatus="i">
                                      <tr>
                                        <td>##${cates.id}</td>
                                        <td>${cates.name}</td>
                                        <td class="align-middle">
                                          <a href="/RPapp2022/categories-form/edit/${cates.id}"
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
                            <nav aria-label="Page navigation example" class="mt-3">
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