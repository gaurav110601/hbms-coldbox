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
                                <li class="breadcrumb-item"><a>Room</a></li>
                                <li class="breadcrumb-item active">Edit Room</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Edit Room</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    #cbmessagebox().renderit()#
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">Edit Room:</h4>
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
                            <form class="needs-validation" <!--- id="addRoom" ---> method="POST" action="#event.buildLink( "admin:rooms.updateRoom" )#" enctype="multipart/form-data">
                                <div class="mb-3">
                                    <label for="example-select" class="form-label">Room Type or Category</label>
                                    <!--- <cfdump  var="#categoryData#"><cfabort> --->
                                    <select class="form-select" name="roomCategory" id="roomCategory" required>
                                        <option value="">Choose Room Type</option>
                                        
                                        <cfloop query="#prc.categoryData#">
                                            <cfif '#prc.categoryData.title#' == '#prc.roomData.category#'>
                                                <cfset selected='selected'>
                                                <cfelse>
                                                <cfset selected=''>
                                            </cfif>
                                            <option value="#prc.categoryData.title#" #selected#>#title#</option>
                                        </cfloop>
                                    </select>
                                </div>
                                <cfloop query="#prc.roomData#">
                                    <input type="hidden" name="roomID" value="#id#">
                                    <div class="mb-3">
                                        <label class="form-label" for="validationCustom02">Room Name</label>
                                        <input type="text" class="form-control" max="50" name="roomName" id="roomName"
                                            placeholder="Room Name" value="#name#" required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="validationCustom04">Max Adult</label>
                                        <input type="number" class="form-control" min="0" max="10" name="maxAdult" value="#maxAdult#" id="maxAdult"
                                            placeholder="Max Adult" required>
                                        <div class="invalid-feedback">
                                            Please provide a valid Number.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="validationCustom04">Max Child</label>
                                        <input type="number" class="form-control" min="0" max="10" name="maxChild" value="#maxChild#" id="maxChild"
                                            placeholder="Max Child" required>
                                        <div class="invalid-feedback">
                                            Please provide a valid Number.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="validationCustom02">Room Description</label>
                                        <input type="text" class="form-control" max="250" name="roomDescription" value="#description#" id="roomDescription"
                                            placeholder="Room Description" required>
                                        <div class="valid-feedback">
                                            Looks good!
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="validationCustom04">No. of Bed</label>
                                        <input type="number" class="form-control" min="0" max="10" name="numberOfBed" value="#beds#" id="numberOfBed"
                                            placeholder="No. of Bed" required>
                                        <div class="invalid-feedback">
                                            Please provide a valid Number.
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="example-fileinput" class="form-label">Room Image</label>
                                        <input type="file" name="roomImage" id="roomImage" accept="image/*" class="form-control">
                                        <input type="hidden" name="roomImageName" value="#imageName#">
                                        <input type="hidden" name="roomImagePath" value="#imagePath#">
                                    </div>
                                    <button class="btn btn-primary" type="submit" id="addRoomFormSubmit">Update</button>
                                </cfloop>
                            </form>

                        </div> <!-- end card-body-->
                    </div> <!-- end card-->
                </div> <!-- end col-->
            </div>

        </div>
        <!-- container -->

    </div>
</cfoutput>