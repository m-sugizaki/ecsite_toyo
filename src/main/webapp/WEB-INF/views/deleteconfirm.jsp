<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.minititle{
	font-size: 26px;
	margin-top: 20px;
	margin-bottom: 10px;
}

/*注文キャンセルの確認画面*/
.ordercancel{
	width: 50%;
}
.ordercancel th{
	position:relative;
	width: 1px;
	text-align:right;
	padding: 10px 0;
	border-bottom: 4px solid #ccc;
}
.ordercancel td{
	text-align: left;
	width:60%;
	text-align: center;
	padding: 10px 0;
	border-bottom: 1px solid #ccc;
}

.open_btn{
position: relative;
  display: inline-block;
  cursor: pointer;
  padding: 0.25em 0.5em;
  height: 27px;
  line-height: 27px;
  text-align: center;
  text-decoration: none;
  color: #FFF;
  background: #fd9535;/*背景色*/
  border-bottom: solid 2px #d27d00;/*少し濃い目の色に*/
  border-radius: 4px;/*角の丸み*/
  box-shadow: inset 0 2px 0 rgba(255,255,255,0.2), 0 2px 2px rgba(0, 0, 0, 0.19);
  font-size: small;
  font-weight: bold;
  margin:10px;
  width: 100px;
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
						<br>
							<a href="logout">ログアウト</a>
			</div>
	</div>

	<!-- 取消確認画面ここから -->
	<div class="contents">
		<p class="minititle">注文キャンセル確認</p>
		<table border="0" class="ordercancel">

		<form:form modelAttribute="productCartModel">
		<tr>
			<th>注文No：</th>
			<td>${deleteconfirm.order_no }</td>
		</tr>
		<tr>
			<th>商品コード：</th>
			<td>${deleteconfirm.product_id }</td>
		</tr>
		<tr>
			<th>商品名：</th>
			<td>${deleteconfirm.product_name }</td>
		</tr>
		<tr>
			<th>価格：</th>
			<td>
			<fmt:formatNumber value="${deleteconfirm.price }" groupingUsed="true"
								maxIntegerDigits="17" maxFractionDigits="1" minIntegerDigits="0" minFractionDigits="0" />
			</td>
		</tr>
		<tr>
			<th>数量：</th>
			<td>${deleteconfirm.quantity }</td>
		</tr>
		<tr>
			<th>購入金額：</th>
				<td>
				<script type="text/javascript">
				var sum ;
				sum = parseInt("${deleteconfirm.price }") * parseInt("${deleteconfirm.quantity }");
				document.write(sum);
				</script>
				</td>
		</tr>
		<tr>
			<th>サイズ：</th>
			<td>${deleteconfirm.size }</td>
		</tr>
		<tr>
			<th>色：</th>
			<td>${deleteconfirm.color }</td>
		</tr>
		<tr>
			<th>配送予定日：</th>
			<td><fmt:formatDate value="${deleteconfirm.delivery_plan_dt }" pattern="yyyy/MM/dd" /></td>
		</tr>
		</table>

		<table border="0" class="canxelpopup">
		<tr>
			<td colspan="2">

				<!-- 取消ボタン(注文取消ポップアップ) -->
					<div class="popup_wrap">
					<input id="trigger" type="checkbox">
					<div class="popup_overlay">
					<label for="trigger" class="popup_trigger"></label>
					<div class="popup_content">
						<!-- 注文ポップアップ中身 -->
						<div align="center" class="delete">
							<p class="minititle">注文をキャンセルしてよろしいですか。</p>
							<br>
							<form:form modelAttribute="productCartModel">
								<form:button name="cancel" class="login">はい</form:button>
								<form:hidden path="order_no" value="${deleteconfirm.order_no}"/>
								<label for="trigger" class="cancel"><span>いいえ</span></label>
							</form:form>
						</div>
					</div>
					</div>
					</div>
						<label for="trigger${address.shipping_address_no}" class="open_btn" >キャンセル
						</label>

					<!-- キャンセルボタン -->
					<a href="purchasehistory" class="cancel">戻る</a>
			</td>
		</tr>
		</table>
		</form:form>
	</div>
	</div>
</body>
</html>