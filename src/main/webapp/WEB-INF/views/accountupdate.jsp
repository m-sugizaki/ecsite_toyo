<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date, java.text.DateFormat" %>
<%
 Date date = new Date();
 int year = date.getYear() + 1900;     // 0 = 1900 年
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント情報更新画面</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/reset.css">
<style type="text/css">
/*支払い方法,お届け先登録完了ボタン*/
	.finish{
		margin-top: 8px;
		padding: 3px;
		cursor: pointer;
		border: solid 1px black;
	}

	.popup_content2 {
		position: relative;
		align-self: center;
		width: 90%;
		max-width: 40%;
		height: 45%;
		padding: 30px 30px 15px;
		box-sizing: border-box;
		background: #fff;
		line-height: 1.4em;
		transition: 0.5s;
	}
</style>
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
<h1>アカウント情報更新</h1>

<div align="center">
	<h1>アカウント情報登録</h1>
	<form:form modelAttribute="accountModel">
		<table>
			<tr>
				<th>ユーザID</th>
				<td>${accountinfo.user_id}</td>
			</tr>
			<tr>
				<th>氏名</th>
				<td><form:input path="name" value="${accountinfo.name}" /></td>
			</tr>
			<tr>
				<th>ﾆｯｸﾈｰﾑ</th>
				<td><form:input path="nickname" value="${accountinfo.nickname}" /></td>
			</tr>
			<tr>
				<th>郵便番号</th>
				<td><form:input path="postal_code" value="${accountinfo.postal_code}" /></td>
			</tr>
			<tr>
				<th>住所1</th>
				<td><form:input path="address1" value="${accountinfo.address1}"/></td>
			</tr>
			<tr>
				<th>住所２</th>
				<td><form:input path="address2" value="${accountinfo.address2}" /></td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td><form:input path="phone_number" value="${accountinfo.phone_number}"/></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><form:input path="email" value="${accountinfo.email}"/></td>
			</tr>
			<tr>
				<th>生年月日</th>
				<td><form:input path="birthday" value="${accountinfo.birthday}"/></td>
			</tr>
			<tr>
				<th>会員ランク</th>
				<td>一般</td>
			</tr>
		</table>

	<form:button>登録</form:button>
	</form:form>
</div>

<p>支払方法情報</p>
<table>
	<tr>
		<th>支払方法</th>
		<th>カード番号</th>
		<th>有効期限</th>
		<th>カード名義人</th>
		<th>削除</th>
		<th>更新</th>
	</tr>

	<c:forEach var="pay" items="${paymentinfo}">
		<tr>
			<td>${pay.payment_method}</td>
			<td>${pay.card_number}</td>
			<td>${pay.expiration_date}</td>
			<td>${pay.card_holder_name}</td>
			<td>
				<!-- 支払方法削除ポップアップ -->
				<div class="popup_wrap">
					<input id="trigger" type="checkbox" class="payment">
					<div class="popup_overlay">
					<label for="trigger" class="popup_trigger"></label>
						<div class="popup_content">
							<!-- 支払い方法削除ポップアップ中身 -->
							<div align="center">
							<h3>削除してよろしいですか。</h3>
							</div>
							<br>
							<form:form modelAttribute="paymentMethodModel">
								<form:button name="deletepayment">削除</form:button>
								<form:hidden path="payment_no" value="${pay.payment_no}"/>
							</form:form>
							<label for="trigger"><span class="finish">キャンセル</span></label>
						</div>
					</div>
				</div>
					<p><label for="trigger" class="open_btn" >削除</label></p>
			</td>
			<td></td>
		</tr>
	</c:forEach>
</table>

<p>お届け先情報</p>
<table>
	<tr>
		<th>郵便番号</th>
		<th>住所1</th>
		<th>住所2</th>
		<th>電話番号</th>
		<th>お届け先名</th>
		<th>削除</th>
		<th>更新</th>
	</tr>

	<c:forEach var="address" items="${shippinginfo}">
		<tr>
			<td>${address.postal_code}</td>
			<td>${address.address1}</td>
			<td>${address.address2}</td>
			<td>${address.phone_number}</td>
			<td>${address.shipping_address_name}</td>
			<td>
				<!-- 届け先情報削除ポップアップ -->
				<div class="popup_wrap">
					<input id="trigger2" type="checkbox" class="payment">
					<div class="popup_overlay">
					<label for="trigger2" class="popup_trigger"></label>
						<div class="popup_content2">
							<!-- 届け先情報削除ポップアップ中身 -->
							<div align="center">
							<h3>削除してよろしいですか。</h3>
							</div>
							<br>
							<form:form modelAttribute="shippingAddressModel">
								<form:button name="deleteshipping">削除</form:button>
								<form:hidden path="shipping_address_no" value="${address.shipping_address_no}"/>
							</form:form>
							<label for="trigger2"><span class="finish">キャンセル</span></label>
						</div>
					</div>
				</div>
					<p><label for="trigger2" class="open_btn" >削除</label></p>
			</td>
			<td></td>
		</tr>
	</c:forEach>
</table>
</body>
</html>