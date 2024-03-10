
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
    <title>Product Details!!!</title>
    
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
  <c:set var="sesadmin" value="${sesadmin}"/>
      <c:choose>
          <c:when test="${sesadmin=='success'}">
             <script type="text/javascript">
             swal("!!!Welcome Admin!!!","", "success");
             </script>
          </c:when>
      </c:choose>
      <c:remove scope="session" var="sesadmin"/>
  
   <c:set var="sesEditPro" value="${sesEditPro}"/>
      <c:choose>
          <c:when test="${sesEditPro=='success'}">
             <script type="text/javascript">
             swal("!!!Product Edited Successfully!!!", "","success");
             </script>
          </c:when>
      </c:choose>
      <c:remove scope="session" var="sesEditPro"/>
  
  <c:set var="sesDelPro" value="${sesDelPro}"/>
      <c:choose>
          <c:when test="${sesDelPro=='success'}">
             <script type="text/javascript">
             swal("!!!Product Deleted Successfully!!!", "","success");
             </script>
          </c:when>
      </c:choose>
      <c:remove scope="session" var="sesDelPro"/>
  
 
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
					 
      					<div class="md-form my-0">
      					<input class="form-control" id="myInput" style="background: transparent; type="text" placeholder="Search..">
       					<!--   <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search"> -->
      					</div>
   					
			</div>
			
			
		</div>
		
		<!-- Body -->
		
		<div class="row" >
			<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 50px; text-align: center;">
					<section id="tablesection">
					     <table class="table"  id="myTable class="table table-striped table-bordered">
 							 <thead>
   								 <tr>
   								 <th>Id</th>
   								 <th>Name</th>
   								 <th>Description</th>
   								 <th>Stock</th>
   								 <th>Anime</th>
   								 <th>Category</th>
   								 <th>Price</th>
   								 <th>Image</th>
   								 <th>Edit</th>
   								 <th>Delete</th>
							    </tr>
 							 </thead>
 							 <c:forEach var="list" items="${list}">
 							 <tbody>
  							 
  							     <td>${list.pro_id}</td>
  							 <td>${list.name}</td>
  							 <td>${list.decription}</td>
  							 <td>${list.stock}</td>
  							 <td>${list.anime}</td>
  							  <td>${list.category}</td>
  							 <td>${list.price}</td>
  							 <td>${list.image}</td>
  							 <td><a href="edit/${list.pro_id}">Edit</a></td>
  							 <td><a href="delete/${list.pro_id}">Delete</a></td>
  							 
  							  
 						     </tbody>
 						     </c:forEach>
					    </table>
					</section>
			</div>
			
		</div>
		</div>
    </div>
        <script type="text/javascript">
             function anime() {
				
			}
        </script>
        
		<script type="text/javascript">
		new DataTable('#example');
		</script>
		<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
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