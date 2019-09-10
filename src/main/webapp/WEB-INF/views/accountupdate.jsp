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

.view {
	border: none;
	background-color: transparent;
	color: blue;
	text-decoration: underline;
}

#kensaku{
 font-size: 18px;
}

.minititle, contents {
	font-size: 26px;
}
.table, results {
	font-size: 16px;
	border: solid 1px #000000;
	border-collapse: collapse;
}

.tabletitle, results {
	font-size: 16px;
	align: center;
	width: 150px;
	background-color: lightblue;
	border: solid 1px #000000;
	border-collapse: collapse;
}

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

.form_input{
	font-size: 15px;
	box-sizing: border-box;
	width: 300px;
	padding: 0.3em;
	transition: 0.3s;
	letter-spacing: 1px;
	color: #aaaaaa;
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
  height: 60%;
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
				<br>ログイン最終日時：<c:out value="${ login.login_dt}" />
			</c:if>
			<c:if test="${!empty login.name }">
				<br>商品カートの有無：
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
		<br><p class="minititle">アカウント情報更新</p>
		<br>
		<form:form modelAttribute="accountModel">
			<table class="account_update">
				<tr>
					<th>ユーザID</th>
					<td class="not_input form_height">${accountinfo.user_id}</td>
				</tr>
				<tr>
					<th>氏名</th>
					<td class="form_height"><form:input path="name" placeholder="${accountinfo.name}" class="form_input"/></td>
					<td><form:errors path="name" elements="span" /></td>
				</tr>
				<tr>
					<th>ﾆｯｸﾈｰﾑ</th>
					<td class="form_height"><form:input path="nickname" placeholder="${accountinfo.nickname}" class="form_input" /></td>
					<td><form:errors path="nickname" elements="span" /></td>
				</tr>
				<tr>
					<th>郵便番号</th>
					<td class="form_height"><form:input path="postal_code" placeholder="${accountinfo.postal_code}" class="form_input" /></td>
					<td><form:errors path="postal_code" elements="span" /></td>
				</tr>
				<tr>
					<th>住所1</th>
					<td class="form_height"><form:input path="address1" placeholder="${accountinfo.address1}" class="form_input"/></td>
					<td><form:errors path="address1" elements="span" /></td>
				</tr>
				<tr>
					<th>住所２</th>
					<td class="form_height"><form:input path="address2" placeholder="${accountinfo.address2}" class="form_input" /></td>
					<td><form:errors path="address2" elements="span" /></td>
				</tr>
				<tr>
					<th>電話番号</th>
					<td class="form_height"><form:input path="phone_number" placeholder="${accountinfo.phone_number}" class="form_input"/></td>
					<td><form:errors path="phone_number" elements="span" /></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td class="form_height"><form:input path="email" placeholder="${accountinfo.email}" class="form_input"/></td>
					<td><form:errors path="email" elements="span" /></td>
				</tr>
				<tr>
					<th>生年月日</th>
					<td class="form_height"><form:input path="birthday" placeholder="${accountinfo.birthday}" class="form_input"/></td>
					<td><form:errors path="birthday" elements="span" /></td>
				</tr>
				<tr>
					<th>会員ランク</th>
					<td class="not_input form_height">一般</td>
				</tr>
			</table>
			<form:button name="update" class="login">登録&nbsp;</form:button>
			<form:button name="cancel" class="login">キャンセル</form:button>
		</form:form>
		<br>

		<p class="minititle">支払方法情報</p>

		<!-- 支払方法追加ポップアップ -->
			<div class="popup_wrap">
				<input id="triggeraddpay" type="checkbox" class="payment">
				<div class="popup_overlay">
				<label for="triggeraddpay" class="popup_trigger"></label>
					<div class="popup_content2">
						<!-- 支払い方法追加ポップアップ中身 -->
						<div align="center">
						<p class="minititle">支払い方法情報登録</p>
						<br>
						<form:form modelAttribute="paymentMethodModel">
							<table class="account_update">
								<tr>
									<th>ユーザーID</th>
										<td>${accountinfo.user_id}</td>
								</tr>
								<tr>
									<th>支払方法</th>
									<td><form:input path="payment_method" class="userid"/></td>
								</tr>
								<tr>
									<th>カード番号</th>
									<td><form:input path="card_number" class="userid"/></td>
								</tr>
								<tr>
									<th>有効期限</th>
									<td><form:select path="expiration_month" class="userid">
											<option value="1">01</option>
											<option value="2">02</option>
											<option value="3">03</option>
											<option value="4">04</option>
											<option value="5">05</option>
											<option value="6">06</option>
											<option value="7">07</option>
											<option value="8">08</option>
											<option value="9">09</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</form:select>

										<form:select path="expiration_year" class="userid">
											<option value="<%= year %>"><%= year %></option>
											<option value="<%= year + 1%>"><%= year + 1 %></option>
											<option value="<%= year + 2%>"><%= year + 2 %></option>
											<option value="<%= year + 3%>"><%= year + 3 %></option>
											<option value="<%= year + 4%>"><%= year + 4 %></option>
										</form:select></td>
								</tr>
								<tr>
									<th>カード名義人</th>
									<td><form:input path="card_holder_name" value="${pay.card_holder_name}" class="userid"/></td>
								</tr>
							</table>
										<br>
							<form:button name="registerpayment" class="login">登録</form:button>
						<label for="triggeraddpay" class="cancel"><span>キャンセル</span></label>
						</form:form>
								</div>
								</div>
							</div>
						</div>
							<p><label for="triggeraddpay" class="open_btn" >追加</label></p>
		<br>
		<table class="results">
			<tr>
				<th class="tabletitle">支払方法</th>
				<th class="tabletitle">カード番号</th>
				<th class="tabletitle">有効期限</th>
				<th class="tabletitle">カード名義人</th>
				<th class="tabletitle">削除</th>
				<th class="tabletitle">更新</th>
			</tr>

			<c:forEach var="pay" items="${paymentinfo}">
				<tr>
					<td class="table">${pay.payment_method}</td>
					<td class="table">${pay.card_number}</td>
					<td class="table">${pay.expiration_date}</td>
					<td class="table">${pay.card_holder_name}</td>
					<td class="table">
						<!-- 支払方法削除ポップアップ -->
						<div class="popup_wrap">
							<input id="triggerdelete${pay.payment_no}" type="checkbox" class="payment">
							<div class="popup_overlay">
							<label for="triggerdelete${pay.payment_no}" class="popup_trigger"></label>
								<div class="popup_content">
									<!-- 支払い方法削除ポップアップ中身 -->
									<div align="center" class="delete">
									<p class="minititle">削除してよろしいですか。</p>
									<br>
									<form:form modelAttribute="paymentMethodModel">
										<form:button name="deletepayment" class="login">削除</form:button>
										<form:hidden path="payment_no" value="${pay.payment_no}"/>
									<label for="triggerdelete${pay.payment_no}" class="cancel"><span>キャンセル</span></label>
									</form:form>
								</div>
								</div>
							</div>
						</div>
							<p><label for="triggerdelete${pay.payment_no}" class="open_btn" >削除</label></p>
					</td>
					<td class="table">
						<!-- 支払方法更新ポップアップ -->
						<div class="popup_wrap">
							<input id="trigger${pay.payment_no}" type="checkbox" class="payment">
							<div class="popup_overlay">
							<label for="trigger${pay.payment_no}" class="popup_trigger"></label>
								<div class="popup_content2">
									<!-- 支払い方法更新ポップアップ中身 -->
									<div align="center">
									<p class="minititle">支払情報更新</p>
									<br>
									<form:form modelAttribute="paymentMethodModel">
										<table class="account_update">
											<tr>
												<th>ユーザーID</th>
												<td>${accountinfo.user_id}</td>
											</tr>
											<tr>
												<th>支払方法</th>
												<td><form:input path="payment_method" value="${pay.payment_method}" class="userid"/></td>
											</tr>
											<tr>
												<th>カード番号</th>
												<td><form:input path="card_number" value="${pay.card_number}" class="userid"/></td>
											</tr>
											<tr>
												<th>有効期限</th>
												<td><form:select path="expiration_month" value="pay.expiration_month" class="userid">
														<option value="1">01</option>
														<option value="2">02</option>
														<option value="3">03</option>
														<option value="4">04</option>
														<option value="5">05</option>
														<option value="6">06</option>
														<option value="7">07</option>
														<option value="8">08</option>
														<option value="9">09</option>
														<option value="10">10</option>
														<option value="11">11</option>
														<option value="12">12</option>
													</form:select>

													<form:select path="expiration_year" value="pay.expiration_year" class="userid">
														<option value="<%= year %>"><%= year %></option>
														<option value="<%= year + 1%>"><%= year + 1 %></option>
														<option value="<%= year + 2%>"><%= year + 2 %></option>
														<option value="<%= year + 3%>"><%= year + 3 %></option>
														<option value="<%= year + 4%>"><%= year + 4 %></option>
													</form:select></td>
											</tr>
											<tr>
												<th>カード名義人</th>
												<td><form:input path="card_holder_name" value="${pay.card_holder_name}" class="userid"/></td>
											</tr>
										</table>
										<br>
										<form:button name="updatepayment" class="login">更新</form:button>
										<form:hidden path="payment_no" value="${pay.payment_no}"/>
									<label for="trigger${pay.payment_no}" class="cancel"><span>キャンセル</span></label>
									</form:form>
								</div>
								</div>
							</div>
						</div>
							<p><label for="trigger${pay.payment_no}" class="open_btn" >更新</label></p>
					</td>
				</tr>
			</c:forEach>
		</table>

		<p class="minititle">お届け先情報</p>

		<!-- 届け先情報追加ポップアップ -->
						<div class="popup_wrap">
							<input id="triggerupaddadd" type="checkbox" class="payment">
							<div class="popup_overlay">
							<label for="triggerupaddadd" class="popup_trigger"></label>
								<div class="popup_content2">
									<!-- 届け先情報追加ポップアップ中身 -->
									<div align="center">
									<p class="minititle">お届け先情報登録</p>
									<br>
									<form:form modelAttribute="shippingAddressModel">
										<table class="account_update">
											<tr>
												<th>ユーザーID</th>
												<td>${accountinfo.user_id}</td>
											</tr>
											<tr>
												<th>郵便番号</th>
												<td><form:input path="postal_code" class="userid"/></td>
											</tr>
											<tr>
												<th>住所1</th>
												<td><form:input path="address1" class="userid"/></td>
											</tr>
											<tr>
												<th>住所2</th>
												<td><form:input path="address2" class="userid"/></td>
											</tr>
											<tr>
												<th>電話番号</th>
												<td><form:input path="phone_number" class="userid"/></td>
											</tr>
											<tr>
												<th>お届け先名</th>
												<td><form:input path="shipping_address_name" class="userid"/></td>
											</tr>
										</table>
										<br>
										<form:button name="registershipping" class="login">登録</form:button>
									<label for="triggerupaddadd" class="cancel"><span>キャンセル</span></label>
									</form:form>
								</div>
								</div>
							</div>
						</div>
							<p><label for="triggerupaddadd" class="open_btn" >追加</label></p>
		<br>
		<table class="results">
			<tr>
				<th class="tabletitle">郵便番号</th>
				<th class="tabletitle">住所1</th>
				<th class="tabletitle">住所2</th>
				<th class="tabletitle">電話番号</th>
				<th class="tabletitle">お届け先名</th>
				<th class="tabletitle">削除</th>
				<th class="tabletitle">更新</th>
			</tr>

			<c:forEach var="address" items="${shippinginfo}">
				<tr>
					<td class="table">${address.postal_code}</td>
					<td class="table">${address.address1}</td>
					<td class="table">${address.address2}</td>
					<td class="table">${address.phone_number}</td>
					<td class="table">${address.shipping_address_name}</td>
					<td class="table">
						<!-- 届け先情報削除ポップアップ -->
						<div class="popup_wrap">
							<input id="triggerdel${address.shipping_address_no}" type="checkbox" class="payment">
							<div class="popup_overlay">
							<label for="triggerdel${address.shipping_address_no}" class="popup_trigger"></label>
								<div class="popup_content">
									<!-- 届け先情報削除ポップアップ中身 -->
									<div align="center" class="delete">
									<p class="minititle">削除してよろしいですか。</p>
									<br>
									<form:form modelAttribute="shippingAddressModel">
										<form:button name="deleteshipping" class="login">削除</form:button>
										<form:hidden path="shipping_address_no" value="${address.shipping_address_no}"/>
									<label for="triggerdel${address.shipping_address_no}" class="cancel"><span>キャンセル</span></label>
									</form:form>
								</div>
							</div>
							</div>
						</div>
							<p><label for="triggerdel${address.shipping_address_no}" class="open_btn" >削除</label></p>
					</td>
					<td class="table">
					<!-- 届け先情報更新ポップアップ -->
						<div class="popup_wrap">
							<input id="triggerup${shipping_address_no}" type="checkbox" class="payment">
							<div class="popup_overlay">
							<label for="triggerup${shipping_address_no}" class="popup_trigger"></label>
								<div class="popup_content2">
									<!-- 届け先情報更新ポップアップ中身 -->
									<div align="center">
									<p class="minititle">お届け先情報更新</p>
									<br>
									<form:form modelAttribute="shippingAddressModel">
										<table class="account_update">
											<tr>
												<th>ユーザーID</th>
												<td>${accountinfo.user_id}</td>
											</tr>
											<tr>
												<th>郵便番号</th>
												<td><form:input path="postal_code" value="${address.postal_code}" class="userid"/></td>
											</tr>
											<tr>
												<th>住所1</th>
												<td><form:input path="address1" value="${address.address1}" class="userid"/></td>
											</tr>
											<tr>
												<th>住所2</th>
												<td><form:input path="address2" value="${address.address2}" class="userid"/></td>
											</tr>
											<tr>
												<th>電話番号</th>
												<td><form:input path="phone_number" value="${address.phone_number}" class="userid"/></td>
											</tr>
											<tr>
												<th>お届け先名</th>
												<td><form:input path="shipping_address_name" value="${address.shipping_address_name}" class="userid"/></td>
											</tr>
										</table>
										<br>
										<form:button name="updateshipping" class="login">更新</form:button>
										<form:hidden path="shipping_address_no" value="${address.shipping_address_no}"/>
									<label for="triggerup${shipping_address_no}" class="cancel"><span>キャンセル</span></label>
									</form:form>
								</div>
								</div>
							</div>
						</div>
							<p><label for="triggerup${shipping_address_no}" class="open_btn" >更新</label></p>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</div>
</body>
</html>