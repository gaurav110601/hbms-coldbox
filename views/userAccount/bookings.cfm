<cfoutput>
    <div class="content" style="margin-top:50px">
    <div class="container">
    <div class="row">
        <div class="col-12">
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
                        <cfif '#prc.userBookingsData.recordcount#' != 0>
                            <cfloop query="#prc.userBookingsData#">
                                <tr>
                                    <td>#prc.sn++#</td>
                                    <td>#bookingNumber#</td>
                                    <td>#name#</td>
                                    <td>#email#</td>
                                    <td>#mobileNumber#</td>
                                    <td>#dateFormat(bookingDate)#</td>
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
                                        <a class="btn btn-primary" href="#event.buildLink( "userAccount.viewBooking", "id=#id#" )#">View Details</a>
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
        </div>
    </div>
</div>
</div>
</cfoutput>