<cfoutput>
    <div class="content">

        <!-- Start Content-->
        <div class="container-fluid">
            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a>HBMS</a></li>
                                <li class="breadcrumb-item"><a>Admin</a></li>
                                <li class="breadcrumb-item active">Dashboard</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Welcome!</h4>
                        #cbMessagebox().renderit()#
                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">
                <div class="col-xxl-3 col-sm-4">
                    <a href="#event.buildLink( "admin:home.newBookings" )#">
                        <div class="card widget-flat text-bg-primary">
                            <div class="card-body">
                                <div class="float-end">
                                    <i class="ri-eye-line widget-icon"></i>
                                </div>
                                <h6 class="text-uppercase mt-0" title="New Booking">New Booking</h6>
                                <h2 class="my-2">
                                    #prc.bookingData.newBookings.recordCount#
                                </h2>
                            </div>
                        </div>
                    </a>
                </div> <!-- end col-->
                
                <div class="col-xxl-3 col-sm-4">
                    <a href="#event.buildLink( "admin:home.approvedBookings" )#">
                        <div class="card widget-flat text-bg-success">
                            <div class="card-body">
                                <div class="float-end">
                                    <i class="ri-wallet-2-line widget-icon"></i>
                                </div>
                                <h6 class="text-uppercase mt-0" title="Approved Booking">Approved Booking</h6>
                                <h2 class="my-2">
                                    #prc.bookingData.approvedBookings.recordCount#
                            </h2>
                        </div>
                    </div>
                </a>
                </div> <!-- end col-->

                <div class="col-xxl-3 col-sm-4">
                    <a href="#event.buildLink( "admin:home.cancelledBookings" )#">
                        <div class="card widget-flat text-bg-danger">
                            <div class="card-body">
                                <div class="float-end">
                                    <i class="ri-shopping-basket-line widget-icon"></i>
                                </div>
                                <h6 class="text-uppercase mt-0" title="Cancelled Booking">Cancelled Booking</h6>
                                <h2 class="my-2">
                                    #prc.bookingData.cancelledBookings.recordCount#
                                </h2>
                            </div>
                        </div>
                    </a>
                </div> <!-- end col-->

                <div class="col-xxl-3 col-sm-4">
                    <a href="#event.buildLink( "admin:home.users" )#">
                        <div class="card widget-flat text-bg-primary">
                            <div class="card-body">
                                <div class="float-end">
                                    <i class="ri-eye-line widget-icon"></i>
                                </div>
                                <h6 class="text-uppercase mt-0" title="Reg Users">Reg Users</h6>
                                <h2 class="my-2">
                                    #prc.usersData.recordcount#
                                </h2>
                            </div>
                        </div>
                    </a>
                </div> <!-- end col-->

                <div class="col-xxl-3 col-sm-4">
                    <a href="#event.buildLink( "admin:home.readEnquiry" )#">
                        <div class="card widget-flat text-bg-success">
                            <div class="card-body">
                                <div class="float-end">
                                    <i class="ri-wallet-2-line widget-icon"></i>
                                </div>
                                <h6 class="text-uppercase mt-0" title="Read Enquries">Read Enquries</h6>
                                <h2 class="my-2">
                                    #prc.enquiryData.readEnquiry.recordcount#
                                </h2>
                            </div>
                        </div>
                    </a>
                </div> <!-- end col-->

                <div class="col-xxl-3 col-sm-4">
                    <a href="#event.buildLink( "admin:home.unreadEnquiry" )#">
                        <div class="card widget-flat text-bg-danger">
                            <div class="card-body">
                                <div class="float-end">
                                    <i class="ri-wallet-2-line widget-icon"></i>
                                </div>
                                <h6 class="text-uppercase mt-0" title="Unread Enquries">Unread Enquries</h6>
                                <h2 class="my-2">
                                    #prc.enquiryData.unreadEnquiry.recordcount#
                                </h2>
                            </div>
                        </div>
                    </a>
                </div> <!-- end col-->


            </div>

        </div>
        <!-- container -->

    </div>
    <!-- content -->
</cfoutput>