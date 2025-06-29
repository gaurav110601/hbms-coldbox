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
                                <li class="breadcrumb-item"><a>Room Category</a></li>
                                <li class="breadcrumb-item active">Add Category</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Add Category</h4>
                    </div>
                </div>
            </div>
            <!-- end page title -->
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    #cbMessagebox().renderit()#
                    <div class="card">
                        <div class="card-header">
                            <h4 class="header-title">Add Category:</h4>
                            <!--- <p class="text-muted mb-0">Custom feedback styles apply custom colors, borders,
                                focus styles, and background
                                icons to better communicate feedback. Background icons for
                                <code>&lt;select&gt;</code>s are only available with
                                <code>.form-select</code>, and not <code>.form-control</code>.
                            </p> --->
                        </div>
                        <div class="card-body">
                            <form class="needs-validation" <!--- id="addCategory" ---> method="POST" action="#event.buildLink( "admin:category.doAddCategory" )#">
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom01">Category Title</label>
                                    <input type="text" class="form-control" name="categoryTitle" id="categoryTitle"
                                        placeholder="Category Title" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom02">Description</label>
                                    <input type="text" class="form-control" name="categoryDescription" id="categoryDescription"
                                        placeholder="Description" required>
                                    <div class="valid-feedback">
                                        Looks good!
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" for="validationCustom04">Price</label>
                                    <input type="number" class="form-control" min="0" name="categoryPrice" id="categoryPrice"
                                        placeholder="Price" required>
                                    <div class="invalid-feedback">
                                        Please provide a valid Price.
                                    </div>
                                </div>
                                <button class="btn btn-primary" type="submit">Add</button>
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