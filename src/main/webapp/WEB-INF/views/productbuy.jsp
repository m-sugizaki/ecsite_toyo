<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date, java.text.DateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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

/*商品購入画面*/
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
<title>商品購入画面</title>

<!-- 商品合計金額計算用 -->
<script type="text/javascript">
function sum(){

	var price = document.form1.quantity.value * ${cart.price};
	document.form1.field.value = price;
}
</script>
<script type="text/javascript">
 var preprice = document.form1.quantity.value * ${productentity.price} ;
 document.form1.field.value = preprice;

</script>

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
						<br>
							<a href="logout">ログアウト</a>
			</div>
	</div>


<!-- 商品購入画面はここから -->

<div class="contents">
		<p class="minititle">商品購入</p>
		<table border="0" class="ordercancel">


<form:form modelAttribute="productCartModel" name="form1">

	<tr>
		<th>カートNo</th>
		<td>${cart.product_cart_id}<form:hidden path="product_cart_id" value="${cart.product_cart_id}" /></td>
	</tr>
	<tr>
		<th>商品名</th>
		<td>${cart.product_name}<form:hidden path="product_name" value="${cart.product_name}" /></td>
	</tr>
	<tr>
		<th>商品コード</th>
		<td>${cart.product_id}<form:hidden path="product_id" value="${cart.product_id}" /></td>
	</tr>
	<tr>
		<th>価格</th>
		<td><fmt:formatNumber value="${cart.price}" groupingUsed="true"
								maxIntegerDigits="17" maxFractionDigits="1" minIntegerDigits="0" minFractionDigits="0" /></td>
	</tr>
	<tr>
		<th>数量</th>
		<td><form:input path="quantity" value="${cart.quantity}" onChange="sum()" name="quantity" pattern="[0-9]{1,5}" required="required"/></td>
	</tr>
	<tr>
		<th>購入金額</th>
		<td>
		<!-- 合計金額表示 -->
		<input type="text" name="field" size="8" value="${cart.price * cart.quantity}" readonly>
		</td>
	</tr>
	<tr>
		<th>サイズ</th>
		<td><form:select path="size" items="${sizelist}" /></td>
	</tr>
	<tr>
		<th>色</th>
		<td><form:select path="color" items="${colorlist}" /></td>
	</tr>
	<tr>
		<th>支払い方法</th>
		<td>
			<form:radiobutton path="payment_method" value="銀行引き落とし" label="銀行引き落とし" checked="checked"  /><br>
			<form:radiobutton path="payment_method" value="商品代引き" label="商品代引き" /><br>
			<form:radiobutton path="payment_method" value="クレジットカード" label="クレジットカード"/><br>
			<br>
			<p>カード会社</p>
			<c:forEach var="paylist" items="${paymentinfo}" >
					<input type="radio" name="payment_no" value="${paylist.payment_no}">${paylist.payment_method}
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th></th>
		<td><a href="accountupdate">支払い情報を追加/更新する</a></td>
	</tr>
	<tr>
		<th>お届け先</th>
		<td>
			<form:radiobutton path="shipping_address_no" value="0" label="現住所" checked="checked" /><br>
			別のお届け先<br>
			<c:forEach var="shiplist" items="${shippinginfo}">
					<input type="radio" name="shipping_address_no" value="${shiplist.shipping_address_no}">${shiplist.address1}${shiplist.address2}<br>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<th></th>
		<td><a href="accountupdate">お届け先情報を追加/更新する</a></td>
	</tr>
	</table>
	<form:button name="purchase" class="login">注文する</form:button>
			<a href="productcart" class="cancel">キャンセル</a>
</form:form>


</body>
</html>