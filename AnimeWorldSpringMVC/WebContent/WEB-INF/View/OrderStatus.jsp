
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
    <title>Order Status!!!</title>
    
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

.custom-select{
  position: relative
  display: block
  max-width: 400px
  min-width: 180px
  margin: 0 auto
  border: 1px solid #3C1C78
  background-color: #16013E
  z-index: 10
  }
  select
  {
    border: none
    outline: none
    background: transparent
    -webkit-appearance: none
    -moz-appearance: none
    appearance: none
    border-radius: 0
    margin: 0
    display: block
    width: 100%
    padding: 12px 55px 15px 15px
    font-size: 14px
    color: #714BB9
  }
  
  &:after{
    position: absolute
    right: 0
    top: 0
    width: 50px
    height: 100%
    line-height: 38px
    content: '\2228'
    text-align: center
    color: #714BB9
    font-size: 24px
    border-left: 1px solid #3C1C78
    z-index: -1
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
    
    </style>
    
  </head>
  
  <body >
 
       <c:set var="sesStatus" value="${sesStatus}"/>
      <c:choose>
          <c:when test="${sesStatus=='success'}">
             <script type="text/javascript">
             swal("!!!Order Status Updated SuccessFully!!!", "", "success");
             </script>
          </c:when>
      </c:choose>
      <c:remove scope="session" var="sesStatus"/>
 
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
		
		 <br>
		<div class="row" >
			<div class="col col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 50px; text-align: center;">
					<section id="tablesection">
					     <table class="table"  id="example" class="table table-striped table-bordered">
 							 <thead>
   								 <tr>
   								 <th>Order Id</th>
   								 <th>User Id</th>
   								 <th>User Name</th>
   								 <th>Date</th>
   								 <th>Bill</th>
   								 <th>Status</th>
                                 <th>New Status</th>
   								 <th>Submit</th>
   								 <th>View</th>
							    </tr>
 							 </thead>
 							 <c:forEach var="list" items="${list}">
 							 <tbody>
  							   
  							   <td>${list.order_id}</td>
  							   <td>${list.user_id}</td>
  							   <td>${list.name}</td>
  							   <td>${list.date}</td>
  							   <td>${list.bill}</td>
  							   <td>${list.status}</td>
  							   <td><select class='custom-select' id="status"><option>Select</option>
  							   							<option>Ordered</option>
  							   						   <option>Order Picked</option>
  							   						   <option>Order In Transit</option>
  							   						   <option>Out For Delivery</option>
  							   						   <option>Reached Destination</option>
  							       </select> </td>
  							   <td><a style="color: #ff7200" onclick="submitStatus(${list.order_id})">Submit</a></td>
  							    <td><a style="color: #ff7200" href="/AnimeWorldSpringMVC/view/${list.order_id}">View</a></td>
  							   
 						     </tbody>
 						     </c:forEach>
					    </table>
					</section>
			</div>
			</div>
			</div>
	
		<script>
    function submitStatus(orderId) {
        var statusValue = document.getElementById('status').value;
        var url = 'status/' + orderId + '/' + statusValue;
        if(statusValue=="Select"){
        alert('Please Select new status');
        }else{
        window.location.href = url;
    }
    }
</script>
		<script>
			function openNav() {
  				document.getElementById("mySidenav").style.width = "50%";
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