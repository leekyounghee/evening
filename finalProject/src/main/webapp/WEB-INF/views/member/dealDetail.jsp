<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.update {font-size:10px !important;}
</style>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div class="my-panel"
		style="width: 100%; height: 1000px; display: flex;">
		<div class="mypageCategory no-drag">
			<ul class="my-tabs">
				<li class="my-tab"><a href="myinfo.me">내 정보 보기</a></li>
				<li class="my-tab"><a href="favorites.me">관심상품목록</a></li>
				<li class="my-tab"><a href="dealDetail.me">거래내역</a></li>
				<li class="my-tab"><a href="mypost.me">내가 쓴 글</a></li>
			</ul>
		</div>
		<div class="col-md-10 col-md-offset-1" style="margin: 0; width: 80%;">
			<div class="contact-wrap" style="height: 900px;">
				<div class="container">
					<ul class="tabs no-drag">
						<li class="tab-link current" data-tab="tab-1">입찰중인 상품</li>
						<li class="tab-link" data-tab="tab-2">결제완료내역</li>
					</ul>
					<div id="tab-1" class="tab-content current">
						<div class="container">

							<div class="row content" style="height: 600px;">
								<table border="1" summary="" class="content-table">
									<colgroup
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 50px;">
										<col style="width: 50px;" class="displaynone">
										<col style="width: 450px;">
										<col style="width: 100px;">
										<col style="width: 100px;" class="">
										<col style="width: 100px;">
									</colgroup>
									<thead>
										<tr style="">
											<th scope="col">번호</th>
											<th scope="col" class="displaynone">카테고리</th>
											<th scope="col">상품 이름</th>
											<th scope="col">현재 입찰가</th>
											<th scope="col">내 입찰가</th>
											<th scope="col">&nbsp;입찰수정</th>
										</tr>
									</thead>
									<tbody>
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											<td>324</td>
											<td class="displaynone"></td>
											<td>상품 이름</td>
											<td>10,000</td>
											<td>8,000</td>
											<td><button onclick="updateAuc();"
													class="btn btn-primary update">수정</button></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											<td>324</td>
											<td class="displaynone"></td>
											<td>상품 이름</td>
											<td>10,000</td>
											<td>8,000</td>
											<td><button onclick="updateAuc();"
													class="btn btn-primary update">수정</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-8"
									style="text-align: center; left: 27%; width: 350px;">
									<!-- <div class="col-md-5" id="searchbox"> -->

									<!-- </div> -->
									<ul class="pagination">
										<li class="disabled"><a href="#">«</a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							</div>
						</div>

					</div>
					<script>
						function updateAuc() {
							var url = "updateAucView.me";
							var name = "입찰내역 수정";

							var option = "width=620px, height=450px, top=100, left=200, resizable=0, location=0, scrollbars=0, tollbars=0, status=0";
							window.open(url, name, option);
						}
					</script>
					<div id="tab-2" class="tab-content">
						<div class="container">

							<div class="row content" style="height: 600px;">
								<table border="1" summary="" class="content-table">
									<colgroup
										class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
										<col style="width: 50px;">
										<col style="width: 50px;" class="displaynone">
										<col style="width: 450px;">
										<col style="width: 100px;">
										<col style="width: 100px;" class="">
										<col style="width: 100px;">
									</colgroup>
									<thead>
										<tr style="">
											<th scope="col">번호</th>
											<th scope="col" class="displaynone">카테고리</th>
											<th scope="col">상품 이름</th>
											<th scope="col">상품 가격</th>
											<th scope="col" class="displaynone">내 입찰가</th>
											<th scope="col">&nbsp;상세보기</th>
										</tr>
									</thead>
									<tbody>
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											<td>324</td>
											<td class="displaynone"></td>
											<td>상품 이름</td>
											<td>10,000</td>
											<td class="displaynone">8,000</td>
											<td><button onclick="updateAuc();"
													class="btn btn-info update">보기</button></td>
										</tr>
										<tr style="background-color: #FFFFFF; color: #333333;"
											class="xans-record-">
											<td>324</td>
											<td class="displaynone"></td>
											<td>상품 이름</td>
											<td>10,000</td>
											<td class="displaynone">8,000</td>
											<td><button onclick="updateAuc();"
													class="btn btn-info update">보기</button></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-md-8"
									style="text-align: center; left: 27%; width: 350px;">
									<!-- <div class="col-md-5" id="searchbox"> -->

									<!-- </div> -->
									<ul class="pagination">
										<li class="disabled"><a href="#">«</a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							</div>
							<!-- <table class="deal-table">
								<thead>
									<tr>
										<th width="30px">No.</th>
										<th width="300px">상품이름</th>
										<th width="100px">현재 입찰 가</th>
										<th width="100px">내 입찰가</th>
										<th width="80px">입찰 수정</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td><button onclick="updateAuc();" class="btn btn-primary">입찰수정</button></td>
									</tr>
									<tr>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td>d</td>
										<td><button onclick="updateAuc();" class="btn btn-primary">입찰수정</button></td>
									</tr>
								</tbody>
							</table> -->
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>