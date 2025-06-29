/**
 * The main module handler
 */

 component extends="Base"{

	property name="pageService" inject="pageService@admin";
    
	
	/**
	 * Module EntryPoint
	 */
	function index( event, rc, prc ){
        relocate( "admin:home.index" );
	}

	

	/**
	 * About Us
	 */
	function aboutUs( event, rc, prc ){
		prc.pageTitle = "About Us";
		prc.aboutData = variables.pageService.about();
		event.setView( "page/aboutUs" );
   	}
	function aboutUpdate( event, rc, prc ){
		if(trim(rc.pageTitle) EQ "" OR trim(rc.pageDescription) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "admin:page.aboutUs" );
		}
		var result = variables.pageService.aboutUpdate( rc );

		if( result.success EQ true){
			variables.messagebox.success( result.message );
		}else{
			variables.messagebox.error( result.message );
		}
		relocate(  "admin:page.aboutUs" );
   	}

	/**
	 * Contact Us
	 */
	function contactUs( event, rc, prc ){
		prc.pageTitle = "Contact Us";
		prc.contactData = variables.pageService.contact();
		event.setView( "page/contactUs" );
   	}
	function contactUpdate( event, rc, prc ){
		if(trim(rc.pageTitle) EQ "" OR trim(rc.email) EQ "" OR trim(rc.mobileNumber) EQ "" OR trim(rc.pageDescription) EQ "" ){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "admin:page.contactUs" );
		}
		var result = variables.pageService.contactUpdate( rc );

		if( result.success EQ true){
			variables.messagebox.success( result.message );
		}else{
			variables.messagebox.error( result.message );
		}
		relocate(  "admin:page.contactUs" );
   	}

}
