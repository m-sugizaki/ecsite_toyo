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
<link rel="stylesheet" type="text/css" href="resources/reset.css">
<style type="text/css">
/*支払い方法,お届け先登録完了ボタン*/
	.finish{
		position: relative;
  display: inline-block;
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
/*ポップアップを開くボタン(リンク風)*/
	.lavel_to_link{
		padding-top: 8px;
		margin: 2px;
		cursor: pointer;
		font-weight: bold;
		color: blue;
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

	#table{
		margin-top: 15px;
		margin-bottom: 15px;
	}

	#table.tr{
		height: 20px;
	}

	.grade{
  position: relative;
  display: block;
  width: 250px;
  margin-top: 10px;
  padding: 5px;
  border: none;
  font-size: 16px;
  outline: none;
}

	.space{
		padding: 5px;
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
					<!--<li><a href="search">商品検索</a></li>
				<c:if test="${not empty  login.name}">
					<li><a href="productcart">商品カート</a></li>
					<li><a href="purchasehistory">購入履歴</a></li>
					<li><a href="account">アカウント</a></li>
				</c:if> -->
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
				<c:choose>
					<c:when test="${empty login.name }">
						<br>
						<!-- ポップアップ -->
							<div class="popup_wrap">
							<input id="trigger" type="checkbox">
							<div class="popup_overlay">
							<label for="trigger" class="popup_trigger"></label>
							<div class="popup_content">
							<!--<label for="trigger" class="close_btn">×</label>-->
							<!-- ログインポップアップ中身 -->
								<div align="center">
									<p class="logintitle">ログイン</p>
									<form method="get" action="">
									</form>
									<table>
										<form:form modelAttribute="userModel" >
										<!-- フォーム入力 -->
										<tr><td><form:input path="user_id" placeholder="ユーザーID" class="userid" /></td></tr>
										<tr><td><form:password path="password" placeholder="パスワード" class="userid" /></td></tr>
										<tr><td><form:input type="hidden" path="hid" value="1"/>
										<input type="submit" value="ログイン" name="login" class="login" />
										<label for="trigger" class="cancel">キャンセル</label></td></tr>
										<!-- <a href="home" class="cancel">キャンセル</a>-->    </td></tr>
										</form:form>
									</table>
								</div>
							</div>
							</div>
							</div>
							<!-- 右上ユーザー情報続き -->
							<label for="trigger" class="open_btn" for="login">ログイン</label>

							 / <a href="regist">新規登録</a>
					</c:when>
					<c:otherwise>
						<br>
							<a href="logout">ログアウト</a>
					</c:otherwise>
				</c:choose>
			</div>
	</div>

			<!-- エラーメッセージ -->
					<form:form modelAttribute="userModel">
						<p class="errormessage">
							<form:errors path="user_id" elements="span" />
							<form:errors path="password" elements="span" />
							<c:if test="${!empty errormessage }">
								<c:out value="${errormessage }" />
							</c:if>
						</p>
					</form:form>

	<!-- メインコンテンツ -->
	<div class="contents">
		<div align="center">
		<p class="title">アカウント情報登録</p>
		<form:form modelAttribute="newUserModel">

		<table id="table">
			<tr>
				<th>ユーザID</th>
				<td><form:input path="user_id" placeholder="(例)abc" class="userid" /></td><td><form:errors path="user_id" elements="span" /></td>
			</tr>
			<tr>
				<th>パスワード</th>
				<td><form:password path="password" placeholder="(例)def" class="userid"/></td><td><form:errors path="password" elements="span" /></td>
			</tr>
			<tr>
				<th>パスワード（確認用）</th>
				<td><form:password path="password2"  class="userid"/></td><td><form:errors path="password2" elements="span" /></td>
			</tr>
			<tr>
				<th>氏名</th>
				<td><form:input path="name" placeholder="(例)山田太郎" class="userid"/></td><td><form:errors path="name" elements="span" /></td>
			</tr>
			<tr>
				<th>ﾆｯｸﾈｰﾑ</th>
				<td><form:input path="nickname" placeholder="(例)たろう" class="userid"/></td><td><form:errors path="nickname" elements="span" /></td>
			</tr>
			<tr>
				<th>郵便番号</th>
				<td><form:input path="postal_code" placeholder="(例)000-0000" class="userid"/></td><td><form:errors path="postal_code" elements="span" /></td>
			</tr>
			<tr>
				<th>住所1</th>
				<td><form:input path="address1" placeholder="(例)東京" class="userid"/></td><td><form:errors path="address1" elements="span" /></td>
			</tr>
			<tr>
				<th>住所２</th>
				<td><form:input path="address2" placeholder="(例)大崎" class="userid" /></td><td><form:errors path="address2" elements="span" /></td>
			</tr>
			<tr>
				<th>電話番号</th>
				<td><form:input path="phone_number" placeholder="(例)000-0000-0000" class="userid"/></td><td><form:errors path="phone_number" elements="span" /></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><form:input path="email" placeholder="(例)xxxx@co.jp" class="userid"/></td><td><form:errors path="email" elements="span" /></td>
			</tr>
			<tr>
				<th>生年月日</th>
				<td><form:input path="birthday" placeholder="(例)0000-00-00" class="userid"/></td><td><form:errors path="birthday" elements="span" /></td>
			</tr>
			<tr>
				<th>会員ランク</th>
				<td class="grade">一般</td>
			</tr>
		</table>
<!-- 支払い方法ポップアップ -->
		<div class="popup_wrap">
		<input id="trigger2" type="checkbox" class="payment">
		<div class="popup_overlay">
		<label for="trigger2" class="popup_trigger"></label>
		<div class="popup_content2">
			<!-- 支払い方法ポップアップ中身 -->
			<div align="center">
			<p class="logintitle">支払い方法情報登録</p>

			<!--<form method="get" action="a">
			</form>-->
			<table>
			 	<tr>
				<th>支払いNo</th>
				<td></td>
				</tr>
				<tr>
				<th>カードの種類</th>
				<td><form:input path="payment_method" placeholder="(例)クレジットカード" class="userid" /></td><td><form:errors path="payment_method" elements="span" /></td>
				</tr>
				<tr>
				<th>カード番号</th>
				<td><form:input path="card_number" placeholder="(例)0000-0000-0000-0000" class="userid" /></td><td><form:errors path="card_number" elements="span" /></td>
				</tr>
				<tr>
				<th>有効期限</th>
				<td>
					<form:select path="expiration_month" class="userid">
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
					</form:select>

				</td>
				</tr>

				<tr>
				<th>カード名義人</th>
				<td><form:input path="card_holder_name" placeholder="(例)abc" class="userid" /></td><td><form:errors path="card_holder_name" elements="span" /></td>
				</tr>
				<!-- <tr><td><input type="submit" name="forward"  value="登録"/><input type="submit" name="cancel"  value="キャンセル"/></td></tr> -->

			</table>
			</div>
			<br>
			<label for="trigger2"><span class="finish">完了</span></label>
		</div>
		</div>
		</div>
		<p class="space"><label for="trigger2" class="open_btn lavel_to_link" >支払い方法登録</label></p>

		<!-- お届け先のポップアップ -->
		<div class="popup_wrap">
		<input id="trigger3" type="checkbox" class="payment">
		<div class="popup_overlay">
		<label for="trigger3" class="popup_trigger"></label>
		<div class="popup_content2">
		<!-- <label for="trigger3" class="close_btn">×</label> -->
			<!-- お届け先ポップアップ中身 -->
			<div align="center">
			<p class="logintitle">お届け先情報登録</p>
			<!-- <form method="get" action="b">
			</form>-->
			<table>
			 	<tr>
				<th>お届けNo</th>
				<td></td>
				</tr>
				<tr>
				<th>郵便番号</th>
				<td><form:input path="postal_code2" placeholder="(例)000-0000" class="userid" /></td><td><form:errors path="postal_code2" elements="span" /></td>
				</tr>
				<tr>
				<th>住所１</th>
				<td><form:input path="address3" placeholder="(例)東京" class="userid" /></td><td><form:errors path="address3" elements="span" /></td>
				</tr>
				<tr>
				<th>住所２</th>
				<td><form:input path="address4" placeholder="(例)大崎" class="userid" /></td><td><form:errors path="address4" elements="span" /></td>
				</tr>
				<tr>
				<th>電話番号</th>
				<td><form:input path="phone_number2" placeholder="(例)000-0000-0000" class="userid" /></td><td><form:errors path="phone_number2" elements="span" /></td>
				</tr>
				<tr>
				<th>お届け先名</th>
				<td><form:input path="shipping_address_name" placeholder="(例)abc" class="userid" /></td><td><form:errors path="shipping_address_name" elements="span" /></td>
				</tr>
				<!-- <tr><td><input type="submit" name="forward"  value="登録"/><input type="submit" name="cancel"  value="キャンセル"/></td></tr> -->

			</table>
			</div>
			<br>
			<label for="trigger3"><span class="finish">完了</span></label>
		</div>
		</div>
		</div>
		<p class="space"><label for="trigger3" class="open_btn lavel_to_link">お届け先登録</label></p>


		<input type="submit" name="regist" value="登録" class="login" />
		<input type="submit" name="back" value="キャンセル" class="login" />

		</form:form>
		</div>
	</div>
	</div>
</div>
</body>
</html>