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
                <div class="col-lg-8 col-md-10 mx-auto">
                  <div class="card mt-4">
                    <div class="card-header p-3">
                      <h5 class="mb-0 text-uppercase">Quản lý người dùng</h5>
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
                              Danh Sách
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link mb-0 px-0 py-1 text-uppercase" data-bs-toggle="tab" href="#dashboard-tabs-icons"
                              role="tab" aria-controls="code" aria-selected="false">
                              <span class="material-icons align-middle mb-1">
                                save_as
                              </span>
                              Cập Nhật
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
                                  <h6 class="text-white text-capitalize ps-3">Authors table</h6>
                                </div>
                              </div>
                              <div class="card-body px-0 pb-2">
                                <div class="table-responsive p-0">
                                  <table class="table align-items-center mb-0">
                                    <thead>
                                      <tr>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Author
                                        </th>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                                          Function</th>
                                        <th
                                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Technology</th>
                                        <th
                                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Employed</th>
                                        <th
                                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Employed</th>
                                        <th
                                          class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                          Employed</th>
                                        <th class="text-secondary opacity-7"></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <!-- List item start -->
                                      <tr>
                                        <td>
                                          <div class="d-flex px-2 py-1">
                                            <div>
                                              <img
                                                src="https://demos.creative-tim.com/test/material-dashboard-pro/assets/img/team-2.jpg"
                                                class="avatar avatar-sm me-3">
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                              <h6 class="mb-0 text-xs">John Michael</h6>
                                              <p class="text-xs text-secondary mb-0">john@creative-tim.com</p>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <p class="text-xs font-weight-bold mb-0">Manager</p>
                                          <p class="text-xs text-secondary mb-0">Organization</p>
                                        </td>
                                        <td class="align-middle text-center text-sm">
                                          <span class="badge bg-gradient-success">Online</span>
                                        </td>
                                        <td class="align-middle text-center">
                                          <span class="text-secondary text-xs font-weight-normal">23/04/18</span>
                                        </td>
                                        <td class="align-middle">
                                          <a href="javascript:;" class="text-secondary font-weight-normal text-xs"
                                            data-toggle="tooltip" data-original-title="Edit user">
                                            Edit
                                          </a>
                                        </td>
                                      </tr>
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
                          <!-- Tab 2 -->
                          <div class="tab-pane fade" id="dashboard-tabs-icons" role="tabpanel"
                            aria-labelledby="pills-profile-tab">
                            <form>
                              <!-- Row -->
                              <div class="row">
                                <div class="row col-9">
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-6">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Email</label>
                                      <input type="email" class="form-control">
                                    </div>
                                  </div>
                                  <!-- Item row -->
                                </div>
                                <div class="row col-md-3">
                                  <!-- Item row -->
                                  <div class="col-md-12 text-center">
                                    <div>
                                      <img class="img-fluid"
                                        src="https://media.istockphoto.com/vectors/no-image-available-sign-vector-id922962354?b=1&k=20&m=922962354&s=170667a&w=0&h=gpsD4Kn3xGxc_CMswNa_twx-Nxf9og_ipyV_2rjCWj4="
                                        width="200px">
                                    </div>
                                    <label class="btn btn-primary mt-1">
                                      Tải ảnh lên
                                      <input type="file" class="form-control" hidden>
                                    </label>
                                  </div>
                                  <!-- Item row -->
                                </div>
                              </div>
                              <!-- Row -->
                              <div class="row p-3 justify-content-end">
                                <button class="col-md-2 btn btn-icon btn-2 btn-success" type="button">
                                  <span class="btn-inner--icon"><i class="material-icons mb-1">save</i></span>
                                  <span class="btn-inner--text">Lưu lại</span>
                                </button>
                                <button class="ms-1 col-md-2 btn btn-icon btn-2 btn-danger" type="button">
                                  <span class="btn-inner--icon"><i class="material-icons">cancel</i></span>
                                  <span class="btn-inner--text">Hủy bỏ</span>
                                </button>
                              </div>
                            </form>
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