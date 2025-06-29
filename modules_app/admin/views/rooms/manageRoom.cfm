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
                                <li class="breadcrumb-item"><a>New Room</a></li>
                                <li class="breadcrumb-item active">Manage Rooms</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Manage Rooms</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row">
                <div class="col-12">
                    #cbmessagebox().renderit()#
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">Manage Rooms</h4>
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
                                        <th>Image</th>
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Description</th>
                                        <th>maxAdult</th>
                                        <th>maxChild</th>
                                        <th>Beds</th>
                                        <th>Price</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <cfif '#prc.roomsData.recordcount#' != 0>
                                        <cfloop query="#prc.roomsData#">
                                            <tr>
                                                <td>#prc.sn++#</td>
                                                <td><img src="\#imagePath#\#imageName#" height="100px" width="100px"></td>
                                                <td>#name#</td>
                                                <td>#category#</td>
                                                <td>#description#</td>
                                                <td>#maxAdult#</td>
                                                <td>#maxChild#</td>
                                                <td>#Beds#</td>
                                                <td>#price#</td>
                                                <td>
                                                    <a class="btn btn-primary" href="#event.buildLink( "admin:rooms.editRoom", "id=#id#" )#">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>
                                                    <a class="btn btn-danger" onclick="return confirm('are you sure?')" href="#event.buildLink( "admin:rooms.deleteRoom", "id=#id#" )#">
                                                        <i class="bi bi-trash"></i>
                                                    </a>
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