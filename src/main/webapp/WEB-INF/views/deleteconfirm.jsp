<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/reset.css">
<style type="text/css">
	.delete{
		padding: 55px;
	}
</style>
<title>注文取消確認</title>
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
						<br>
							<a href="logout">ログアウト</a>
			</div>
	</div>

	<!-- 取消確認画面ここから -->
	<div class="contents">
		<p class="minititle">注文取消確認</p>

		<form:form modelAttribute="productCartModel">
		<table>
		<tr>
			<th>注文No</th>
			<td>${deleteconfirm.order_no }</td>
		</tr>
		<tr>
			<th>商品コード</th>
			<td>${deleteconfirm.order_no }&nbsp;&nbsp;&nbsp;&nbsp;${deleteconfirm.product_name }</td>
		</tr>
		<tr>
			<th>価格</th>
			<td>${deleteconfirm.price }</td>
		</tr>
		<tr>
			<th>数量</th>
			<td>${deleteconfirm.quantity }</td>
		</tr>
		<tr>
			<th>購入金額</th>
				<td>
				<script type="text/javascript">
				var sum ;
				sum = parseInt("${deleteconfirm.price }") * parseInt("${deleteconfirm.quantity }");
				document.write(sum);
				</script>
				</td>
		</tr>
		<tr>
			<th>サイズ</th>
			<td>${deleteconfirm.size }</td>
		</tr>
		<tr>
			<th>色</th>
			<td>${deleteconfirm.color }</td>
		</tr>
		<tr>
			<th>配送予定日</th>
			<td>${deleteconfirm.delivery_plan_dt }</td>
		</tr>
		<tr>
			<td colspan="2">

				<!-- 取消ボタン(注文取消ポップアップ) -->
					<div class="popup_wrap">
					<input id="trigger" type="checkbox">
					<div class="popup_overlay">
					<label for="trigger" class="popup_trigger"></label>
					<div class="popup_content">
						<!-- 注文取消ポップアップ中身 -->
						<div align="center" class="delete">
							<p class="minititle">取消してよろしいですか。</p>
							<br>
							<form:form modelAttribute="productCartModel">
								<form:button name="delete" class="login">削除</form:button>
								<form:hidden path="shipping_address_no" value="${deleteconfirm.order_no}"/>
								<label for="trigger" class="cancel"><span>キャンセル</span></label>
							</form:form>
						</div>
					</div>
					</div>
					</div>
						<label for="trigger${address.shipping_address_no}" class="open_btn" >取消</label>

					<!-- キャンセルボタン -->
					<a href="purchasehistory" class="cancel">キャンセル</a>
			</td>
		</tr>
		</table>
		</form:form>
	</div>
	</div>
</body>
</html>