<cfoutput>
    <div class="account-pages pt-2 pt-sm-5 pb-4 pb-sm-5 position-relative">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xxl-8 col-lg-10">
                    <div class="card overflow-hidden">
                        <div class="row g-0">
                            <div class="col-lg-6 d-none d-lg-block p-2">
                                <img src="/includes/images/auth-img.jpg" alt="" class="img-fluid rounded h-100">
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex flex-column h-100">
                                    <div class="auth-brand p-4">
                                        <h1>Hotel Booking Management System</h1>
                                    </div>
                                    <div class="p-4 my-auto">
                                        <h4 class="fs-20">Admin Login</h4>
                                        <p class="text-muted mb-3">Enter your email address and password to access
                                            account.
                                        </p>

                                        #cbMessagebox().renderit()#

                                        <!--- <cfinclude template="msg.cfm"> --->
                                        <!--- <cfscript>
                                            if(url.keyExists('smsg')){
                                              writeOutput("<div class='alert alert-primary' role='alert'>#smsg#</div>");
                                            }
                                            if(url.keyExists('emsg')){
                                              writeOutput("<div class='alert alert-danger' role='alert'>#emsg#</div>");
                                            }
                                          </cfscript>
                                          <script>
                                          window.setTimeout(function() {
                                            $(".alert").fadeTo(500, 0).slideUp(500, function(){
                                                $(this).remove(); 
                                              });
                                            }, 3000);
                                          </script> --->

                                        <!-- form -->
                                        <form <!--- id="adminLogin" ---> method="POST" action="#event.buildLink("admin:login.doLogin")#">
                                            <div class="mb-3">
                                                <label for="email" class="form-label">Email address</label>
                                                <input class="form-control" type="email" <!--- id="adminEmail" ---> name="email" required=""
                                                    placeholder="Enter your email">
                                            </div>
                                            <div class="mb-3">
                                                <!--- <a href="auth-forgotpw.cfm" class="text-muted float-end"><small>Forgot
                                                        your
                                                        password?</small></a> --->
                                                <label for="password" class="form-label">Password</label>
                                                <input class="form-control" type="password" name="password" required="" <!--- id="adminPassword" --->
                                                    placeholder="Enter your password">
                                            </div>
                                            <!--- <div class="mb-3">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input"
                                                        id="checkbox-signin">
                                                    <label class="form-check-label" for="checkbox-signin">Remember
                                                        me</label>
                                                </div>
                                            </div> --->
                                            <div class="mb-0 text-start">
                                                <button class="btn btn-soft-primary w-100" type="submit" id="">
                                                    <i class="ri-login-circle-fill me-1"></i> 
                                                    <span class="fw-bold">Log In</span> 
                                                </button>
                                            </div>

                                            <!--- <div class="text-center mt-4">
                                                <p class="text-muted fs-16">Sign in with</p>
                                                <div class="d-flex gap-2 justify-content-center mt-3">
                                                    <a href="javascript: void(0);" class="btn btn-soft-primary"><i
                                                            class="ri-facebook-circle-fill"></i></a>
                                                    <a href="javascript: void(0);" class="btn btn-soft-danger"><i
                                                            class="ri-google-fill"></i></a>
                                                    <a href="javascript: void(0);" class="btn btn-soft-info"><i
                                                            class="ri-twitter-fill"></i></a>
                                                    <a href="javascript: void(0);" class="btn btn-soft-dark"><i
                                                            class="ri-github-fill"></i></a>
                                                </div>
                                            </div> --->
                                        </form>
                                        <!-- end form-->
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>
           <!---  <div class="row">
                <div class="col-12 text-center">
                    <p class="text-dark-emphasis">Don't have an account? <a href="auth-register.cfm"
                            class="text-dark fw-bold ms-1 link-offset-3 text-decoration-underline"><b>Sign up</b></a>
                    </p>
                </div> <!-- end col -->
            </div> --->
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->
</cfoutput>