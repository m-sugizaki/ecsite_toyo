<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.view{
border: none;
background-color: transparent;
color: blue;
text-decoration: underline;
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
											<label for="trigger" class="close_btn">×</label>
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
															<td><form:input path="password" placeholder="パスワード"
																	class="userid" /></td>
														</tr>
														<tr>
															<td><input type="submit" value="ログイン" name="login"
																class="login" /> <a href="home" class="cancel">キャンセル</a></td>
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
				<h1>商品検索</h1>
				<form:form modelAttribute="prodmgrModel">
					<table id="kensaku">

						<tr>
							<td>商品名&nbsp;&nbsp;</td>
							<td><form:input path="product_name" placeholder="商品名" /></td>
						</tr>
						<tr>
							<td>メーカー名&nbsp;&nbsp;</td>
							<td><form:input path="maker" placeholder="メーカー名" /></td>
						<tr>
						<tr>
							<td>価格帯&nbsp;&nbsp;&nbsp;</td>
							<td><form:input path="minprice" placeholder="下限価格　（例）0" />&nbsp;&nbsp;～&nbsp;&nbsp;</td>
							<td><form:input path="maxprice"
									placeholder="上限価格  （例）5000000" /></td>
							<td>&nbsp;&nbsp;&nbsp;<form:button name="kensaku">検索</form:button></td>
						</tr>
						<c:out value="${opposite}"/>
						<c:out value="${numberformat}"/>
					</table>
				</form:form>
				<br> <br>

					<table id="kensakuresult" border="1">
						<tr>
							<th>商品コード&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>商品名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>メーカー&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>価格&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						</tr>
						<c:forEach var="product" items="${productsearchresultsentity}">
						<form:form modelAttribute="prodmgrModel">
							<tr>
								<td><form:button name="detail" class="view"> ${product.product_id}</form:button>
								<form:hidden path="product_id" value="${product.product_id}"/>
								</td>
								<td>${product.product_name}</td>
								<td>${product.maker}</td>
								<td>${product.price}</td>
							</tr>
						</form:form>
						</c:forEach>
					</table>


				<!-- テスト中！！！！！！！！！！！！！ -->
			</div>
		</div>
	</div>

</body>
</html>