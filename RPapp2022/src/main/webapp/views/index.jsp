<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<%@ include file="common/head.jsp"%>
<title>RPapp Dashboard</title>

</head>

<body class="g-sidenav-show  bg-gray-200">
	<!-- Header menu -->
	<%@ include file="common/header.jsp"%>
	<!-- Header menu -->
	<main
		class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
		<!-- Navbar -->
		<%@ include file="common/header2.jsp"%>
		<!-- End Navbar -->
		<!-- Main -->
		<div class="container-fluid py-4">
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div
								class="icon icon-lg icon-shape bg-gradient-dark shadow-dark text-center border-radius-xl mt-n4 position-absolute">
								<i class="material-icons opacity-10">weekend</i>
							</div>
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">TỔNG DANH MỤC</p>
								<h4 class="mb-0">${count1}</h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div
								class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
								<i class="material-icons opacity-10">person</i>
							</div>
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">TỔNG NGƯỜI DÙNG</p>
								<h4 class="mb-0">${count2}</h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div
								class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
								<i class="material-icons opacity-10">person</i>
							</div>
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">TỔNG THU</p>
								<h4 class="mb-0"><fmt:formatNumber>${count3}</fmt:formatNumber> VND</h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
							</p>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6">
					<div class="card">
						<div class="card-header p-3 pt-2">
							<div
								class="icon icon-lg icon-shape bg-gradient-info shadow-info text-center border-radius-xl mt-n4 position-absolute">
								<i class="material-icons opacity-10">weekend</i>
							</div>
							<div class="text-end pt-1">
								<p class="text-sm mb-0 text-capitalize">TỔNG CHI</p>
								<h4 class="mb-0"><fmt:formatNumber>${count4}</fmt:formatNumber> VND</h4>
							</div>
						</div>
						<hr class="dark horizontal my-0">
						<div class="card-footer p-3">
							<p class="mb-0">
								
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div class="card mb-3">
					<div class="card-body p-3">
						<div class="chart">
							<canvas id="pie-chart" class="chart-canvas" height="400px"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Main -->
		<!-- footer start -->
		<%@ include file="common/footer.jsp"%>
		<!-- footer end -->

	</main>

	<!--   Core JS Files   -->
	<%@ include file="common/javascript.jsp"%>
	<!--   Core JS Files   -->
</body>

</html>