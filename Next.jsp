<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">





<!DOCTYPE html>
<html lang="en">
<head>
	<link rel="stylesheet" href="main.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		.checked {
 		 color: orange;
		}
	</style>

  <link rel="stylesheet" type="text/css" href="style.css">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <title>Suggesions</title>

</head>

<body>
	<nav class="navbar navbar-inverse">
  		<div class="container-fluid">
    		<div class="navbar-header">
      		<a class="navbar-brand" href="#"><img src="images/restaurant.png"></a>
    		</div>
    		<div class="brand"><p class="smallcap" >FOOD IS LIFE</p></div>
    		<ul class="nav navbar-nav navbar-right">
    		  <li class="active"><a href="index.html">Home</a></li>
    		  <li><a href="List.jsp">Restaurants A-Z</a></li>
    		  <li><a href="#">Reviews</a></li>
    		  <li><a href="#">Menus</a></li>
    		  <li><a href="#">Contact us</a></li>
   			</ul>
  		</div>
  	</nav>

  	<br><br><br>
  	<h4 class="lab" style="font-weight: 900;">Location  <i class="fa fa-map-marker" style="font-size:40px;color:#331a00"></i></h4><h4 class="lab">-     <%
    String location = request.getParameter("location");
    %>
    <%= location%>
	</h4>

	<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/food"
        user="root" password="root"
    />

    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM restaurants 
        where location = '<%= location%>'
        order by rating desc;
    </sql:query>

  	<br><br>
	<div class="thumbnails">
		<c:forEach var="restaurants" items="${listUsers.rows}">
		<div class="box">
			<a class="image fit"><img src="<c:out value="${restaurants.image}" />" alt="" /></a>
			<div class="inner">
				<h2><c:out value="${restaurants.name}" /></h2>
				<h3><c:out value="${restaurants.desc}" /></h3>
				<p  style="font-size: 20px">Cost for two - ₹<c:out value="${restaurants.cost}" /><br>
				Rating - 
				<span class="fa fa-star checked"></span>
				<c:out value="${restaurants.rating}" />
				<br><c:out value="${restaurants.time}" /></p>
			</div>
		</div>
		</c:forEach>

	    <footer class="footer-bs">
        <div class="row">
        	<div class="col-md-3 footer-brand animated fadeInLeft">
            	<img src="images/restaurant.png" style="height: 70px;width: 70ppx">
                <h4>Food is Life</h4>
                <p>© 2014 BS3 UI Kit, All rights reserved</p>
            </div>
        	<div class="col-md-4 footer-nav animated fadeInUp">
            	<h3>Contact —</h3>
            	<div class="col-md-6">
            		<i class="fa fa-phone" style="font-size:24px"></i>
            		<h4>+91 8072 688 955</h4>
            		<i class="fa fa-envelope-o" style="font-size:24px"></i>
            		<h4>g.sara@gmail.com</h4>
                </div>
                
            	<div class="col-md-6">
            		<h4>About Us —</h4>
            		A quality website can make the difference between a new customer and a missed opportunity.
                </div>
            </div>
        	<div class="col-md-2 footer-social animated fadeInDown">
            	<h3>Follow Us</h3>
            	<ul>
                	<li><a href="#">Facebook</a></li>
                	<li><a href="#">Twitter</a></li>
                	<li><a href="#">Instagram</a></li>
                	<li><a href="#">RSS</a></li>
                </ul>
            </div>
        	<div class="col-md-3 footer-ns animated fadeInRight">
            	<h3>ThankYOU!</h3>
                <p>There is always, always, always something to be thankful for</p>
                
            </div>
        </div>
    </footer>
</body>
</html>