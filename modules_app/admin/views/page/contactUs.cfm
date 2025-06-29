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
                                <li class="breadcrumb-item"><a>Page</a></li>
                                <li class="breadcrumb-item active">Contact Us</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Contact Us</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    #cbmessagebox().renderit()#
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">Contact Us:</h4>
                            <!--- <p class="text-muted mb-0">Custom feedback styles apply custom colors, borders,
                                focus styles, and background
                                icons to better communicate feedback. Background icons for
                                <code>&lt;select&gt;</code>s are only available with
                                <code>.form-select</code>, and not <code>.form-control</code>.
                            </p> --->
                        </div>
                        <div class="card-body">
                            <form class="needs-validation" <!--- id="contactUs" ---> method="POST" action="#event.buildLink( "admin:page.contactUpdate" )#">
                                <cfloop query="#prc.contactData#">
                                    <input type="hidden" name="id" id="id" value="#id#">
                                    <div class="mb-3">
                                        <label class="form-label" for="validationCustom01">Page Title</label>
                                        <input type="text" class="form-control" name="pageTitle" id="pageTitle"
                                            value="#title#" required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="emailaddress" class="form-label">Email </label>
                                        <input class="form-control" type="email" id="email" name="email" value="#email#" required="" >
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="emailaddress" class="form-label">Mobile Number</label>
                                        <input class="form-control" type="number" id="mobileNumber" name="mobileNumber" value="#mobileNumber#" minlength="10" maxlength="10" required="">
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="validationCustom02">Page Description</label>
                                        <textarea type="text" class="form-control" name="pageDescription" id="pageDescription" rows="4" required>#description#</textarea>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                </cfloop>
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