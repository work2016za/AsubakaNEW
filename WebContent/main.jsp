<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page import="dao.AccountDAO"%>
<%@ page import="model.Login"%>


<%
String datesJavaScriptArrayFromRequest = (String) request.getAttribute("datesJavaScriptArray");
%>



<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>あすばか</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<body>
	<!-- 背景 -->
	<div class="bg_pattern Moon"></div>
	<div class="main">
		<div class="containerA">
			<!-- 目標の詳細-->
			<div class="card goal">
				<!--<h2>目標</h2>-->
				<p>
					<span class="material-icons">pets</span>
					<c:out value="${account.objective}" />
					<span class="material-icons">pets</span>
				</p>
			</div>
			<!-- ランダムな名言 -->
			<div class="quote">
				<c:out value="${randomQuoteAndAuthor}" />
			</div>
			<!-- ランダムな猫の画像 -->
			<div class="image-container">
				<img src="${animalImagePath}" alt="猫" />
			</div>
		</div>

		<div class="containerB">

			<!-- その日の目標達成を確認するボタン -->
			<div>
				<h2>今日の習慣</h2>
				<form method="post" action="DayServlet.java">
					<input type="hidden" name="name" value="${account.name}"> <input
						type="hidden" name="pass" value="${account.pass}">
					<button id="achievedButton" class="button">やった！</button>
				</form>
			</div>

			<!-- カレンダーの表示 -->
			<div class="flex">
				<span class="material-symbols-outlined" id="prevMonth" class="month">chevron_left</span>
				<h1 id="calendar-title"></h1>
				<span class="material-symbols-outlined" id="nextMonth" class="month">navigate_next</span>
			</div>
			<div class="calendar-container">
				<div id="calendar" class="calendar-wrap"></div>
			</div>
			<!-- 残り日数-->
			<p>
				残り日数:
				<c:out value="${account.day}" />
				日
			</p>

			<!-- 66日間の継続達成度の表示 プログレスバー-->
			<div class="achieve">
				<div class="side">
					<h2>達成度</h2>
				</div>
				<div class="side">
					<progress value="<c:out value="${account.count}" />" max="66"></progress>
					<c:out value="${account.count}" />
					日 / 66日
				</div>
			</div>
		</div>
	</div>

	<script>
  		  // 現在の日数を取得
   		 let currentDays = parseInt('<c:out value="${account.count}" />');
   		let isCompleted = '<%=request.getAttribute("isCompleted")%>';
   		if (isCompleted === 'true') {
   		    window.location.href = "/reward.jsp";
   		}

   		 // 66日目にボタンをクリックした場合のリダイレクトロジック
  			   document.getElementById("achievedButton").addEventListener("click", function(event) {
        if (currentDays >= 66) {
            event.preventDefault();  // Submitをキャンセル
            window.location.href = "reward.jsp";
          }
        });
	</script>

	<script src="script.js"></script>

<script>
document.addEventListener("DOMContentLoaded", function() {
    // ウェブページのコンテンツが読み込まれたときに実行する処理

    // サーバーサイドから受け取った日付の情報を格納
    const datesFromRequest = "<%=datesJavaScriptArrayFromRequest%>";

    function processElements() {
        const elements = document.querySelectorAll('td input[data-date]');

        elements.forEach(element => {
            const date = element.getAttribute('data-date');

            if (datesFromRequest.includes(date)) {
                element.classList.add('hidden-checkbox');

                const image = document.createElement('img');
                image.src = 'images/mark.png';
                image.alt = 'Marked';
                image.classList.add('custom-checkbox');
                element.parentNode.appendChild(image);
            }
        });
    }

    // ページ読み込み時に実行
    processElements();

    const prevMonthElement = document.getElementById("prevMonth");
    const nextMonthElement = document.getElementById("nextMonth");

    if (prevMonthElement && nextMonthElement) {
        prevMonthElement.addEventListener("click", processElements);
        nextMonthElement.addEventListener("click", processElements);
    }
});
</script>



	<style>
@charset "UTF-8";

@importurl('https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;600&family=Zen+Kaku+Gothic+Antique:wght@400;700&display=swap');

* {
	margin: 0;
	padding: 0;
	font-family: 'Zen Kaku Gothic Antique', sans-serif;
	-webkit-appearance: none
}

html, body {
	height: 100%;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	overflow: hidden; /* スクロール */
}

body {
	color: #0B1013;
	background-color: #E0E0E0;
}

h1 {
	text-align: center;
	font-size: 35px;
}

h2, p {
	text-align: center;
	font-size: 20px;
	margin-top: 10px;
}
/*背景*/
.bg_pattern {
	position: fixed;
	top: 0;
	left: 0;
	width: 100vw;
	height: 100vh;
	background-color: #B5CAA0;
	opacity: 0.4;
	z-index: -1;
}

.Moon {
	background-image: radial-gradient(ellipse farthest-corner at 20px 20px, #91AD70, #91AD70 50%, #B5CAA0 50%);
	background-size: 20px 20px;
}

/*２段組み*/
.main {
	display: flex;
}

.containerA {
	margin: 20px 20px 0 20px;
	width: 800px;
	float: right;
}

.containerB {
	margin: 30px 30px 0px 30px;
}

/*猫画像*/
.image-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.image-container img {
	width: 400px;
	height: 400px;
	object-fit: cover; /* 縦横比を保持 */
	border-radius: 15px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	margin: 0px 0px 20px 0px;
}

/*名言*/
.quote {
	position: relative;
	padding: 1rem;
	border-radius: 10px;
	border: 1px solid #B5CAA0;
	background-color: #B5CAA0;
	opacity: 0.8;
	color: #0B1013;
	font-weight: bold;
	font-size: 17px;
	margin-bottom: 20px;
}

.quote:before {
	position: absolute;
	top: 3px;
	left: 3px;
	width: 100%;
	height: 100%;
	border-radius: 10px;
	border: 3px solid #2E5C6E;
	content: "";
}

.quote:after {
	position: absolute;
	bottom: -31px;
	left: 50px;
	transform: skew(-25deg);
	height: 25px;
	width: 15px;
	border-right: 3px solid #333;
	background-color: #B5CAA0;
	content: "";
}

/*目標*/
.card {
	position: relative;
	padding: .5rem .5rem 1rem .5rem;
	margin: 30px 20px 10px 170px;
	width: 450px;
	border: 2px solid #2E5C6E;
	border-radius: 5px;
	background-color: #FBE251;
	justify-content: center;
	align-items: center;
}

.card.goal::before {
	position: absolute;
	top: -2.05rem;
	left: 50%;
	width: 30px;
	height: 15px;
	line-height: 5px;
	transform: translateX(-50%);
	border-radius: 30px 30px 0 0;
	border: 2px solid #2E5C6E;
	border-bottom: transparent;
	padding: 1rem 1rem 0 1rem;
	background: #2E5C6E;
	color: #FBE251;
	font-size: 0.8rem;
	text-align: center;
	text-transform: uppercase;
	content: '目標';
}

.card p {
	color: #0B1013;
	line-height: 1.5;
	text-wrap: balance;/*ちょうどいいところで折り返す*/
}

/*やったボタン*/
.button {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 250px;
	margin: 0 auto;
	padding: .9em 2em;
	border: none;
	border-radius: 25px;
	background-color: #2E5C6E;
	color: #FBE251;
	font-weight: 600;
	font-size: 1em;
}

.button:hover {
	animation: anime-button .3s linear infinite;
}
 
@keyframes anime-button { 
20% {
	transform: translate(-2px, 2px);
	}
40%{
	transform:translate(-2px,-2px);
	}
60%{
	transform:translate(2px,2px);
	}
80%{
	transform:translate(2px,-2px);
	}
}

/* 代わりに使用するイラストのスタイル */
.custom-checkbox {
	display: inline-block;
	width: 25px; /* 適切な幅と高さを設定 */
	height: 25px;
	background: url('images/mark.png');
	background-size: contain;
	cursor: pointer;
	position: absolute;
}

/* Checkboxがチェックされたときのカスタムスタイル*/
input[type="checkbox"]:checked+.custom-checkbox-label {
	background-image: url('mark_checked.png'); /* チェックされたときの画像 */
} 

/* Checkboxを非表示にするスタイル */
		input[type="checkbox"] {
		    display: none;
		}
		
/* カレンダー*/
.month {
	cursor: pointer;
}

#calendar-title {
	font-size: 20px;
	margin-top: 0px;
}

#calendar td {
	padding: 15px;
}

.calendar-wrap {
	font-size: 18px;
}
/* カレンダーの月とボタンの横並び */
.flex {
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin-top: 15px;
	cursor: pointer;
}

.calendar-container {
  position: relative;
  display: flex;
  display: flex;
  align-items: center;
  justify-content: space-around;
} 

.side {
	display: flex;
	align-items: center;
	justify-content: space-around;
}

.side {
	display: inline-block;
}

/* レスポンシブ */
@media ( max-width : 1100px) {
	.main {
		flex-direction: column;
	}
	.containerA, .containerB {
		width: 80%;
		margin: 0 auto; /* 左右の余白を自動調整 */
	}
	#calendar {
		display: flex;
		justify-content: center;
	}
	#calendar td {
		padding: 20px;
	}
	.image-container img {
		width: 80%; /* 画像の幅を80%に設定 */
	}
	.card {
		margin: 0px auto;
		margin-top: 35px;
		margin-bottom: 20px;
		width: 80%;
	}
	.achieve {
		margin-bottom: 4%;
	}
	body {
		overflow: auto; /* スクロール */
	}
}

@media ( max-width : 600px) {
	#calendar td {
		padding: 15px;
	}
}
</style>
</body>
</html>
