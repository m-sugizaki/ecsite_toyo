<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>アカウント新規登録</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
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
		<div align="center">
		<h1>アカウント情報登録</h1>
		<form:form modelAttribute="newUserModel">

		<table>
			<tr>
				<th>ユーザID</th>
				<td><form:input path="user_id" placeholder="(例)abc" /></td><td><form:errors path="user_id" elements="span" /></td>
			</tr>
			<tr>
				<th>パスワード</th>
				<td><form:password path="password" placeholder="(例)def"/></td><td><form:errors path="password" elements="span" /></td>
			</tr>
			<tr>
				<th>パスワード（確認用）</th>
				<td><form:password path="password2" /></td><td><form:errors path="password2" elements="span" /></td>
			</tr>
			<tr>
				<th>氏名</th>
				<td><form:input path="name" placeholder="(例)山田太郎" /></td><td><form:errors path="name" elements="span" /></td>
			</tr>
			<tr>
				<th>ﾆｯｸﾈｰﾑ</th>
				<td><form:input path="nickname" placeholder="(例)たろう" /></td><td><form:errors path="nickname" elements="span" /></td>
			</tr>
			<tr>
				<th>郵便番号</th>
				<td><form:input path="postal_code" placeholder="(例)000-0000" /></td><td><form:errors path="postal_code" elements="span" /></td>
			</tr>
			<tr>
				<th>住所1</th>
				<td><form:input path="address1" placeholder="(例)東京"/></td><td><form:errors path="address1" elements="span" /></td>
			</tr>
			<tr>
				<th>住所２</th>
				<td><form:input path="address2" placeholder="(例)大崎" /></td><td><form:errors path="address2" elements="span" /></td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td><form:input path="phone_number" placeholder="(例)000-0000-0000"/></td><td><form:errors path="phone_number" elements="span" /></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><form:input path="email" placeholder="(例)xxxx@co.jp"/></td><td><form:errors path="email" elements="span" /></td>
			</tr>
			<tr>
				<th>生年月日</th>
				<td><form:input path="birthday" placeholder="(例)0000/00/00"/></td><td><form:errors path="birthday" elements="span" /></td>
			</tr>
			<tr>
				<th>会員ランク</th>
				<td>一般</td>
			</tr>
		</table>
<!-- 支払い方法ポップアップ -->
		<div class="popup_wrap">
		<input id="trigger" type="checkbox" class="payment">
		<div class="popup_overlay">
		<label for="trigger" class="popup_trigger"></label>
		<div class="popup_content">
			<!-- 支払い方法ポップアップ中身 -->
			<div align="center">
			<h2>支払い方法情報登録</h2>

			<!--<form method="get" action="a">
			</form>-->
			<table>
			 	<tr>
				<th>支払いNo</th>
				<td></td>
				</tr>
				<tr>
				<th>支払方法</th>
				<td><form:input path="payment_method" placeholder="(例)クレジットカード" /></td><td><form:errors path="payment_method" elements="span" /></td>
				</tr>
				<tr>
				<th>カード番号</th>
				<td><form:input path="card_number" placeholder="(例)0000-0000-0000-0000" /></td><td><form:errors path="card_number" elements="span" /></td>
				</tr>
				<tr>
				<th>有効期限</th>
				<td>
					<form:select path="expiration_month">
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

					<form:select path="expiration_year">
					<option value="<%= year %>"><%= year %></option>
					<option value="<%= year + 1%>"><%= year + 1 %></option>
					<option value="<%= year + 2%>"><%= year + 2 %></option>
					<option value="<%= year + 3%>"><%= year + 3 %></option>
					<option value="<%= year + 4%>"><%= year + 4 %></option>
					</form:select>

				</td>
				</tr>

				<tr>
				<th>カード名義人</th>
				<td><form:input path="card_holder_name" placeholder="(例)abc" /></td><td><form:errors path="card_holder_name" elements="span" /></td>
				</tr>
				<!-- <tr><td><input type="submit" name="forward"  value="登録"/><input type="submit" name="cancel"  value="キャンセル"/></td></tr> -->

			</table>
			</div>
			<br>
			<label for="trigger"><span class="finish">完了</span></label>
		</div>
		</div>
		</div>
		<p><label for="trigger" class="open_btn" >支払い方法登録</label></p>

		<!-- お届け先のポップアップ -->
		<div class="popup_wrap">
		<input id="trigger2" type="checkbox" class="payment">
		<div class="popup_overlay">
		<label for="trigger2" class="popup_trigger"></label>
		<div class="popup_content2">
		<!-- <label for="trigger2" class="close_btn">×</label> -->
			<!-- お届け先ポップアップ中身 -->
			<div align="center">
			<h2>お届け先情報登録</h2>
			<!-- <form method="get" action="b">
			</form>-->
			<table>
			 	<tr>
				<th>お届けNo</th>
				<td></td>
				</tr>
				<tr>
				<th>郵便番号</th>
				<td><form:input path="postal_code2" placeholder="(例)000-0000" /></td><td><form:errors path="postal_code2" elements="span" /></td>
				</tr>
				<tr>
				<th>住所１</th>
				<td><form:input path="address3" placeholder="(例)東京" /></td><td><form:errors path="address3" elements="span" /></td>
				</tr>
				<tr>
				<th>住所２</th>
				<td><form:input path="address4" placeholder="(例)大崎" /></td><td><form:errors path="address4" elements="span" /></td>
				</tr>
				<tr>
				<th>電話番号</th>
				<td><form:input path="phone_number2" placeholder="(例)000-0000-0000" /></td><td><form:errors path="phone_number2" elements="span" /></td>
				</tr>
				<tr>
				<th>お届け先名</th>
				<td><form:input path="shipping_address_name" placeholder="(例)abc" /></td><td><form:errors path="shipping_address_name" elements="span" /></td>
				</tr>
				<!-- <tr><td><input type="submit" name="forward"  value="登録"/><input type="submit" name="cancel"  value="キャンセル"/></td></tr> -->

			</table>
			</div>
			<br>
			<label for="trigger2"><span class="finish">完了</span></label>
		</div>
		</div>
		</div>
		<p><label for="trigger2" class="open_btn" >お届け先登録</label></p>


		<input type="submit" name="regist" value="登録" />
		<input type="submit" name="back" value="キャンセル" />

	  	</form:form>
	  	</div>
</body>
</html>