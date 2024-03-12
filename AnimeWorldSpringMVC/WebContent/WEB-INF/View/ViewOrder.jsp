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
    <title>Order!!!</title>
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
                                         
                                        <c:set var="user" value="${user}"></c:set>
                                        
                            				<a href="/AnimeWorldSpringMVC/product2">Home</a>
                                         <c:if test="${user eq 'on'}">
                                         	<a href="/AnimeWorldSpringMVC/cart" >Cart</a>
                                       	    <a href="/AnimeWorldSpringMVC/Order/${sesuser}">Order</a>
                                            <a href="/AnimeWorldSpringMVC/userlogout" >LogOut</a>
                                         </c:if>
                                         <c:if test="${empty user}">
                                         	<a href="/AnimeWorldSpringMVC/userlogin" >LogIn</a>
                                         </c:if>
                                        
                                        
      				</div>

					<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; Order</span>
			</div>
			
			<div class="col col-lg-7 col-md-7 col-sm-7 col-xs-7">
			</div>
			
			<div class="col col-lg-3 col-md-3 col-sm-3 col-xs-3">
					

		</div>
		
		<!-- Body -->
	 <section id="tablesection">
					     
  							  <c:forEach var="list" items="${list}">
  							   <div class="row" style="margin-top: 10px">
                        <div class="col-md-3">
                            <img src="/AnimeWorldSpringMVC/image/${list.image}" style="width: 200px; height: 200px;">
                        </div>
                        <div class="col-md-9">
                            <label style="font-size: 40px">${list.name}</label>
                            <br>
                            <br>
                            <label style="font-size: 20px">Quantity : ${list.quentity}</label>
                            <br>
                            <br>
                            <label style="font-size: 20px">Price Rs.${list.price}</label>
                        </div>
                    </div>
  							   </c:forEach>
 						    
					</section>
			</div>
			
		
		
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