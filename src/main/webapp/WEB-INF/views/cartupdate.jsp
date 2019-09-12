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

<title>カート更新画面</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/reset.css">

<!-- 商品合計金額計算用 -->
<script type="text/javascript">
function sum(){

	var price = document.form1.quantity.value * ${cart.price};
	document.form1.field.value = price;
}
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
<div align="center">
<p class="minititle">商品カート更新</p>
<form:form modelAttribute="productCartModel" name="form1">

<table>
	<tr>
		<th>カートNo</th>
		<td>${cart.product_cart_id}<form:hidden path="product_cart_id" value="${cart.product_cart_id}" /></td>
	</tr>
	<tr>
		<th>商品コード</th>
		<td>${cart.product_id}<form:hidden path="product_id" value="${cart.product_id}" /></td>
	</tr>
	<tr>
		<th>価格</th>
		<td>${cart.price}<form:hidden path="price" value="${cart.price}" /></td>
	</tr>
	<tr>
		<th>数量</th>
		<td><form:input path="quantity" value="${cart.quantity}" onChange="sum()" name="quantity" class="input_form" /></td><!--  -->
	</tr>
	<tr>
		<th>購入金額</th>
		<td>
		<!-- 合計金額表示 -->
		<input type="text" name="field" size="8" value="${cart.price} " class="input_form" readonly>
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
</table>

	<form:button name="update">更新&nbsp;</form:button>
			<a href="productcart">キャンセル</a>

</form:form>
</div>
</div>
</div>
</body>
</html>