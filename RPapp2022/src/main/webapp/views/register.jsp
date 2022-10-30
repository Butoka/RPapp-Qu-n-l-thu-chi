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
          RPapp - Đăng ký tài khoản
        </title>

    </head>

    <body class="">
      <main class="main-content  mt-0">
        <section>
          <div class="page-header min-vh-100">
            <div class="container">
              <div class="row">
                <div
                  class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
                  <div
                    class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center"
                    style="background-image: url('./assets/img/illustrations/illustration-signup.jpg'); background-size: cover;">
                  </div>
                </div>
                <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
                  <div class="card card-plain">
                    <div class="card-header">
                      <h4 class="font-weight-bolder">Đăng ký</h4>
                      <p class="mb-0">Nhập đầy đủ các thông tin dưới đây để tạo tài khoản</p>
                       <!-- Check username -->
                        <div class="alert alert-success text-white" role="alert" ${message?'':'hidden'}>
                          <small>${message?'Đăng ký thành công !':''}</small>
                        </div>
                        <!-- Check username -->
                    </div>
                    <div class="card-body pt-0" ${message?'hidden':''}>
                      <form role="form" method="post" action="">	
                        <div class="input-group input-group-outline mb-2">
                          <label class="form-label">Username</label>
                          <input type="text" class="form-control" name="username" value="${user_temp.username}">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger mb-2" role="alert" ${!m1?'hidden':''}>
                          <small>${message1}</small>
                        </div>
                        <!-- Check username -->
                        <div class="input-group input-group-outline mb-2">
                          <label class="form-label">Password</label>
                          <input type="password" class="form-control" name="password">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger mb-2" role="alert" ${!m2?'hidden':''}>
                          <small>${message2}</small>
                        </div>
                        <!-- Check username -->
                        <div class="input-group input-group-outline mb-2">
                          <label class="form-label">Confirm Password</label>
                          <input type="text" class="form-control" name="confirmpass">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger mb-2" role="alert" ${!m3?'hidden':''}>
                          <small>${message3}</small>
                        </div>
                        <!-- Check username -->
                        <div class="input-group input-group-outline mb-2">
                          <label class="form-label">Fullname</label>
                          <input type="text" class="form-control" name="fullname" value="${user_temp.fullname}">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger mb-2" role="alert" ${!m4?'hidden':''}>
                          <small>${message4}</small>
                        </div>
                        <!-- Check username -->
                        <div class="input-group input-group-outline mb-2">
                          <div class="form-check form-check-inline p-0">
                            <label class="form-check-label" for="">Gender:</label>
                          </div>
                          <div class="form-check form-check-inline p-0">
                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="true" ${user_temp.gender?'checked':''}>
                            <label class="form-check-label" for="inlineRadio1">Male</label>
                          </div>
                          <div class="form-check form-check-inline p-0">
                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="false" ${user_temp.gender?'':'checked'}>
                            <label class="form-check-label" for="inlineRadio2">Female</label>
                          </div>
                        </div>
                        <!-- Check username -->
                        <div class="text-danger mb-2" role="alert" ${!m5?'hidden':''}>
                          <small>${message5}</small>
                        </div>
                        <!-- Check username -->
                        <div class="input-group input-group-outline mb-2">
                          <label class="form-label">Email</label>
                          <input type="text" class="form-control" name="email" value="${user_temp.email}">
                        </div>
                        <!-- Check username -->
                        <div class="text-danger mb-2" role="alert" ${!m6?'hidden':''}>
                          <small>${message6}</small>
                        </div>
                        <!-- Check username -->
                        <div class="text-center">
                          <button type="submit" class="btn btn-lg bg-gradient-primary btn-lg w-100 mt-4 mb-0">Đăng
                            ký</button>
                        </div>
                      </form>
                    </div>
                    <div class="card-footer text-center pt-0 px-lg-2 px-1">
                      <p class="mb-2 text-sm mx-auto">
                        Bạn đã có tài khoản?
                        <a href="/RPapp2022/login" class="text-primary text-gradient font-weight-bold">Đăng nhập</a>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
      <!--   Core JS Files   -->
      <%@ include file="common/javascript.jsp" %>
        <!--   Core JS Files   -->
    </body>

    </html>