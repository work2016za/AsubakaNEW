<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>明日やろうは馬鹿野郎- 新規登録完了</title>
</head>
<body>
	<!-- 背景 -->	
	<div class="bg_pattern Crown"></div>
	
	<h1>新規登録が完了しました</h1>
	<p>新しいアカウントが正常に登録されました。</p>
	<p>ログインページからログインしてください。</p>
		
	<hr> <!-- 水平線を追加 -->
		
	<!-- ログインへのリンク -->
	<a href="/AsubakaNEW/index.jsp">ログイン</a>
	
	<style>
		* {
			margin: 0;
			padding: 0;
			font-family: 'Zen Kaku Gothic Antique', sans-serif;
		}
		
		html, body{
			height:100%;
			width:100%;
			display: flex;
			flex-direction: column;
			justify-content: center;
            align-items: center;
			text-align : center;
			color: #0B1013;
			/*background-color: #E0E0E0;*/
		}
		/* 背景 */
		.bg_pattern {
		  position: fixed;
		  top: 0;
		  left: 0;
		  width: 100vw;
		  height: 100vh;
		  background-color: #b5caa0;
		  opacity: 0.4;
		  z-index: -1;
		}
		.Crown {
		  background-image: linear-gradient(45deg, #91AD70 25%, transparent 25%), linear-gradient(315deg, #91AD70 25%, #B5CAA0 25%);
		  background-position: 10px 0, 20px 0, 0 0, 0 0;
		  background-size: 20px 20px;
		  background-repeat: repeat;
		}
	</style>
</body>
</html>