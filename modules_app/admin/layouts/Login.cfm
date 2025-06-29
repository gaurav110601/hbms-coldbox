<cfoutput>
    <!--- <cfif structKeyExists(session, "adminID")>
        <cflocation  url="admin/">
    <cfelse> --->
        <!DOCTYPE html>
        <html lang="en">
    
    
        <!-- Mirrored from themes.getappui.com/techzaa/velonic/layouts/auth-login.cfm by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Nov 2023 06:52:35 GMT -->
        <head>
            <title>Log In | Admin - Hotel Booking Management System</title>
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
    
        <body class="authentication-bg position-relative">
            #view()#

            <!--- <cfinclude template="footer.cfm"> --->
            <!-- Footer Start -->
            <footer class="footer footer-alt fw-medium">
                <span class="text-dark">
                    <script>document.write(new Date().getFullYear())</script> © Lucid - Hotel Booking Management System
                </span>
            </footer>
            <!-- end Footer -->

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


        <!-- Mirrored from themes.getappui.com/techzaa/velonic/layouts/auth-login.cfm by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 12 Nov 2023 06:52:35 GMT -->
        </html>
    <!--- </cfif> --->
</cfoutput>