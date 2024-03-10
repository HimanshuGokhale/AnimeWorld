<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!doctype html>
<html lang="en">
  <head>
	  <link rel="stylesheet" href="CSS/index.css">
	  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
	  
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Otp Valification!!!</title>
    
  </head>
  
  <body >
     <c:set var="sesotp" value="${sesotp}"/>
      <c:choose>
          <c:when test="${sesotp=='failed'}">
             <script type="text/javascript">
             swal("!!!Wronge OTP!!!", "Try Again","error");
             </script>
          </c:when>
      </c:choose>
      <c:remove scope="session" var="sesotp"/>
    
    <div class="container-fluid" >
		<!-- Header -->
		<div class="row" style="margin-top: 100px">
		   <div class="col-md-12" style="text-align: center;">
    		<h1 >Otp Valificaton</h1>
  			</div>
		</div>
		<!-- Body -->
		<div class="row" style="margin-top: 20px">
			 <section class="container my-2 bg-dark text-light p-2" style="width: 400px">
		
		<form class="row g-3 p-3" action="CheckOtpReg" method="post">
		 
  <div class="col-md-12">
    <label for="validationCustom01" class="form-label"  >Enter opt:-</label>
    <input type="text" class="form-control"   name="otp" placeholder="Enter otp" required="required">
  </div>
  
  <div class="col-12">
    <div style="text-align: center;">
     <button  type="submit" class="btn btn-primary" id="submit">Submit</button>
    </div>
  </div>
</form>
	</section>
		</div>
    </div>
	

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>