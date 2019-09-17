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

#kensaku{
 font-size: 18px;
}
#kensaku th{
	height: 40px;
}

.minititle, contents {
	font-size: 26px;
}

.table, results {
	font-size: 16px;
	border: solid 1px #000000;
	border-collapse: collapse;
}

.results td{
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

.results th{
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

.tabletitle, results {
	font-size: 16px;
	align: center;
	width: 180px;
	background-color: lightblue;
	border: solid 1px #000000;
	border-collapse: collapse;
}

.form_input{
	font-size: 15px;
	box-sizing: border-box;
	width: 300px;
	padding: 0.3em;
	transition: 0.3s;
	letter-spacing: 1px;
	color: #aaaaaa;
	border: none;
	border-bottom: 2px solid lightgray;
	background: transparent;
}
</style>
<title>商品検索</title>
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
						<c:out value="${ login.login_dt}" />
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
												<form method="get" action=""></form>
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
															<td><form:input type="hidden" path="hid" value="2"/>
															<input type="submit" value="ログイン" name="login" class="login" />
																<label for="trigger" class="cancel">キャンセル</label></td>
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
				<p class="minititle">商品検索</p>
				<br>
				<form:form modelAttribute="prodmgrModel">
					<table id="kensaku">

						<tr>
							<td>商品名&nbsp;&nbsp;</td>
							<td><form:input path="product_name" placeholder="商品名" class="form_input" /></td>
						</tr>
						<tr>
							<td>メーカー名&nbsp;&nbsp;</td>
							<td><form:input path="maker" placeholder="メーカー名" class="form_input" /></td>
						<tr>
						<tr>
							<td>価格帯&nbsp;&nbsp;&nbsp;</td>
							<td><form:input path="minprice" placeholder="下限価格　（例）0" class="form_input" />&nbsp;&nbsp;～&nbsp;&nbsp;</td>
							<td><form:input path="maxprice"
									placeholder="上限価格  （例）5000000" class="form_input" /></td>
							<td>&nbsp;&nbsp;&nbsp;<form:button name="kensaku" class="login">検索</form:button></td>
						</tr>
						<tr>
					</table>

					<div class="errormessage">
						<c:out value="${opposite}" />
						<c:out value="${numberformat}" />
						<c:out value="${minus}" />
					</div>
				</form:form>
				<br> <br>



				<table class="results">
					<tr>
						<th class="tabletitle">商品コード</th>
						<th class="tabletitle">商品名</th>
						<th class="tabletitle">メーカー</th>
						<th class="tabletitle">価格</th>
					</tr>
					<c:forEach var="product" items="${productsearchresultsentity}">
						<form:form modelAttribute="prodmgrModel">
							<tr>
								<td class="table"><form:button name="detail" class="view"> ${product.product_id}</form:button>
									<form:hidden path="product_id" value="${product.product_id}" />
								</td>
								<td class="table">${product.product_name}</td>
								<td class="table">${product.maker}</td>
								<td class="table" align="right"><fmt:formatNumber value="${product.price}" groupingUsed="true"
								maxIntegerDigits="17" maxFractionDigits="1" minIntegerDigits="0" minFractionDigits="0" /></td>
							</tr>
						</form:form>
					</c:forEach>
				</table>
				<div class="errormessage">
						<c:out value="${noproduct}" />
					</div>
			</div>
		</div>
	</div>

</body>
</html>