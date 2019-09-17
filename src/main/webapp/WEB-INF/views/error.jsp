<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>システムエラー画面</title>
<link rel="stylesheet" type="text/css" href="resources/mypage.css">
<style type="text/css">
@charset "UTF-8";

*{
	margin: 0;
	padding: 0;
	box-sizing: border;
	/*background: #DDDDDD;*/
}

.wrap{
	background: white;
	margin: 50px auto;
	padding: 5 5em;
	max-width: 600px;
	border: solid lightgray 10px;
}

.return{
  position: relative;
  display: inline-block;
  cursor: pointer;
  padding: 0.25em 0.5em;
  height: 27px;
  line-height: 27px;
  text-align: center;
  text-decoration: none;
  color: #FFF;
  background: #6495ed;/*背景色*/
  border-bottom: solid 2px #5782cf;/*少し濃い目の色に*/
  border-radius: 4px;/*角の丸み*/
  box-shadow: inset 0 2px 0 rgba(255,255,255,0.2), 0 2px 2px rgba(0, 0, 0, 0.19);
  font-size: small;
  font-weight: bold;
  margin:10px;
  width: 130px;
}

.minititle{
	margin: 30px;
	font-size: 26px;
}
</style>
</head>
<body>
<div class="wrap" align="center">
<p><br></p>
<p class="minititle">「システムエラー発生のご報告」</p>
<p>利用者各位</p>
<p><br></p>
<p>いつもご利用ありがとうございます。</p>
<p>
システムのご利用中に問題が発生しました。<br />
大変申し訳ありませんが、マイページにアクセスしていただき、<br>システムへ再度ログインを行ってください。
</p>
<p><br></p>
<p>
	<a href="home" class="return">マイページに戻る</a>
</p>
<p><br></p>
</div>
</body>
</html>