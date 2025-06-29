component{

	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	this.allowedMethods = {};

	property name="loginService" inject="loginService";
    property name="frontService" inject="frontService";
    property name="messagebox" inject="messagebox@cbmessagebox";
	property name="sessionStorage" inject="sessionStorage@cbstorages";

	function preHandler( event, rc, prc ){
        prc.aboutData = variables.frontService.about();
        prc.contactData = variables.frontService.contact();
        prc.categoryData = variables.frontService.category();
		if( variables.sessionStorage.exists("userID" ) ){
			prc.userID = variables.sessionStorage.get("userID");
            prc.userName = variables.sessionStorage.get("userName");
		} 

    }

	/**
	 * Default Action
	 */
	function index( event, rc, prc ){
		prc.pageTitle="Home";
		prc.classHeadTop = "";
		prc.styleDisplay = "";
		event.setView( "main/index" );
	}

	/**
	 * About
	 */
	function about( event, rc, prc ){
		prc.pageTitle="About Us";
		event.setView( "main/about" );
	}

	/**
	 * Room Data By Category
	 */
	function roomsByCategory( event, rc, prc ){
		prc.pageTitle="Rooms";
		prc.roomsDataByCategory = variables.frontService.roomsByCategory(rc.id);
		event.setView( "main/roomsByCategory" );
	}

	/**
	 * Gallery
	 */
	function gallery( event, rc, prc ){
		prc.pageTitle="Gallery";
		prc.roomsData = variables.frontService.room();
		event.setView( "main/gallery" );
	}

	/**
	 * Contact
	 */
	function contact( event, rc, prc ){
		prc.pageTitle="Contact";
		event.setView( "main/contact" );
	}
	function doEnquiry( event, rc, prc ){
		if(trim(rc.name) EQ "" OR trim(rc.mobileNumber) EQ "" OR trim(rc.email) EQ "" OR trim(rc.message) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "main.contact" );
		}

		var result = variables.frontService.doEnquiry( rc );

		if( result GT 0){
			variables.messagebox.success( "Messaage Sent!!" );
		}/* else{
			variables.messagebox.error( "Category Already Exists!!" );
		} */
		relocate(  "main.contact" );
   	}

	/**
	 * Sign In
	 */
	function signin( event, rc, prc ){
		prc.pageTitle="Sign In";
		event.setView( "main/signin" );
	}
	
	/**
	 * Do Login
	 */
	function doLogin( event, rc, prc ){
		if(trim(rc.email) EQ "" OR trim(rc.password) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "main.signin" );
		}

		
		var result = variables.loginService.doLogin( rc.email, rc.password);

		if( result.success EQ true){
			variables.sessionStorage.set("userID", result.userID );
			variables.sessionStorage.set("userName", result.userName );
			/* variables.messagebox.success( result.message ); */
			relocate(  "main.index" );
		}else{
			variables.messagebox.error( result.message );
			relocate(  "main.signin" );
		}
	}
	

	/**
	 * Sign Up
	 */
	function signup( event, rc, prc ){
		prc.pageTitle="Sign Up";
		event.setView( "main/signup" );
	}

	/**
	 * Do Register
	 */
	function doRegister( event, rc, prc ){
		if(trim(rc.name) EQ "" OR trim(rc.mobileNumber) EQ "" OR trim(rc.email) EQ "" OR trim(rc.password) EQ ""){
			variables.messagebox.error( "All Fields Required!!" );
			relocate(  "main.signup" );
		}

		var result = variables.loginService.doRegister( rc );

		if( result GT 0){
			variables.messagebox.success( "Registered Successfully!!" );
			relocate(  "main.signin" );
		}else{
			variables.messagebox.error( "Email Already Exists!!" );
			relocate( "main.signup" );
		}
	}
    
	

	/**
	 * Produce some restfulf data
	 */
	function data( event, rc, prc ){
		return [
			{ "id" : createUUID(), "name" : "Luis" },
			{ "id" : createUUID(), "name" : "Joe" },
			{ "id" : createUUID(), "name" : "Bob" },
			{ "id" : createUUID(), "name" : "Darth" }
		];
	}

	/**
	 * Relocation example
	 */
	function doSomething( event, rc, prc ){
		relocate( "main.index" );
	}

	/**
	 * --------------------------------------------------------------------------
	 * Implicit Actions
	 * --------------------------------------------------------------------------
	 * All the implicit actions below MUST be declared in the config/Coldbox.cfc in order to fire.
	 * https://coldbox.ortusbooks.com/getting-started/configuration/coldbox.cfc/configuration-directives/coldbox#implicit-event-settings
	 */

	function onAppInit( event, rc, prc ){
	}

	function onRequestStart( event, rc, prc ){
	}

	function onRequestEnd( event, rc, prc ){
	}

	function onSessionStart( event, rc, prc ){
	}

	function onSessionEnd( event, rc, prc ){
		var sessionScope     = event.getValue( "sessionReference" );
		var applicationScope = event.getValue( "applicationReference" );
	}

	function onException( event, rc, prc ){
		event.setHTTPHeader( statusCode = 500 );
		// Grab Exception From private request collection, placed by ColdBox Exception Handling
		var exception = prc.exception;
		// Place exception handler below:
	}

}
