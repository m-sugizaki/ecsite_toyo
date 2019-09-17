<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date, java.text.DateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 商品合計金額計算用 -->
<script type="text/javascript">
function sum(){

	var price = document.form1.quantity.value * ${cart.price};
	document.form1.field.value = price;
}
</script>

</head>
<body>
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
		<td>${cart.price}</td>
	</tr>
	<tr>
		<th>数量</th>
		<td><form:input path="quantity" value="${cart.quantity}" onChange="sum()" name="quantity" /></td>
	</tr>
	<tr>
		<th>購入金額</th>
		<td>
		<!-- 合計金額表示 -->
		<input type="text" name="field" size="8" value="${cart.price} " readonly>
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
			<form:radiobutton path="payment_method" value="銀行引き落とし" label="銀行引き落とし" checked="checked" /><br>
			<form:radiobutton path="payment_method" value="商品代引き" label="商品代引き" /><br>
			<form:radiobutton path="payment_method" value="クレジットカード" label="クレジットカード"/>
			<c:forEach var="paylist" items="${paymentinfo}" >
					<input type="radio" name="payment_no" value="${paylist.payment_no}">${paylist.payment_method}
					</c:forEach>
			<!--<form:select path="payment_no">
				<form:options items="${paymentinfo}" itemLabel="payment_method" itemvalue="payment_no"/>
			</form:select>-->
			<!--<form:hidden path="payment_no" name="payno" value="" />-->
		</td>
	</tr>
	<tr>
		<th>お届け先</th>
		<td>
			<form:radiobutton path="shipping_address_no" value="0" label="現住所" checked="checked" /><br>
			別のお届け先
			<c:forEach var="shiplist" items="${shippinginfo}">
					<input type="radio" name="shipping_address_no" value="${shiplist.shipping_address_no}">${shiplist.address1}${shiplist.address2}<br>
					</c:forEach>
		</td>
	</tr>

	</table>
	<form:button name="purchase">注文する&nbsp;</form:button>
			<a href="productcart">キャンセル</a>
</form:form>


</body>
</html>