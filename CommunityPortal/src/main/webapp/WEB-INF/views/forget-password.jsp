<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forget Password</title>
</head>
<body>

 <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-8 col-lg-7 d-none d-md-block">
              <img src="image/reset.jpg"
                alt="login form" class="img-fluid h-100 w-100"/>
            </div>
            <div class="col-md-4 col-lg-5 d-flex align-items-center card">
              <div class="card-body p-4 p-lg-5 text-black">

                <form action="verify-email" method="post" class="needs-validation"  novalidate="novalidate">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <img alt="logo" src="image/logo.png" width="200px" class="ps-1">
                  </div>

                  <h1 class="fw-normal mb-3 pb-3 fs-3" style="letter-spacing: 1px;">Please verify your indentity</h1>

                  <div class="form-outline mb-4">
                    <input name="email" type="email" id="validationCustom01" class="form-control form-control-lg" required="required"/>
                    <label class="form-label" for="validationCustom01">Email address</label>
                    <div class="invalid-feedback">
				      Please enter a valid email.
				    </div>
                  </div>

                  <div class="pt-1 mb-4">
                  	  <button class="btn btn-primary btn-lg btn-block" type="submit">Continue</button>
                  </div>

                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

<jsp:include page="footer.jsp" />
</body>
</html>