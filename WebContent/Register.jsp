<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" type="text/css" href="Register.css">

<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>明日やろうは馬鹿野郎 - 新規登録</title>

<script>
    function validatePassword() {
        var password = document.getElementById("pass").value;

        // パスワードが6文字以上で、大文字と数字を含むかを検証
        if (password.length < 6 || !/[A-Z]/.test(password)
                || !/[0-9]/.test(password)) {
            alert("パスワードは大文字と数字を含めた6文字以上にしてください。");
            return false;
        }
        
        var name = document.getElementsByName("name")[0].value;
        var mail = document.getElementsByName("mail")[0].value;
        var objective = document.getElementsByName("objective")[0].value;
        var reward = document.getElementsByName("reward")[0].value;
        

        // バリデーション: mail、objective、reward が空の場合はアラートを表示してフォームを送信しない
        if (name==="" || mail === "" || objective === "" || reward === "" ) {
            alert("名前、メールアドレス、目標、報酬を入力してください。");
            return false;
        }

        return true;
    }
    
    


    function submitForm(event) {
        event.preventDefault(); // 通常のフォーム送信を阻止

        if (!validatePassword()) {
            return false;
        }

        var form = document.getElementById("registrationForm");
        var formData = new FormData(form);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "RegisterServlet.java", true);


        xhr.onload = function() {
            if (xhr.status === 200) {
                window.location.href = "/AsubakaNEW/RegisterSuccses.jsp";
            } else if (xhr.status === 409) {
                alert(xhr.responseText);
            } else {
                alert("エラーが発生しました。");
            }
        };

        xhr.send(formData);
    }
</script>

</head>
<body>

    <!-- 背景 -->
    <div class="bg_pattern Crown"></div>

    <h1>新規登録</h1>

	<!-- 新規登録フォームzz -->
	<form action="RegisterServlet.java" method="post"
		onsubmit="return validatePassword() && showDuplicateError();">
		ユーザー名：<input type="text" name="name"><br> パスワード：<input
			type="password" name="pass" id="pass"><br> メールアドレス：<input
			type="mail" name="mail"><br> 達成したい目標：<input type="text"
			name="objective"><br> 達成報酬：<input type="text"
			name="reward"><br> 継続日数:<br> <select name="day">
			<option value="66">66日</option>
		</select><br> <input type="hidden" name="count" value="0"
			style="display: none;">
		<!-- 非表示の count フィールド -->
		<br> <input type="submit" value="新規登録"
			onclick="showDuplicateError(); return false;">
	</form>

    <hr>
    <!-- 水平線を追加 -->

    <!-- ログインへのリンク -->
    <a href="/AsubakaNEW/index.jsp">ログインページへ戻る</a>

</body>
</html>
