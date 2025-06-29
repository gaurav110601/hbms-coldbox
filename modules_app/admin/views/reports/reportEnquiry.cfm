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
                                <li class="breadcrumb-item"><a>Reports</a></li>
                                <li class="breadcrumb-item active">Enquiry Report</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Enquiry Between Dates Report</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">Enquiry Between Dates Report:</h4>
                            <!--- <p class="text-muted mb-0">Custom feedback styles apply custom colors, borders,
                                focus styles, and background
                                icons to better communicate feedback. Background icons for
                                <code>&lt;select&gt;</code>s are only available with
                                <code>.form-select</code>, and not <code>.form-control</code>.
                            </p> --->
                        </div>
                        #cbmessagebox().renderit()#
                        <div class="card-body">
                            <form class="needs-validation" method="POST" action="#event.buildLink( "admin:reports.enquiryReport" )#">
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom01">From Date:</label>
                                    <input type="date" class="form-control" name="fromDate" id="fromDate"required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom02">To Date:</label>
                                    <input type="date" class="form-control" name="toDate"  id="toDate" required>
                                </div>
                                <button class="btn btn-primary" type="submit">Submit</button>
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