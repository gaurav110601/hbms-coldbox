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
                                <li class="breadcrumb-item active">View Booking</li>
                            </ol>
                        </div>
                        <h4 class="page-title">View Booking</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row">
                <div class="col-12">
                    #cbmessagebox().renderit()#
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">View Booking</h4>
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
                                            <th colspan="4" class="text-primary">Admin Remarks:</th>
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
                                    </tbody>
                                </table>
                                <cfif '#status#' == 1>
                                    <!-- Button trigger modal -->
                                    <center>
                                        <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="##bookingAction">
                                            Take Action
                                        </button>
                                    </center>
                                    
                                    <!-- Modal -->
                                    <div class="modal fade" id="bookingAction" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Take Action</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form <!--- id="bookingRemarkForm" ---> method="POST" action="#event.buildLink( "admin.bookings.bookingAction" )#">
                                                <input type="hidden" name="bookingID" id="bookingID" value="#id#">
                                                <div class="modal-body">
                                                    <table class="table table-striped dt-responsive nowrap w-100">
                                                        <tbody>
                                                            <tr>
                                                                <th>Remarks: </th>
                                                                <td>
                                                                    <textarea type="text" class="form-control" max="100" name="bookingRemark" id="bookingRemark" rows="4" placeholder="Remarks" required></textarea>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th>Status:</th>
                                                                <td>
                                                                    <select class="form-select" name="bookingStatus" id="bookingStatus" required>
                                                                        <option value="2" selected>Approved</option>
                                                                        <option value="0">Cancelled</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </div>
                                            </form>
                                        </div>
                                        </div>
                                    </div>
                                </cfif>
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