<cfoutput>
	<!DOCTYPE HTML>
	<html>
	
		<!-- Mirrored from www.hbsm.web33.fr/about.php by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Mar 2024 12:09:03 GMT -->
		<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
		<head>
			<title>Hotel Booking Management System | #prc.pageTitle# :: Page</title>
			<link href="/includes/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
			<link href="/includes/css/style.css" rel="stylesheet" type="text/css" media="all" />
		</head>
		<body>
			
			<!--header-->
            
<div class="header 
            <cfif structKeyExists(prc, "classHeadTop")>
                #prc.classHeadTop#
            <cfelse>
                head-top
            </cfif>
">
    <div class="container">
<div class="header-top">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="##bs-example-navbar-collapse-1" aria-expanded="false">
  <span class="sr-only">Toggle navigation</span>
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
  <span class="icon-bar"></span>
</button>
<div class="navbar-brand">
<h1><a href="#event.buildLink( "main.index" )#">HBMS</a></h1>
</div>
</div>

<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
  <li class="active"><a href="#event.buildLink( "main.index" )#">Home <span class="sr-only">(current)</span></a></li>
  <li><a href="#event.buildLink( 'main.about' )#">About</a></li>
  <li class="dropdown">
      <a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Rooms <span class="caret"></span></a>
<ul class="dropdown-menu">
    <cfloop query="#prc.categoryData#">
        <li><a href="#event.buildLink("main.roomsByCategory", "id=#id#")#">#title#</a></li>
    </cfloop>
   
</ul>
  </li>
  <li><a href="#event.buildLink( "main.gallery" )#">Gallery</a></li>
  <li><a href="#event.buildLink( "main.contact" )#">Contact</a></li>
  
  
  
  
  <cfif structKeyExists(prc, "userID") >
    <li class="dropdown">
        <a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Account <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#event.buildLink( "userAccount.profile" )#">Profile</a></li>
            <li><a href="#event.buildLink( "userAccount.bookings" )#">My Bookings</a></li>
            <li><a href="#event.buildLink( "userAccount.changePassword" )#">Change Password</a></li>
            <li><a href="#event.buildLink( "userAccount.logout" )#">Logout</a></li>
        </ul>
    </li>
<cfelse>
    <li><a href="#event.buildLink( "admin:login.index" )#">Admin</a></li>
        <li><a href="#event.buildLink( "main.signup" )#">Sign Up</a></li>
        <li><a href="#event.buildLink( "main.signin" )#">Login</a></li>                                                                    </ul>
    </cfif>

  </div><!-- /.container-fluid -->
</nav>
</div><!-- /.navbar-collapse -->

        </div>	
            <!--- #prc.slider#	 --->
            <div class="slider" 
                <cfif structKeyExists(prc, "styleDisplay")>
                    style="display:block;"
                <cfelse>
                    style="display:none;"
                </cfif>
            >
                <div class="callbacks_container">
                    <ul class="rslides" id="slider">
                     <li>	          
                        <h3>great choice of  <span>hotels</span> </h3>
                     </li>
                     <li>	          
                        <h3>best rates  <span>guaranteed</span> </h3>  
                     </li>
                     <li>	          
                         <h3>the best place to <span>relax</span> </h3>
                    </li>
                </ul>
            </div>
        </div>
      </div>
</div>
<!--header-->

<!-- content -->
			#view()#
<!-- /content -->
			
<!--GET IN TOUCH-->
        
            <div class="touch-section">
            <div class="container">
                <h3>get in touch</h3>
                <div class="touch-grids">
                    <cfloop query="#prc.contactData#">
                                                <div class="col-md-4 touch-grid">
                        <h4>address</h4>
                        <h5>#description#</h5>
                        
                    </div>
                    <div class="col-md-4 touch-grid">
                        <h4>Sales</h4>
                        <h5>Sales Enquiries</h5>
                        <p>Telephone : #mobileNumber#</p>
                    <p>E-mail : #email#</p>
                    </div>		
                </cfloop>
                <cfloop query="#prc.aboutData#">
                                    <div class="col-md-4 touch-grid">
                                                    <h4>About Us</h4>
                            
                        <p>#description#</p>
                        
                    </div>	
                </cfloop>						
                <div class="clearfix"></div>
                </div>
            </div>
            </div>
        <!--GET IN TOUCH-->	
    </div>
			
			<!--footer-->
<div class="footer-section">
    <div class="container">
        <div class="footer-top">
            <p>Hotel Booking Management Sytem @ Lucid </p>
        </div>
    
</div>
</div>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="/includes/js/jquery-1.11.1.min.js"></script>
<script src="/includes/js/bootstrap.js"></script>
<script src="/includes/js/responsiveslides.min.js"></script>
 <script>
    $(function () {
      $("##slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>

<script type="text/javascript">
    $(window).load(function() {			
     $("##flexiselDemo1").flexisel({
       visibleItems: 4,
       animationSpeed: 1000,
       autoPlay: true,
       autoPlaySpeed: 3000,    		
       pauseOnHover:true,
       enableResponsiveBreakpoints: true,
       responsiveBreakpoints: { 
           portrait: { 
               changePoint:480,
               visibleItems: 1
           }, 
           landscape: { 
               changePoint:640,
               visibleItems: 2
           },
           tablet: { 
               changePoint:768,
               visibleItems: 3
           }
       }
   });
   });
   </script>
   <script type="text/javascript" src="/includes/js/jquery.flexisel.js"></script>	

		</body>

	<!-- Mirrored from www.hbsm.web33.fr/about.php by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 18 Mar 2024 12:09:03 GMT -->
	</html>
</cfoutput>
