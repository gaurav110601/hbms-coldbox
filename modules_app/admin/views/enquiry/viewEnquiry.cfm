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
                                <li class="breadcrumb-item"><a>Enquiry</a></li>
                                <li class="breadcrumb-item active">View Enquiry</li>
                            </ol>
                        </div>
                        <h4 class="page-title">View Enquiry</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row">
                <div class="col-12">
                    #cbmessagebox().renderit()#
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">View Enquiry</h4>
                            <!--- <p class="text-muted mb-0">
                                DataTables has most features enabled by default, so all you need to do to use it
                                with your own tables is to call the construction
                                function:
                                <code>$().DataTable();</code>. KeyTable provides Excel like cell navigation on
                                any table. Events (focus, blur, action etc) can be assigned to individual
                                cells, columns, rows or all cells.
                            </p> --->
                        </div>
                        
                        <div class="card-body">
                            <table id="basic-datatable" class="table table-striped dt-responsive nowrap w-100">
                                <tbody>
                                    <cfloop query="#prc.enquiryData#">
                                        <tr>
                                            <th colspan="4" class="text-primary text-center">User Details</th>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td>#name#</td>
                                            <th>Mobile Number</th>
                                            <td>#mobileNumber#</td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td>#email#</td>
                                            <th>Message</th>
                                            <td>#message#</td>
                                        </tr>
                                        <tr>
                                            <th colspan="4">
                                                <button class="border-0 bg-white text-primary" onclick="window.location=document.referrer;"> <b>< Go Back</b></button>
                                            </th>
                                        </tr>
                                    </cfloop>
                                </tbody>
                            </table>
                        </div> <!-- end card body-->
                    </div> <!-- end card -->
                </div><!-- end col-->
            </div> <!-- end row-->

        </div>
        <!-- container -->

    </div>
    <!-- content -->
</cfoutput>