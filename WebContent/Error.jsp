<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
    <title>Error Page</title>
</head>
<body>
    <h1>Error Page</h1>
    <p>${errorMessage}</p>
    
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
			background-color: #E0E0E0;
		}

    </style>
</body>
</html>
