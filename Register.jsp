<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="register.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<title>Register</title>
	<script type="text/javascript">
		
		function registerValidate() {
			var fname = document.registerform.firstname.value;
			var lname = document.registerform.lastname.value;
			var sex = document.registerform.gender.value;
			var user = document.registerform.name.value;
			var pass = document.registerform.password.value;
			var cpass = document.registerform.confirm_password.value;

			if (fname=="") {
				alert("Please enter your firstname!");
				return false;
			}

			if (lname=="") {
				alert("Please enter your lastname!");
				return false;
			}

			if (sex=="") {
				alert("Pleaser select your Gender!");
				return false;
			}

			if (user=="") {
				alert("Username cannot be empty!");
				return false;
			}

			if ((pass=="") || (cpass=="")){
				alert("Password or Confirm Password cannot be empty!");
				return false;
			}

			if(pass!=cpass){
				alert("Password and Confirm Password must be same!")
				return false;
			}

			document.registerform.method="POST";
			document.registerform.action="Register";
			document.registerform.submit();
		}


		function loadXMLDoc()
		{
			var xmlhttp;
			var k=document.getElementById("name").value;
			var urls="checkname.jsp?ver="+k;
			if (window.XMLHttpRequest)
			{
				xmlhttp=new XMLHttpRequest();
			}
			else
			{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()
			{
			if (xmlhttp.readyState==4)
			{
				document.getElementById("err").innerHTML=xmlhttp.responseText;
			}
			}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}


	</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-5">
				<br>
				<h2 class="text-center">BECOME A MEMBER</h2><br>
				<form name="registerform" method="POST" onsubmit=registerValidate()>
					<input type="text" class="form-control" name="firstname" placeholder="First name">
					<input type="text" class="form-control" name="lastname" placeholder="Last name">
					<h5 class="radio">Gender :<input class="radio-inline" type="radio" name="gender" value="Male"><label class="lab">Male</label>
						<input type="radio" class="radio-inline" name="gender" value="Female"><label class="lab">Female</label></h5>
					<h5 class="radio">
					Vegetarian :<input class="checkbox-inline" type="checkbox" name="vegetarian">		<label class="lab">
						Yes
					</label>
					</h5>	
					<select class="form-control" id="sel1">
					   <option>Location</option>
				   	   <option>Ashok nagar</option>
				 	   <option>T nagar</option>
				 	   <option>Porur</option>
				 	   <option>Tambaram</option>
				 	   <option>Anna nagar</option>
				 	   <option>Mogappair</option>
					</select>
					<input type="text" class="form-control" name="name" placeholder="User name" id="name" onkeyup="loadXMLDoc()"><span id="err"> </span>
					<input type="password" class="form-control" name="password" placeholder="Password"	>	
					<input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password">			
					<hr>
					<input type="submit" class="btn btn-info" value="SIGN UP">
				</form>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>

</body>
</html>