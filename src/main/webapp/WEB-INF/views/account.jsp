<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント情報画面</title>
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
					<li><a href="productcart">商品カート</a></li>
					<li><a href="purchasehistory">購入履歴</a></li>
					<li><a href="account">アカウント</a></li>
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
				<c:if test="${not empty  login.name}" >
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
				<br><a href="logout">ログアウト</a>
			</div>
	</div>
	</div>
	</div>


	<!-- メインコンテンツ -->
<h1>アカウント情報</h1>

<table border="0">
	<tr>
		<th>ユーザーID：</th>
		<td>${accountinfo.user_id}</td>
	</tr>

	<tr>
		<th>氏名：</th>
		<td>${accountinfo.name}</td>
	</tr>

	<tr>
		<th>ニックネーム：</th>
		<td>${accountinfo.nickname}</td>
	</tr>

	<tr>
		<th>郵便番号：</th>
		<td>${accountinfo.postal_code}</td>
	</tr>

	<tr>
		<th>住所1：</th>
		<td>${accountinfo.address1}</td>
	</tr>

	<tr>
		<th>住所2：</th>
		<td>${accountinfo.address2}</td>
	</tr>

	<tr>
		<th>電話番号：</th>
		<td>${accountinfo.phone_number}</td>
	</tr>

	<tr>
		<th>Eメール：</th>
		<td>${accountinfo.email}</td>
	</tr>

	<tr>
		<th>生年月日：</th>
		<td>${accountinfo.birthday}</td>
	</tr>

	<tr>
		<th>会員ランク：</th>
		<td>${accountinfo.member_rank}</td>
	</tr>
</table>

<p>支払方法情報</p>

<table>
	<tr>
		<th>支払No</th>
		<th>支払方法</th>
		<th>カード番号</th>
		<th>有効期限</th>
		<th>カード名義人</th>
	</tr>

	<c:forEach var="pay" items="paymentinfo">
		<tr>
			<td>${pay.payment_id}</td>
			<td>${pay.payment_method}</td>
			<td>${pay.card_number}</td>
			<td>${pay.expiration_date}</td>
			<td>${pay.card_holder_name}</td>
		</tr>
	</c:forEach>
</table>

<p>お届け先情報</p>

<table>
	<tr>
		<th>お届けNo</th>
		<th>郵便番号</th>
		<th>住所1</th>
		<th>住所2</th>
		<th>電話番号</th>
		<th>お届け先名</th>
	</tr>

	<c:forEach var="address" items="shippinginfo">
		<tr>
			<td>${address.shipping_address_no}</td>
			<td>${address.postal_code}</td>
			<td>${address.address1}</td>
			<td>${address.address2}</td>
			<td>${address.phone_number}</td>
			<td>${address.shipping_address_name}</td>
		</tr>
	</c:forEach>
</table>

<a href="accountupdate">変更</a>


</body>
</html>