<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Abc Jobs</title>
</head>
<body>
<jsp:include page="home-header.jsp" />
<div class="px-4 py-5" style="background-image: url('image/hero.webp'); background-size: cover;background-repeat: no-repeat; width: 100%; height: 600px;">
  <div class="row d-flex align-items-center g-5 py-5 text-white">
    <div class="col-lg-6 col-xxl-5">
      <h1 class="display-6 fw-bold lh-1 mb-3 text-center text-lg-start">Elevate Your Career with Our Job Search and Networking Platform</h1>
      <p class="lead text-center text-lg-start">Welcome to our community portal for software programmers! Our platform is designed to help talented programmers like you find their dream jobs, connect with other programmers, and stay up-to-date with the latest industry news and trends.</p>
      <div class="d-grid gap-2 d-md-flex justify-content-md-start">
        <a href="register"><button type="button" class="btn btn-primary btn-lg px-4 me-md-2">Get Started</button></a> 
      </div>
    </div>
  </div>
</div>

<div class="container">
  <div class="row">
    <div class="col-lg-5 col-xxl-6 d-flex justify-content-center justify-content-md-end">
      <img alt="jobs" src="image/landing-job.png" class="img-fluid mx-auto d-block mb-4 mb-md-0" style="max-width: 100%; height: auto; max-height: 400px;">
    </div>
    <div class="col-lg-7 col-xxl-6 d-flex  xl-justify-content-end justify-content-center align-items-center">
      <div class="w-75">    
        <h1 class="display-6 fw-bold text-center text-lg-start">Find Your Next Job with Ease</h1>
        <p class="lead text-center text-lg-start">Our platform makes it easy to find your next job as a software programmer. Browse job listings, filter by location and experience, and apply with just a few clicks.</p>    
        <button class="btn btn-outline-primary w-100">Discover Job Opportunities</button>
      </div>
    </div>
  </div>
  <div class="row my-md-5">
    <div class="col-lg-7 col-xxl-6 d-flex flex-column justify-content-center align-items-center">
      <div class="w-75">    
        <h1 class="display-6 fw-bold text-center text-lg-start">Connect with Other Programmers</h1>
        <p class="lead text-center text-lg-start">Our community of programmers is a great place to network, collaborate, and learn. Connect with other programmers, share your projects, and gain valuable insights.</p>    
        <button class="btn btn-outline-primary w-100 ">Explore Connections</button>
      </div>
    </div>
    <div class="col-lg-5 col-xxl-6 d-flex justify-content-center justify-content-md-start">
      <img alt="jobs" src="image/landing-connect.png" class="img-fluid mx-auto d-block" style="max-width: 100%; height: auto; max-height: 400px;">
    </div>
  </div>
</div>


<jsp:include page="footer.jsp" />
</body>
</html>