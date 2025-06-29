<cfoutput>
    <!--- <cfif structKeyExists(session, "adminID")> --->
        <!DOCTYPE html>
        <html lang="en">
    
            
        <!-- Mirrored from themes.getappui.com/techzaa/velonic/layouts/index.cfm by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Nov 2023 06:50:51 GMT -->
        <head>
            <title>#prc.pageTitle# | Admin - Hotel Booking Management System</title>
            <!--- <cfinclude  template="css.cfm"> --->
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta content="A fully responsive admin theme which can be used to build CRM, CMS,ERP etc." name="description" />
            <meta content="Techzaa" name="author" />

            <!-- App favicon -->
            <!--- <link rel="shortcut icon" href="/includes/images/favicon.ico"> --->

            <!-- Daterangepicker css -->
            <link rel="stylesheet" href="/includes/vendor/daterangepicker/daterangepicker.css">

            <!-- Vector Map css -->
            <link rel="stylesheet" href="/includes/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css">

            <!-- Theme Config Js -->
            <script src="/includes/js/config.js"></script>

            <!-- App css -->
            <link href="/includes/css/app.min.css" rel="stylesheet" type="text/css" id="app-style" />

            <!-- Icons css -->
            <link href="/includes/css/icons.min.css" rel="stylesheet" type="text/css" />
            
        </head>
    
            <body>
                <!-- Begin page -->
                <div class="wrapper">
    
                    <!--- <cfinclude  template="header.cfm"> --->
                    <!-- ========== Topbar Start ========== -->
                    <div class="navbar-custom">
                        <div class="topbar container-fluid">
                            <div class="d-flex align-items-center gap-1">

                                <!-- Topbar Brand Logo -->
                                <div class="logo-topbar">
                                    <!-- Logo light -->
                                    <a href="#event.buildLink( "admin:home.index" )#" class="logo-light">
                                        <span class="logo-lg">
                                            <h1>HBMS</h1>
                                        <span class="logo-sm">
                                            <h1>HBMS</h1>
                                        </span>
                                    </a>

                                    <!-- Logo Dark -->
                                    <a href="#event.buildLink( "admin:home.index" )#" class="logo-dark">
                                        <span class="logo-lg text-dark">
                                            <h1>HBMS</h1>
                                        </span>
                                        <span class="logo-sm text-dark">
                                            <h1>HBMS</h1>
                                        </span>
                                    </a>
                                </div>

                                <!-- Sidebar Menu Toggle Button -->
                                <button class="button-toggle-menu">
                                    <i class="ri-menu-line"></i>
                                </button>

                                <!-- Horizontal Menu Toggle Button -->
                                <button class="navbar-toggle" data-bs-toggle="collapse" data-bs-target="##topnav-menu-content">
                                    <div class="lines">
                                        <span></span>
                                        <span></span>
                                        <span></span>
                                    </div>
                                </button>
                            </div>

                            <ul class="topbar-menu d-flex align-items-center gap-3">

                                <li class="d-none d-sm-inline-block">
                                    <a class="nav-link" data-bs-toggle="offcanvas" href="##theme-settings-offcanvas">
                                        <i class="ri-settings-3-line fs-22"></i>
                                    </a>
                                </li>

                                <li class="d-none d-sm-inline-block">
                                    <div class="nav-link" id="light-dark-mode">
                                        <i class="ri-moon-line fs-22"></i>
                                    </div>
                                </li>

                                <li class="dropdown">
                                    <a class="nav-link dropdown-toggle arrow-none nav-user" data-bs-toggle="dropdown" href="##" aria-haspopup="true" aria-expanded="false">
                                        <span class="account-user-avatar">
                                            <img src="/includes/images/users/admin.jpg" alt="user-image" width="32" class="rounded-circle">
                                        </span>
                                        <span class="d-lg-block d-none">
                                            <h5 class="my-0 fw-normal">#prc.adminName#<i
                                                    class="ri-arrow-down-s-line d-none d-sm-inline-block align-middle"></i></h5>
                                        </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-menu-animated profile-dropdown">
                                        <!-- item-->
                                        <div class=" dropdown-header noti-title">
                                            <h6 class="text-overflow m-0">Welcome !</h6>
                                        </div>

                                        <!-- item-->
                                        <a href="#event.buildLink( "admin:profile.profile" )#" class="dropdown-item">
                                            <i class="ri-account-circle-line fs-18 align-middle me-1"></i>
                                            <span>My Account</span>
                                        </a>

                                        <!-- item-->
                                        <a href="#event.buildLink( "admin:profile.changePassword" )#" class="dropdown-item">
                                            <i class=" ri-lock-password-line fs-18 align-middle me-1"></i>
                                            <span>Change Password</span>
                                        </a>

                                        <!-- item-->
                                        <a class="dropdown-item btn btn-primary" <!--- type="button" id="logout"  ---> href="#event.buildLink( "admin:login.logout" )#">
                                            <i class="ri-logout-box-line fs-18 align-middle me-1"></i>
                                            <span>Logout</span>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- ========== Topbar End ========== -->

                    <!--- <cfinclude  template="sidebar.cfm"> --->
                     <!-- ========== Left Sidebar Start ========== -->
                    <div class="leftside-menu">

                        <!-- Brand Logo Light -->
                        <a href="#event.buildLink( "admin:home.index" )#" class="logo logo-light">
                            <span class="logo-lg text-light">
                                <h1>HBMS</h1>
                            </span>
                            <span class="logo-sm text-light">
                                <p>HBMS</p>
                            </span>
                        </a>

                        <!-- Brand Logo Dark -->
                        <a href="#event.buildLink( "admin:home.index" )#" class="logo logo-dark">
                            <span class="logo-lg text-light">
                                <h1>HBMS</h1>
                            </span>
                            <span class="logo-sm text-light">
                                <p>HBMS</p>
                            </span>
                        </a>

                        <!-- Sidebar -left -->
                        <div class="h-100" id="leftside-menu-container" data-simplebar>
                            <!-- Sidemenu -->
                            <ul class="side-nav">

                                <!--- <li class="side-nav-title">Main</li> --->

                                <li class="side-nav-item ">
                                    <a href="#event.buildLink( "admin:home.index" )#" class="side-nav-link">
                                        <i class="ri-dashboard-3-line"></i>
                                        <!--- <span class="badge bg-success float-end">9+</span> --->
                                        <span> Dashboard </span>
                                    </a>
                                </li>

                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="##roomCategory1" aria-expanded="false" aria-controls="roomCategory1" class="side-nav-link">
                                        <i class="ri-pages-line"></i>
                                        <span>Room Category</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="roomCategory1">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="#event.buildLink( "admin:category.addCategory" )#">Add Category</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:category.manageCategory" )#">Manage Category</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </li>
                                
                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="##newRoom" aria-expanded="false" aria-controls="newRoom" class="side-nav-link">
                                        <i class="ri-pencil-line"></i>
                                        <span>New Room</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="newRoom">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="#event.buildLink( "admin:rooms.addRoom" )#">Add Room</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:rooms.manageRoom" )#">Manage Room</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </li>
                                
                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="##page" aria-expanded="false" aria-controls="page" class="side-nav-link">
                                        <i class="ri-file-text-line"></i>
                                        <span>Page</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="page">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="#event.buildLink( "admin:page.aboutUs" )#">About Us</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:page.contactUs" )#">Contact Us</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </li>

                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="##booking" aria-expanded="false" aria-controls="booking" class="side-nav-link">
                                        <i class="ri-book-line"></i>
                                        <span>Booking</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="booking">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="#event.buildLink( "admin:bookings.allBookings" )#">All Bookings</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:bookings.newBookings" )#">New Bookings</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:bookings.approvedBookings" )#">Approved Bookings</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:bookings.cancelledBookings" )#">Cancelled Bookings</a>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </li>

                                <li class="side-nav-item">
                                    <a href="#event.buildLink( "admin:users.index" )#" class="side-nav-link">
                                        <i class=" ri-group-line"></i>
                                        <span>Reg Users</span>
                                        <!---<span class="menu-arrow"></span>--->
                                    </a>
                                </li>

                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="##enquiry" aria-expanded="false" aria-controls="enquiry" class="side-nav-link">
                                        <i class="ri-clipboard-line"></i>
                                        <span>Enquiry</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="enquiry">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="#event.buildLink( "admin:enquiry.readEnquiry" )#">Read Enquiry</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:enquiry.unreadEnquiry" )#">Unread Enquiry</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="##search" aria-expanded="false" aria-controls="search" class="side-nav-link">
                                        <i class="ri-search-line"></i>
                                        <span>Search</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="search">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="#event.buildLink( "admin:search.searchEnquiry" )#">Search Enquiry</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:search.searchBooking" )#">Search Booking</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                                <!--- <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="#search" aria-expanded="false" aria-controls="search" class="side-nav-link">
                                        <i class="ri-file-search-line"></i>
                                        <span>Search</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="search">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="searchEnquiry.cfm">Search Enquiry</a>
                                            </li>
                                            <li>
                                                <a href="searchBooking.cfm">Search Booking</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li> --->

                                <li class="side-nav-item">
                                    <a data-bs-toggle="collapse" href="##report" aria-expanded="false" aria-controls="report" class="side-nav-link">
                                        <i class="ri-file-paper-line"></i>
                                        <span>Reports</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <div class="collapse" id="report">
                                        <ul class="side-nav-second-level">
                                            <li>
                                                <a href="#event.buildLink( "admin:reports.reportEnquiry" )#">Enquiry B/W Reports</a>
                                            </li>
                                            <li>
                                                <a href="#event.buildLink( "admin:reports.reportBooking" )#">Booking B/W Reports</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                                
                            </ul>
                            <!-- End Sidemenu -->

                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <!-- ========== Left Sidebar End ========== -->

                    <!-- ============================================================== -->
                    <!-- Start Page Content here -->
                    <!-- ============================================================== -->

                    <div class="content-page">

                        #view()#
    
                        <!--- <cfinclude  template="footer.cfm"> --->
                        <!-- Footer Start -->
                        <footer class="footer footer-alt fw-medium">
                            <span class="text-dark">
                                <script>document.write(new Date().getFullYear())</script> © Lucid - Hotel Booking Management System
                            </span>
                        </footer>
                        <!-- end Footer -->
    
                    </div>
    
                    <!-- ============================================================== -->
                    <!-- End Page content -->
                    <!-- ============================================================== -->

                </div>
                <!-- END wrapper -->

                <!--- <cfinclude  template="themeSettings.cfm"> --->
                <!-- Theme Settings -->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="theme-settings-offcanvas">
                    <div class="d-flex align-items-center bg-primary p-3 offcanvas-header">
                        <h5 class="text-white m-0">Theme Settings</h5>
                        <button type="button" class="btn-close btn-close-white ms-auto" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body p-0">
                        <div data-simplebar class="h-100">
                            <div class="p-3">
                                <h5 class="mb-3 fs-16 fw-bold">Color Scheme</h5>

                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-check form-switch card-switch mb-1">
                                            <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-light" value="light">
                                            <label class="form-check-label" for="layout-color-light">
                                                <img src="/includes/images/layouts/light.png" alt="" class="img-fluid">
                                            </label>
                                        </div>
                                        <h5 class="font-14 text-center text-muted mt-2">Light</h5>
                                    </div>

                                    <div class="col-4">
                                        <div class="form-check form-switch card-switch mb-1">
                                            <input class="form-check-input" type="checkbox" name="data-bs-theme" id="layout-color-dark" value="dark">
                                            <label class="form-check-label" for="layout-color-dark">
                                                <img src="/includes/images/layouts/dark.png" alt="" class="img-fluid">
                                            </label>
                                        </div>
                                        <h5 class="font-14 text-center text-muted mt-2">Dark</h5>
                                    </div>
                                </div>

                                <div id="layout-width">
                                    <h5 class="my-3 fs-16 fw-bold">Layout Mode</h5>

                                    <div class="row">
                                        <div class="col-4">
                                            <div class="form-check form-switch card-switch mb-1">
                                                <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-fluid" value="fluid">
                                                <label class="form-check-label" for="layout-mode-fluid">
                                                    <img src="/includes/images/layouts/light.png" alt="" class="img-fluid">
                                                </label>
                                            </div>
                                            <h5 class="font-14 text-center text-muted mt-2">Fluid</h5>
                                        </div>

                                        <div class="col-4">
                                            <div id="layout-boxed">
                                                <div class="form-check form-switch card-switch mb-1">
                                                    <input class="form-check-input" type="checkbox" name="data-layout-mode" id="layout-mode-boxed" value="boxed">
                                                    <label class="form-check-label" for="layout-mode-boxed">
                                                        <img src="/includes/images/layouts/boxed.png" alt="" class="img-fluid">
                                                    </label>
                                                </div>
                                                <h5 class="font-14 text-center text-muted mt-2">Boxed</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="my-3 fs-16 fw-bold">Topbar Color</h5>

                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-check form-switch card-switch mb-1">
                                            <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-light" value="light">
                                            <label class="form-check-label" for="topbar-color-light">
                                                <img src="/includes/images/layouts/light.png" alt="" class="img-fluid">
                                            </label>
                                        </div>
                                        <h5 class="font-14 text-center text-muted mt-2">Light</h5>
                                    </div>

                                    <div class="col-4">
                                        <div class="form-check form-switch card-switch mb-1">
                                            <input class="form-check-input" type="checkbox" name="data-topbar-color" id="topbar-color-dark" value="dark">
                                            <label class="form-check-label" for="topbar-color-dark">
                                                <img src="/includes/images/layouts/topbar-dark.png" alt="" class="img-fluid">
                                            </label>
                                        </div>
                                        <h5 class="font-14 text-center text-muted mt-2">Dark</h5>
                                    </div>
                                </div>

                                <div>
                                    <h5 class="my-3 fs-16 fw-bold">Menu Color</h5>

                                    <div class="row">
                                        <div class="col-4">
                                            <div class="form-check form-switch card-switch mb-1">
                                                <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-light" value="light">
                                                <label class="form-check-label" for="leftbar-color-light">
                                                    <img src="/includes/images/layouts/sidebar-light.png" alt="" class="img-fluid">
                                                </label>
                                            </div>
                                            <h5 class="font-14 text-center text-muted mt-2">Light</h5>
                                        </div>

                                        <div class="col-4">
                                            <div class="form-check form-switch card-switch mb-1">
                                                <input class="form-check-input" type="checkbox" name="data-menu-color" id="leftbar-color-dark" value="dark">
                                                <label class="form-check-label" for="leftbar-color-dark">
                                                    <img src="/includes/images/layouts/light.png" alt="" class="img-fluid">
                                                </label>
                                            </div>
                                            <h5 class="font-14 text-center text-muted mt-2">Dark</h5>
                                        </div>
                                    </div>
                                </div>

                                <div id="sidebar-size">
                                    <h5 class="my-3 fs-16 fw-bold">Sidebar Size</h5>

                                    <div class="row">
                                        <div class="col-4">
                                            <div class="form-check form-switch card-switch mb-1">
                                                <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-default" value="default">
                                                <label class="form-check-label" for="leftbar-size-default">
                                                    <img src="/includes/images/layouts/light.png" alt="" class="img-fluid">
                                                </label>
                                            </div>
                                            <h5 class="font-14 text-center text-muted mt-2">Default</h5>
                                        </div>

                                        <div class="col-4">
                                            <div class="form-check form-switch card-switch mb-1">
                                                <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-compact" value="compact">
                                                <label class="form-check-label" for="leftbar-size-compact">
                                                    <img src="/includes/images/layouts/compact.png" alt="" class="img-fluid">
                                                </label>
                                            </div>
                                            <h5 class="font-14 text-center text-muted mt-2">Compact</h5>
                                        </div>

                                        <div class="col-4">
                                            <div class="form-check form-switch card-switch mb-1">
                                                <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-small" value="condensed">
                                                <label class="form-check-label" for="leftbar-size-small">
                                                    <img src="/includes/images/layouts/sm.png" alt="" class="img-fluid">
                                                </label>
                                            </div>
                                            <h5 class="font-14 text-center text-muted mt-2">Condensed</h5>
                                        </div>


                                        <div class="col-4">
                                            <div class="form-check form-switch card-switch mb-1">
                                                <input class="form-check-input" type="checkbox" name="data-sidenav-size" id="leftbar-size-full" value="full">
                                                <label class="form-check-label" for="leftbar-size-full">
                                                    <img src="/includes/images/layouts/full.png" alt="" class="img-fluid">
                                                </label>
                                            </div>
                                            <h5 class="font-14 text-center text-muted mt-2">Full Layout</h5>
                                        </div>
                                    </div>
                                </div>

                                <div id="layout-position">
                                    <h5 class="my-3 fs-16 fw-bold">Layout Position</h5>

                                    <div class="btn-group checkbox" role="group">
                                        <input type="radio" class="btn-check" name="data-layout-position" id="layout-position-fixed" value="fixed">
                                        <label class="btn btn-soft-primary w-sm" for="layout-position-fixed">Fixed</label>

                                        <input type="radio" class="btn-check" name="data-layout-position" id="layout-position-scrollable" value="scrollable">
                                        <label class="btn btn-soft-primary w-sm ms-0" for="layout-position-scrollable">Scrollable</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="offcanvas-footer border-top p-3 text-center">
                        <div class="row">
                            <div class="col-12">
                                <button type="button" class="btn btn-primary w-100" id="reset-layout">Reset</button>
                            </div>
                            <!---<div class="col-6">
                                <a href="https://1.envato.market/velonic" target="_blank" role="button" class="btn btn-primary w-100">Buy Now</a>
                            </div>--->
                        </div>
                    </div>
                </div> 
                
                <!--- <cfinclude  template="scripts.cfm"> --->
                <!-- Vendor js -->
                <script src="/includes/js/vendor.min.js"></script>

                <!-- Daterangepicker js -->
                <script src="/includes/vendor/daterangepicker/moment.min.js"></script>
                <script src="/includes/vendor/daterangepicker/daterangepicker.js"></script>

                <!-- Apex Charts js -->
                <script src="/includes/vendor/apexcharts/apexcharts.min.js"></script>

                <!-- Vector Map js -->
                <script src="/includes/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js"></script>
                <script src="/includes/vendor/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js"></script>


                <!-- Dashboard App js -->
                <script src="/includes/js/pages/dashboard.js"></script>


                <!-- App js -->
                <script src="/includes/js/app.min.js"></script>

            </body>

        <!-- Mirrored from themes.getappui.com/techzaa/velonic/layouts/index.cfm by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Nov 2023 06:52:01 GMT -->
        </html> 
    <!--- <cfelse>
        <cflocation  url="/admin/login.cfm">
    </cfif> --->
</cfoutput>