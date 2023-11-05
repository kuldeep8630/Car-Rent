<%@page import="com.entities.CarDtls"%>
<%@page import="com.DAO.CarDAOImpl"%>
<%@page import="java.awt.print.Book"%>
<%@page import="com.DAO.BookingDAOImpl"%>
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BOOK CAR PAGE</title>
<%@include file="css/allCss.jsp"%>
</head> 
<body style="background-color: #f7f7f7;">




<!-- NAVBAR -->





<div class="container-fluid" style="height: 10px; background-clor:"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success"></div>
		<h3>
			<i class="fa-solid fa-car"></i> Online Car Booking
		</h3>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>

			<div class="col-md-3">

				<c:if test="${not empty userobj}">
					<div class="col-md-3"></div>
					<a href="book_car.jsp" class="btn btn-success"><i
							class="fas fa-user"></i>    <i
						class="fas fa-sign-in-alt"></i>${userobj.name}</a>
					<a href="logout.jsp" class="btn btn-primary">Logout</a>

				</c:if>


		 <c:if test="${empty userobj }">
					<c:redirect url="login.jsp"></c:redirect>

				</c:if> 


			</div>
		</div>
	</div>


	<!-- LOGOUT MODAl -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4>Do You Want to Logout ?</h4>
					<div class="text-center">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="../logout" type="button" class="btn btn-danger">Logout</a>

					</div>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>





	<!-- End LOGOUT MODAL  -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<a class="navbar-brand" href="index2.jsp"><i
			class="fa-solid fa-house"></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index2.jsp">HOME <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link" href="#"><i
						class="fa-regular fa-address-card "></i>ABOUT US</a></li>


			</ul>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-light my-2 my-sm-0" type="submit">
					<i class="fa-solid fa-gear"></i> SETTING
				</button>
				<button class="btn btn-light my-2 my-sm-0 ml-2" type="submit">
					<i class="fa-solid fa-phone-volume"></i> CONTACT US
				</button>
			</form>
		</div>
	</nav>




	<!-- EndNavbar-->
	
	
	
<div calss="container">
<div class="row p-2">
<div class="col-md-6">

<div class="card bg-white">
<div class="card-body">
<h3 class="text-center text-success">Your Selected Car</h3>
 <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">CAR ID</th>
      <th scope="col">CAR NAME</th>
      <th scope="col">DRIVER NAME</th>
      <th scope="col">PRICE</th>
    </tr>
  </thead>
  <tbody>
  
  
  <%
   String idParam = request.getParameter("id");
   int id;
   CarDtls c = null;
   
   if (idParam != null && !idParam.isEmpty()) {
      try {
         id = Integer.parseInt(idParam);
         CarDAOImpl dao = new CarDAOImpl(DBConnect.getConn());
         c = dao.getCarById(id);
      } catch (NumberFormatException e) {
         // Handle the exception (e.g., log the error, display an error message)
      }
   }
%>
							
			 
    <tr>
      <th scope="row">1</th>
      <td><%=c.getCarId()%></td>
		<%-- <td><img src="../carimages/<%=c.getPhotoName()%>" 
		style="width: 50px; height: 50px;"></td> --%>
		<td><%=c.getCarname()%></td>
		<td><%=c.getDriver()%></td>
		<td><%=c.getPrice()%></td>
    </tr>
    
    
    
    
  </tbody>
</table>

</div>
</div>
</div>



<div class="col-md-6">

<div class="card bg-white">
<div class="card-body">
<h3>Your Detail For Booking</h3>
<form>

<div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Name</label>
      <input type="text" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="email" class="form-control" id="inputPassword4" >
    </div>
  </div>
  
 <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Password</label>
      <input type="password" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Mobile</label>
      <input type="number" class="form-control" id="inputPassword4" >
    </div>
  </div>
  
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Pick-Up Date</label>
      <input type="calender" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Drop Date</label>
      <input type="calender" class="form-control" id="inputPassword4" >
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Address</label>
      <input type="text" class="form-control" id="inputEmail4">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Landmark</label>
      <input type="text" class="form-control" id="inputPassword4" >
    </div>
  </div>
  
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">City</label>
      <input type="text" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">State</label>
      <input type="text" class="form-control" id="inputPassword4" >
    </div>
  </div>
	
 <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Pin Code</label>
      <input type="numbers" class="form-control" id="inputEmail4" >
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Payment</label>
      
     <select class="form-control" >
     <option selected>---Select---</option>
	 <option>Paytm Or any other UPI Platform</option>
	  <option>Debit/Credit Card</option>
	</select>
    </div>
  </div>
  
  
	<div class="text-center">
	<div> 
	<button class="btn btn-warning">Book Now</button>
	<button class="btn btn-primary">Cancle</button>
	 
	</div>
  </div>

</form>

</div>
</div>







</div>
</div>	
	
<body>

</body>
</html>