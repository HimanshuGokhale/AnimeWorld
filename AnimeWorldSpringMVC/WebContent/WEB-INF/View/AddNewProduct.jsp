
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
    <title>Add New Product!!!</title>
    
    <style type="text/css">
    .sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
  text-align:center;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;

}

.sidenav a:hover{
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
    
    </style>
    
  </head>
  
  <body >
   <c:set var="sesNewPro" value="${sesNewPro}"/>
      <c:choose>
          <c:when test="${sesNewPro=='success'}">
             <script type="text/javascript">
             swal("!!!Product Added Successfully!!!", "","success");
             </script>
          </c:when>
      </c:choose>
      <c:remove scope="session" var="sesNewPro"/>
  
 
    <div class="container-fluid" >
		
		
		<!-- Heading -->
		<div class="row">
			<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12" style="background-color:blue;">
					<h1 style="color: #ff7200; text-align: center; margin-top: 15px;">AnimeWorld</h1>
			</div>
		</div>
		
		
		<!-- Navigation -->
		<div class="row" >
			<div class="col col-lg-2 col-md-2 col-sm-2 col-xs-2">
					<div id="mySidenav" class="sidenav">
 					 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 					 <a href="product">Product Details</a>
 					 <a href="AddNewProduct">Add New Product</a>
                                         <a href="OrderStatus">Order Status</a>
                                         <a href="Adminlogout" >LogOut</a>
      				</div>

					<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Home</span>
			</div>
			
			<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
			</div>
			
			<div class="col col-lg-3 col-md-3 col-sm-3 col-xs-3">
					 <form class="form-inline"  style="margin-top: 5px"s>
      					<div class="md-form my-0">
       					 <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      					</div>
   					 </form> 
			</div>
			
			
		</div>
		
		<!-- Body -->
		
		<div class="row" style="margin-top: 10px">
			 <section class="container my-2 bg-dark w-50 text-light p-2">
		
		<form class="row g-3 p-3" action="addproduct" method="post" enctype="multipart/form-data">
		 
  <div class="col-md-6">
    <label for="validationCustom01" class="form-label"  >Product name:-</label>
    <input type="text" class="form-control" id="name"  name="name" placeholder="Enter Product Name"  required="required">
  </div>
  
   <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Image Name:-</label><br>
        <input type="file" class="form-control" id="file"  name="file" placeholder="Enter Image Name"  required="required">
   </div>
   
  <div class="col-md-12">
    <label for="inputEmail4" class="form-label" >Describtion:-</label>
    <input type="text" class="form-control" id="decription"  name="decription" placeholder="Enter Description"  required="required">
     <small class="text-danger" id="chkemail"></small>
  </div>
  
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label">Stock:-</label>
    <input type="text" class="form-control" id="stock"  name="stock" placeholder="Enter Stock" required="required">
    <small class="text-danger" id="chkpassword"></small>
  </div>
  
   <div class="col-md-6">
    <label for="inputEmail4" class="form-label" >Anime Name:-</label>
    <input type="text" class="form-control" id="anime" name="anime"  placeholder="Enter Anime Name"  required="required">
  </div>
  
  <div class="col-md-6">
    <label for="inputPassword4" class="form-label" >Product Category:-</label>
    <input type="text" class="form-control" id="category" name="category"  placeholder="Enter Product Category"  required="required">
    <small class="text-danger" id="chkdob"></small>
  </div>
  
  <div class="col-md-6">
    <label for="inputEmail4" class="form-label">Product Price:-</label><br>
        <input type="text" class="form-control" id="price" name="price"  placeholder="Enter Product Price" required="required">
   </div>
   
  <div class="col-12">
    <div style="text-align: center;">
     <button  type="submit" class="btn btn-primary" id="submit">Add</button>
    </div>
  </div>
</form>
	</section>
		</div>
    </div>
		
		
		<script>
			function openNav() {
  				document.getElementById("mySidenav").style.width = "100%";
			}

			function closeNav() {
 			    document.getElementById("mySidenav").style.width = "0";
			}
		</script>


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