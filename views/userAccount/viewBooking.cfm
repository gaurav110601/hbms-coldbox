<cfoutput>
    <div class="content" style="margin-top:50px">

        <!-- Start Content-->
        <div class="container">
            
            <div class="row">
                <div class="col-12">
                    <!--- #cbmessagebox().renderit()# --->
                    <div class="card">
                        
                        <div class="card-body">
                            <table id="basic-datatable" class="table table-striped dt-responsive nowrap w-100">
                                <tbody>
                                    <cfloop query="#prc.bookingData#">
                                        <tr>
                                            <th colspan="4" class="text-danger text-center">Booking Number: #bookingNumber#</th>
                                        </tr>
                                        <tr>
                                            <th colspan="4" class="text-primary">Booking Detail:</th>
                                        </tr>
                                        <tr>
                                            <th>Customer Name</th>
                                            <td>#name#</td>
                                            <th>Mobile Number</th>
                                            <td>#mobileNumber#</td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td>#email#</td>
                                            <th>ID Type</th>
                                            <td>#idtype#</td>
                                        </tr>
                                        <tr>
                                            <th>Gender</th>
                                            <td>#gender#</td>
                                            <th>Address</th>
                                            <td>#address#</td>
                                        </tr>
                                        <tr>
                                            <th>Check in Date</th>
                                            <td>#dateFormat(checkInDate)#</td>
                                            <th>Check out Date  </th>
                                            <td>#dateFormat(checkOutDate)#</td>
                                        </tr>
                                    </cfloop>
                                    <cfloop query="#prc.roomData#">
                                        <tr>
                                            <th colspan="4" class="text-primary">Room Detail:</th>
                                        </tr>
                                        <tr>
                                            <th>Room Type</th>
                                            <td>#category#</td>
                                            <th>Room Price (perday)</th>
                                            <td>Rs. #price#</td>
                                        </tr>
                                        <tr>
                                            <th>Room Name</th>
                                            <td>#name#</td>
                                            <th>Room Description</th>
                                            <td>#description#</td>
                                        </tr>
                                        <tr>
                                            <th>Max Adult</th>
                                            <td>#maxAdult#</td>
                                            <th>Max Child</th>
                                            <td>#maxChild#</td>
                                        </tr>
                                        <tr>
                                            <th>No. of Bed</th>
                                            <td>#beds#</td>
                                            <th>Room Image</th>
                                            <td><img src="\#imagePath#\#imageName#" height="100px" width="100px"></td>
                                        </tr>
                                    </cfloop>
                                    <cfloop query="#prc.bookingData#">
                                        <tr>
                                            <th>Booking Date</th>
                                            <td colspan="3">#dateFormat(bookingDate)#</td>
                                        </tr>
                                        <tr>
                                            <th colspan="4" class="text-primary"><b>Admin Remarks:</b></th>
                                        </tr>
                                        <tr>
                                            <th>Order Final Status</th>
                                            <td>
                                                <cfif '#status#' == 2>
                                                    Booking Approved
                                                <cfelseif '#status#' == 1>
                                                    Not Response Yet
                                                <cfelse>
                                                    Booking Cancelled
                                                </cfif>
                                            </td>
                                            <th>Admin Remark</th>
                                            <td>#remarks#</td>
                                        </tr>
                                        <!--- <tr>
                                            <td>
                                                <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="##bookingAction">
                                                    Take Action
                                                </button>
                                            </td>
                                        </tr> --->
                                    </tbody>
                                </table>
                            </cfloop>
                        </div> <!-- end card body-->
                    </div> <!-- end card -->
                </div><!-- end col-->
            </div> <!-- end row-->

        </div>
        <!-- container -->

    </div>
    <!-- content -->
</cfoutput>