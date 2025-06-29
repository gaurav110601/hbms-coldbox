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
                                <li class="breadcrumb-item active">Add Room</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Add Room</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    #cbmessagebox().renderit()#
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">Add Room:</h4>
                            <!--- <p class="text-muted mb-0">Custom feedback styles apply custom colors, borders,
                                focus styles, and background
                                icons to better communicate feedback. Background icons for
                                <code>&lt;select&gt;</code>s are only available with
                                <code>.form-select</code>, and not <code>.form-control</code>.
                            </p> --->
                        </div>
                        <div class="card-body">
                            <!--- <cfparam name="form.roomImage" default="">

                            <cfif form.roomImage>
                                <cffile action="upload"
                                    fileField="roomImage"
                                    destination="C:\docs">
                                <p>Thankyou, your file has been uploaded.</p>
                            </cfif> --->
                            <form class="needs-validation" <!--- id="addRoom" ---> method="POST" action="#event.buildLink( "admin:rooms.doAddRoom" )#" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="example-select" class="form-label">Room Type or Category</label>
                                    <!--- <cfdump  var="#categoryData#"><cfabort> --->
                                    <select class="form-select" name="roomCategory" id="roomCategory" required>
                                        <option value="">Choose Room Type</option>
                                        
                                        <cfloop query="#prc.categoryData#">
                                            <option value="#title#">#title#</option>
                                        </cfloop>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom02">Room Name</label>
                                    <input type="text" class="form-control" max="50" name="roomName" id="roomName"
                                        placeholder="Room Name" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom04">Max Adult</label>
                                    <input type="number" class="form-control" min="0" max="10" name="maxAdult" id="maxAdult"
                                        placeholder="Max Adult" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid Number.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom04">Max Child</label>
                                    <input type="number" class="form-control" min="0" max="10" name="maxChild" id="maxChild"
                                        placeholder="Max Child" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid Number.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom02">Room Description</label>
                                    <input type="text" class="form-control" max="250" name="roomDescription" id="roomDescription"
                                        placeholder="Room Description" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom04">No. of Bed</label>
                                    <input type="number" class="form-control" min="0" max="10" name="numberOfBed" id="numberOfBed"
                                        placeholder="No. of Bed" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid Number.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="example-fileinput" class="form-label">Room Image</label>
                                    <input type="file" name="roomImage" id="roomImage" accept="image/*" class="form-control" required>
                                </div>
                                <button class="btn btn-primary" type="submit" id="addRoomFormSubmit">Add</button>
                            </form>

                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->
            </div>

        </div>
        <!-- container -->

    </div>
    <!-- content -->
    <!--- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $('##add').click(function(){
                event.preventDefault();
                const obj = {
                    roomCategory: $('##roomCategory option:selected').val(),
                    roomName: $('##roomName').val(),
                    maxAdult: $('##maxAdult').val(),
                    maxChild: $('##maxChild').val(),
                    roomDescription: $('##roomDescription').val(),
                    numberOfBed: $('##numberOfBed').val(),
                    roomImageName: $('##roomImage')
                };
                console.log(obj);
            })
        })
    </script> --->
</cfoutput>