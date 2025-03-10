<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
	<title>중고 거래 게시판</title>
	</head>
	<body>
	
	<c:import url="/WEB-INF/views/common/header.jsp"/>
		
	<div class="colorlib-loader"></div>

	<div id="page">

		<div class="colorlib-shop">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-push-2">
						<div class="row row-pb-lg">
						
						<button class="btn btn-primary btn-outline"style="float: right; margin: 0px 50px 0 0px;"
							onclick="location.href='insertForm.ud';">글쓰기</button>
						
						<h2><span style="font-size: 50px;">중고 거래 게시판</span></h2>
						
						<!-- 상품 리스트 -->
						<c:if test="${ fn:length(alist) > 0 }">
						
							<c:forEach var="i" items="${ alist }" begin="0" end="${ fn:length(alist) }">
								<div class="col-md-4 text-center">
									<div class="product-entry">
									
										<!-- 이미지 삽입 : 이미지 파일이 여러개일시 첫번째 이름을 등록 -->
										<c:forEach var="j" items="${ af }" begin="0" end="${ fn:length(af) }">
											<c:if test="${ j.SG_ID eq i.SG_ID }">
												<c:forTokens items="${ j.RENAMEFILENAME }" delims="," varStatus="jStatus">
													<c:if test="${ jStatus.first }">
														<c:set var="k" value="${ jStatus.current }" />
													</c:if>
												</c:forTokens>
											</c:if>
										</c:forEach>
										<div class="product-img" style="background-image: url(resources/images/${ k })">
										
										<!-- 사진이 없을시 나타날 공백표시 -->
										<c:remove var="k"/>
										
										<!-- 테스트용 ( 날짜 계산 )  -->
											<jsp:useBean id="now" class="java.util.Date"/>
											<fmt:parseDate var="enroll" value="${ i.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
											<fmt:parseDate var="end" value="${ i.SG_END_DATE }" pattern="yyyy-MM-dd"/>
											
											<fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowDays"/>
											<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays"/>
											<fmt:parseNumber value="${ end.time / (1000*60*60*24) }" integerOnly="true" var="endDays"/>

												<p class="tag">
													<c:if test="${ ( nowDays - enrollDays ) <= 7 }">
														<span class="new">New</span>
													</c:if>
												</p>

												<div class="cart">
													<p>
														<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
														<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
														<span><a href="#"><i class="icon-heart3"></i></a></span>
														<!-- <span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span> -->
													</p>
												</div>
												
										</div>
										
										<div class="desc">
											<h3><a href="product-detail.html">${ i.SG_BNAME }</a></h3>
											<p class="price">가격<span> <br> <fmt:formatNumber value="${i.SG_PRICE }" type="currency"/></span></p>
										</div>
										
									</div>
								</div>
							</c:forEach>
						</c:if>
							
						</div>
						
						<div class="row"> <!-- 페이지 이동 바(페이징 처리) -->
							<div class="col-md-12">
								<ul class="pagination">
									<!-- 이전 페이지 -->
									<c:if test="${ pi.currentPage <= 1 }">
										<li class="disabled"><a>&laquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
										<c:url var="before" value="secondgoodList.bo">	
											<c:param name="page" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<li><a href="${ before }">&laquo;</a></li>
									</c:if>
									
									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="active"><a>${ p }</a></li>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="secondgoodList.bo">
												<c:param name="page" value="${ p }"/>
											</c:url>
											<li><a href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>
									
									<!-- 다음 페이지 -->
									<c:if test="${ pi.currentPage >= pi.maxPage }">
										<li class="disabled"><a href="#">&raquo;</a></li>
									</c:if>
									<c:if test="${ pi.currentPage < pi.maxPage }">
										<c:url var="after" value="secondgoodList.bo">
											<c:param name="page" value="${ pi.currentPage + 1 }"/>
										</c:url>
										<li><a href="${ after }">&raquo;</a></li>
									</c:if>
								</ul>
							</div>
						</div>
						
					</div>
					
					<div class="col-md-2 col-md-pull-10">
						<div class="sidebar"> <!-- 사이드바 -->
							<div class="side"> <!-- side 하나당 사이이드바 칸 한개씩 추가됨 -->
								<h2>정렬 순서</h2>
								<div class="fancy-collapse-panel">
			                  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
			                     
			                     
			                     <c:url var="recentList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="recent"/>
			                     </c:url>
			                     <c:if test="${ modeSet eq 'recent' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ recentList }" style="color: white;">최근 등록순</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'recent' }">
				                     <div><a href="${ recentList }">최근 등록순</a></div>
			                     </c:if>
			                     
			                     <c:url var="priceAscList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="priceAsc" />
			                     </c:url>
			                      <c:if test="${ modeSet eq 'priceAsc' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ priceAscList }" style="color: white;">가격 오름차 순</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'priceAsc' }">
			                     	<div><a href="${ priceAscList }">가격 오름차 순</a></div>
			                     </c:if>
			                     
			                     <c:url var="priceDescList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="priceDesc"/>
			                     </c:url>
			                      <c:if test="${ modeSet eq 'priceDesc' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ priceDescList }" style="color: white;">가격 내림차 순</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'priceDesc' }">
			                     	<div><a href="${ priceDescList }">가격 내림차 순</a></div>
			                     </c:if>
			                     
			                     <c:url var="CountList" value="secondgoodList.bo">
			                     	<c:param name="page" value="${ pi.currentPage }"/>
			                     	<c:param name="mode" value="CountList" />
			                     </c:url>
			                     <c:if test="${ modeSet eq 'CountList' }">
				                     <div style="background-color: orange; padding-left: 10px;"><a href="${ CountList }" style="color: white;">조회순</a></div>
			                     </c:if>
			                     <c:if test="${ modeSet ne 'CountList' }">
			                     	<div><a href="${ CountList }">조회순</a></div>
			                     </c:if>
			                     
			                     <br>
			                     <div style="font: bolder; font-size: 15px;">총 상품 수 : ${ pi.listCount }</div>
			                     
			                  </div>
			               </div>
						</div>

							<div class="side">
								<h2>최근에 본 물건</h2>
								<div>test</div>
							</div>
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<c:import url="/WEB-INF/views/common/footer.jsp"/>

	</body>
</html>

