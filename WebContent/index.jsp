<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>あすばかログイン</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<!-- 背景 -->	
	<div class="bg_pattern Crown"></div>
    <h4>ねこちゃんとがんばる習慣づけ管理アプリ</h4>
    <h1>明日やろうは馬鹿野郎</h1>

    <!-- ログインフォーム -->
    <form action="MainServlet.java" method="post">
        <span class="form-label">ユーザー名</span><input type="text" name="name"><br>
        <span class="form-label">パスワード</span><input type="password" name="pass"><br>
        <a href="PassForget.jsp" class="left">パスワードを忘れた場合</a><br>
        <input type="submit" value="ログイン"><br>
        <!-- 新規登録へのリンク -->
    <a href="Register.jsp">アカウントを新規作成</a>
    <!-- エラーメッセージを表示 -->
	<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
	<% if (errorMessage != null) { %>
    	<div class="error-message"><%= errorMessage %></div>
	<% } %>
    </form>

    <hr> <!-- 水平線 -->
    <p>習慣化に必要な期間は平均66日間と言われています。<br>
    まずは66日間、あなたが身に付けたい習慣に取り組んでみてください。</p>
    
</body>
</html>