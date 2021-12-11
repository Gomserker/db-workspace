
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI Test Result</title>
<link href="style.css" rel="stylesheet">
</head>
<body>

	<section>
		<div class="header">
			<h1>BMI 결과</h1>
		</div>
		<div class="content_name">
			<span> 이름 </span>
			<span> ${bmi.name} </span>
		</div>
		<div class="content_height">
			<span> 키 </span>
			<span> ${bmi.height * 100} cm</span>
		</div>
		<div class="content_weight">
			<span> 체중 </span>
			<span> ${bmi.weight} Kg</span>
		</div>
		<div class="content_weight">
			<span> BMI </span>
			<span> ${bmi.bmi2} </span>
		</div>
		<div class="content_weight">
			<span> 결과 </span>
			<span> ${bmi.result} </span>
		</div>
		<div class="content_weight">
			<span> 사진 </span>
			<span> <img src="img/${bmi.file}" width=50px height=50px></span>
		</div>
	</section>

</body>
</html>