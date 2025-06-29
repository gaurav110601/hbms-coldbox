<cfoutput>
    <div class="content">

        <!-- Start Content-->
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row ">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a>HBMS</a></li>
                                <li class="breadcrumb-item"><a>Admin</a></li>
                                <li class="breadcrumb-item active">Change Passwords</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Change Password</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">Change Password:</h4>
                            <!--- <p class="text-muted mb-0">Custom feedback styles apply custom colors, borders,
                                focus styles, and background
                                icons to better communicate feedback. Background icons for
                                <code>&lt;select&gt;</code>s are only available with
                                <code>.form-select</code>, and not <code>.form-control</code>.
                            </p> --->
                        </div>
                        #cbMessagebox().renderit()#
                        <div class="card-body">
                            <form class="needs-validation" <!--- id="changePassword" ---> method="POST" action="#event.buildLink( "admin:profile.passwordUpdate" )#">
                                    <input type="hidden" name="adminID" id="adminID" value="#prc.adminID#">
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom01">Old Password</label>
                                    <input type="password" class="form-control" name="oldPassword" id="oldPassword" minlength="6"
                                        required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom02">New Password</label>
                                    <input type="password" class="form-control" name="newPassword" id="newPassword" minlength="6"
                                        required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom03">Confirm Password</label>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" minlength="6" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                    
                                <button class="btn btn-primary" type="submit">Update</button>
                            </form>

                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->
            </div>

        </div>
        <!-- container -->

    </div>
    <!-- content -->
</cfoutput>