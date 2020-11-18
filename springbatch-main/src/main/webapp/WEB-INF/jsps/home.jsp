<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
<html lang="en">
<head>
  <title>Batch Processing Site</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="/load/home">Home</a></li>
       
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>
  
    
    <div> 
      <h1>Welcome to SQL Batch Processing</h1>
       <button type="submit" ><a href="/load/selectmode?mode=autosql">Auto scheduling </a> </button>
       <button type="submit"><a href="/load/selectmode?mode=manualsql">Manual Scheduling</a></button>
    
         
         
         
         <div > <c:if test="${automode eq 'autosql'}">
     
      
      <h3>Auto Scheduling</h3>
      <p>

<button><a href="/load/getsqlauto">Auto Scheduling</a></button>

  <hr><p>upload files

 <form method="post" action="/load/uploadfilessql" enctype="multipart/form-data">
 
 <input type="file" name="fileUpload" size="50" />
 
 <input type="submit" value="Upload" />
 </form>


<!-- <hr><button><a href="/autohistory">Auto Job Scheduling history</a></button> --></p>
</c:if>
    </div><div class="ac">
      <c:if test="${automode eq 'auto'}">
      
      
      <h3>For Auto Job Scheduling</h3>
      <p><c:if test="${logi ne 'login'}">

<button><a href="/load">Auto Job Scheduling</a></button>

  <hr align="left" width="50%" size="50"><p>upload files

 <form method="post" action="/load/uploadfiles" enctype="multipart/form-data">
 
 <input type="file" name="fileUpload" size="50" />
 
 <input type="submit" value="Upload" />
 </form>


</c:if> <!-- <hr><button><a href="/autohistory">Auto Job Scheduling history</a></button> --></p>
</c:if>

</div>

<hr align="left" width="50%" size="50">
<c:if test="${manualmode eq 'manual' }">
<!-- <h3>For Manual Scheduling</h3> -->

<p> <%-- <c:if test="${logi ne 'login'}">



 <button> <a href="/load/manualmodelist">Manual Job Scheduling</a></button>
</c:if> --%></p></c:if>
    </div>
    <c:if test="${logi eq 'login'}">
<form action="/logicheck" method="post">
<div align="center">
<h3>${logfail}</h3>

UserName : <input type="text" name = "userName" placeholder="Enter username"><br>
Password : <input type="password" name="password"
 placeholder="Enter password">
<hr>
<input type = "submit" value="Login">
</div>

</form>
</c:if>

<%-- <c:if test="${logi ne 'login'}">

<button><a href="/automode">Auto Job Scheduling</a></button>  

 <button> <a href="/manualmodelist">Manual Job Scheduling</a></button>
</c:if> --%>
<br>
${successorfailure} <br>

${cre}


<!-- <br> <a href="/firstautomodetest">first auto test </a> -->



${hello}

<c:if test="${cahis eq 'checkahis' }">

<c:if test="${lisAuto.size() == 0}">

No Auto scheduling histories available

</c:if>
<c:if test="${lisAuto.size() != 0}">
<table border=1>
<h3>Auto Scheduling History</h3>
<tr><th>SNO</th><th>File Name</th><th>Date </th><th>Status</th></tr>
<c:forEach items="${lisAuto}" var = "lh">

<tr><td>${lh.sNo}</td><td>${lh.fileName}</td><td>${lh.dateTime}</td><td>${lh.status}</td></tr>

</c:forEach>
</table>

</c:if>
</c:if>



<c:if test="${chis eq 'checkhis' }">

<c:if test="${lisHist.size() == 0}">

No manual scheduling histories available

</c:if>
<c:if test="${lisHist.size() != 0}">
<table border=1>
<h3>Manual Scheduling History</h3>
<tr><th>SNO</th><th>File Name</th><th>Date </th><th>Status</th></tr>
<c:forEach items="${lisHist}" var = "lh">

<tr><td>${lh.sNo}</td><td>${lh.fileName}</td><td>${lh.dateTime}</td><td>${lh.status}</td></tr>

</c:forEach>
</table>

</c:if>
</c:if>
<div class="ad">
<c:if test="${manualtest eq 'checkmanual'}">

<!-- <button><a href="/manualhistory">Manal scheduling history</a></button> -->
<form action="/load/manualmode" method="get">
<table>
<h3>Select files </h3>
<c:forEach items="${fName}" var="fileName"> 
<tr> <td><input type="checkbox" name="fnames" value= "${fileName}"></td><td>
   ${fileName}</td>
</tr>
</c:forEach></table><div align="right"><table><h4>select time</h4><tr><td>
calender :  <input type="datetime-local"  value="2020-10-08 19:32:00" step="1" name="datetimeloc" style="width:150px">
</td></tr><tr><td><br><input type="submit" value="manual search"></td></tr>

</table></div></form></c:if>
</div>
<div class="ad">
<c:if test="${manualtest eq 'checkmanualsql'}">

<!-- <button><a href="/manualhistory">Manal scheduling history</a></button> -->
<form action="/load/manualmodesql" method="get">


<table>
<h3>Select files </h3>
<c:forEach items="${fName}" var="fileName"> 
<tr> <td><input type="checkbox" name="fnames" value= "${fileName}"></td><td>
   ${fileName}</td>
</tr>
</c:forEach></table>
<table><h4>select time</h4><tr><td>
calender :  
<input type="datetime-local"  value="2020-10-08 19:32:00" step="1" name="datetimeloc">
</td></tr><tr><td><br><input type="submit" value="Search"></td></tr>

</table></div>
</form>
</c:if></div>
<c:if test="${not empty manualdone}">
			<script>
				alert("Manual batch scheduled");
			</script>
			<c:remove var="manualdone" scope="session" />
		</c:if>



<c:if test="${not empty autodone}">
			<script>
				alert("Auto batch started");
			</script>
			<c:remove var="autodone" scope="session" />
		</c:if>

</div>
</body>
</html>