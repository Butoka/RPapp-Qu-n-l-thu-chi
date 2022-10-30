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
          RPapp - Đổi mật khẩu
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
            <div class="container-fluid py-4 mt-5 mb-3">
              <div class="row">
                <div class="col-lg-6 col-md-12 col-12 mx-auto">
                  <div class="card z-index-0 fadeIn3 fadeInBottom">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                      <div class="bg-gradient-primary shadow-primary border-radius-lg py-3 pe-1">
                        <h4 class="text-white font-weight-bolder text-center mt-2 mb-0 text-uppercase">Đổi mật khẩu</h4>
                        <div class="row mt-3">
                          <div class="col-4 text-center m-auto">
                            <a class="btn btn-link px-3" href="javascript:;">
                              <i class="fas fa-lock text-white text-lg"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card-body">
                    	<!-- Check username -->
                        <div class="alert alert-success text-white" role="alert" ${message?'':'hidden'}>
                          <small>${message?'Đổi mật khẩu thành công !':''}</small>
                        </div>
                        <!-- Check username -->
                      <form role="form" class="text-start" action="" method="post" ${message?'hidden':''}>
                        <div class="input-group input-group-outline mt-3 mb-2">
                          <label class="form-label">Old Password</label>
                          <input type="text" class="form-control" name="oldpass" value="${user_temp}">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger mb-2" role="alert" ${!m1?'hidden':''}>
                          <small>${message1}</small>
                        </div>
                        <!-- Check username -->
                        <div class="input-group input-group-outline mb-2">
                          <label class="form-label">New Password</label>
                          <input type="password" class="form-control" name="password">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger" role="alert" ${!m2?'hidden':''}>
                          <small>${message2}</small>
                        </div>
                        <!-- Check username -->
                        <div class="input-group input-group-outline mb-2">
                          <label class="form-label">Confirm New Password</label>
                          <input type="password" class="form-control" name="confirmpass">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger" role="alert" ${!m3?'hidden':''}>
                          <small>${message3}</small>
                        </div>
                        <!-- Check username -->
                        <div class="text-center">
                          <button type="submit" class="btn bg-gradient-primary w-100 my-4 mb-2">Lưu lại</button>
                        </div>
                      </form>
                    </div>
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