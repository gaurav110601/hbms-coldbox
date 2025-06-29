<cfoutput>
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
                                    <li class="breadcrumb-item"><a>Bookings</a></li>
                                    <li class="breadcrumb-item active">Cancelled Bookings</li>
                                </ol>
                            </div>
                            <h4 class="page-title">Cancelled Bookings</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->
                
                <div class="row">
                    <div class="col-12">
                        #cbmessagebox().renderit()#
                        <div class="card">
                            <div class="card-header">
                                <h4 class="header-title">Cancelled Bookings</h4>
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
                                    <thead>
                                        <tr>
                                            <th>S.No</th>
                                            <th>Booking Number</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Mobile Number</th>
                                            <th>Booking Date</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
    
                                    <tbody>
                                        <cfif '#prc.cancelledBookingsData.recordcount#' != 0>
                                            <cfloop query="#prc.cancelledBookingsData#">
                                                <tr>
                                                    <td>#prc.sn++#</td>
                                                    <td>#bookingNumber#</td>
                                                    <td>#name#</td>
                                                    <td>#email#</td>
                                                    <td>#mobileNumber#</td>
                                                    <td>#DateFormat(bookingDate)#</td>
                                                    <td>
                                                        <cfif '#status#' == 0>
                                                            <span class="bg-danger text-light p-1 rounded">Booking Cancelled</span> 
                                                        <cfelseif '#status#' == 1>
                                                            <span class="bg-primary text-light p-1 rounded">New Booking</span>
                                                        <cfelse>
                                                            <span class="bg-success text-light p-1 rounded">Booking Approved</span>
                                                        </cfif>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-primary" href="#event.buildLink( "admin:bookings.viewBooking", "id=#id#" )#">View Details</a>
                                                    </td>
                                                </tr>
                                            </cfloop>
                                            <cfelse>
                                            <tr>
                                                <td colspan="8" class="text-danger text-center">No data found</td>
                                            </tr>
                                        </cfif>
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
</cfoutput>