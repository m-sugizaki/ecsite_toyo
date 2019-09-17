<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.view {
	border: none;
	background-color: transparent;
	color: blue;
	text-decoration: underline;
}

.minititle, contents {
	font-size: 26px;
}

.table, review {
	font-size: 16px;
	border: solid 1px #000000;
	border-collapse: collapse;
}

.tabletitle, review {
	font-size: 16px;
	width: 150px;
	align: center;
	background-color: lightblue;
	border: solid 1px #000000;
	border-collapse: collapse;
}

.review td {
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

.review th {
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

/*テキストボックスのデザイン*/
.input_form {
	position: relative;
	display: block;
	width: 100px;
	margin-top: 6px;
	padding: 2px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	color: black;
	outline: none;
	background: white;
	border: 1px solid lightgray;
}
</style>
<title>購入履歴</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/reset.css">


</head>
<body>
	<div class="all">
		<!-- サイドバー -->
		<aside class="sidebar">
			<ul style="list-style: none">
				<li class="sidebartitle">MENU</li>
				<li><a href="home">マイページ</a></li>
				<li><a href="search">商品検索</a></li>
				<c:if test="${not empty  login.name}">
					<li><a href="productcart">商品カート</a></li>
					<li><a href="purchasehistory">購入履歴</a></li>
					<li><a href="account">アカウント</a></li>
				</c:if>
			</ul>
		</aside>
		<!-- メイン(サイドバー横)の要素 -->
		<div class="main">
			<!-- ヘッダー -->
			<div class="headder">
				<div class="head">
					<p class="title">アジャイル開発実践ECサイト</p>
				</div>
				<!-- 右上ユーザー情報 -->
				<div class="head log">
					<p>
						ようこそ
						<c:choose>
							<c:when test="${empty login.name}">
				ゲスト
			</c:when>
							<c:otherwise>
								<c:out value="${ login.name}" />
							</c:otherwise>
						</c:choose>
						さま
						<c:if test="${not empty  login.name}">
							<br>
					ログイン最終日時：
						<c:out value="${ formatedlogin_dt}" />
						</c:if>
						<c:if test="${!empty login.name }">
							<br>
					商品カートの有無：
					<c:choose>
								<c:when test="${login.product_cart_id == 0 }"> 無</c:when>
								<c:otherwise> 有</c:otherwise>
							</c:choose>
						</c:if>
						<c:choose>
							<c:when test="${empty login.name }">
								<br>
								<!-- ポップアップ -->
								<div class="popup_wrap">
									<input id="trigger" type="checkbox">
									<div class="popup_overlay">
										<label for="trigger" class="popup_trigger"></label>
										<div class="popup_content">
											<!-- ログインポップアップ中身 -->
											<div align="center">
												<p class="logintitle">ログイン</p>
												<form method="get" action="login"></form>
												<table>
													<form:form modelAttribute="userModel">
														<tr>
															<td><form:input path="user_id" placeholder="ユーザーID"
																	class="userid" /></td>
														</tr>
														<tr>
															<td><form:password path="password"
																	placeholder="パスワード" class="userid" /></td>
														</tr>
														<tr>
															<td><form:input type="hidden" path="hid" value="3" />
																<input type="submit" value="ログイン" name="login"
																class="login" /> <label for="trigger" class="cancel">キャンセル</label></td>
														</tr>
													</form:form>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- 右上ユーザー情報続き -->
								<label for="trigger" class="open_btn" for="login">ログイン</label>

							 / <a href="regist">新規登録</a>
							</c:when>
							<c:otherwise>
								<br>
								<a href="logout">ログアウト</a>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
			<!-- メインコンテンツ -->
			<div class="contents">
				<br>
				<p class="minititle">購入履歴</p>
				<br> <br>
				<!-- 購入履歴の表示テーブル-->

				<table class="review">
					<tr>
						<th class="tabletitle">注文日時</th>
						<th class="tabletitle">注文No.</th>
						<th class="tabletitle">商品コード</th>
						<th class="tabletitle">商品名</th>
						<th class="tabletitle">注文状況</th>
						<th class="tabletitle">配送予定日</th>
						<th class="tabletitle">カートに入れる</th>
						<th class="tabletitle">レジに進む</th>
						<th class="tabletitle">注文キャンセル</th>


					</tr>
					<c:forEach var="purchaselist" items="${purchaselist}">
					<tr>

							<!-- varはitemから取り出した要素を格納する変数　itemsはループする配列、または、コレクション(キー)。　-->
							<!--  -->
								<td class="table">
								　<fmt:parseDate var="date" value="${purchaselist.order_dt}" pattern="yyyy-MM-dd HH:mm" />
　                                                                                    <fmt:formatDate value="${date}" pattern="yyyy/MM/dd  HH:mm" />

								</td>
								<td class="table">${purchaselist.order_no}</td>

								<form:form modelAttribute="prodmgrModel">
								<td class="table">
									<form:button name="detail" class="view"> ${purchaselist.product_id}</form:button>
									<form:hidden path="product_id" value="${purchaselist.product_id}" />
								</td>
								</form:form>

								<form:form modelAttribute="productCartModel" action="purchasehistory">

								<td class="table">${purchaselist.product_name}</td>
								<td class="table">${purchaselist.order_status}</td>
								<td class="table">    		<fmt:formatDate value="${purchaselist.delivery_plan_dt}" pattern="yyyy/MM/dd" /></td>
								<td class="table"><input type="submit" name="addcart"
									value="同じ内容でカートに追加">
								<input type="hidden" name="product_id" value="${purchaselist.product_id}" />
								<input type="hidden" name="product_name" value="${purchaselist.product_name}" />
								<input type="hidden" name="quantity" value="${purchaselist.quantity}" />
								<input type="hidden" name="size" value="${purchaselist.size}" />
								<input type="hidden" name="color" value="${purchaselist.color}" />
								<input type="hidden" name="order_no" value="${purchaselist.order_no}">
								<input type="hidden" name="price" value="${purchaselist.price}">
								</td>
								<td class="table"><input type="submit" name="prepurchase"
									value="同じ内容でレジに進む"></td>
								<td class="table">

								<c:choose>
									<c:when test="${!purchaselist.order_status.equals('注文確定')}"></c:when>
									<c:otherwise><form:button name="cancelorder">注文をキャンセルする</form:button></c:otherwise>
								</c:choose>
								</td>
								</form:form>
							</tr>
						<br>
					</c:forEach>
				</table>
				<br>
			</div>
		</div>
	</div>
</body>
</html>