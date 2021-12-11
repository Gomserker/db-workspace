<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI Test</title>
<link href="style.css" rel="stylesheet">
<script type="text/javascript">
	function call(){
	let input = document.getElementById('name');
	let input2 = document.getElementById('height');
	let input3 = document.getElementById('weight');
	
	if(isEmpty(input) || lessThan(input, 2)) {
		alert('required error');
		input.focus();
		input.value = "";
		return false;
	}
	
	if(lessThan(input2, 3) || isNotNumber(input2)) {
		alert('3글자 이상 숫자만');
		input2.focus();
		input2.value = "";
		return false;
	}
	
	if(isNotNumber(input3)){
		alert('숫자만');
		input3.focus();
		input3.value = "";
		return false;
	}
	return true;
	}
	
</script>
<script type="text/javascript" src="../js/validCheck.js"></script>
</head>
<body>
	<form action="BmiController" enctype="multipart/form-data" onsubmit="return call();" method="post">
		<section>
			<div class="header">
				<h1>BMI 검사</h1>
			</div>
			<div class="content_name">
				<span> 이름 </span>
				<input class="content_name_input" id="name" name="name" placeholder="필수, 2글자 이상">
			</div>
			<div class="content_height">
				<span> 키 </span>
				<input class="content_height_input" id="height" name="height" placeholder="3글자 이상 숫자만">
			</div>
			<div class="content_weight">
				<span> 체중 </span>
				<input class="content_weight_input" id="weight" name="weight" placeholder="숫자만">
			</div>
			<div class="content_pics">
				<span> 사진 </span>
				<input type="file" name="pic" class="content_pics_upload">
		</div>
			<div class=content_btn>
			<button>계산</button>
		</div>
		</section>
	</form>
</body>
</html>