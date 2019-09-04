<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

.table,review {
	border: solid 1px #000000;
	border-collapse: collapse;}

</style>

<title>商品詳細</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<link rel="stylesheet" type="text/css" href="resources/reset.css">

<!-- 商品合計金額計算用 -->
<script type="text/javascript">
function sum(){

	var price = document.form1.quantity.value * ${productentity.price};
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
											<label for="trigger" class="close_btn">×</label>
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
															<td><input type="submit" value="ログイン" name="login"
																class="login"  /> <a href="home" class="cancel">キャンセル</a></td>
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
				<h5>商品詳細</h5>
				<br>
				<br>
		      <!-- 商品詳細の表示 -->
				<table id="kensaku">
					<form:form modelAttribute="productCartModel">
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
							<td>価格&nbsp;&nbsp;&nbsp;</td><td>${productentity.price}</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>サイズ&nbsp;&nbsp;&nbsp;</td>
							<td><form:select path="size" items="${sizelist}" /></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>色&nbsp;&nbsp;&nbsp;</td>
							<td><form:select path="color" items="${colorlist}" /></td>

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
							<td>写真&nbsp;&nbsp;&nbsp;</td><td><img src="data:image/jpg;base64,${productentity.image64}"></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td>数量&nbsp;&nbsp;&nbsp;</td><td><form:input path="quantity" value="1" onChange="sum()" name="quantity"/></td>
						</tr>
						<tr><td>&nbsp;</td><tr>
						<tr>
							<td>購入価格&nbsp;&nbsp;&nbsp;</td>
							<td>
							<!-- 合計金額表示 -->
							<input type="text" name="field" size="8" value="0" readonly>
							</td>
						</tr>
						<tr><td>&nbsp;</td><tr>

					</form:form>
				</table>


				<!-- カートに入れる　レジに進む　のポップアップ -->
					<c:choose>
					<c:when test="${empty login.name }">
						<br>
						<!-- ポップアップ -->
							<div class="popup_wrap">
							<input id="trigger" type="checkbox">
							<div class="popup_overlay">
							<label for="trigger" class="popup_trigger"></label>
							<div class="popup_content">
							<label for="trigger" class="close_btn">×</label>
							<!-- ログインポップアップ中身 -->
								<div align="center">
									<p class="logintitle">ログイン</p>
									<form method="get" action="">
									</form>
									<table>
										<form:form modelAttribute="userModel">
										<tr><td><form:input path="user_id" placeholder="ユーザーID" class="userid" /></td></tr>
										<tr><td><form:input path="password" placeholder="パスワード" class="userid" /></td></tr>
										<tr><td><input type="submit" value="ログイン" name="login" class="login" />
										<a href="home" class="cancel">キャンセル</a></td></tr>
										</form:form>
									</table>
								</div>
							</div>
							</div>
							</div>
							<!-- 右上ユーザー情報続き -->
							<label for="trigger" class="open_btn" for="login">カートに入れる</label>
							<label for="trigger" class="open_btn" for="login">レジへ進む</label>
					</c:when>
					<c:otherwise>
						<br>
						<!--login中の「カートに進む」のポップアップ -->
						<!--lポップアップ -->
							<div class="popup_wrap">
							<input id="trigger_c" type="checkbox">
							<div class="popup_overlay">
							<label for="trigger_c" class="popup_trigger"></label>
							<div class="popup_content">
							<label for="trigger_c" class="close_btn">×</label>
							<!-- ポップアップ中身 -->
								<div align="center">
								　		<br>
										<br>
									<p>カートに追加しますか？</p>
									<form method="get" action="">
									</form>
									<table>

										<tr><td><a href="detail" class="cancel">カートに追加</a></td>
									　　　　　　　<td><a href="detail" class="cancel">キャンセル</a></td></tr>
										</tr>

									</table>
								</div>
							</div>
							</div>
							</div>
						<!-- login中の「レジに進む」のポップアップ -->
						<!-- lポップアップ -->
							<div class="popup_wrap">
							<input id="trigger_b" type="checkbox">
							<div class="popup_overlay">
							<label for="trigger_b" class="popup_trigger"></label>
							<div class="popup_content">
							<label for="trigger_b" class="close_btn">×</label>
							<!-- ポップアップ中身 -->
								<div align="center">
								　		<br>
										<br>
									<p>カートに追加しますか？</p>
									<form method="get" action="">
									</form>
									<table>

										<tr><td><a href="detail" class="cancel">カートに追加</a></td></tr>

									</table>
								</div>
							</div>
							</div>
							</div>


							<!-- 右上ユーザー情報続き -->

							<label for="trigger_c" class="open_btn" for="tocart"><input type="submit" value="ログイン" name="login" class="login" />カートに入れる</label>

							 <a href="regist">レジに進む</a>
							 <!-- lレジに進むはｊｓｐ -->


					</c:otherwise>
				</c:choose>



				<br>
				　　 <!-- 商品の口コミの表示-->
					<table class ="review" >
						<tr>
							<th class="table">口コミNo</th>
							<th class="table">ニックネーム</th>
							<th class="table">評価</th>
							<th class="table">口コミ内容</th>
							<th class="table">口コミ日時</th>

						</tr>
						<c:forEach var="reviewbox" items="${reviewentity}">
						<!-- varはitemから取り出した要素を格納する変数　itemsはループする配列、または、コレクション(キー)。　-->
						<!--  -->
							<tr>
								<td class="table">${reviewbox.review_no}</td>
								<td class="table">${reviewbox.nickname}</td>
								<td class="table">${reviewbox.evaluation}</td>
								<td class="table">${reviewbox.review_content}</td>
								<td class="table">${reviewbox.review_dt}</td>
							</tr>
						</c:forEach>
					</table>

			</div>
			</div>
		</div>
</body>
</html>