<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="PassForget.css">

<html lang="ja">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>パスワードを忘れた場合</title>
</head>
<body>
	<!-- 背景 -->	
	<div class="bg_pattern Crown"></div>
	
    <h1>パスワードを忘れた場合</h1>


    <form action="PassResetServlet.java" method="post">
        <label for="mail">メールアドレス:</label>
        <input type="text" name="mail" required><br>

        <label for="name">名前:</label>
        <input type="text" name="name" required><br>

		<br>
        <input type="submit" value="パスワードを表示">
        
        
        <% String message = (String) request.getAttribute("message");
    if (message != null) { %>
        <p><%= message %></p>
    <% } else { %>
        <p>パスワードは: <%= request.getAttribute("pass") %></p>
    <% } %>
        
    </form>
<br>
<hr>

    <a href="/AsubakaNEW/index.jsp">ログインページへ戻る</a>
    
    
</body>
</html>

 