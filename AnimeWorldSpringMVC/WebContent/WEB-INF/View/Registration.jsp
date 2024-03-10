<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Registration Form</title>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body style="background-image: url('image/w3.jpg');">
  
   <c:set var="Email" value="${Email}"/>
      <c:choose>
          <c:when test="${Email=='duplicate'}">
             <script type="text/javascript">
             swal("!!!Duplicate Email!!!","Try again", "error");
             </script>
          </c:when>
      </c:choose>
      <c:remove scope="session" var="Email"/>
    
   
     <div class="container-fluid bg-dark text-light py-3">
		<header class="text-center">
			<h1 class="display-6">Welcome to AnimeWorld</h1>
		</header>
	</div>
    <div class="row">
    <section class="container my-2 bg-dark w-50 text-light p-2">
		
		<form class="row g-3 p-3 col col-xs-12" action="save" method="post">
  <div class="col-md-4 col-xs-12">
    <label for="validationCustom01" class="form-label"  >First name</label>
    <input type="text" class="form-control" id="first_name" name="first_name" required="required" placeholder="Enter First Name">
    <small class="text-danger" id="chkname"></small>
  </div>
  
  <div class="col-md-4">
    <label for="validationCustom02" class="form-label" >Last name</label>
    <input type="text" class="form-control" id="last_name" name="last_name" required="required" placeholder="Enter Last Name" >
    <small class="text-danger" id="chksarname"></small>
  </div>
  
  <div class="col-md-4">
    <label for="validationCustomUsername" class="form-label" >Username</label>
    <div class="input-group has-validation">
      <span class="input-group-text" id="inputGroupPrepend">@</span>
      <input type="text" class="form-control" id="user_name" name="user_name" required="required" placeholder="Enter User Name" aria-describedby="inputGroupPrepend">
      <small class="text-danger" id="chkusername"></small>
    </div>
  </div>
  
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label" >Email</label>
    <input type="email" class="form-control" id="email" name="email" required="required" placeholder="Enter Email" onblur="checkEmail()">
     <small class="text-danger" id="chkemail"></small>
  </div>
  
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Password</label>
    <input type="password" class="form-control" id="password" required="required" name="password" placeholder="Enter Password" onblur="checkPassword()">
    <small class="text-danger" id="chkpassword"></small>
  </div>
  
   <div class="col-md-6">
    <label for="inputEmail4" class="form-label" >Phone Number</label>
    <input type="text" class="form-control" id="phone" required="required" name="phone" placeholder="Enter Phone Number" onblur="checkPhone()">
     <small class="text-danger" id="chkphone"></small>
  </div>
  
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label" >Date of Birth</label>
    <input type="date" class="form-control" required="required" id="dob" name="dob" placeholder="Enter Date of Birth" onblur="checkDob()">
    <small class="text-danger" id="chkdob"></small>
  </div>
  
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Gender</label><br>
    <input type="radio" class="form-check-input" name="gender" value="male" id="male" onclick="checkGender()" >Male &nbsp;&nbsp;
    <input type="radio" class="form-check-input" name="gender" value="female" id="female" onclick="checkGender()" >Female <br>
     <small class="text-danger" id="chkgender">* Please select gender</small>
  </div>
  
  <div class="col-12">
    <label for="inputAddress" class="form-label" >Address</label>
    <input type="text" class="form-control" required="required" id="address" name="address" placeholder="Enter Address">
    <small class="text-danger" id="chkaddress"></small>
  </div>
  
  <div class="col-md-6">
    <label for="inputCity" class="form-label" >City</label>
    <input type="text" class="form-control" required="required" id="city" name="city" placeholder="Enter City" onblur="checkCity()">
    <small class="text-danger" id="chkcity"></small>
  </div>
  
  <div class="col-md-3 ">
    <label for="inputState" class="form-label">State</label>
    <select id="state" name="state" class="form-select" onblur="checkState()">
      <option selected value="Select State">Select State</option>
      <option value="Maharashtra">Maharashtra</option>
      <option value="Punjab">Punjab</option>
      <option value="Gujarat">Gujarat</option>
      <option value="Goa">Goa</option>
      <option value="Himachal">Himachal</option>
    </select>
    <small class="text-danger" id="chkstate"></small>
  </div>
  <div class="col-md-3">
    <label for="inputZip" class="form-label" >Zip</label>
    <input type="text" class="form-control" required="required" id="zip" name="zip" placeholder="Enter Zip" onblur="checkZip()">
    <small class="text-danger" id="chkzip"></small>
  </div>
  
  <div class="col-12">
    <button type="submit" class="btn btn-primary" id="submit">Sign UP</button>
  </div>
</form>
	</section>
	</div>
	<script>
		var statusFirstName=true;
		var statusLastName=true;
		var statusUserName=true;
		var statusEmail=false;
		var statusPassword=false;
		var statusPhone=false;
		var statusDate=true;
		var statusGender=false;
		var statusAddress=true;
		var statusCity=true;
		var statusState=true;
		var statusZip=true;
				
		
		var mailformat = /^\w+([\.-]?\w+)@\w+([\.-]?\w+)(\.\w{2,3})+$/;
		
		var paswd=  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
		
		var phoneno = /^\d{10}$/;
		

				
		function checkEmail(){
					var email=document.getElementById('email').value;
					if(email==''||email==null)
					{
						document.getElementById('chkemail').innerHTML="* Email field is required ";
						document.getElementById('email').focus();
						statusEmail=false;
					}
					else if(!email.match(mailformat))
					{
						document.getElementById('chkemail').innerHTML="* Email Invalid";
						document.getElementById('email').focus();
						statusEmail=false;
					}else{
						statusEmail=true;
						document.getElementById('chkemail').innerHTML="";
						
						if(statusFirstName==true && statusLastName==true  &&  statusUserName==true && statusEmail==true && statusPassword==true && statusPhone==true && statusDate==true && statusGender==true && statusAddress==true && statusCity==true && statusState==true && statusZip==true){
							
						}	else{
								
								}
					}
				}
				
		function checkPassword(){
					var password=document.getElementById('password').value;
					if(password==''||password==null)
					{
						document.getElementById('chkpassword').innerHTML="* Password field is required ";
						document.getElementById('password').focus();
						statusPassword=false;
					
						
					}
					else if(!password.match(paswd))
					{
						document.getElementById('chkpassword').innerHTML="* Password  should be between 8 to 15 characters which contain at least one lowercase letter, one uppercase letter, one numeric digit, and one special character";
						document.getElementById('password').focus();
						statusPassword=false;
						
					}else{
						statusPassword=true;
						document.getElementById('chkpassword').innerHTML="";
						
						if(statusFirstName==true && statusLastName==true  &&  statusUserName==true && statusEmail==true && statusPassword==true && statusPhone==true && statusDate==true && statusGender==true && statusAddress==true && statusCity==true && statusState==true && statusZip==true){
							
						}	else{
								
								}
					}
				}
				
		function checkPhone(){
					var phone=document.getElementById('phone').value;
					if(phone==''||phone==null)
					{
						document.getElementById('chkphone').innerHTML="* Phone Field is Required";
						document.getElementById('phone').focus();
						statusPhone= false;
						
						
					}
					else if(isNaN(phone))
					{
						document.getElementById('chkphone').innerHTML="* Phone Number feild should be numerical only";
						document.getElementById('phone').focus();
						statusPhone= false;
						
					}
					else if(phone.length==0||phone.length>10||phone.length<10)
					{
						document.getElementById('chkphone').innerHTML="Phone Number should be 10 digit only";
						document.getElementById('phone').focus();
						statusPhone= false;
					
						
					}
					else{
						statusPhone=true;
						document.getElementById('chkphone').innerHTML="";
						
						if(statusFirstName==true && statusLastName==true  &&  statusUserName==true && statusEmail==true && statusPassword==true && statusPhone==true && statusDate==true && statusGender==true && statusAddress==true && statusCity==true && statusState==true && statusZip==true){
							
						}	else{
								
								}
					}
				}
				
	
				
		function checkGender(){
			        if(document.getElementById('male').checked==true || document.getElementById('female').checked==true){
						statusGender=true;
						document.getElementById('chkgender').innerHTML="";
						
						if(statusFirstName==true && statusLastName==true  &&  statusUserName==true && statusEmail==true && statusPassword==true && statusPhone==true && statusDate==true && statusGender==true && statusAddress==true && statusCity==true && statusState==true && statusZip==true){
						}	else{
								}
								
					}else{
						statusGender=false;
					}
						
		}	
		
	
	
	</script>
  </body>
</html>