<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>達成おめでとう！</title>
</head>
<body>
    <form method="post" action="RewardServlet">
        <input type="hidden" name="name" value="${loggedInAccount.name}">
        <input type="hidden" name="pass" value="${loggedInAccount.pass}">
    </form>

    <section>
	    <div class="leftside">
	    	<figure>
	    		<img alt="猫の画像" src='images/14.jpg'>
	    	</figure>
	    </div>
	    
	    <div class="rightside">
			<h1>Congratulations!</h1>
		
		    <div class="flexbox">
		    	<div class="flexitem">
				    <c:out value="${loggedInAccount.name}さん" />
				</div>
				<div class="flexitem">
				    <c:out value="達成した目標: ${loggedInAccount.objective}" />
				</div>
				<div class="flexitem">
				    <c:out value="ご褒美: ${loggedInAccount.reward}" />
				</div>
		   </div>
			<!-- アカウント削除ボタン -->
			<form method="post" action="DeleteServlet">
				<input type="hidden" name="username" value="${loggedInAccount.name}">
				<input type="submit" value="アカウントを削除">
				<div class="memo">
					<p>66日間継続して取り組むことができたあなたにはきっと習慣が身に付いているはずです。おめでとう！<br>
					アカウント削除ボタンを押してください。<br>
					身に付けたい習慣ができたとき、また会いましょう！</p>
				</div>
			</form>
		</div>
		
    </section>
    
    

    <style>
    	@charset "UTF-8";
		@import url('https://fonts.googleapis.com/css2?family=Zen+Kaku+Gothic+Antique:wght@300;400;500&display=swap');
		
		*{
			margin:0;
			padding:0;
			font-family: 'Zen Kaku Gothic Antique', sans-serif;
			box-sizing: border-box;
		}
		
		html{
			font-size: 10px;
		}
		
		body{
			background: #1f3134;
			color: #e7e7eb;
			overflow: hidden; /*カーソル*/
		}
		
		section{
		 max-width: 1200px;
		 display: flex;
		 justify-content: center;
		 align-items: center;
		}
		
		/*左サイド*/
		.leftside{
			width: 600px;
			
		}
		
		/*写真のサイズ*/
		.leftside figure{
			width: 500px;
			height: 500px;
			border: 2px solid #646464;
			position:relative;
			display: flex;
		    justify-content: space-around;
		    align-items: center;
		    margin: 80px;
		}
		
		/*写真を回転*/
		.leftside figure img{
			width: 100%;
			height: 100%;
			object-fit: cover;
			transform: rotate(-7deg);
			transform-origin: 0% 100%;
			display: flex;
		    justify-content: space-around;
		    align-items: center;
		}
		
		/*黄色の影*/
		.leftside figure::after{
			content: "";
			width: 100%;
			height: 100%;
			background-color: #f2ba52;
			position: absolute;
			top: 20px;
			left: 20px;
			z-index: -1;
		}
		
		/*右サイド*/
		.rightside{
			width: 600px;
			margin-left: 20px;
			text-align: center;
		}
		
		.rightside h1{
			font-size: 6rem;
			text-align:center;
			font-weight:bold;
			color: transparent;
			background: repeating-linear-gradient(45deg,
				#F5B090 0.1em 0.2em,
				#FCD7A1 0.2em 0.3em,
				#FFF9B1 0.3em 0.4em,
				#A5D4AD 0.4em 0.5em,
				#A3BCE2 0.5em 0.6em,
				#A59ACA 0.7em 0.8em,
				#CFA7CD 0.8em 0.9em);
			-webkit-background-clip: text;
			letter-spacing: .1em;
		}
		
		.flexbox{
			text-align: center;
		    justify-content: center;
		    align-items: center;
		    font-size: 3rem;
		}
		/*削除ボタン*/
		form input[type="submit"] {
		    background-color: #f2ba52;
		    padding: 10px 15px;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		    transition: .3s cubic-bezier(0.5, 1, 0.89, 1);
		    color: #8b0000;
		    margin-top: 20px;
		}
		
		form input[type="submit"]:hover {
		    background: #8b0000;
		  	color: #f2ba52;
		  	transform: scale(1.1);
		}
		
		
		.memo{
			margin: 2em auto;
			padding:2em;/*内側余白*/
			border:dotted 3px #e2c2b3;/*線の種類・太さ・色*/
			border-radius: 30px;
		}
		
		.memo p{
			font-size: 1.5rem;
		}
		

		/*レスポンシブ*/
		@media (max-width: 900px) {
		
			body{
				overflow: auto;/* スクロール */
				overflow-x: hidden;
			}
			
			section{
				flex-direction: column;
			}
			
			.leftside,
			.rightside{
				width: 80%;
		        margin: 0 auto; /* 左右の余白を自動調整 */
			}
			.leftside figure {
		        width: 80vw;
		        height: auto; /* 画像のアスペクト比を保つ */
		        margin: 0 auto; /* 中央寄せ */
		        margin-top: 4em;
		    }
		    
		    /* 画像を回転しないよう設定 */
		    .leftside figure img {
		        transform: rotate(0);
		        transform-origin: center center;
		        width: 80vw;
		    }
			
			.rightside{
				margin-top: 4em;
			}
			
			.rightside h1{
				font-size: 6rem;
			}
		
			.flexbox{
				font-size: 2rem;
			}
			
			.memo p{
				font-size: 1.2rem;
			}
		}
		
		@media (max-width: 600px) {
			.leftside figure {
				margin-top: 4em;
			}
			.rightside h1{
				font-size: 4rem;
			}
		
			.flexbox{
				font-size: 2rem;
			}
		
		}
    </style>    
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.3.2/dist/confetti.browser.min.js"></script>
	<script>
		var end = Date.now() + (15 * 1000);
	
		var colors = ['#fcc800', '#706caa', '#e95464'];
	
		(function frame() {
		  confetti({
		    particleCount: 3,
		    angle: 60,
		    spread: 55,
		    origin: { x: 0 },
		    colors: colors
		  });
		  confetti({
		    particleCount: 3,
		    angle: 120,
		    spread: 55,
		    origin: { x: 1 },
		    colors: colors
		  });
	
		  if (Date.now() < end) {
		    requestAnimationFrame(frame);
		  }
		}());

	</script>

</body>
</html>
