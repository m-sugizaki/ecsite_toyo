<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

.minititle,contents{
	font-size: 26px;
}

.table,review {
	font-size: 16px;
	border: solid 1px #000000;
	border-collapse: collapse;}

.tabletitle,review{
	font-size: 16px;
	width: 150px;
	align: center;
 	background-color: lightblue;
 	border: solid 1px #000000;
	border-collapse: collapse;
}

.review td{
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

.review th{
	height: 40px;
	display: table-cell;
	vertical-align: middle;
}

/*テキストボックスのデザイン*/
.input_form{
  position: relative;
  display: block;
  width: 100px;
  margin-top: 6px;
  padding: 2px;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  color: black;
  outline: none;
  background: white;
  border: 1px solid lightgray;
}
</style>
<title>商品詳細</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/reset.css">

<!-- 商品合計金額計算用 -->
<script type="text/javascript">
function sum(){

	var price = document.form1.quantity.value * ${productentity.price} ;
	document.form1.field.value = price;

}
</script>
</head>
<body>
	<div class="all">
		<!-- サイドバー -->
		<aside class="sidebar">
			<ul style="list-style: none">
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
						<c:if test="${not empty  login.name}">
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
											<!-- ログインポップアップ中身 -->
											<div align="center">
												<p class="logintitle">ログイン</p>
												<form method="get" action="login"></form>
												<table>
													<form:form modelAttribute="userModel">
														<tr>
															<td><form:input path="user_id" placeholder="ユーザーID"
																	class="userid" /></td>
														</tr>
														<tr>
															<td><form:password path="password" placeholder="パスワード"
																	class="userid" /></td>
														</tr>
														<tr>
															<td><form:input type="hidden" path="hid" value="3" />
															<input type="submit" value="ログイン" name="login"
																class="login"  /> <label for="trigger" class="cancel">キャンセル</label></td>
														</tr>
													</form:form>
												</table>
											</div>
										</div>
									</div>
								</div>
								<!-- 右上ユーザー情報続き -->
								<label for="trigger" class="open_btn" for="login" >ログイン</label>

							 / <a href="regist">新規登録</a>
							</c:when>
							<c:otherwise>
								<br>
								<a href="logout">ログアウト</a>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
			<!-- メインコンテンツ -->
			<div class="contents">
			<br>
			<p class= "minititle">商品詳細</p>
				<br>
				<br>
		      <!-- 商品詳細の表示 -->
		      <form:form modelAttribute="productCartModel" name="form1" action="purchasehistory">
				<table id="kensaku">
						<tr>
							<td>商品コード&nbsp;&nbsp;</td><td>${productentity.product_id}</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>商品名&nbsp;&nbsp;</td><td>${productentity.product_name}</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>メーカー&nbsp;&nbsp;&nbsp;</td><td>${productentity.maker}</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>価格&nbsp;&nbsp;&nbsp;</td><td><fmt:formatNumber value="${productentity.price}" groupingUsed="true"
								maxIntegerDigits="17" maxFractionDigits="1" minIntegerDigits="0" minFractionDigits="0" />
						</td>
							</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>サイズ&nbsp;&nbsp;&nbsp;</td>
							<td><form:select path="size" items="${sizelist}" class="input_form" /></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>色&nbsp;&nbsp;&nbsp;</td>
							<td><form:select path="color" items="${colorlist}" class="input_form" /></td>

						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>セールスポイント&nbsp;&nbsp;&nbsp;</td><td>${productentity.sale_point}</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>在庫数&nbsp;&nbsp;&nbsp;</td><td>${productentity.stock_quantity}</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>写真&nbsp;&nbsp;&nbsp;</td><td><img src="data:image/jpg;base64,${productentity.imagebase}"></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>数量&nbsp;&nbsp;&nbsp;</td><td><form:input path="quantity" value="1" onChange="sum()" name="quantity" class="input_form" /></td>
						</tr>
						<tr><td>&nbsp;</td><tr>
						<tr>
							<td>合計購入価格&nbsp;&nbsp;&nbsp;</td>
							<td >
							<!-- 合計金額表示 -->
							<input type="text" name="field" size="8" value="${productentity.price}" class="input_form" readonly>
							</td>
						</tr>
						<tr><td>&nbsp;</td><tr>

				</table>

				<!-- カートに入れる　レジに進む　のポップアップ -->
				　　　<!-- ログインしていないときはログインポップアップ -->
					<c:choose>
					<c:when test="${empty login.name }">
						<br>
						<!-- ポップアップ -->
							<div class="popup_wrap">
							<input id="trigger" type="checkbox">
							<div class="popup_overlay">
							<label for="trigger" class="popup_trigger"></label>
							<div class="popup_content">
							<!-- ログインポップアップ中身 -->
								<div align="center">
									<p class="logintitle">ログイン</p>
									<form method="get" action="">
									</form>
									<table>
										<form:form modelAttribute="userModel">
										<tr><td><form:input path="user_id" placeholder="ユーザーID" class="userid" /></td></tr>
										<tr><td><form:input path="password" placeholder="パスワード" class="userid" /></td></tr>
										<tr><td><form:input type="hidden" path="hid" value="3" />
										<input type="submit" value="ログイン" name="login" class="login" />
										<label for="trigger" class="cancel">キャンセル</label></td></tr>
										</form:form>
									</table>
								</div>
							</div>
							</div>
							</div>
							<!-- 右上ユーザー情報続き -->
							<label for="trigger" class="tocart" for="login">カートに入れる</label>
							<label for="trigger" class="tocart" for="login">レジへ進む</label>
					</c:when>
					<c:otherwise>
						<br>
						<!-- ログインしているときのポップアップ -->
						<!--「カートに進む」のポップアップ -->
						　　　<!--ポップアップ -->
							<div class="popup_wrap">
							<input id="trigger_c" type="checkbox">
							<div class="popup_overlay">
							<label for="trigger_c" class="popup_trigger"></label>
							<div class="popup_content">

							　　<!-- ポップアップ中身 -->
								<div align="center">
								　		<br>
										<br>
									<p>カートに追加しますか？</p>
									<form method="get" action="">
									</form>
									<table>

										<tr><td><input type="submit" value="カートに追加" class="cancel" name="addcart"/></td>
										<td><form:input type="hidden" path="product_id" value="${productentity.product_id}" />
											</td>
									　　　　　　　<td><label for="trigger_c" class="cancel">キャンセル</label></td>
										</tr>


									</table>
								</div>
							</div>
							</div>
							</div>
						<!-- カートに進む・レジに進のボタン -->
							<label for="trigger_c" class="tocart" for="tocart">カートに入れる</label>
							 <a href="regist" class="tocart">レジに進む</a>
							 <!-- lレジに進むはｊｓｐ -->


					</c:otherwise>
				</c:choose>



				<br>
				　　 <!-- 商品の口コミの表示-->
					<table class ="review" >
						<tr>
							<th class="tabletitle">口コミNo</th>
							<th class="tabletitle">ニックネーム</th>
							<th class="tabletitle">評価</th>
							<th class="tabletitle">口コミ内容</th>
							<th class="tabletitle">口コミ日時</th>

						</tr>
						<c:forEach var="reviewbox" items="${reviewentity}">
						<!-- varはitemから取り出した要素を格納する変数　itemsはループする配列、または、コレクション(キー)。　-->
						<!--  -->
							<tr>
								<td class="table">${reviewbox.review_no}</td>
								<td class="table">${reviewbox.nickname}</td>
								<td class="table">
									<c:choose>
										<c:when test="${reviewbox.evaluation == 1}">★☆☆☆☆</c:when>
										<c:when test="${reviewbox.evaluation == 2}">★★☆☆☆</c:when>
										<c:when test="${reviewbox.evaluation == 3}">★★★☆☆</c:when>
										<c:when test="${reviewbox.evaluation == 4}">★★★★☆</c:when>
										<c:otherwise>★★★★★</c:otherwise>
									</c:choose>
								</td>
								<td class="table">${reviewbox.review_content}</td>
								<td class="table">${reviewbox.review_dt}</td>
							</tr>
						</c:forEach>
					</table>
			</form:form>
			</div>
			</div>
		</div>
</body>
</html>