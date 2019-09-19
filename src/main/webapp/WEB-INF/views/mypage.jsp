<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/reset.css">
</head>
<body>
	<div class="all">
	<!-- サイドバー -->
		<aside class="sidebar">
			<ul style="list-style:none">
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
		<span class="title">アジャイル開発実践ECサイト</span>
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
				<c:if test="${not empty  login.name}" >
				<br>
					ログイン最終日時：
						<c:out value="${formatedlogin_dt}" />
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
							<!--<label for="trigger" class="close_btn">×</label>-->
							<!-- ログインポップアップ中身 -->
								<div align="center">
									<p class="logintitle">ログイン</p>
									<form method="get" action="">
									</form>
									<table>
										<form:form modelAttribute="userModel" >
										<!-- フォーム入力 -->
										<tr><td><form:input path="user_id" placeholder="ユーザーID" class="userid" /></td></tr>
										<tr><td><form:password path="password" placeholder="パスワード" class="userid" /></td></tr>
										<tr><td><form:input type="hidden" path="hid" value="1"/>
										<input type="submit" value="ログイン" name="login" class="login" />
										<label for="trigger" class="cancel">キャンセル</label></td></tr>
										<!-- <a href="home" class="cancel">キャンセル</a>-->    </td></tr>
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

			<!-- エラーメッセージ -->
					<form:form modelAttribute="userModel">
						<p class="errormessage">
							<form:errors path="user_id" elements="span" />
							<form:errors path="password" elements="span" />
							<c:if test="${!empty errormessage }">
								<c:out value="${errormessage }" />
							</c:if>
						</p>
					</form:form>
			<!-- メインコンテンツ -->
			<div class="contents">
				<img src="resources/image.PNG" alt="ロゴ" height="300px" width="340px"/>
			</div>
	</div>
	</div>
</body>
</html>