<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="common/taglib.jsp" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
                      <a href="/RPapp2022/pays-manager" class="btn btn-primary">
                        <span class="material-icons align-middle">
                          add_circle_outline
                        </span>
                        Danh sách khoản thu</a>
                    </div>
                    <div class="card-body p-3">
                    <!-- Check username -->
                        <div class="alert ${del} alert-success text-white" role="alert" ${message!=null?'':'hidden'}>
                          <small>${message}</small>
                        </div>
                        <!-- Check username -->
                      <!-- Conntent start -->
                      <form class="mt-3" method="post" action="" ${message!=null?'hidden':''}>
                              <!-- Row -->
                              <div class="row">
                                  <!-- Item row -->
                                  <div class="col-md-12">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Tên khoản thu</label>
                                      <input type="text" class="form-control" name="name" value="${rec.name}"  required="required">
                                    </div>
                                    <!-- Check username -->
			                        <div class="text-danger mb-2" role="alert" ${!m1?'hidden':''}>
			                          <small>${message1}</small>
			                        </div>
			                        <!-- Check username -->
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-12">
                                    <div class="input-group input-group-outline my-2">
                                      <label class="form-label">Số tiền thu</label>
                                      <input min="0" type="number" class="form-control" name="money" value='${rec.money}'  required="required">
                                    </div>
                                    <!-- Check username -->
			                        <div class="text-danger mb-2" role="alert" ${!m1?'hidden':''}>
			                          <small>${message1}</small>
			                        </div>
			                        <!-- Check username -->
                                  </div>
                                  <!-- Item row -->
                                  <!-- Item row -->
                                  <div class="col-md-12">
                                    <div class="input-group input-group-static mb-4">
									     <label for="exampleFormControlSelect1" class="ms-0">Danh mục</label>
									     <select name="cate" class="form-control" id="exampleFormControlSelect1">
									      <c:forEach var="item3" items="${cate}">
									      		 <option ${rec.category.id==item3.id?'selected':''} value="${item3.id}">${item3.name}</option>
									      </c:forEach>
									     </select>
									   </div>
                                  </div>
                                  <!-- Item row -->
                              </div>
                              <div class="row">
                              	<!-- Item row -->
                                  <div class="col-md-6">
                                     <div class="input-group input-group-outline"}>
			                          <div class="form-check form-check-inline p-0">
			                            <label class="form-check-label" for="">Mức độ:</label>
			                          </div>
			                          <div class="form-check form-check-inline p-0">
			                            <input class="form-check-input" type="radio" name="levels" id="inlineRadio1" value="true" ${rec.levels?'checked':''} ${message==null?'checked':''} >
			                            <label class="form-check-label" for="inlineRadio1">Thường xuyên</label>
			                          </div>
			                          <div class="form-check form-check-inline p-0">
			                            <input class="form-check-input" type="radio" name="levels" id="inlineRadio2" value="false" ${rec.levels?'':'checked'}>
			                            <label class="form-check-label" for="inlineRadio2">Đột xuất</label>
			                          </div>
			                        </div>
                                  </div>
                                  <!-- Item row -->
                              </div>
                              <!-- Row -->
                              <div class="row p-3 justify-content-end">
                              	<button ${re?'hidden':''} class="col-md-2 btn btn-icon btn-2 btn-success" type="submit" formaction="/RPapp2022/receives-form/update">
                                  <span class="btn-inner--icon"><i class="material-icons mb-1">save</i></span>
                                  <span class="btn-inner--text">Cập nhật</span>
                                </button>
                                <button ${re?'':'hidden'} class="col-md-2 btn btn-icon btn-2 btn-success" type="submit" formaction="/RPapp2022/receives-form/add">
                                  <span class="btn-inner--icon"><i class="material-icons mb-1">save</i></span>
                                  <span class="btn-inner--text">Thêm</span>
                                </button>
                                <button ${re?'hidden':''} class="col-md-2 btn btn-icon btn-2 btn-danger" type="submit" formaction="/RPapp2022/receives-form/delete">
                                  <span class="btn-inner--icon"><i class="material-icons mb-1">highlight_off
                                  </i></span>
                                  <span class="btn-inner--text">Xóa</span>
                                </button>
                                <a class="ms-1 col-md-2 btn btn-icon btn-2 btn-secondary" href="/RPapp2022/receives-form">
                                  <span class="btn-inner--icon"><i class="material-icons">cancel</i></span>
                                  <span class="btn-inner--text">Hủy bỏ</span>
                                </a>
                              </div>
                            </form>                      
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