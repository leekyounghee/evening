<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
	<title>Store Template</title>
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
						<!-- 상품 리스트 -->
						
						<c:if test="${ fn:length(alist) > 0 }">
						<c:set var="imageCount" value="1"/>
							<c:forEach var="i" items="${ alist }" begin="0" end="${ fn:length(alist) }">
								<div class="col-md-4 text-center">
									<div class="product-entry">
										<div class="product-img" style="background-image: url(resources/images/item-${imageCount}.jpg);">
										
										<c:set var="imageCount" value="${imageCount + 1}"/>
										<c:if test="${ imageCount > 15 }">
											<c:set var="imageCount" value="1"/>
										</c:if> <!-- 테스트용  -->
											<jsp:useBean id="now" class="java.util.Date"/>
											<fmt:parseDate var="enroll" value="${ i.SG_ENROLL_DATE }" pattern="yyyy-MM-dd"/>
											
											<fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowDays"/>
											<fmt:parseNumber value="${ enroll.time / (1000*60*60*24) }" integerOnly="true" var="enrollDays"/>
											
											<c:if test="${ ( nowDays - enrollDays ) < 8 }">
												<p class="tag"><span class="new">New</span></p>
											</c:if>
										
											<div class="cart">
												<p>
													<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
													<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
													<span><a href="#"><i class="icon-heart3"></i></a></span>
													<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
												</p>
											</div>
										</div>
										<div class="desc">
											<h3><a href="product-detail.html">${ i.SG_BNAME }</a></h3>
											<p class="price">급매가<span> <br> <fmt:formatNumber value="${i.SG_PRICE }" type="currency"/></span></p>
											<p class="price">경매시작가<span> <br> <fmt:formatNumber value="${i.SG_SPRICE }" type="currency"/></span></p>
											
											테스트 : 7일까지는 'New' <br>
											현재 : ${ now } , ${ nowDays } <br>
											등록일 : ${ enroll }, ${ enrollDays }
											<br>
											차이 : ${ nowDays - enrollDays } 일
											
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
							
							<!-- 삭제예정
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-6.jpg);">
										<p class="tag"><span class="sale">Sale</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$199.00</span> <span class="sale">$300.00</span> </p>
									</div>
								</div>
							</div>
							
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-7.jpg);">
										<p class="tag"><span class="new">New</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-8.jpg);">
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-9.jpg);">
										<p class="tag"><span class="sale">Sale</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$199.00</span> <span class="sale">$300.00</span> </p>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-10.jpg);">
										<p class="tag"><span class="new">New</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-11.jpg);">
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-12.jpg);">
										<p class="tag"><span class="new">New</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-13.jpg);">
										<p class="tag"><span class="new">New</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-14.jpg);">
										<p class="tag"><span class="new">New</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-15.jpg);">
										<p class="tag"><span class="new">New</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div>
							<div class="col-md-4 text-center">
								<div class="product-entry">
									<div class="product-img" style="background-image: url(resources/images/item-16.jpg);">
										<p class="tag"><span class="new">New</span></p>
										<div class="cart">
											<p>
												<span class="addtocart"><a href="cart.html"><i class="icon-shopping-cart"></i></a></span> 
												<span><a href="product-detail.html"><i class="icon-eye"></i></a></span> 
												<span><a href="#"><i class="icon-heart3"></i></a></span>
												<span><a href="add-to-wishlist.html"><i class="icon-bar-chart"></i></a></span>
											</p>
										</div>
									</div>
									<div class="desc">
										<h3><a href="product-detail.html">Floral Dress</a></h3>
										<p class="price"><span>$300.00</span></p>
									</div>
								</div>
							</div> -->
							
							
							
						</div>
						
						<div class="row"> <!-- 페이지 이동 바 -->
							<div class="col-md-12">
								<ul class="pagination">
									<li class="disabled"><a href="#">&laquo;</a></li>
									<li class="active"><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">&raquo;</a></li>
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
			                     <!-- 판넬식 방법 (템플릿)
			                     <div class="panel panel-default">
			                         <div class="panel-heading" role="tab" id="headingOne">
			                             <h4 class="panel-title">
			                                 <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Men
			                                 </a>
			                             </h4>
			                         </div>
			                         <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			                             <div class="panel-body">
			                                 <ul>
			                                 	<li><a href="#">Jeans</a></li>
			                                 	<li><a href="#">T-Shirt</a></li>
			                                 	<li><a href="#">Jacket</a></li>
			                                 	<li><a href="#">Shoes</a></li>
			                                 </ul>
			                             </div>
			                         </div>
			                     </div> -->
			                     <div><a href="">마감 시간순</a></div>
			                     <div><a href="">최근 등록순</a></div>
			                     
			                  </div>
			               </div>
						</div>
						
						<div class="side">
							<h2>최근에 본 물건</h2>
							<div>test D
								<div>test S</div>
							</div>
						</div>
							
							<!-- 안쓸것 같은 사이드바 칸 (일단 잠금)
							<div class="side">
								<h2>Price Range</h2>
								<form method="post" class="colorlib-form-2">
				              	<div class="row">
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">Price from:</label>
				                    <div class="form-field">
				                      <i class="icon icon-arrow-down3"></i>
				                      <select name="people" id="people" class="form-control">
				                        <option value="#">1</option>
				                        <option value="#">200</option>
				                        <option value="#">300</option>
				                        <option value="#">400</option>
				                        <option value="#">1000</option>
				                      </select>
				                    </div>
				                  </div>
				                </div>
				                
				                <div class="col-md-12">
				                  <div class="form-group">
				                    <label for="guests">Price to:</label>
				                    <div class="form-field">
				                      <i class="icon icon-arrow-down3"></i>
				                      <select name="people" id="people" class="form-control">
				                        <option value="#">2000</option>
				                        <option value="#">4000</option>
				                        <option value="#">6000</option>
				                        <option value="#">8000</option>
				                        <option value="#">10000</option>
				                      </select>
				                    </div>
				                  </div>
				                </div>
				              </div>
				            </form>
							</div>
							
							<div class="side">
								<h2>Color</h2>
								<div class="color-wrap">
									<p class="color-desc">
										<a href="#" class="color color-1"></a>
										<a href="#" class="color color-2"></a>
										<a href="#" class="color color-3"></a>
										<a href="#" class="color color-4"></a>
										<a href="#" class="color color-5"></a>
									</p>
								</div>
							</div>
							
							<div class="side">
								<h2>Size</h2>
								<div class="size-wrap">
									<p class="size-desc">
										<a href="#" class="size size-1">xs</a>
										<a href="#" class="size size-2">s</a>
										<a href="#" class="size size-3">m</a>
										<a href="#" class="size size-4">l</a>
										<a href="#" class="size size-5">xl</a>
										<a href="#" class="size size-5">xxl</a>
									</p>
								</div>
							</div>
							 -->
							 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<c:import url="/WEB-INF/views/common/footer.jsp"/>

	</body>
</html>

