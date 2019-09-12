<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.minititle{
	font-size: 26px;
	margin-top: 20px;
	margin-bottom: 10px;
}

/*アカウント情報テーブル*/
.accounttable{
	width: 50%;
}
.accounttable th{
	position:relative;
	width: 1px;
	text-align:right;
	padding: 10px 0;
	border-bottom: 4px solid #ccc;
}
.accounttable td{
	text-align: left;
	width:60%;
	text-align: center;
	padding: 10px 0;
	border-bottom: 1px solid #ccc;
}

	/*支払い&お届け先情報テーブル*/
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
.table, results {
	font-size: 16px;
	border: solid 1px #000000;
	border-collapse: separate;
}
.tabletitle, results {
	font-size: 16px;
	align: center;
	width: 150px;
	background-color: lightblue;
	border: 1px solid  #000000;
	border-collapse: separate;
}
</style>
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


	<!-- メインコンテンツ -->
<div class="contents">
<p class="minititle">アカウント情報</p>

<table border="0" class="accounttable">
	<tr>
		<th>ユーザーID:</th>
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
<br>
<p class="minititle">支払方法情報</p>

<table class="results">
	<tr>
		<th class="tabletitle">カードの種類</th>
		<th class="tabletitle">カード番号</th>
		<th class="tabletitle">有効期限</th>
		<th class="tabletitle">カード名義人</th>
	</tr>

	<c:forEach var="pay" items="${paymentinfo}">
		<tr>
			<td class="table">${pay.payment_method}</td>
			<td class="table">${pay.card_number}</td>
			<td class="table">${pay.expiration_date}</td>
			<td class="table">${pay.card_holder_name}</td>
		</tr>
	</c:forEach>
</table>
<br>
<p class="minititle">お届け先情報</p>

<table class="results">
	<tr>
		<th class="tabletitle">郵便番号</th>
		<th class="tabletitle">住所1</th>
		<th class="tabletitle">住所2</th>
		<th class="tabletitle">電話番号</th>
		<th class="tabletitle">お届け先名</th>
	</tr>

	<c:forEach var="address" items="${shippinginfo}">
		<tr>
			<td class="table">${address.postal_code}</td>
			<td class="table">${address.address1}</td>
			<td class="table">${address.address2}</td>
			<td class="table">${address.phone_number}</td>
			<td class="table">${address.shipping_address_name}</td>
		</tr>
	</c:forEach>
</table>

<a href="accountupdate" class="cancel">変更</a>
</div>

	</div>
	</div>


</body>
</html>