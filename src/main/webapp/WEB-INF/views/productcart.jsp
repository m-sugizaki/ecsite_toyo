<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date, java.text.DateFormat" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品カート画面</title>
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

.view {
	font-size: 15px;
	border: none;
	background-color: transparent;
	color: blue;
	text-decoration: underline;
	cursor : pointer;
}


#kensaku{
 font-size: 18px;
}

.minititle, contents {
	font-size: 26px;
}
.minititle{
	margin-top: 30px;
}
.table, kensakuresult{
	font-size: 14px;
	border: solid 1px #000000;
	border-collapse: collapse;
}
.table2, kensakuresult{
	font-size: 14px;
	border: solid 1px #000000;
	border-collapse: collapse;
}
.table3, kensakuresult{
	font-size: 14px;
	border: solid 1px #000000;
	border-collapse: collapse;
}
.tabletitle, kensakuresult {
	font-size: 12px;
	align: center;
	width: 170px;
	background-color: lightblue;
	border: solid 1px #000000;
	border-collapse: collapse;
}

.tabletitle2, kensakuresult {
	font-size: 12px;
	align: center;
	width: 70px;
	background-color: lightblue;
	border: solid 1px #000000;
	border-collapse: collapse;
}
.tabletitle3, kensakuresult {
	font-size: 12px;
	align: center;
	width: 110px;
	background-color: lightblue;
	border: solid 1px #000000;
	border-collapse: collapse;
}
.kensakuresult td{
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

.kensakuresult th{
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}
.cartpopup{
  position: relative;
  display: inline-block;
  cursor: pointer;
  padding: 0.25em 0.5em;
  height: 35px;
  text-decoration: none;
  color: #FFF;
  background: #fd9535;/*背景色*/
  border-left: 0px;
  border-top: 0px;
  border-right: 0px;
  border-bottom: solid 2px #d27d00;/*少し濃い目の色に*/
  border-radius: 4px;/*角の丸み*/
  box-shadow: inset 0 2px 0 rgba(255,255,255,0.2), 0 2px 2px rgba(0, 0, 0, 0.19);
  font-size: small;
  font-weight: bold;
  margin: 10px;
  width: 100px;
}

.cartpopup:active {
  border-bottom: solid 2px #fd9535;
  box-shadow: 0 0 2px rgba(0, 0, 0, 0.30);
}

button.gopurchase{
  cursor: pointer;
  border: none;
  background: none;
  color: #0033cc;
  text-decoration:underline;
  text-decoration-color:#002080;
}
button.gopurchase:hover{
  text-decoration: underline;
  color: #002080;
}

.form_input{
	font-size: 15px;
	box-sizing: border-box;
	width: 300px;
	padding: 0.3em;
	transition: 0.3s;
	letter-spacing: 1px;
	color: black;
	border: none;
	border-bottom: 2px solid lightgray;
	background: transparent;
}

.form_input:focus {
	border-bottom: 2px solid black;
	outline: none;
}

.not_input{
	font-size: 15px;
	color: black;
}

.form_height{
	height: 40px;
}

.account_update th{
	width: 100px;
	text-align: left;
}



/*支払い方法登録,お届け先登録ポップアップ*/
	.popup_content2 {
  position: relative;
  align-self: center;
  width: 90%;
  max-width: 40%;
  height: 70%;
  padding: 30px 30px 15px;
  box-sizing: border-box;
  background: #fff;
  line-height: 1.4em;
  transition: 0.5s;
}

.delete{
	padding: 55px;
}

</style>
</head>
<body>
<div class="all">
	<!-- サイドバー -->
	<aside class="sidebar">
		<ul style="list-style:none" >
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
			<p>ようこそ
			<c:choose>
				<c:when test="${empty login.name}">
					ゲスト
				</c:when>
				<c:otherwise>
					<c:out value="${ login.name}" />
				</c:otherwise>
			</c:choose>さま
			<c:if test="${not empty  login.name}" >
				<br/>ログイン最終日時：<c:out value="${ formatedlogin_dt}" />
			</c:if>
			<c:if test="${!empty login.name }">
				<br/>商品カートの有無：
				<c:choose>
					<c:when test="${login.product_cart_id == 0 }"> 無</c:when>
					<c:otherwise> 有</c:otherwise>
				</c:choose>
			</c:if>
				<br><a href="logout">ログアウト</a>
			</div>
	</div>
<!-- メインコンテンツ -->
<p class="minititle">商品カート</p>
<table id="kensakuresult" border="1">
						<tr>
							<th class="tabletitle2" >カートNo</th>
							<th class="tabletitle" >商品コード</th>
							<th class="tabletitle" >商品名</th>
							<th class="tabletitle3" >価格（円）</th>
							<th class="tabletitle2" >数量</th>
							<th class="tabletitle3" >購入金額</th>
							<th class="tabletitle2" >サイズ</th>
							<th class="tabletitle3" >色</th>
							<th class="tabletitle" >カート追加日時</th>
							<th class="tabletitle2" >更新</th>
							<th class="tabletitle2" >カートから出す</th>
							<th class="tabletitle3" >レジに進む</th>
						</tr>
						<c:forEach var="cartlist" items="${cartlist}">

							<tr>
								<td class="table2" style="text-align:center">${cartlist.product_cart_id}</td>

								<form:form modelAttribute="prodmgrModel">
								<td class="table">
									<form:button name="detail" class="gopurchase"> ${cartlist.product_id}</form:button>
									<form:hidden path="product_id" value="${cartlist.product_id}" />
								</td>
								</form:form>

								<form:form modelAttribute="productCartModel">
								<form:hidden path="product_id" value="${cartlist.product_id}"/>
								<form:hidden path="product_cart_id" value="${cartlist.product_cart_id}" />
								<td class="table">${cartlist.product_name}<form:hidden path="product_name" value="${cartlist.product_name}" /></td>
								<td class="table3" align="right"><fmt:formatNumber value="${cartlist.price}" groupingUsed="true"
								maxIntegerDigits="17" maxFractionDigits="1" minIntegerDigits="0" minFractionDigits="0" /></td>
								<td class="table2" align="right">${cartlist.quantity}<form:hidden path="quantity" value="${cartlist.quantity}" /></td>
								<td class="table2" align="right"><fmt:formatNumber value="${cartlist.quantity * cartlist.price}" groupingUsed="true"
								maxIntegerDigits="17" maxFractionDigits="1" minIntegerDigits="0" minFractionDigits="0" /><form:hidden path="price" value="${cartlist.price}" /></td>
								<td class="table3">${cartlist.size}<form:hidden path="size" value="${cartlist.size}" /></td>
								<td class="table">${cartlist.color}<form:hidden path="color" value="${cartlist.color}" /></td>
								<td class="table"> <fmt:parseDate var="registdate" value="${cartlist.cart_regist_dt}" pattern="yyyy-MM-dd HH:mm" />
　                                                                                    <fmt:formatDate value="${registdate}" pattern="yyyy/MM/dd  HH:mm" /> </td>


								<td class="table"><form:button name="preupdate" class="view">更新</form:button></td>
								<td class="table">
										<!-- 商品カート削除ポップアップ -->
								<div class="popup_wrap">
									<input id="triggerdel${cartlist.product_cart_id}" type="checkbox" class="payment">
									<div class="popup_overlay">
									<label for="triggerdel${cartlist.product_cart_id}" class="popup_trigger"></label>
										<div class="popup_content">
											<!-- 商品カート削除ポップアップ中身 -->
											<div align="center" class="delete">
											<p class="minititle">削除してよろしいですか。</p>
											<br>
												<form:button name="delete" class="cartpopup">削除</form:button>
											<label for="triggerdel${cartlist.product_cart_id}" class="cancel"><span>キャンセル</span></label>
										</div>
									</div>
									</div>
								</div>
									<p><label for="triggerdel${cartlist.product_cart_id}" class="open_btn" >削除</label></p>
								</td>
								<td class="table"><form:button name="prepurchase" class="gopurchase">レジに進む</form:button></td>
								</form:form>
							</tr>

						</c:forEach>
					</table>
			</div>
			</div>
</body>
</html>